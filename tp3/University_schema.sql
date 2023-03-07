CREATE DOMAIN SexType AS CHAR
CHECK (VALUE IN ('M', 'F', 'NB'));

CREATE TABLE Etudiant (
	sid char(2) PRIMARY KEY,
	snom char(50),
	sexe SexType,
	dateNaissance date,
	niveau char(1),
	moyenne char(3)
);

CREATE TABLE Dept (
	dID char(25) PRIMARY KEY,
	nombrephds integer
);

CREATE TABLE Prof (
	pID char(2) PRIMARY KEY,
	pnom char(2),
	dep char(25) NOT NULL UNIQUE, --Ajout de UNIQUE pour répondre à la question 1.2
	FOREIGN KEY(dep) REFERENCES Dept(dID)
);

CREATE TABLE Cours (
	cno char(3) PRIMARY KEY,
	cnom char(50),
	dep char(25) NOT NULL,
	FOREIGN KEY(dep) REFERENCES dept(dID)
);

CREATE TABLE section (
	cno char(3) NOT NULL,
	sectno char(1) NOT NULL,
	pID char(2),
	PRIMARY KEY(cno, sectno),
	FOREIGN KEY(pID) REFERENCES Prof(pID) ON DELETE SET NULL,
	FOREIGN KEY(cno) REFERENCES Cours(cno) ON DELETE CASCADE 
); 

CREATE TABLE Inscription (
	sid char(2) NOT NULL,
	cno char(3) NOT NULL,
	sectno char(1) NOT NULL,
	note integer,
	PRIMARY KEY(sid, cno, sectno),
	FOREIGN KEY(sid) REFERENCES Etudiant(sid),
	FOREIGN KEY(cno, sectno) REFERENCES section(cno, sectno)
);