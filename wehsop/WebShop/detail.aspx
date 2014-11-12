<%@ Page Title="" Language="C#" MasterPageFile="/Web.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="WebShop.Web.detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            var screenw = $(window).width();
            var screenh = $(window).height();
            var screenhh = $(document).height();
            var lgl = (screenw - 410) / 2;
            var lgt = (screenh - 370) / 2;
            $(".marsk").width(screenw).height(screenhh);
            $(".login").css({ "left": lgl, "top": lgt });

            $(".quit").click(function () {
                $(".marsk").hide();
                $(".login").hide();
            });

            $(".addin").click(function () {
                $(".marsk").show();
                $(".login").show();
            });

        });

</script>
    <link rel="stylesheet" type="text/css" href="css/detail.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
            <div class="mbx">
                <a href="http://www.33sogo.com">主页</a><span>></span>
                <a href="category.aspx?kid=<%=kid %>"><%=kname%></a><span>></span>
                <%=cname %>
            </div>
            <div class="detail_mes">
                <h1><%=pname %></h1>
                <div class="mesdes">
                	<div class="imgsm jqzoom"><img src="/<%=imgUrl %>" width="200" height="200" jqimg="img/dada.jpg" id="bigImg" /></div>
                    <div class="protext">
                    	<p class="priwrap"><span class="pri"><%=salePrice %></span>￥</p>
                        <p class="sav">节约￥<%=savePrice %></p>
                        <p class="adv">建议零售价￥<%=costPrice %></p>
                    </div>
                </div>
                <div class="buy">
                	<span class="prono">产品编号<%=pnum %></span>
                	<a class="addin" href="<%=taobaoUrl %>"><img src="images/addcart.jpg" width="159" height="36" /></a>
                    <a href="<%=taobaoUrl %>"><img src="images/buynow.jpg" width="150" height="36" /></a>
                </div>
            </div>          
        <div class="information-wrap">
         	<div class="information">
                 <%=pcontent.Replace("\r\n", "<br />") %>
            </div>
            <p style="height:30px; padding-top:10px; line-height:30px; text-align:right"><a style="font-size:16px; color:#1271e5;" href="###">查看更多</a></p>
         </div>     
         <div class="category_box"> 
            <p style="font-size:20px; color:#373737; font-weight:bold; border-bottom:2px solid #ddd; padding-bottom:10px;">购买了该商品的用户还购买了</p>        
            <ul class="procon selling">
                <asp:Repeater ID="Rp_productList" runat="server">
                    <ItemTemplate>
                         <li class="pro_section ">
                		        <a href="detail.aspx?id=<%#Eval("id") %>">
                        	        <img src="/<%#Eval("imgurl") %>" width="150" height="150" />
                                </a>
                                <p class="prodes">
                        	        <a href="detail.aspx?id=<%#Eval("id") %>"  title="<%#Eval("pname") %>"><%#Eval("pname") %></a>
                                </p>
                                <a href="detail.aspx?id=<%#Eval("id") %>">
                        	        <p class="price">$<%#Eval("saleprice") %></p>
                        	        <p class="savedl">SAVE $<%#(Convert.ToDouble(Eval("costprice").ToString())-Convert.ToDouble(Eval("saleprice").ToString())).ToString().Replace("\r\n", "<br />") %></p> 
                                </a>                 
                        </li>
                    </ItemTemplate>

                </asp:Repeater>

                   <%-- <li class="pro_section ">
                            <a href="###">
                                <img src="img/150_CW.jpg" width="150" height="150" />
                            </a>
                            <p class="prodes">
                                <a href="###"  title="Ostelin Vitamin D & Calcium 300 Tablets">Ostelin Vitamin D & Calcium 300 Tablets</a>
                            </p>
                            <a href="###">
                                <p class="price">$10.99</p>
                                <p class="savedl">SAVE $4.12</p> 
                            </a>                 
                    </li>   --%>
                                                 
            </ul>
        </div>                  
	</div>
    <div class="side">
    	<div class="imgbox">
        	<a href="###"><img src="img/img1.jpg" width="300" height="145" /></a>
        </div>
        <div class="productlist">
        	<p><img src="images/FP_Header.png" width="300" height="51" /></p>
            <div class="adbox"><a href="###"><img src="img/imgad.jpg" width="300" height="250" /></a></div>
        </div>
        <div class="productlist">
        	<p><img src="images/FP_Header.png" width="300" height="51" /></p>
            <div class="adbox"><a href="###"><img src="img/imgad.jpg" width="300" height="250" /></a></div>
        </div>       
    </div>
</asp:Content>
