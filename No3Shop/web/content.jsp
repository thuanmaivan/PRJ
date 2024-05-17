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
        <title>Fast Food</title>
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
                                    <h5>0905134237</h5>
                                    <span>support 24/7 time</span>
                                </div>
                            </div>
                        </div>  



                        <!-- Featured Section Begin -->
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <c:forEach items="${listP}" var="p"> 
                                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                                            <div class="featured__item">
                                                
                                                <div class="featured__item__pic set-bg" data-setbg="${p.getImage()}">
                                                    <ul class="featured__item__pic__hover">
                                                        <c:if test="${sessionScope.user !=  null}">                                                           
                                                            <li><a href="cart?productID=${p.getID()}"><i class="fa fa-shopping-cart"></i></a></li>
                                                                </c:if>
                                                                <c:if test="${sessionScope.user == null}">
                                                            <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>

                                                        </c:if>

                                                    </ul>
                                                </div>  
                                                <div class="featured__item__text">
                                                    <h6>
                                                        <a style="font-weight: normal" href="productdetail?ID=${p.getID()}" onmouseover="changeStyle(this, true)" onmouseout="changeStyle(this, false)">
                                                            ${p.getName()}
                                                        </a>
                                                    </h6>
                                                    <h5 class="price">${p.getPrice()} VND</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </section>
                        <!-- Featured Section End -->

                        <div class="clearfix">
                            <ul class="pagination">
                                <li class="page-item <%=(((int)request.getAttribute("currPage")) == 1) ? "disabled" : ""%>"><a href="content?page=${requestScope.currPage - 1}<%=request.getParameter("CateID") != null ? "&CateID="+request.getParameter("CateID") : ""%><%=request.getParameter("sort") != null ? "&sort="+request.getParameter("sort") : ""%><%=request.getParameter("to") != null ? "&to="+request.getParameter("to") : ""%><%=request.getParameter("from") != null ? "&from="+request.getParameter("from") : ""%>" class="page-link">Previous</a></li>
                                    <c:forEach begin="1" end="${requestScope.totalPage}" varStatus="loop">
                                    <li class="page-item <c:if test="${requestScope.currPage == loop.count}"><c:out value="${'active'}"/></c:if>"><a href="content?page=${loop.count}<%=request.getParameter("CateID") != null ? "&CateID="+request.getParameter("CateID") : ""%><%=request.getParameter("sort") != null ? "&sort="+request.getParameter("sort") : ""%><%=request.getParameter("to") != null ? "&to="+request.getParameter("to") : ""%><%=request.getParameter("from") != null ? "&from="+request.getParameter("from") : ""%>" class="page-link">${loop.count}</a></li>
                                    </c:forEach>
                                <li class="page-item <%=(((int)request.getAttribute("currPage")) == ((int)request.getAttribute("totalPage"))) ? "disabled" : ""%>"><a href="content?page=${requestScope.currPage + 1}<%=request.getParameter("CateID") != null ? "&CateID="+request.getParameter("CateID") : ""%><%=request.getParameter("sort") != null ? "&sort="+request.getParameter("sort") : ""%><%=request.getParameter("to") != null ? "&to="+request.getParameter("to") : ""%><%=request.getParameter("from") != null ? "&from="+request.getParameter("from") : ""%>" class="page-link">Next</a></li>
                            </ul>
                        </div>
                        <hr>    

                        <div class="text-center"><h4>Sản phẩm mới nhất</h4></div><br>
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <c:forEach items="${listN}" var="p"> 
                                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                                            <div class="featured__item">
                                                <div class="featured__item__pic set-bg" data-setbg="${p.getImage()}">
                                                    <ul class="featured__item__pic__hover">
                                                        <c:if test="${sessionScope.user !=  null}">                                                           
                                                            <li><a href="cart?productID=${p.getID()}"><i class="fa fa-shopping-cart"></i></a></li>
                                                                </c:if>
                                                                <c:if test="${sessionScope.user == null}">
                                                            <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>

                                                        </c:if>

                                                    </ul>
                                                </div>  
                                                <div class="featured__item__text">
                                                    <h6>
                                                        <a style="font-weight: normal" href="productdetail?ID=${p.getID()}" onmouseover="changeStyle(this, true)" onmouseout="changeStyle(this, false)">
                                                            ${p.getName()}
                                                        </a>
                                                    </h6>
                                                    <h5 class="price">${p.getPrice()} VND</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </section>
                        <hr>    

                        <div class="text-center"><h4>Sản phẩm nổi bật</h4></div><br>
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <c:forEach items="${listF}" var="p"> 
                                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                                            <div class="featured__item">
                                                <div class="featured__item__pic set-bg" data-setbg="${p.getImage()}">
                                                    <ul class="featured__item__pic__hover">
                                                        <c:if test="${sessionScope.user !=  null}">                                                           
                                                            <li><a href="cart?productID=${p.getID()}"><i class="fa fa-shopping-cart"></i></a></li>
                                                                </c:if>
                                                                <c:if test="${sessionScope.user == null}">
                                                            <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>

                                                        </c:if>

                                                    </ul>
                                                </div>  
                                                <div class="featured__item__text">
                                                    <h6>
                                                        <a style="font-weight: normal" href="productdetail?ID=${p.getID()}" onmouseover="changeStyle(this, true)" onmouseout="changeStyle(this, false)">
                                                            ${p.getName()}
                                                        </a>
                                                    </h6>
                                                    <h5 class="price">${p.getPrice()} VND</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </section>

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
