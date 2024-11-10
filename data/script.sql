
DROP DATABASE IF EXISTS gestion_talent;
CREATE DATABASE gestion_talent;
USE gestion_talent;

-- Table des employés
CREATE TABLE Employe (
    id_employe INT AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mdp VARCHAR(100) NOT NULL,
    telephone VARCHAR(15),
    date_embauche DATE NOT NULL,
    departement VARCHAR(50),
    poste VARCHAR(50),
    isAdmin BOOLEAN DEFAULT FALSE -- pour indiquer le rôle d'administrateur ou d'employé
);



-- Table des compétences
CREATE TABLE Competence (
    id_competence INT AUTO_INCREMENT PRIMARY KEY,
    nom_competence VARCHAR(50) NOT NULL,
    description TEXT
);



-- Table des compétences des employés
CREATE TABLE CompetenceEmploye (
    id_competence_employe INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    id_competence INT,
    niveau_maitrise VARCHAR(10), -- Par exemple : Débutant, Intermédiaire, Avancé, Expert
    date_acquisition DATE,
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe) ON DELETE CASCADE,
    FOREIGN KEY (id_competence) REFERENCES Competence(id_competence) ON DELETE CASCADE
);




-- Table des formations
CREATE TABLE Formation (
    id_formation INT AUTO_INCREMENT PRIMARY KEY,
    nom_formation VARCHAR(100) NOT NULL,
    description TEXT,
    date_debut DATE,
    date_fin DATE,
    fournisseur VARCHAR(100)
);



-- Table des participations aux formations
CREATE TABLE FormationEmploye (
    id_formation_employe INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    id_formation INT,
    date_completion DATE,
    statut VARCHAR(20), -- Par exemple : En cours, Complété, Abandonné
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe) ON DELETE CASCADE,
    FOREIGN KEY (id_formation) REFERENCES Formation(id_formation) ON DELETE CASCADE
);




-- Table des évaluations de performance -- EVALUATION DE L'ADMIN
CREATE TABLE EvaluationPerformance (
    id_evaluation INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    date_evaluation DATE NOT NULL,
    periode_evaluation VARCHAR(20), -- Par exemple : 2023 T1, 2023 Annuel
    commentaires TEXT,
    note INT,
    CHECK (note BETWEEN 1 AND 5), -- 1 à 5, où 5 est la meilleure note
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe) ON DELETE CASCADE
);




-- Table des CV déposés
CREATE TABLE CV (
    id_cv INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    nom_candidat VARCHAR(100),
    email_candidat VARCHAR(100) NOT NULL,
    chemin_fichier VARCHAR(255) NOT NULL, -- Emplacement du fichier CV
    date_soumission DATE DEFAULT CURRENT_DATE,
    statut VARCHAR(20) DEFAULT 'Reçu', -- Statuts possibles : Reçu, En cours, Accepté, Refusé
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe) ON DELETE SET NULL
);



-- Table des postes ou offres d'emploi omeny Entreprise
CREATE TABLE Poste (
    id_poste INT AUTO_INCREMENT PRIMARY KEY,
    nom_poste VARCHAR(50) NOT NULL,
    departement VARCHAR(50),
    description TEXT,
    competences_requises TEXT, -- Liste des compétences requises
    statut VARCHAR(20) DEFAULT 'Ouvert' -- Statuts : Ouvert, Fermé
);
ALTER TABLE Poste
ADD COLUMN id_entreprise INT,
ADD FOREIGN KEY (id_entreprise) REFERENCES Entreprise(id_entreprise) ON DELETE SET NULL;



CREATE TABLE Entreprise (
    id_entreprise INT AUTO_INCREMENT PRIMARY KEY,
    nom_entreprise VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    telephone VARCHAR(15),
    email VARCHAR(100),
    site_web VARCHAR(100),
    image_url VARCHAR(255) -- Colonne pour le chemin d'accès de l'image
);


-- Table des candidatures pour les postes
CREATE TABLE Candidature (
    id_candidature INT AUTO_INCREMENT PRIMARY KEY,
    id_poste INT,
    id_cv INT,
    date_candidature DATE DEFAULT CURRENT_DATE,
    statut VARCHAR(20) DEFAULT 'Reçu', -- Statuts : Reçu, En cours, Accepté, Refusé
    FOREIGN KEY (id_poste) REFERENCES Poste(id_poste) ON DELETE CASCADE,
    FOREIGN KEY (id_cv) REFERENCES CV(id_cv) ON DELETE CASCADE
);



-- Table des projets
CREATE TABLE Projet (
    id_projet INT AUTO_INCREMENT PRIMARY KEY,
    nom_projet VARCHAR(100) NOT NULL,
    description TEXT,
    date_debut DATE,
    date_fin DATE,
    statut VARCHAR(20) DEFAULT 'En cours' -- Statuts : En cours, Terminé, Suspendu
);



-- Table des assignations des employés aux projets
CREATE TABLE ProjetEmploye (
    id_projet_employe INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    id_projet INT,
    role VARCHAR(50), -- Rôle de l'employé dans le projet
    date_assignation DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe) ON DELETE CASCADE,
    FOREIGN KEY (id_projet) REFERENCES Projet(id_projet) ON DELETE CASCADE
);



-- Table pour l'historique des promotions ou changements de poste
CREATE TABLE HistoriquePromotion (
    id_promotion INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    ancien_poste VARCHAR(50),
    nouveau_poste VARCHAR(50),
    date_promotion DATE DEFAULT CURRENT_DATE,
    commentaires TEXT,
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe) ON DELETE CASCADE
);



-- Table pour les évaluations de compétence spécifique
CREATE TABLE EvaluationCompetence (
    id_evaluation_competence INT AUTO_INCREMENT PRIMARY KEY,
    id_employe INT,
    id_competence INT,
    date_evaluation DATE NOT NULL,
    commentaires TEXT,
    score INT,
    CHECK (score BETWEEN 1 AND 10), -- Évaluation de 1 à 10
    FOREIGN KEY (id_employe) REFERENCES Employe(id_employe) ON DELETE CASCADE,
    FOREIGN KEY (id_competence) REFERENCES Competence(id_competence) ON DELETE CASCADE
);


-- Table des entreprises
CREATE TABLE Entreprise (
    id_entreprise INT AUTO_INCREMENT PRIMARY KEY,
    nom_entreprise VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    telephone VARCHAR(15),
    email VARCHAR(100),
    site_web VARCHAR(100),
    image_url VARCHAR(255) -- Colonne pour le chemin d'accès de l'image
);









