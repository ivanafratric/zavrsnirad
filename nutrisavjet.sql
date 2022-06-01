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
    radionica int not null
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


