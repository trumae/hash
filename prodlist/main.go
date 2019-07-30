package main

import (
	"context"
	"database/sql"
	"encoding/json"
	"io"
	"net/http"
	"time"

	_ "github.com/lib/pq"
	log "github.com/sirupsen/logrus"
	pb "github.com/trumae/prodlist/discounts"
	"google.golang.org/grpc"
)

const (
	address = "proddiscount:50051"
)

var (
	db        *sql.DB
	dconn     *grpc.ClientConn
	disclient pb.DiscountsClient
)

type Discount struct {
	Pct          float32 `json:"pct"`
	ValueInCents int32   `json:"value_in_cents"`
}

type Product struct {
	ID          string   `json:"id"`
	Price       int      `json:"price_in_cents"`
	Title       string   `json:"title"`
	Description string   `json:"description"`
	Discount    Discount `json:"discount"`
}

func fillDiscounts(prods []Product, userid string) error {
	for idx := range prods {
		ctx, cancel := context.WithTimeout(context.Background(), time.Second)
		defer cancel()

		r, err := disclient.Discount(ctx, &pb.DiscountRequest{Idprod: prods[idx].ID, Iduser: userid})
		if err != nil {
			log.Error("could not greet: ", err)
			break
		}

		prods[idx].Discount.Pct = r.Pct
		prods[idx].Discount.ValueInCents = r.ValueInCents
	}

	return nil
}

func productHandler(w http.ResponseWriter, r *http.Request) {
	userid := r.Header.Get("X-USER-ID")

	rows, err := db.Query("SELECT id, price_in_cents, title, description FROM product")
	if err != nil {
		log.Error(err)
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	prods := []Product{}
	for rows.Next() {
		var id string
		var price int
		var title string
		var description string

		err = rows.Scan(&id, &price, &title, &description)
		if err != nil {
			log.Error(err)
			http.Error(w, "Internal server error", http.StatusInternalServerError)
			return
		}

		prod := Product{
			ID:          id,
			Price:       price,
			Title:       title,
			Description: description,
		}
		prods = append(prods, prod)
	}

	err = fillDiscounts(prods, userid)
	if err != nil {
		log.Error(err)
	}

	response, err := json.Marshal(prods)
	if err != nil {
		log.Error(err)
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}
	w.Header().Add("Content-Type", "application/json")
	io.WriteString(w, string(response))
}

func main() {
	var err error

	connStr := "user=postgres dbname=hash_teste password=example host=db sslmode=disable"
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}

	// Set up a connection to the server.
	dconn, err = grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not grpc connect: %v", err)
	}
	defer dconn.Close()

	disclient = pb.NewDiscountsClient(dconn)

	http.HandleFunc("/product", productHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
