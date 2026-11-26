USE kirjasto;

INSERT INTO Tekija (Etunimi, Sukunimi) VALUES
  ('Väinö','Linna'), ('Terry','Pratchett'), ('Neil','Gaiman'), ('Tove','Jansson');

INSERT INTO Teos (Nimi, ISBN) VALUES
  ('Tuntematon sotilas','ISBN-0001'),
  ('Hyviä enteitä','ISBN-0002'),
  ('Muumipeikko ja pyrstötähti','ISBN-0003');

-- Hyviä enteitä: kaksi tekijää (Pratchett ja Gaiman)
INSERT INTO Tekija_Teos (idTekija, idTeos) VALUES (1,1), (2,2), (3,2), (4,3);

-- Tuntematon sotilas: kaksi kappaletta eri pääavaimilla
INSERT INTO Kirja (idTeos, Luokitus) VALUES (1,'A1'), (1,'A1'), (2,'B3'), (3,'C2');

INSERT INTO Asiakas (Etunimi, Sukunimi, Osoite, Puhelinnumero) VALUES
  ('Matti','Meikäläinen','Esimerkkitie 1','040 0000001'),
  ('Liisa','Virtanen','Esimerkkitie 2','040 0000002'),
  ('Pekka','Korhonen','Esimerkkitie 3','040 0000003');

-- Voimassa oleva laina: Matti lainasi Tuntemattoman sotilaan kappaleen 1
INSERT INTO Lainaus (LainausPVM, PalautusPVM, idAsiakas, idKirja, Palautettu)
VALUES (CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY), 1, 1, 0);

-- Vanha, jo palautettu laina
INSERT INTO Lainaus (LainausPVM, PalautusPVM, idAsiakas, idKirja, Palautettu)
VALUES ('2026-10-01', '2026-10-31', 2, 3, 1);
SELECT * FROM Tekija;
-- 1	Väinö	Linna
-- 2	Terry	Pratchett
-- 3	Neil	Gaiman
-- 4	Tove	Jansson
		
SELECT * FROM Teos;
-- 1	Tuntematon sotilas	ISBN-0001
-- 2	Hyviä enteitä	ISBN-0002
-- 3	Muumipeikko ja pyrstötähti	ISBN-0003
		
SELECT * FROM Tekija_Teos;
-- 1	1
-- 2	2
-- 3	2
-- 4	3
	
SELECT * FROM Kirja;
-- 1	1	A1
-- 2	1	A1
-- 3	2	B3
-- 4	3	C2
		
SELECT * FROM Asiakas;
-- 1	Matti	Meikäläinen	Esimerkkitie 1	040 0000001
-- 2	Liisa	Virtanen	Esimerkkitie 2	040 0000002
-- 3	Pekka	Korhonen	Esimerkkitie 3	040 0000003
				
SELECT * FROM Lainaus;
-- 1	2026-11-26	2026-12-26	1	1	0
-- 2	2026-10-01	2026-10-31	2	3	1
					
-- Onko kukin kappale lainassa vai hyllyssä
SELECT Kirja.idKirja, Teos.Nimi, Kirja.Luokitus,
       IF(Lainaus.idLainaus IS NULL, 'hyllyssä', 'lainassa') AS tila
FROM Kirja
JOIN Teos ON Kirja.idTeos = Teos.idTeos
LEFT JOIN Lainaus ON Lainaus.idKirja = Kirja.idKirja AND Lainaus.Palautettu = 0;
-- 1	Tuntematon sotilas	A1	lainassa
-- 2	Tuntematon sotilas	A1	hyllyssä
-- 3	Hyviä enteitä	B3	hyllyssä
-- 4	Muumipeikko ja pyrstötähti	C2	hyllyssä