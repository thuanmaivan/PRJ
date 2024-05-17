<%-- 
    Document   : menu
    Created on : Oct 31, 2023, 10:53:21 PM
    Author     : havie
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.user.role != 1}">

    <div  class="col-lg-3">
        <div  class="hero__categories">
            <div style="background-color: orange" class="hero__categories__all">
                <i class="fa fa-bars"></i>
                <span>Categories</span>
            </div>
            <ul>
                <li onmouseover="this.style.backgroundColor = 'orange'" onmouseout="this.style.backgroundColor = ''">
                    <a href="content">All</a>
                </li>
                <c:forEach items="${listC}" var="c">
                    <li onmouseover="this.style.backgroundColor = 'orange'" onmouseout="this.style.backgroundColor = ''"}>
                        <a href="content?CateID=${c.getID()}">${c.getName()}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <c:if test="${not empty isContent}">
            <hr>
            <form>
                <div style="padding-left: 60px; padding-top: 10px; padding-bottom: 12px;">
                    <select name="sort">
                        <option value="" disabled selected hidden>Sắp xếp theo giá</option>
                        <option value="htl">Sắp Xếp Giảm Dần</option>
                        <option value="lth">Sắp Xếp Tăng Dần</option>
                    </select>
                </div>
                <br>
                <div class="text-center" style="padding-top: 10px; padding-bottom: 12px;">
                    <input style="width:5vw" type="number" name="from" placeholder="Từ VND"> - <input style="width:5vw" type="number" name="to" placeholder="Đến VND">
                </div>
                <%if(request.getParameter("CateID") != null) {%>
                <input type="hidden" name="CateID" value="<%=request.getParameter("CateID")%>">
                <%}%>
                <div class="text-center" style="padding-top: 10px; padding-bottom: 12px;">
                    <input type="submit" value="Lọc">
                </div>
            </form>
        </c:if>
    </div>







</c:if>

<c:if test="${sessionScope.user.role == 1}">

    <div class="col-lg-3">
        <div class="hero__categories">
            <div style="background-color: orange" class="hero__categories__all">
                <i class="fa fa-bars"></i>
                <span >Manager</span>
            </div>
            <ul>

                <li onmouseover="this.style.backgroundColor = 'orange'" onmouseout="this.style.backgroundColor = ''">
                    <a href="customerlist">Customer Manager</a>
                </li>
                <li onmouseover="this.style.backgroundColor = 'orange'" onmouseout="this.style.backgroundColor = ''">
                    <a href="listproduct">Product Manager</a>
                </li>
                <li onmouseover="this.style.backgroundColor = 'orange'" onmouseout="this.style.backgroundColor = ''">
                    <a href="billlist">Bill Manager</a>
                </li>
                <li onmouseover="this.style.backgroundColor = 'orange'" onmouseout="this.style.backgroundColor = ''">
                    <a href="statistic">Statistic</a>
                </li>
            </ul>
        </div>
    </div>
</c:if>

