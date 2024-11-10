<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
    <style>
        #sidebar {
            width: 200px;
            height: 100%;
            background-color: #f4f4f4;
            padding: 15px;
            position: fixed;
        }
        #content {
            margin-left: 220px;
            padding: 15px;
        }
        
    </style>
</head>
<body>
    <div id="sidebar">
        <h3>Menu</h3>
        <?php if ($isAdmin): ?>
            <ul>
                <li><a href="#">Gérer les employés</a></li>
                <li><a href="#">Gérer les compétences</a></li>
                <li><a href="#">Gérer les formations</a></li>
                <li><a href="#">Gérer les projets</a></li>
                <li><a href="#">Gérer les évaluations</a></li>
            </ul>
        <?php else: ?>
            <ul>
                <li><a href="#">Mon Profil</a></li>
                <li><a href="#">Mes évaluations</a></li>
                <li><a href="#">Mes projets</a></li>
                <li><a href="<?= base_url('EntrepriseCtrl/index') ?>">Lister les entreprises</a></li>
            </ul>
        <?php endif; ?>
    </div>

    <div id="content">
        <h2>Bienvenue, <?= $prenom ?> <?= $nom ?>!</h2>
        <p>Voici votre page d'accueil.</p>

    </div>

</body>
</html>
