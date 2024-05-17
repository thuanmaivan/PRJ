<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="js/chart.js"></script>
        <title>FastFood</title>
    </head>
    <body>


        <jsp:include page="panner.jsp"></jsp:include>
            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>
                        <div class="col-lg-9">
                            <h3><strong>Statistic</strong></h3> 
                            <hr>
                            <span class='col-md-5'>Users Count: </span><span>${UserCount}</span>
                            <br>
                            <span class='col-md-5'>Products Count: </span><span>${ProductCount}</span>
                            <br>
                            <span class='col-md-5'>Max Income Month: </span><span>${MaxIncome}</span>
                            <br>
                            <span class='col-md-5'>Min Income Month: </span><span>${MinIncome}</span>
                            <br>
                            <span class='col-md-5'>Average Income: </span><span>${AvgIncome}VND</span>
                            <br>
                            <span class='col-md-5'>Total Income: </span><span>${TotalIncome}VND</span>
                            <hr>
                        </div>
                    </div>
                </div>
            </section>
        <!-- Hero Section End -->











        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>



    </body>
</html>
