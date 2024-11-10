<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
</head>
<body>
    <h2>Inscription d'un employé</h2>
    <?php if (isset($error_message)) echo '<p style="color:red;">' . $error_message . '</p>'; ?>

    <form method="post" action="<?= base_url('EmpCtrl/process_register') ?>">
        <label>Prénom:</label>
        <input type="text" name="prenom" required><br>

        <label>Nom:</label>
        <input type="text" name="nom" required><br>

        <label>Email:</label>
        <input type="email" name="email" required><br>

        <label>Mot de passe:</label>
        <input type="password" name="password" required><br>

        <label>Téléphone:</label>
        <input type="text" name="telephone"><br>

        <label>Date d'embauche:</label>
        <input type="date" name="date_embauche" required><br>

        <label>Département:</label>
        <input type="text" name="departement"><br>

        <label>Poste:</label>
        <input type="text" name="poste"><br>

        <label>Administrateur:</label>
        <input type="checkbox" name="isAdmin" value="1"><br>

        <button type="submit">S'inscrire</button>
    </form>
</body>
</html>
