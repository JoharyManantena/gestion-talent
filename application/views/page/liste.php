<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Entreprises</title>
    <style>
        /* Styles pour le modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 8px;
            position: relative;
            text-align: center;
        }
        .close {
            color: #aaa;
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .modal-image {
            width: 100%;
            max-width: 150px;
            height: auto;
            border-radius: 4px;
            margin-top: 10px;
        }
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
    <ul>
        <li><a href="#">Mon Profil</a></li>
        <li><a href="#">Mes évaluations</a></li>
        <li><a href="#">Mes projets</a></li>
        <li><a href="<?= base_url('EntrepriseCtrl/index') ?>">Lister les entreprises</a></li>
    </ul>
</div>

<div id="content">
    <h1>Liste des Entreprises</h1>

    <?php if (!empty($entreprises)): ?>
        <table border="1" cellspacing="0" cellpadding="10">
            <thead>
                <tr>
                    <th></th>
                    <th>Nom de l'entreprise</th>
                    <th>Poste</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($entreprises as $entreprise): ?>
                    <tr>
                        <td>
                            <?php if (!empty($entreprise->image_url)): ?>
                                <img src="<?= base_url($entreprise->image_url) ?>" alt="Image de <?= $entreprise->nom_entreprise ?>" width="100">
                            <?php else: ?>
                                Pas d'image
                            <?php endif; ?>
                        </td>
                        
                        <td>
                            <a href="#" onclick="showDetails(<?= htmlspecialchars(json_encode($entreprise)) ?>)">
                                <?= $entreprise->nom_entreprise ?>
                            </a>
                        </td>
                        <td>
                            <?php if (!empty($entreprise->postes)): ?>
                                <ul>
                                    <?php foreach ($entreprise->postes as $poste): ?>
                                        <li><?= $poste->nom_poste ?></li>
                                    <?php endforeach; ?>
                                </ul>
                            <?php else: ?>
                                Aucun poste disponible
                            <?php endif; ?>
                        </td>
                        <td><button>Postuler</button></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>Aucune entreprise trouvée.</p>
    <?php endif; ?>

    <!-- Modal pour afficher les informations de l'entreprise -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <img id="modal-image" class="modal-image" alt="" width="100">
            <h2 id="modal-nom"></h2>
            <p><strong>Adresse :</strong> <span id="modal-adresse"></span></p>
            <p><strong>Téléphone :</strong> <span id="modal-telephone"></span></p>
            <p><strong>Email :</strong> <span id="modal-email"></span></p>
            <p><strong>Site Web :</strong> <span id="modal-site"></span></p>
        </div>
    </div>
</div>

<script>
    function showDetails(entreprise) {
        document.getElementById('modal-image').src = entreprise.image_url ? '<?= base_url() ?>' + entreprise.image_url : '';
        document.getElementById('modal-nom').textContent = entreprise.nom_entreprise;
        document.getElementById('modal-adresse').textContent = entreprise.adresse;
        document.getElementById('modal-telephone').textContent = entreprise.telephone;
        document.getElementById('modal-email').textContent = entreprise.email;
        document.getElementById('modal-site').innerHTML = `<a href="${entreprise.site_web}" target="_blank">${entreprise.site_web}</a>`;
        document.getElementById('modal').style.display = 'block';
    }

    // Fonction pour fermer le modal
    function closeModal() {
        document.getElementById('modal').style.display = 'none';
    }
</script>
</body>
</html>
