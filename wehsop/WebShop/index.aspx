<%@ Page Title="" Language="C#" MasterPageFile="/Web.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebShop.Web.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
    	<div class="featured_slides">
    	    <ul class="imground">
                <asp:Repeater ID="tp_topAdList" runat="server">
                    <ItemTemplate>
                        <li style="width:560px; z-index:2"><a href='<%#Eval("webUrl") %>'><img src='/<%#Eval("imgUrl") %>' width="560" height="270" /></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            	<%--<li style="width:560px; z-index:2"><img src="img/ad.jpg" width="560" height="270" /></li>
                <li><img src="img/ad1.jpg" width="560" height="270" /></li>--%>
            </ul>
            <div class="imgcont">
            	<a class="prev" href="javascript:;"></a>
            	<a class="imgitem blue" href="javascript:;"></a>
                <a class="imgitem" href="javascript:;"></a>
                <a class="next" href="javascript:;"></a>
            </div>
    	</div>
        <div class="probox">
        	<div class="protitle"><img src="images/cat_header.png" width="560" height="34" /></div>
            <ul class="procon savings">
                <asp:Repeater ID="Rp_HotProduct" runat="server">
                    <ItemTemplate>
                        
                        <li class="pro_section"><a href="detail.aspx?id=<%#Eval("id") %>"><img src="/<%#Eval("imgUrl") %>" width="151" height="170" /></a></li>
                       
                    </ItemTemplate>

                </asp:Repeater>

            <%--	<li class="pro_section"><a href="###"><img src="img/542.jpg" width="151" height="170" /></a></li>--%>
                                              
            </ul>
        </div>
      <div class="probox">
        	<div class="protitle"><img src="images/top_header.png" width="560" height="34" usemap="#Map" border="0" />
              <map name="Map" id="Map">
                <area shape="rect" coords="449,4,551,30" href="##" />
              </map>
        	</div>
            <ul class="procon selling">
                <asp:Repeater ID="Rp_TopProduct" runat="server">
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
                        	    <p class="savedl">SAVE $<%#Convert.ToDouble(Eval("costprice").ToString())-Convert.ToDouble(Eval("saleprice").ToString()) %></p> 
                            </a>                 
                    </li>

                    </ItemTemplate>


                </asp:Repeater>

            	<%--<li class="pro_section ">
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
                </li> --%>  
                                        
        	</ul>
        </div>
    </div>
    <div class="side">
    	<div class="imgbox">
            <asp:Repeater ID="rp_topImg" runat="server">
                <ItemTemplate>

                    <a href='http://<%#Eval("webUrl") %>'><img src="/<%#Eval("imgUrl") %>" width="300" height="145" /></a>
                </ItemTemplate>

            </asp:Repeater>
        
        </div>
        
    </div>
</asp:Content>
