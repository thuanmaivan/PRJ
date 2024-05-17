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
        <title>Yoru kitchen</title>
        <style>
            .featured__item__pic__hover li:nth-child(2) a i {
                /* CSS properties */
                /* Ví dụ: */
                display: none;
            }

            .featured__item__pic__hover li:nth-child(2) a::after {
                content: "Buy";
                /* CSS properties */
                /* Ví dụ: */
                /* ... */
            }
            .featured__item__text h6 a {
                font-weight: bold;
                text-decoration: none;
            }

            .featured__item__text h6 a:hover {
                text-decoration: underline;
            }

            .featured__item__text .price {
                font-weight: normal;
            }
        </style>
    </head>
    <body>


        <jsp:include page="panner.jsp"></jsp:include>
            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>

                        <div class="col-lg-9">
                        <%
               String mess = (String) request.getAttribute("mess");
               if (mess != null) {
                        %>
                        <p style="color: red" id="message">${mess}</p>
                        <%
                            }
                        %>

                        <script type="text/javascript">
                            // Hàm để ẩn thông báo sau 2 giây
                            function hideMessage() {
                                var messageElement = document.getElementById("message");
                                if (messageElement) {
                                    setTimeout(function () {
                                        messageElement.style.display = "none";
                                    }, 2000); // 2 giây
                                }
                            }

                            // Gọi hàm hideMessage khi trang đã tải xong
                            window.onload = hideMessage;
                        </script>
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="content" method="post">
                                    <input type="text" name="txt" placeholder="What do you want ?">
                                    <button style="background-color: orange" type="submit" class="site-btn">SEARCH</button>
                                </form>
                            </div>
                            <div class="hero__search__phone">
                                <div class="hero__search__phone__icon">
                                    <i style="color: orange" class="fa fa-phone"></i>
                                </div>
                                <div class="hero__search__phone__text">
                                    <h5>0827549866</h5>
                                    <span>support 24/7 time</span>
                                </div>
                            </div>
                        </div>  

                      
                        
                        <!-- Featured Section Profile -->
                        <section class="featured spad">
                            <div class="container">
                                <div class="text-center">
                                    <h5>Welcome ${user.username}</h5>
                                    <hr>
                                    <button onclick="window.location.href='order'">Order History</button>
                                    <hr>
                                    <form method="post">
                                        <h4>Change Password</h4>
                                        <input style="margin-top: 1.5vh" type="password" placeholder="old password" id="old" name="oldpass" required>
                                        <br>
                                        <input style="margin-top: 1vh" type="password" placeholder="new password" id="new" name="newpass" required>
                                        <br>
                                        <input style="margin-top: 1vh" type="password" placeholder="confirm password" id="confirm" name="confirmpass" required>
                                        <br>
                                        <input style="margin-top: 1vh" value="Change Password" type="button" onclick="changePassword(this.form)"/>
                                    </form>
                                    <script>
                                        function changePassword(form) {
                                            if(!(form.new.value === form.confirm.value)) {
                                                alert("Confirm password doesn't match!");
                                            } else {
                                                if(form.new.value.length > 0 && form.old.value.length > 0 && form.confirm.value.length > 0) {
                                                    form.submit();
                                                } else {
                                                    alert("Please fill all the field!");
                                                }
                                            }
                                        }
                                    </script>
                                </div>
                            </div>
                        </section>
                        <!-- Featured Section End -->

                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->





        <jsp:include page="footer.jsp"></jsp:include>



        <!-- Js Plugins -->
        <script>
            function changeStyle(element, isHovered) {
                if (isHovered) {
                    element.style.fontWeight = "bold"; // In đậm
                    element.style.textDecoration = "underline"; // Gạch chân
                } else {
                    element.style.fontWeight = "normal"; // Trạng thái bình thường
                    element.style.textDecoration = "none"; // Trạng thái bình thường
                }
            }

        </script>
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
