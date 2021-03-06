<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="shortcut icon" href="assets/img/books.svg" type="image/x-icon">
    <link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/css/login.css">

    <script src="assets/lib/sweetalert2/sweetalert2.all.min.js"></script>
    
    <title>Biblioteca | Entrar</title>
</head>
<body>
    <section class="form">
        <div class="row no-gutters">
            <div class="col-lg-6 bg-image">
                    
            </div>
            <div class="col-lg-6 px-5 pt-5">
                <h1 class="font-weight-bold py-3">Biblioteca</h1>
                <h4>Por favor, faça login</h4>
                <form action="gerenciar_login.do" method="post">
                    <div class="form-row">
                        <div class="col-lg-7">
                            <input type="text" name="login" id="login" placeholder="Usuario" class="form-control my-3 p-4">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-lg-7">
                            <input type="password" name="senha" id="senha" placeholder="*******" class="form-control my-3 p-4">
                        </div>
                    </div>
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> Lembre de mim
                        </label>
                    </div>
                    <div class="form-row">
                        <div class="col-lg-7">
                            <input type="submit" value="Entrar" class="entrar btn-outline-primary mt-3 mb-5">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script src="assets/js/alerts.js"></script>
    <script src="assets/lib/jquery/jquery-3.6.0.min.js"></script>
    <script src="assets/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>

