create table "bankpayment"
(
	id int generated always as identity
		constraint bankpayment_pk
			primary key,
	move_date TEXT,
	price TEXT,
	variable_symbol TEXT,
	account_number TEXT,
	constants_ymbol TEXT,
	specific_symbol TEXT,
	note TEXT,
	currency TEXT,
	message TEXT,
	advanced_information TEXT,
	comment TEXT,
	status TEXT
);

create table "event"
(
	id int generated always as identity
		primary key,
	slug TEXT,
	readable_name TEXT,
	account_number TEXT,
	prefix_variable_symbol INTEGER,
	automatic_payment_pairing INTEGER,
	bank_id INTEGER,
	bank_api_key TEXT,
	max_elapsed_payment_days INTEGER,
	scarf_price INTEGER,
	tshirt_price INTEGER,
	allow_patrols INTEGER,
	maximal_closed_patrols_count INTEGER,
	minimal_patrol_participants_count INTEGER,
	maximal_patrol_participants_count INTEGER,
	allow_ists INTEGER,
	maximal_closed_ists_count INTEGER,
	web_url TEXT,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	data_protection_url int,
	diet_price INTEGER,
	ist_label TEXT,
	event_start DATE,
	contact_email TEXT
);

create table "user"
(
	id int generated always as identity
		primary key,
	email TEXT not null,
	status TEXT,
	created_at TIMESTAMP not null,
	updated_at TIMESTAMP not null,
	event_id int default 1
		constraint user_event_id_fk
			references "event",
	role TEXT default 'withoutRole'
);

create table "logintoken"
(
	id int generated always as identity
		primary key,
	token TEXT not null,
	user_id INT
		constraint login_tokens_users_id_fk
			references "user",
	used BOOLEAN,
	created_at TIMESTAMP not null,
	updated_at TIMESTAMP not null
);

create table "participant"
(
	id int generated always as identity
		primary key,
	user_id INT
		constraint ist_userId_fk
			references "user",
	first_name TEXT,
	last_name TEXT,
	nickname TEXT,
	gender TEXT,
	birth_date TIMESTAMP,
	birth_place TIMESTAMP,
	permanent_residence TEXT,
	country TEXT,
	id_number TEXT,
	telephone_number TEXT,
	email TEXT,
	legal_representative TEXT,
	health_problems TEXT,
	food_preferences TEXT,
	scout_unit TEXT,
	tshirt TEXT,
	scarf TEXT,
	notes TEXT,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	patrol_leader_id int,
	patrol_name TEXT,
	drivers_license TEXT,
	languages TEXT,
	skills TEXT,
	preferred_position TEXT,
	role TEXT,
	swimming TEXT,
	arrival_date TEXT,
	departue_date TEXT,
	uploaded_filename TEXT,
	uploaded_original_filename TEXT,
	uploaded_contenttype TEXT
);

create table "payment"
(
	id int generated always as identity
		primary key,
	variable_symbol TEXT not null,
	price TEXT not null,
	currency TEXT not null,
	status TEXT not null,
	purpose TEXT not null,
	account_number TEXT not null,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	participant_id int not null
		references "participant",
	note TEXT
);

create unique index user_email_uindex
	on "user" (email);

INSERT INTO public."event" (id)
	OVERRIDING SYSTEM VALUE VALUES (1);

UPDATE public."event"
	SET diet_price=100,readable_name='test',bank_api_key='test',maximal_patrol_participants_count=100,ist_label='test',tshirt_price=100,account_number='test',slug='test',minimal_patrol_participants_count=10,prefix_variable_symbol=100,scarf_price=100,bank_id=1025,created_at='2020-06-08 22:46:49.739',maximal_closed_patrols_count=100,contact_email='michael@kaplan.sh',max_elapsed_payment_days=14,allow_ists=1,allow_patrols=1,updated_at='2020-06-08 22:46:53.928',event_start='2020-06-08',maximal_closed_ists_count=1000,automatic_payment_pairing=1,web_url='kissj.kpml.net'
	WHERE id=1;
