CREATE DOMAIN SexType AS CHAR
CHECK (VALUE IN ('M', 'F', 'NB'));

CREATE TABLE Etudiant (
	sid integer PRIMARY KEY,
	snom char(50),
	sexe SexType,
	dateNaissance date,
	niveau integer,
	moyenne float(4)
);

CREATE TABLE Dept (
	dID integer PRIMARY KEY,
	nombrephds integer
);

CREATE TABLE Prof (
	pID integer PRIMARY KEY,
	pnom char(50),
	dep integer NOT NULL UNIQUE, --Ajout de UNIQUE pour répondre à la question 1.2
	FOREIGN KEY(dep) REFERENCES Dept(dID)
);

CREATE TABLE Cours (
	cno integer PRIMARY KEY,
	cnom char(50),
	dep integer NOT NULL,
	FOREIGN KEY(dep) REFERENCES dept(dID)
);

CREATE TABLE section (
	cno integer NOT NULL,
	sectno integer NOT NULL,
	pID integer,
	PRIMARY KEY(cno, sectno),
	FOREIGN KEY(pID) REFERENCES Prof(pID) ON DELETE SET NULL,
	FOREIGN KEY(cno) REFERENCES Cours(cno) ON DELETE CASCADE 
); 

CREATE TABLE Inscription (
	sid integer NOT NULL,
	cno integer NOT NULL,
	sectno integer NOT NULL,
	note numeric(3, 2),
	PRIMARY KEY(sid, cno, sectno),
	FOREIGN KEY(sid) REFERENCES Etudiant(sid),
	FOREIGN KEY(cno, sectno) REFERENCES section(cno, sectno)
);