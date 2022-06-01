# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\zavrsnirad\nutrisavjet.sql

drop database if exists nutrisavjet;
create database nutrisavjet;
use nutrisavjet;

create table usluga(
    sifra int not null primary key auto_increment,
    nazivusluge varchar(50) not null,
    cijena decimal(18,2) not null,
    opisusluge varchar(500)
);

create table klijent(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(50) not null
    );

create table radionica(
    sifra int not null primary key auto_increment,
    vrstaradionice varchar(100) not null,
    naziv varchar(50) not null,
    opis varchar(200),
    cijena decimal(18,2) not null,
    od datetime not null,
    do datetime,
    maksimalanbrojpolaznika int  
);

create table posjeta(
    sifra int not null primary key auto_increment,
    klijent int not null,
    datum datetime not null,
    nalaz varchar(200),
    radionica int
);

create table dolazak(
    sifra int not null primary key auto_increment,
    posjeta int not null,
    usluga int not null
);

alter table posjeta add foreign key (klijent) references klijent(sifra);
alter table posjeta add foreign key (radionica) references radionica(sifra);

alter table dolazak add foreign key (posjeta) references posjeta(sifra);
alter table dolazak add foreign key (usluga) references usluga(sifra);

insert into klijent (ime, prezime, oib, kontakt)
values ('Ivana', 'Radić', '14589633251', 'ivana.radic@gmail.com');

insert into klijent (ime, prezime, oib, kontakt)
values ('Maja', 'Šimić', '15236698521', 'maja.simic@gmail.com');

insert into klijent (ime, prezime, oib, kontakt)
values ('Sanja', 'Perić', '58996321145', 'sanja.peric@gmail.com');

insert into usluga (nazivusluge, cijena, opisusluge)
values ('Inicijalno savjetovanje', 300, 'Kroz inicijalno savjetovanje ćemo saznati gdje se trenutno nalazite, odnosno koje je Vaše stanje organizma, koji su Vaši ciljevi te koji su koraci dalje.');

insert into usluga (nazivusluge, cijena, opisusluge)
values ('Izrada jelovnika', 700, 'Jelovnik za sedam dana, nutricionistički izbalansiran s idealnim omjerima mikro i makronutrijenata za Vaš organizam');

insert into usluga (nazivusluge, cijena, opisusluge)
values ('Kontrolne konzultacije', 500, 'Mjerimo napredak kroz mjerenje i vaganje te utvrđujemo koliki je pomak i daljnje korake');

insert into radionica (vrstaradionice, naziv, opis, cijena, od, do, maksimalanbrojpolaznika)
values ('kulinarska', 'Rižoto na sto načina', 'Riža je jedna od najrasprostranjenijih namirnica, a ujedno i vrlo ukusna. 
Postoji više vrsta riže te ćemo se upoznati s nekoliko njih te način pripreme svake', 600, '2022-06-13 17:00', '2022-06-13 20:00', 8);

insert into radionica (vrstaradionice, naziv, opis, cijena, od, do, maksimalanbrojpolaznika)
values ('joga', 'Pronađite svoj unutarnji mir', 'Radionica za početnike gdje ćemo Vam maksimalno posvetiti pažnju i naučiti pravilno disanje', 
400, '2022-06-04 09:00', '2022-06-04 12:00', 12);

insert into posjeta (klijent, datum, radionica, nalaz)
values (1, '2022-06-04', 2, null);

insert into posjeta (klijent, datum, radionica, nalaz)
values (2, '2022-02-17', null, 'Početno vaganje');

insert into posjeta (klijent, datum, radionica, nalaz)
values (2, '2022-03-02', null, 'Kontrolne konzultacije');

insert into posjeta (klijent, datum, radionica, nalaz)
values (3, '2022-06-13', 1, null);