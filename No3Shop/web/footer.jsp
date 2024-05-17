<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer Section Begin -->
<style>
    .back-to-top {
        color: white; /* Màu chữ mặc định */
        border: 2px solid black; /* Viền ngoài mặc định */
        padding: 10px 20px; /* Khoảng cách giữa chữ và viền */
        text-decoration: none; /* Loại bỏ gạch chân */
        transition: color 0.3s; /* Hiệu ứng chuyển đổi màu chữ trong 0.3s */
        background-color: black;
        border-radius: 20px
        
    }

    .back-to-top:hover {
        color: orange; /* Màu chữ khi di chuột vào */
    background-color: #333; /* Màu nền khi di chuột vào */
    }
</style>
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="content"><img src="img/logooo.jpg" alt=""></a>
                    </div>
                    <ul>
                        <li>Địa chỉ: Khu Đô Thị FPT - Hòa Hải - Ngũ Hành Sơn - Thành Phố Đà Nẵng</li>
                        <li>SĐT: 0905134237</li>
                        <li>Email: No3shop@gmail.com</li>
                    </ul>
                </div>
                <div class="col-12 copyright mt-3">
                    <p class="float-left">
                        <a href="#" class="back-to-top">Back to top</a>
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Useful Links</h6>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">About Our Shop</a></li>
                        <li><a href="#">Secure Shopping</a></li>
                        <li><a href="#">Delivery infomation</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Our Sitemap</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">Who We Are</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Innovation</a></li>
                        <li><a href="#">Testimonials</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Join Our Newsletter Now</h6>
                    <p>Get E-mail updates about our latest shop and special offers.</p>
                    <form action="#">
                        <input type="text" placeholder="Enter your mail">
                        <button style="background-color: orange;" type="submit" class="site-btn">Subscribe</button>
                    </form>
                    
                </div>
            </div>
        </div>

    </div>
</footer>
<!-- Footer Section End -->