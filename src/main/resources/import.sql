insert into institution (name, description) values ("Anioly","Anioły są wśród Nas - Przyjdź, Zobacz, Pomóż i Pozostań z Nami");
insert into institution (name, description) values ("Czerwone noski","Clown w szpitalu");
insert into institution (name, description) values ("Fundacja Anny Dymnej","Warto mimo wszystko!");
insert into institution (name, description) values ("Fundacja Warto Zyc","Zatrzymaj sie i pomysl, po co zyjesz? ");
insert into institution (name, description) values ("Fundacja Nauron+","Dostrzegamy szanse tam, gdzie inni widzą przeszkody. Tworzymy możliwości");
insert into institution (name, description) values ("Fundacja IRASIAD - ZAGUBIONYM","Dobroczynność nie polega na dawaniu kości psu");


insert into donation (city, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code) VALUEs ("Warszawa" , "ostroznie szklo", "2023-11-16", "17:00", 3, "Warszawska", "08-263") ;

insert into category (name) value ("Zabawki");
insert into category (name) value ("Ubrania");
insert into category (name) value ("Buty");
insert into category (name) value ("Inne");

insert into user ( email, password) values ( "guest@wp.pl", "$2a$10$zzlH6E3frv97E2OKO58XnuowaZz57.zGzqNoMa6CJgyT48mJjvyjq");
insert into user ( email, password) values ("admin@wp.pl", "$2a$10$zzlH6E3frv97E2OKO58XnuowaZz57.zGzqNoMa6CJgyT48mJjvyjq");

insert into role (name) values ("ROLE_ADMIN");
insert into role (name) values ("ROLE_USER");