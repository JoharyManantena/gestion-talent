<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <?php if (isset($error_message)) echo '<p>' . $error_message . '</p>'; ?>
    <form method="post" action="<?= base_url('EmpCtrl/login') ?>">
        <label>Email:</label>
        <input type="text" name="email" value="employer@gmail.com" required><br>
        <label>Password:</label>
        <input type="password" name="password" required><br>
        <button type="submit">Login</button>
    </form>
    <p>Vous n'avez pas de compte ? <a href="<?= base_url('EmpCtrl/register') ?>">Inscrivez-vous ici</a></p>
</body>
</html>
