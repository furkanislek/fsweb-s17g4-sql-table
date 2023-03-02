-- SQL ifadelerinizi buraya yazınız.
CREATE TABLE ogrenci (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    dtarih TEXT NOT NULL,
    cinsiyet TEXT NOT NULL,
    sinif TEXT NOT NULL,
    puan INTEGER NOT NULL
);

------------------------------------------------------
CREATE TABLE islem (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ogrenci_id INTEGER REFERENCES ogrenci (ID) NOT NULL,
    kitap_id INTEGER REFERENCES kitap (ID) NOT NULL,
    atarih TEXT NOT NULL,
    vtarih TEXT NOT NULL
);

------------------------------------------------------
CREATE TABLE kitap (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    sayfasayisi INTEGER NOT NULL,
    puan INTEGER NOT NULL,
    yazar_id INTEGER REFERENCES yazar (ID) NOT NULL,
    tur_id INTEGER REFERENCES tur (ID) NOT NULL
);

------------------------------------------------------
CREATE TABLE yazar (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL
);

------------------------------------------------------
CREATE TABLE tur (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL
);

------------------------------------------------------
-- 1
CREATE TABLE copy_ogrenci_table AS
SELECT
    *
FROM
    ogrenci;

DROP TABLE ogrenci;

CREATE TABLE ogrenci (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    dtarih TEXT NOT NULL,
    cinsiyet TEXT NOT NULL,
    sinif TEXT NOT NULL,
    puan INTEGER NOT NULL,
    sehir TEXT NOT NULL
);

INSERT INTO
    ogrenci (
        ID,
        ad,
        soyad,
        dtarih,
        cinsiyet,
        sinif,
        puan
    )
SELECT
    ID,
    ad,
    soyad,
    dtarih,
    cinsiyet,
    sinif,
    puan
FROM
    copy_ogrenci_table;

DROP TABLE copy_ogrenci_table;

----------------------------------------------------
--2 
CREATE TABLE copy_ogrenci_table AS
SELECT
    *
FROM
    ogrenci;

DROP TABLE ogrenci;

CREATE TABLE ogrenci (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    dtarih DATETIME NOT NULL,
    cinsiyet TEXT NOT NULL,
    sinif TEXT NOT NULL,
    puan INTEGER NOT NULL,
    sehir TEXT NOT NULL
);

INSERT INTO
    ogrenci (
        ID,
        ad,
        soyad,
        dtarih,
        cinsiyet,
        sinif,
        puan,
        sehir
    )
SELECT
    ID,
    ad,
    soyad,
    dtarih,
    cinsiyet,
    sinif,
    puan,
    sehir
FROM
    copy_ogrenci_table;

DROP TABLE copy_ogrenci_table;

CREATE TABLE copy_islem_table AS
SELECT
    *
FROM
    islem;

DROP TABLE islem;

CREATE TABLE islem (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ogrenci_id INTEGER REFERENCES ogrenci (ID) NOT NULL,
    kitap_id INTEGER REFERENCES kitap (ID) NOT NULL,
    atarih DATETIME NOT NULL,
    vtaih DATETIME NOT NULL
);

INSERT INTO
    islem (
        ID,
        ogrenci_id,
        kitap_id,
        atarih,
        vtaih
    )
SELECT
    ID,
    ogrenci_id,
    kitap_id,
    atarih,
    vtaih
FROM
    copy_islem_table;

DROP TABLE copy_islem_table;

-------------------------------------------------
-- 3
CREATE TABLE copy_ogrenci_table AS
SELECT
    *
FROM
    ogrenci;

DROP TABLE ogrenci;

CREATE TABLE ogrenci (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    dtarih DATETIME NOT NULL,
    cinsiyet TEXT NOT NULL,
    sinif TEXT NOT NULL,
    puan INTEGER NOT NULL,
    sehir TEXT NOT NULL,
    dogum_yeri TEXT NOT NULL DEFAULT Türkiye
);

INSERT INTO
    ogrenci (
        ID,
        ad,
        soyad,
        dtarih,
        cinsiyet,
        sinif,
        puan,
        sehir
    )
SELECT
    ID,
    ad,
    soyad,
    dtarih,
    cinsiyet,
    sinif,
    puan,
    sehir
FROM
    copy_ogrenci_table;

DROP TABLE copy_ogrenci_table;

--------------------------------------------------------
-- 4
CREATE TABLE copy_ogrenci_table AS
SELECT
    *
FROM
    ogrenci;

DROP TABLE ogrenci;

CREATE TABLE ogrenci (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    dtarih DATETIME NOT NULL,
    cinsiyet TEXT NOT NULL,
    sinif TEXT NOT NULL,
    sehir TEXT NOT NULL,
    dogum_yeri TEXT DEFAULT Türkiye NOT NULL
);

INSERT INTO
    ogrenci (
        ID,
        ad,
        soyad,
        dtarih,
        cinsiyet,
        sinif,
        sehir,
        dogum_yeri
    )
SELECT
    ID,
    ad,
    soyad,
    dtarih,
    cinsiyet,
    sinif,
    sehir,
    dogum_yeri
FROM
    copy_ogrenci_table;

DROP TABLE copy_ogrenci_table;

-------------------------------------------------------
--5
CREATE TABLE kiz_ogrenciler (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    dtarih DATETIME NOT NULL,
    cinsiyet TEXT NOT NULL,
    sinif TEXT NOT NULL,
    sehir TEXT NOT NULL,
    dogum_yeri TEXT DEFAULT Türkiye NOT NULL
);

INSERT INTO
    kiz_ogrenciler (
        ID,
        ad,
        soyad,
        dtarih,
        cinsiyet,
        sinif,
        sehir,
        dogum_yeri
    )
SELECT
    ID,
    ad,
    soyad,
    dtarih,
    cinsiyet,
    sinif,
    sehir,
    dogum_yeri
FROM
    copy_ogrenci_table
WHERE
    cinsiyet = "K";

--------------------------------------------------------
--6
DROP TABLE kiz_ogrenciler;

-----------------------------------------------------------
-- 7
CREATE TABLE kiz_yurdu (ad TEXT);

INSERT INTO
    kiz_yurdu (ad)
VALUES
    ("Ayşe");

-------------------------------------------------
-- 8
CREATE TABLE kogrenciler (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    dtarih DATETIME NOT NULL,
    cinsiyet TEXT NOT NULL,
    sinif TEXT NOT NULL,
    sehir TEXT NOT NULL,
    dogum_yeri TEXT DEFAULT Türkiye NOT NULL
);

INSERT INTO
    kogrenciler (
        ID,
        ad,
        soyad,
        dtarih,
        cinsiyet,
        sinif,
        sehir,
        dogum_yeri
    )
SELECT
    ID,
    ad,
    soyad,
    dtarih,
    cinsiyet,
    sinif,
    sehir,
    dogum_yeri
FROM
    kiz_ogrenciler;

DROP TABLE kiz_ogrenciler;

---------------------------------------
-- 9
CREATE TABLE yazar_copy_table AS
SELECT
    *
FROM
    yazar;

DROP TABLE yazar;

CREATE TABLE yazar (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    soyad TEXT NOT NULL
);

INSERT INTO
    yazar (
        ID,
        name,
        soyad
    )
SELECT
    ID,
    ad,
    soyad
FROM
    yazar_copy_table;

DROP TABLE yazar_copy_table;

--------------------------------------------

-- 10

CREATE TABLE copy_yazar_table AS SELECT *
                                          FROM yazar;

DROP TABLE yazar;

CREATE TABLE yazar (
    ID         INTEGER PRIMARY KEY AUTOINCREMENT,
    name       TEXT    NOT NULL,
    soyad      TEXT    NOT NULL,
    ulke               NOT NULL
                       DEFAULT Türkiye,
    universite         NOT NULL
);

INSERT INTO yazar (
                      ID,
                      name,
                      soyad
                  )
                  SELECT ID,
                         name,
                         soyad
                    FROM copy_yazar_table;

DROP TABLE copy_yazar_table;
