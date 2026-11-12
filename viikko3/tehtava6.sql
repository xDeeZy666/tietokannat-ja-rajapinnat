use testi1;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE owner (
first_name VARCHAR(255),
last_name VARCHAR(255),
address VARCHAR(255),
ownerID INT PRIMARY KEY AUTO_INCREMENT
) ENGINE INNODB;

INSERT INTO owner VALUES ('Harold','Lloyd','Someaddress 1',NULL);
INSERT INTO owner VALUES ('Gwen','Stefani','Someaddress 2',NULL);
INSERT INTO owner VALUES ('Benny','Hill','Someaddress 3',NULL);
INSERT INTO owner VALUES ('Diane','Keaton','Someaddress 4',NULL);

ALTER TABLE pet ADD ownerID INT;
UPDATE pet SET ownerID = 1 WHERE owner = 'Harold';
UPDATE pet SET ownerID = 2 WHERE owner = 'Gwen';
UPDATE pet SET ownerID = 3 WHERE owner = 'Benny';
UPDATE pet SET ownerID = 4 WHERE owner = 'Diane';

ALTER TABLE pet DROP COLUMN owner;
ALTER TABLE pet ADD FOREIGN KEY (ownerID) REFERENCES owner(ownerID);

SET SQL_SAFE_UPDATES = 1;

-- Taulujen rakenteet
DESC owner;
-- first_name	varchar(255)	YES			
-- last_name	varchar(255)	YES			
-- address	varchar(255)	YES			
-- ownerID	int	NO	PRI		auto_increment


DESC pet;
-- name	varchar(20)	YES			
-- species	varchar(20)	YES			
-- sex	char(1)	YES			
-- birth	date	YES			
-- death	date	YES			
-- petID	int	NO	PRI		auto_increment
-- ownerID	int	YES	MUL		
