Drop Table public."wallet";
Drop Table public."user";

CREATE TABLE public."user"
(
    user_id integer NOT NULL,
    name_u text,
    surname text,
    date_of_registration date,
    CONSTRAINT user_pkey PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE public."user"
    OWNER to postgres;

CREATE TABLE public.wallet
(
    wallet_id integer NOT NULL,
    currency text,
    amount real,
    user_id integer,
    created date,
    CONSTRAINT wallet_id_pk PRIMARY KEY (wallet_id),
    CONSTRAINT user_id_fk FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.wallet
    OWNER to postgres;

INSERT INTO public."user"(
	user_id, name_u, surname, date_of_registration)
	VALUES (2, 'Oleh' , 'Berezhnyi', '2022-07-14');	
	
INSERT INTO public.wallet(
	wallet_id, currency, amount, user_id, created)
	VALUES (1, 'USD', 1000, 2, '2022-07-12');	
	
INSERT INTO public.wallet(
	wallet_id, currency, amount, user_id, created)
	VALUES (2, 'UAH', 90000, 2, '2022-07-12');	
	
SELECT * FROM public."user"
Join public.wallet ON wallet.user_id = "user".user_id;	

