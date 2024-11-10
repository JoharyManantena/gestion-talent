INSERT INTO Employe (prenom, nom, email, mdp, telephone, date_embauche, departement, poste, isAdmin)
VALUES 
('Emp', 'employer', 'employer@gmail.com', '1234', '0123456789', '2024-01-01', 'Marketing', 'Responsable Marketing', FALSE),
('Admin', 'administrator', 'admin@gmail.com', 'admin', '0987654321', '2024-01-01', 'Direction', 'Directrice', TRUE);


INSERT INTO Entreprise (nom_entreprise, adresse, telephone, email, site_web, image_url)
VALUES 
('MadagascarTech', 'Lot II F 13, Andraharo, Antananarivo', '0202233445', 'contact@madatech.mg', 'www.madatech.mg', 'assets/images/madatech.jpg'),
('Soa Business', 'Rue Ravoninahitriniarivo, Analakely, Antananarivo', '0203344556', 'info@soabusiness.mg', 'www.soabusiness.mg', 'assets/images/Soa.jpg'),
('Innovate MG', 'Lot III B 29, Ivato, Antananarivo', '0204455667', 'support@innovatemg.mg', 'www.innovatemg.mg', 'assets/images/innovate.jpg');




INSERT INTO Competence (nom_competence, description)
VALUES 
('Java', 'Programmation en Java'),
('Gestion de projet', 'Competence en gestion et organisation de projets'),
('SQL', 'Maîtrise des bases de donnees relationnelles et du langage SQL'),
('Communication', 'Competence en communication interpersonnelle');


INSERT INTO CompetenceEmploye (id_employe, id_competence, niveau_maitrise, date_acquisition)
VALUES 
(1, 1, 'Avance', '2021-04-01'),
(2, 2, 'Expert', '2023-05-20'),
(3, 3, 'Intermediaire', '2022-07-15'),
(1, 4, 'Debutant', '2023-09-10');


INSERT INTO Formation (nom_formation, description, date_debut, date_fin, fournisseur)
VALUES 
('Formation Java Avancee', 'Formation sur les concepts avances de Java', '2023-06-01', '2023-06-15', 'OpenClassrooms'),
('Gestion de Projet Agile', 'Formation sur les methodologies agiles', '2023-09-10', '2023-10-05', 'Udemy'),
('SQL pour les Debutants', 'Formation de base sur SQL', '2024-01-10', '2024-01-25', 'Coursera');

INSERT INTO FormationEmploye (id_employe, id_formation, date_completion, statut)
VALUES 
(1, 1, '2023-06-15', 'Complete'),
(2, 2, '2023-10-05', 'Complete'),
(3, 3, NULL, 'En cours');

INSERT INTO EvaluationPerformance (id_employe, date_evaluation, periode_evaluation, commentaires, note)
VALUES 
(1, '2023-12-01', '2023 Annuel', 'Excellent travail et bonne progression', 5),
(2, '2024-06-01', '2024 T1', 'Bon travail d equipe', 4),
(3, '2023-03-01', '2023 T1', 'Doit ameliorer les competences techniques', 3);


INSERT INTO CV (id_employe, nom_candidat, email_candidat, chemin_fichier, date_soumission, statut)
VALUES 
(1, 'Alice Martin', 'alice.martin@gmail.com', '/cvs/alice_martin.pdf', '2023-05-20', 'Accepte'),
(2, 'Bob Dupont', 'bob.dupont@gmail.com', '/cvs/bob_dupont.pdf', '2023-07-10', 'Reçu');


INSERT INTO Poste (nom_poste, departement, description, competences_requises, statut, id_entreprise)
VALUES
('Developpeur Full Stack', 'Developpement', 'Developpement d applications web, gestion des bases de donnees et des API.', 'Java, JavaScript, SQL, React', 'Ouvert', 1),
('Responsable Marketing', 'Marketing', 'Gestion des campagnes marketing, analyse des performances, et strategie de communication.', 'SEO, SEM, Google Analytics, Marketing digital', 'Ouvert', 2),
('Chef de Projet', 'Gestion de projet', 'Gestion de projets, coordination des equipes, gestion des delais et des ressources.', 'Gestion de projet, Leadership, Scrum', 'Ferme', 3);



INSERT INTO Candidature (id_poste, id_cv, date_candidature, statut)
VALUES 
(1, 1, '2024-02-10', 'En cours'),
(2, 2, '2024-03-05', 'Reçu');


INSERT INTO Projet (nom_projet, description, date_debut, date_fin, statut)
VALUES 
('Projet Alpha', 'Developpement d une application mobile', '2023-01-01', '2023-12-31', 'Termine'),
('Projet Beta', 'Migration vers le cloud', '2024-02-01', NULL, 'En cours');


INSERT INTO ProjetEmploye (id_employe, id_projet, role, date_assignation)
VALUES 
(1, 1, 'Developpeuse', '2023-01-01'),
(2, 2, 'Chef de Projet', '2024-02-01');


INSERT INTO EvaluationCompetence (id_employe, id_competence, date_evaluation, commentaires, score)
VALUES 
(1, 1, '2023-06-20', 'Très bonne maîtrise du Java', 8),
(2, 2, '2024-01-25', 'Capacite à gerer des projets efficacement', 9);


INSERT INTO EvaluationCompetence (id_employe, id_competence, date_evaluation, commentaires, score)
VALUES 
(1, 1, '2023-06-20', 'Très bonne maîtrise du Java', 8),
(2, 2, '2024-01-25', 'Capacite à gerer des projets efficacement', 9);


