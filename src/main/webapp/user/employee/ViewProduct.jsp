<%@page import="model.Quantity"%>
<%@page import="model.User"%>
<%@page import="other.Other"%>
<%@page import="model.Shoes"%>
<%@page import="java.util.List"%>
<%@page import="model.DetailProduct"%>
<%@page import="connectionjdbc.product.ProductService"%>
<%@page import="connectionjdbc.user.UserService"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>MiaShoes</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
          integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="detail.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    request.setAttribute("id", id);
    ProductService service = new ProductService();
    Product product = service.getDescriptionProduct(id);
    List<Product> list = service.recommenProduct(product);
    request.setAttribute("product", product);
    DetailProduct dp = product.getDetailProduct();
    int pri1 = (int)product.getPrice()/100 * (100 - product.getDiscount());
    String sale1 = Other.displayMoney(pri1);
    String price1 = Other.displayMoney((int)product.getPrice());
    request.setAttribute("dp", dp);
    request.setAttribute("qu", product.getQuantity());
    request.setAttribute("sale1", sale1);
    request.setAttribute("price1", price1);
    request.setAttribute("discount1", product.getDiscount());
%>
<div class="header">
    <div class="package">
        <div class="shop_name">
            <a href="home.jsp"><h1>MiaShoes</h1></a>
        </div>
        <div class="box_search">
            <span>T??m Ki???m S???n Ph???m</span>
            <div class="search">
                <form action="Search.jsp?type=1" method="post">
                    <input type="search" name="str" placeholder="Search">
                    <input type="submit" value="T??m ki???m" >
                </form>
            </div>
        </div>
        <!-- end-search -->
        <%
            User current = (User) session.getAttribute("currentUser");
            request.setAttribute("cur", current);
            if(current != null){
                int amount = current.getTemps().size();
                request.setAttribute("amount", amount);
            }

        %>
        <c:choose>
            <c:when test="${cur eq null}">
                <div class="infor">
                    <a href="SignIn.jsp" class="account">
                        <i class="fa fa-user" aria-hidden="true" id="show"> T??i Kho???n</i>

                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="infor">
                    <a href="user/MyAccount.jsp." class="account">
                        <i class="fa fa-user" aria-hidden="true" id="show"> T??i Kho???n</i>
                    </a>

                    <div class="logout">
                        <a href="/ShoeShop/user/LogOut.jsp">????ng xu???t</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- end-header -->
<div class="menu">
    <div class="package">
        <ul class="menu-ngang">
            <li id="menu1">
                <a href="Search.jsp?str=nike&type=2" class="item1">NIKE</a>
                <ul id="menu11">
                    <li><a href="Search.jsp?str=nike&type=2" id="item2">Air Force 1</a></li>
                    <li><a href="Search.jsp?str=nike&type=2" id="item2">Air Jordan1</a></li>
                    <li><a href="Search.jsp?str=nike&type=2" id="item2">Air Max 1</a></li>
                    <li><a href="Search.jsp?str=nike&type=2" id="item2">Air Max 197</a></li>
                    <li><a href="Search.jsp?str=nike&type=2" id="item2">Air Max 270</a></li>
                    <li><a href="Search.jsp?str=nike&type=2" id="item2">Air Max 97</a></li>
                    <li><a href="Search.jsp?str=nike&type=2" id="item2">Presto</a></li>
                </ul>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=adidas&type=2" class="item1">ADIDAS</a>
                <ul id=menu11>
                    <li><a href="Search.jsp?str=adidas&type=2" id="item2">Stan Smith</a></li>
                    <li><a href="Search.jsp?str=adidas&type=2" id="item2">SuperStar</a></li>
                    <li><a href="Search.jsp?str=adidas&type=2" id="item2">Derup Runner</a></li>
                    <li><a href="Search.jsp?str=adidas&type=2" id="item2">Tubular Doom</a></li>
                    <li><a href="Search.jsp?str=adidas&type=2" id="item2">Falcom</a></li>
                    <li><a href="Search.jsp?str=adidas&type=2" id="item2">Pod</a></li>
                    <li><a href="Search.jsp?str=adidas&type=2" id="item2">Young1</a></li>
                </ul>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=luxury&type=2" class="item1">LUXURY</a>
                <ul id=menu11 style="height: 100px;">
                    <li><a href="Search.jsp?str=luxury&type=2" id="item2">Balenciaga</a></li>
                    <li><a href="Search.jsp?str=luxury&type=2" id="item2">Gucci</a></li>
                    <li><a href="Search.jsp?str=luxury&type=2" id="item2">MC Queen</a></li>
                </ul>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=vans&type=2" class="item1">VANS</a>
                <ul id=menu11 style="height: 150px;">
                    <li><a href="Search.jsp?str=vans&type=2" id="item2">Style 36</a></li>
                    <li><a href="Search.jsp?str=vans&type=2" id="item2">Slip on</a></li>
                    <li><a href="Search.jsp?str=vans&type=2" id="item2">Old Skool</a></li>
                    <li><a href="Search.jsp?str=vans&type=2" id="item2">Era 95</a></li>
                    <li><a href="Search.jsp?str=vans&type=2" id="item2">Sk8</a></li>
                </ul>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=convers&type=2" class="item1">CONVERS</a>
                <ul id=menu11 style="height: 80px;">
                    <li><a href="Search.jsp?str=convers&type=2" id="item2">1970s</a></li>
                    <li><a href="Search.jsp?str=convers&type=2" id="item2">Chuck 70s x CDG</a></li>
                </ul>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=fila&type=2" class="item1">FILA</a>
                <ul id=menu11 style="height: 80px;">
                    <li><a href="Search.jsp?str=fila&type=2" id="item2">Fila ray</a></li>
                    <li><a href="Search.jsp?str=fila&type=2" id="item2">Fila Disruptor II</a></li>
                </ul>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=the10&type=2" class="item1">THE10</a>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=fashion&type=2" class="item1">FASHION</a>
                <ul id=menu11 style="height: 120px;">
                    <li><a href="Search.jsp?str=fashion&type=2" id="item2">??o Ph??ng</a></li>
                    <li><a href="Search.jsp?str=fashion&type=2" id="item2">??o S?? Mi</a></li>
                    <li><a href="Search.jsp?str=fashion&type=2" id="item2">Qu???n Jeans</a></li>
                    <li><a href="Search.jsp?str=fashion&type=2" id="item2">Qu???n ??u</a></li>
                </ul>
            </li>
            <li id="menu1">
                <a href="Search.jsp?type=4" class="item1">SALES</a>
            </li>
            <li id="menu1">
                <a href="Search.jsp?str=shock&type=3" class="item1">PH??? KI???N</a>
            </li>
            <li id="menu1">
                <a href="" class="item1">NH???N TH??NG B??O SALES</a>
            </li>
        </ul>
    </div>
</div
        <!-- end-menu -->


<div class="center">
    <div class="left">
        <img src="${product.img1}" width="600px" height="400px">
        <br>
        <div class="sub">
            <div class="img1">
                <a>
                    <img class="subimg" width="150px" src="${product.img1}">
                </a>
            </div>
            <div class="img2">
                <a>
                    <img class="subimg" width="150px" src="${product.img2}">
                </a>
            </div>
            <div class="img3">
                <a>
                    <img class="subimg" width="150px" src="${product.img1}">
                </a>
            </div>
            <div class="img4">
                <a>
                    <img class="subimg" width="150px" src="${product.img2}">
                </a>
            </div>
        </div>
    </div>
    <div class="right">
        <h1 class="titel">${product.name}</h1>
        <div class="price">
            <c:choose>
                <c:when test="${discount1 != '0'}">
                    <ul>
                        <li style="color: red; margin-left:20px;font-size: 17px;list-style: none;"><c:out value="${sale1}" /></li>
                        <li style="color: #a6a6a6;text-decoration: line-through;font-size: 17px; list-style: none;">${price1}</li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul>
                        <li style="color: black; margin-left: 40px; font-size: 17px;"><c:out value="${price1}" /></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
        <p>- Ch???t l?????ng Rep 1:1 [ Bao check ]<br>
            - V???n chuy???n to??n qu???c&nbsp;[ Ki???m Tra H??ng Tr?????c Khi Thanh To??n ]&nbsp;<br>
            - 100% ???nh ch???p tr???c ti???p t???i Mia Shoes&nbsp;<br>
            - B???o H??nh Tr???n ?????i S???n Ph???m&nbsp;<br>
            - ?????i Tr??? 7 Ng??y Kh??ng K??? L?? Do&nbsp;<br>
            - Li??n H??? : 0966.027.102
        </p>
        <div>
            S??? l?????ng
        </div>
        <div class="tab">
            <table>
                <tr>
                    <th>36</th>
                    <th>37</th>
                    <th>38</th>
                    <th>39</th>
                    <th>40</th>
                    <th>41</th>
                    <th>42</th>
                    <th>43</th>
                    <th>44</th>
                    <th>45</th>
                </tr>

                <tr>
                    <td>${qu.size36}</td>
                    <td>${qu.size37}</td>
                    <td>${qu.size38}</td>
                    <td>${qu.size39}</td>
                    <td>${qu.size40}</td>
                    <td>${qu.size41}</td>
                    <td>${qu.size42}</td>
                    <td>${qu.size43}</td>
                    <td>${qu.size44}</td>
                    <td>${qu.size45}</td>
                </tr>
            </table>
        </div>
        <br>
      </div>
</div>
<div class="contact">
    <a href="tel:0966027102" title="tel:0966027102"><i class="fa fa-phone" aria-hidden="true"></i></a>
</div>
<div class="contact1">
    <a href="https://www.facebook.com/Hung.2mono"><i class="fab fa-facebook-messenger"></i></a>
</div>
<div class="information">
    <div class="package">
        <div class="information1">
            <h1>V??? C???A H??NG</h1>
            <span>MiaShoes chuy??n Rep 1:1 cao c???p nh???t th??? tr?????ng.</span>
            <div style="width:100%; height: 0.1em;background:rgb(181, 178, 178); margin-top:10px;margin-bottom: 10px;"></div>
            <ul>
                <li>?????a ch???: S??? 2 Tr???n ?????i Ngh??a, H?? N???i, Vi???t Nam</li>
                <li>
                    <a href="mailto:ngonam21021999@gmail.com">Email:ngonam21021999@gmail.com</a>
                </li>
                <li>
                    <a href="tel:123456789">??i???n tho???i:123456789</a>
                </li>
                <li><a href="">Website:miashoes.vn</a></li>
            </ul>
        </div>
        <div class="information2">
            <h1>TH??NG TIN</h1>
            <ul>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Trang ch???</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Gi???i thi???u</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">S???n ph???m</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Khuy???n m???i</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Tin t???c</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Li??n h???</a></li>
            </ul>
        </div>
        <div class="information2" style="">
            <h1>H?????NG D???N & CH??NH S??CH</h1>
            <ul>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">H?????ng d???n mua h??ng</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Th??? Th??nh Vi??n</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Ship COD</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Ch??nh s??ch b???o h??nh</a></li>
                <li><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="">Ch??nh s??ch ?????i tr??? & ho??n ti???n</a></li>
            </ul>
        </div>
        <div class="payment">
            <h1>PH????NG TH???C THANH TO??N</h1>
            <ul>
                <li><img src="css/pay1.png" alt=""></li>
                <li><img src="css/pay2.png" alt=""></li>
                <li><img src="css/pay3.png" alt=""></li>
                <li><img src="css/pay4.png" alt=""></li>
                <li><img src="css/pay5.png" alt=""></li>
            </ul>
            <span><img src="css/cn.png" alt="" style="width:150px;"></span>
        </div>
    </div>
</div>
<!-- end-information -->
<div class="banner-end">
    <div class="package">
        <div class="banner-left" style="color: black;">?? B???n quy???n thu???c v??? <span style="color: white;">MiaShoe</span></div>
        <div class="banner-right">
            <ul>
                <li><a href=""><i class="fa fa-facebook" aria-hidden="true" title="facebook"></i></a></li>
                <li><a href=""><i class="fa fa-instagram" aria-hidden="true" title="instagram"></i></a></li>
                <li><a href=""><i class="fa fa-google-plus" aria-hidden="true" title="google"></i></a></li>
                <li><a href=""><i class="fa fa-twitter" aria-hidden="true" title="twitter"></i></a></li>
            </ul>
        </div>
    </div>
</div>
<!-- end-banner -->
</body>
</html>
