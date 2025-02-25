create database Pastane32

use Pastane32
go
create table Kullanici_Sifre(
	ID int primary key IDENTITY(1,1),
	kullaniciAdi varchar(50),
	sifre varchar(50)
	);

insert into Kullanici_Sifre values('Huzur','33377');


create table Kisi(
	KisiID int primary key IDENTITY(1,1),
	TCNo char(11) unique not null,
	FirstName varchar(100) not null,
	LastName varchar(100) not null
	);

insert into Kisi values(73749205619,'��nar','Demir');
insert into Kisi values(74927453839,'Ali','Kara');
insert into Kisi values(93638352792,'Sevgi','R�zao�lu');
insert into Kisi values(26393646892,'Kadriye','Akkaya');
insert into Kisi values(28284991183,'Su','Kendici');
insert into Kisi values(19374528922,'Mahmut','Sar�');
insert into Kisi values(16343728272,'Kemal','Ata');
insert into Kisi values(72628191167,'Nil�fer','Sezgin');
insert into Kisi values(92376252228,'Nalan','Ka��k��');
insert into Kisi values(26452863282,'Emine','Sayg�');
insert into Kisi values(91735282722,'Hayat','Mutlu');
insert into Kisi values(45728463728,'�eyma','�z�elik');
insert into Kisi values(89375358693,'Selami','Aky�rek');
insert into Kisi values(29084842246,'Melis','Canl�');

--kisi ekleme
insert into Kisi values(78247724646,'Bulut','Yazar');
insert into Kisi values(87379023525,'Parlak','Kaptan');
--kisi g�ncelleme
UPDATE Kisi SET LastName = 'Yaz�c�' WHERE TCNo = 78247724646;
UPDATE Kisi SET LastName = 'Kaplan' WHERE TCNo = 87379023525;
--kisi silme
DELETE FROM Kisi WHERE TCNo = 78247724646 AND FirstName = 'Bulut';
DELETE FROM Kisi WHERE TCNo = 87379023525 AND FirstName = 'Parlak';

	
create table IletisimBilgisi(
	IletisimID int primary key IDENTITY(1,1),
	Telefon char(10) unique not null,
	Adres varchar(250) not null,
	e_mail varchar(50) unique,
	KisiID int FOREIGN KEY REFERENCES Kisi(KisiID) on delete set null on update set null
	);

select * from Kisi j1 inner join IletisimBilgisi j2
on
j1.KisiID=j2.KisiID

insert into IletisimBilgisi values(5688367253,'�sk�dar �stanbul','cinardemir@gmail.com',1)
insert into IletisimBilgisi values(5892272436,'Kad�k�y �stanbul','alikara@gmail.com',2)
insert into IletisimBilgisi values(5925278521,'�sk�dar �stanbul','sevgirizaoglu@gmail.com',3)
insert into IletisimBilgisi values(5284635292,'�sk�dar �stanbul','kadriyeakkaya@gmail.com',4)
insert into IletisimBilgisi values(5748475893,'Kad�k�y �stanbul','sukendici@gmail.com',5)
insert into IletisimBilgisi values(5938464538,'Caddebostan �stanbul','mahmutsari@gmail.com',6)
insert into IletisimBilgisi values(5387363838,'Beykoz �stanbul','kemalata@gmail.com',7)
insert into IletisimBilgisi values(5948662782,'Bebek �stanbul','nil�fersezgin@gmail.com',8)
insert into IletisimBilgisi values(5927342326,'Levent �stanbul','nalankasikci@gmail.com',9)
insert into IletisimBilgisi values(5922725422,'�mraniye �stanbul','eminesaygi@gmail.com',10)
insert into IletisimBilgisi values(5233738526,'�mraniye �stanbul','hayatmutlu@gmail.com',11)
insert into IletisimBilgisi values(5927438399,'Sar�yer �stanbul','seymaozcelik@gmail.com',12)
insert into IletisimBilgisi values(5282356775,'�akmak �stanbul','selamiakyurek@gmail.com',13)
insert into IletisimBilgisi values(5839476477,'Ac�badem �stanbul','meliscanli@gmail.com',14)


create table Yonetici(
	YonID int primary key IDENTITY(1,1),
	Maas money not null,
	KisiID int FOREIGN KEY REFERENCES Kisi(KisiID)
	);

select * from Kisi j1 inner join Yonetici j2
on
j1.KisiID=j2.KisiID


insert into Yonetici values(80000,1);
insert into Yonetici values(70000,2);
insert into Yonetici values(70000,3);

create table Calisan(
	CalID int primary key IDENTITY(1,1),
	Maas money not null,
	KisiID int FOREIGN KEY REFERENCES Kisi(KisiID)
	);

select * from Kisi j1 inner join Calisan j2
on
j1.KisiID=j2.KisiID

insert into Calisan values(30000,4);
insert into Calisan values(30000,5);
insert into Calisan values(30000,6);
	
create table Musteri(
	MusID int primary key IDENTITY(1,1),
	KisiID int FOREIGN KEY REFERENCES Kisi(KisiID)
	);

insert into Musteri values(7);
insert into Musteri values(8);
insert into Musteri values(9);
insert into Musteri values(10);
insert into Musteri values(11);
insert into Musteri values(12);
insert into Musteri values(13);
insert into Musteri values(14);

select MusID,TCNo,FirstName,LastName from Kisi j5 inner join Musteri j6
on
j5.KisiID=j6.KisiID

	
create table Fatura(
	FatNo int primary key IDENTITY(1,1),
	FatTarihi date default getdate()
	);

insert into Fatura DEFAULT values;
insert into Fatura DEFAULT values;
insert into Fatura DEFAULT values;
insert into Fatura DEFAULT values;
insert into Fatura DEFAULT values;
insert into Fatura DEFAULT values;
insert into Fatura DEFAULT values;
insert into Fatura DEFAULT values;

create table Siparis(
    SipNo int primary key IDENTITY(1,1),
    SipTarihi date default getdate(),
    FatNo int FOREIGN KEY REFERENCES Fatura(FatNo),
    MusID int FOREIGN KEY REFERENCES Musteri(MusID)
);

-- Siparis tablosuna gerekli verileri ekleyelim
insert into Siparis(FatNo, MusID) values (1, 1);
insert into Siparis(FatNo, MusID) values (2, 2);
insert into Siparis(FatNo, MusID) values (3, 3);
insert into Siparis(FatNo, MusID) values (4, 4);
insert into Siparis(FatNo, MusID) values (5, 5);
insert into Siparis(FatNo, MusID) values (6, 6);
insert into Siparis(FatNo, MusID) values (7, 7);
insert into Siparis(FatNo, MusID) values (8, 8);



-- Kategori tablosunu olu�tural�m
create table Kategori(
    KategNo int primary key IDENTITY(1,1),
    KategAdi varchar(30),
    UstKategori int null,
    FOREIGN KEY (UstKategori) REFERENCES Kategori(KategNo)
);

-- Ana Kategorileri ekleyelim
insert into Kategori(KategAdi, UstKategori) values ('Po�a�a', null);
insert into Kategori(KategAdi, UstKategori) values ('Kek', null);
insert into Kategori(KategAdi, UstKategori) values ('Kurabiye', null);
insert into Kategori(KategAdi, UstKategori) values ('B�rek', null);

-- Kategori tablosundaki Kategori ID'lerini g�rmek i�in
select * from Kategori;

-- Urun tablosunu olu�tural�m
create table Urun(
	UrunKodu int primary key IDENTITY(1,1),
	UrunAdi varchar(30) not null,
	UrunFiyati money not null,
	KategNo int FOREIGN KEY REFERENCES Kategori(KategNo),
	SipNo int FOREIGN KEY REFERENCES Siparis(SipNo)
	);

insert into Urun values('Peynirli Po�a�a',30,1,1);
insert into Urun values('Zeytinli Po�a�a',35,1,2);
insert into Urun values('�ikolatal� Kek',70,2,3);
insert into Urun values('Havu�lu Kek',85,2,4);
insert into Urun values('Limonlu Kurabiye',50,3,5);
insert into Urun values('F�nd�kl� Kurabiye',65,3,6);
insert into Urun values('K�ymal� B�rek',100,4,7);
insert into Urun values('Ispanakl� B�rek',70,4,8);
