
INSERT INTO Dept VALUES ('genChem', 9);
INSERT INTO Dept VALUES ('gigl', 40);
INSERT INTO Dept VALUES ('Maths', 5);
	
	
INSERT INTO Cours VALUES ('105', 'programmation', 'gigl');
INSERT INTO Cours VALUES ('200', 'NLP', 'gigl');
INSERT INTO Cours VALUES ('304', 'Geometrie 101', 'Maths');
INSERT INTO Cours VALUES ('305', 'Theoremes en geometrie', 'Maths');
INSERT INTO Cours VALUES ('306', 'Geometrie intermediaire', 'Maths');
INSERT INTO Cours VALUES ('307', 'Geometrie','Maths');	


ALTER TABLE Prof DROP CONSTRAINT uniqueProf; 
/* 
	Q1.3 b) On voit que le SGBD lance une erreur puisque l'insertion viole
	la contrainte UNIQUE de l'attribut dep dans Prof. Deux profs ne peuvent pas
	gérer le même département
*/

INSERT INTO Prof VALUES ('p1', 'AZ', 'gigl');
INSERT INTO Prof VALUES ('p2', 'MG', 'gigl');	
INSERT INTO Prof VALUES ('p3', 'NZ', 'Maths');
INSERT INTO Prof VALUES ('p4', 'LH', 'Maths');


INSERT INTO Section VALUES ('105', '1', 'p1');			
INSERT INTO Section VALUES ('105', '2', 'p1');		
INSERT INTO Section VALUES ('305', '1', 'p3');		
INSERT INTO Section VALUES ('305', '2', 'p4');					
		
INSERT INTO Etudiant 
(snom, sid, sexe, dateNaissance, niveau, moyenne)
VALUES ('Simon Nissan', 's1', 'M', TO_DATE('20/01/1998', 'DD/MM/YYYY'), '1', '4.2');	
						 
INSERT INTO Etudiant 
(snom, sid, sexe, dateNaissance, niveau, moyenne)
VALUES ('Laurent Passepartout', 's2', 'M', TO_DATE('20/01/1999', 'DD/MM/YYYY'), '1', '3.2');	
						 
INSERT INTO Etudiant 
(snom, sid, sexe, dateNaissance, niveau, moyenne)
VALUES ('Alexandra Laplace', 's3', 'F', TO_DATE('20/01/2000', 'DD/MM/YYYY'), '1', '2.8');

INSERT INTO Etudiant
(snom, sid, sexe, dateNaissance, niveau, moyenne)
VALUES ('Alex Laplace', 's4', 'F', TO_DATE('20/01/2001', 'DD/MM/YYYY'), '2', '3.5');	
						 
INSERT INTO Etudiant 
(snom, sid, sexe, dateNaissance, niveau, moyenne)
VALUES ('Simon Belanger', 's5', 'M', TO_DATE('20/01/2002', 'DD/MM/YYYY'), '2', '3.2');
						 
INSERT INTO Etudiant 
(snom, sid, sexe, dateNaissance, niveau, moyenne)
VALUES ('Mark Zuck', 's6', 'M', TO_DATE('20/01/2003', 'DD/MM/YYYY'), '2', '1.2');	
						 
INSERT INTO Etudiant
(snom, sid, sexe, dateNaissance, niveau, moyenne)
VALUES ('Sophie Yenamarre', 's7', 'M', TO_DATE('20/01/2004', 'DD/MM/YYYY'), '3', '4.2');						 


INSERT INTO Inscription VALUES ('s3', '105', '1', 90);
INSERT INTO Inscription VALUES ('s2', '105', '1', 60);
INSERT INTO Inscription VALUES ('s1', '105', '2', 70);
INSERT INTO Inscription VALUES ('s5', '105', '2', 70);
INSERT INTO Inscription VALUES ('s5', '305', '2', 100);
INSERT INTO Inscription VALUES ('s6', '305', '2', 65);

/*
	Q1.3 a)
	On voit que le SGBD lance une erreur, car cette insertion viole la contrainte de FK 
	de Inscription puisque la combinaison FK(305, 3) n'est pas présente dans la table Section.
*/
