USE opintorekisteri;

DELIMITER $$

DROP PROCEDURE IF EXISTS LisaaSuoritus $$

CREATE PROCEDURE LisaaSuoritus (
  IN En VARCHAR(45),
  IN Sn VARCHAR(45),
  IN KK VARCHAR(45),
  IN Arvos INT
)
-- Aliohjelman kutsu: CALL LisaaSuoritus('Iines','Ankka','T200123',3);
Aliohjelma: BEGIN
  DECLARE OpiskID INT DEFAULT 0;
  DECLARE OpjaksoID INT DEFAULT 0;

  -- Haetaan opiskelijan id. Jos ei löydy, OpiskID jää nollaksi
  SELECT idOpiskelija INTO OpiskID FROM Opiskelija
  WHERE Etunimi = En AND Sukunimi = Sn;

  IF OpiskID = 0 THEN
    SELECT 'Opiskelijaa ei ole';
    LEAVE Aliohjelma;
  END IF;

  -- Haetaan opintojakson id koodin perusteella
  SELECT idOpintojakso INTO OpjaksoID FROM Opintojakso
  WHERE Koodi = KK;

  IF OpjaksoID = 0 THEN
    SELECT 'Opintojaksoa ei ole';
    LEAVE Aliohjelma;
  END IF;

  -- Tarkistetaan, että arvosana on välillä 0 - 5
  IF Arvos IS NULL OR Arvos < 0 OR Arvos > 5 THEN
    SELECT 'Arvosanan pitää olla välillä 0 - 5';
    LEAVE Aliohjelma;
  END IF;

  -- Kaikki kunnossa, lisätään suoritus
  INSERT INTO Arviointi VALUES (NULL, CURDATE(), Arvos, OpiskID, OpjaksoID);
  SELECT 'Suoritus lisätty';
END $$

DELIMITER ;

CALL LisaaSuoritus('Iines','Ankka','T200123',3);   -- Suoritus lisätty
CALL LisaaSuoritus('Roope','Ankka','T200123',4);   -- Opiskelijaa ei ole
CALL LisaaSuoritus('Aku','Ankka','X999',4);        -- Opintojaksoa ei ole
CALL LisaaSuoritus('Aku','Ankka','T200456',7);     -- Arvosanan pitää olla välillä 0 - 5
CALL LisaaSuoritus('Mikki','Hiiri','T200456',5);   -- Suoritus lisätty

SELECT * FROM Arviointi;
-- 1	2026-11-26	3	1	1
-- 2	2026-11-26	5	3	2
				