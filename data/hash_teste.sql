
DROP TABLE IF EXISTS "product";
CREATE TABLE "public"."product" (
    "id" character varying NOT NULL,
    "price_in_cents" integer NOT NULL,
    "title" character varying NOT NULL,
    "description" character varying NOT NULL,
    CONSTRAINT "product_id_idx" UNIQUE ("id")
) WITH (oids = false);

INSERT INTO "product" ("id", "price_in_cents", "title", "description") VALUES
('aaf83170-b1a5-11e9-bb85-f342c7728eb8',	3347,	'Sapiens - Uma Breve História da Humanidade',	'O que possibilitou ao Homo sapiens subjugar as demais espécies? O que nos torna capazes das mais belas obras de arte, dos avanços científicos mais impensáveis e das mais horripilantes guerras? Nossa capacidade imaginativa. '),
('b46024a2-b1a5-11e9-a190-e3a207c400d5',	3188,	'A revolução dos bichos: Um conto de fadas ',	'Verdadeiro clássico moderno, concebido por um dos mais influentes escritores do século XX, A revolução dos bichos é uma fábula sobre o poder. Narra a insurreição dos animais de uma granja contra seus donos. Progressivamente, porém, a revolução degenera numa tirania ainda mais opressiva que a dos humanos.'),
('f38e69a8-b1a6-11e9-a347-6befa6ccf216',	4472,	'Rápido e devagar',	'Em Rápido e devagar: duas formas de pensar, Daniel Kahneman nos leva a uma viagem pela mente humana e explica as duas formas de pensar: uma é rápida, intuitiva e emocional; a outra, mais lenta, deliberativa e lógica.'),
('1a15a19a-b1a7-11e9-9e59-339af5014ab4',	2940,	'Laranja Mecânica',	'Uma das mais brilhantes sátiras distópicas já escritas, Laranja Mecânica ganhou fama ao ser adaptado em uma obra magistral do cinema pelas mãos de Stanley Kubrick. '),
('45be79b6-b1a7-11e9-95a5-7f49a64b227c',	6390,	'Conan, O Bárbaro - Livro 3',	'O Pipoca & Nanquim tem orgulho de apresentar o terceiro e derradeiro volume de uma das maiores sagas épicas de toda a história da literatura. Conan, o Bárbaro é a obra máxima do escritor Robert E. Howard, um dos mais celebrados romancistas de sua geração, criador do subgênero Espada & Feitiçaria e principal inspiração para autores de renome indiscutível como George R. R. Martin e Michael Moorcock.'),
('319dcfa8-b1a8-11e9-948f-af083b2f22e4',	1679,	'Harry Potter e a pedra filosofal',	'Harry Potter é um garoto cujos pais, feiticeiros, foram assassinados por um poderosíssimo bruxo quando ele ainda era um bebê. Ele foi levado, então, para a casa dos tios que nada tinham a ver com o sobrenatural.'),
('57a1602a-b1a8-11e9-8fd4-97349ee9d244',	2690,	'Os axiomas de Zurique',	'A nova edição de um dos maiores livros sobre investimentos de todos os tempos. O sistema bancário suíço é um dos mais ricos do mundo. Milionários de todos os continentes aplicam no país não só pelo anonimato oferecido por suas instituições financeiras.'),
('76fccc98-b1a8-11e9-aa44-d784fd0e88c6',	3834,	'21 lições para o século 21',	'O novo livro do autor de Sapiens e Homo Deus explora as grandes questões do presente e o que podemos fazer para melhorálo. Como podemos nos proteger de guerras nucleares, cataclismos ambientais e crises tecnológicas?'),
('9e81e0aa-b1a8-11e9-9acf-532f37ef3a7d',	10450,	'Watchmen - Edição Definitiva',	'Uma das Graphic Novels mais influentes de todos os tempos e um eterno bestseller, Watchmen só cresceu em estatura desde sua publicação original, como minissérie, em 1986. Esta edição de luxo, com capa dura, papel especial e formato diferenciado, traz a lendária saga escrita por Alan Moore e desenhada por Dave Gibbons, totalmente recolorida digitalmente por John Higgings, o colorista original.'),
('b8156fe6-b1a8-11e9-80ed-9b52a85b167f',	1999,	'Darwin sem frescura',	'Em uma viagem por Eras, continentes, nascimentos e extinções, dois brasucas nerds nos convidam a um mergulho na teoria da Evolução com as mais modernas e variadas descobertas científicas já feitas na história. Com a leveza e descontração de que só quem entende do assunto é capaz, os autores Reinaldo e Pirula respondem questões das mais diversas que, de algum modo, se relacionam à teoria mais importante da biologia. Afinal, existe um elo perdido?'),
('e22d2c7e-b1a8-11e9-9d87-8b215dc6e7a0',	3359,	'O guia definitivo do Mochileiro das Galáxias',	'Pela primeira vez, reunimos em um único volume os cinco livros da cultuada série O Mochileiro das Galáxias, de Douglas Adams.  Com mais de 15 milhões de exemplares vendidos, a saga do britânico esquisitão Arthur Dent pela Galáxia conquistou leitores do mundo inteiro.'),
('07bfb934-b1a9-11e9-a118-2f70c18aac63',	2079,	'Mitologia Nórdica - Edição de Luxo',	'Quem, além de Neil Gaiman, poderia se tornar cúmplice dos deuses e usar de sua habilidade com as palavras para recontar as histórias dos mitos nórdicos? Fãs e leitores sabem que a mitologia nórdica sempre teve grande influência na obra do autor. Depois de servirem de inspiração para clássicos como Deuses americanos e Sandman, Gaiman agora investiga o universo dos mitos nórdicos.');

DROP TABLE IF EXISTS "user";
CREATE TABLE "public"."user" (
    "id" character varying NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying NOT NULL,
    "date_of_birth" date NOT NULL,
    CONSTRAINT "user_id_idx" UNIQUE ("id")
) WITH (oids = false);

INSERT INTO "user" ("id", "first_name", "last_name", "date_of_birth") VALUES
('1',	'Tony',	'Stark',	'1960-01-01'),
('2',	'Donald',	'Blake',	'1963-05-12'),
('3',	'Bruce',	'Banner',	'1964-12-13');

