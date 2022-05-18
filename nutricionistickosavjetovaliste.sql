# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\github\zavrsnirad\nutricionistickosavjetovaliste.sql

drop database if exists nutricionistickosavjetovaliste;
create database nutricionistickosavjetovaliste;
use nutricionistickosavjetovaliste;

create table savjetovaliste(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    telefon varchar(20) not null,
    email varchar(50) not null,
    opis varchar(500)
);

create table usluga(
    sifra int not null primary key auto_increment,
    nazivusluge varchar(50) not null,
    cijena decimal(18,2) not null,
    opisusluge varchar(500),
    savjetovaliste int not null
);

create table klijent(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib char(11) not null,
    kontakt varchar(50) not null,
    nalaz varchar(200)
);

create table radionicakuhanja(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis varchar(200),
    cijena decimal(18,2) not null,
    datumpocetka datetime not null,
    datumzavrsetka datetime,
    maksimalanbrojpolaznika int  
);

create table radionicajoge(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis varchar(200),
    cijena decimal(18,2) not null,
    datumpocetka datetime not null,
    datumzavrsetka datetime,
    maksimalanbrojpolaznika int
);

create table clan(
    sifra int not null primary key auto_increment,
    klijent int not null,
    usluga int not null,
    radionicakuhanja int not null,
    radionicajoge int not null
);

alter table usluga add foreign key (savjetovaliste) references savjetovaliste(sifra);

alter table clan add foreign key (klijent) references klijent(sifra);
alter table clan add foreign key (usluga) references usluga(sifra);
alter table clan add foreign key (radionicakuhanja) references radionicakuhanja(sifra);
alter table clan add foreign key (radionicajoge) references radionicajoge(sifra);
