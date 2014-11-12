<%@ Page Title="" Language="C#" MasterPageFile="/Web.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="WebShop.Web.category" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer"  TagPrefix="webdiyer"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
<link rel="stylesheet" type="text/css" href="css/category.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
            <div class="mbx">
                <a href="/index.aspx">主页</a><span>></span>
                <a href="/category.aspx?id=<%=kid %>"><%=kindName %></a>
                <%--<span>></span>--%>
                
            </div>
            <div class="featured">
                <a href="###"><img src="img/ad.jpg" width="560" height="270" /></a>
            </div>
            
        <div class="category_box"> 
            <div class="category_headers">
                顶级的产品类别
                <%--<span class="sj"><img src="images/red_triangle.gif" width="27" height="13" /></span>--%>
            </div>
            <ul class="category_list">
                <asp:Repeater ID="Rp_kindList" runat="server" OnItemDataBound="Rp_kindList_ItemDataBound">
                    <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="sonKind" runat="server"></asp:HyperLink></li>
                    </ItemTemplate>

                </asp:Repeater>
               
                       
            </ul>
        </div>
        
         <div class="category_box"> 
            <div class="category_headers">
                减肥产品
                <span>排序
                    <select name="searchsortoptions" onchange="javascript:;" style="vertical-align:middle; background-color:White">
                        <option value="">最热门</option>
                        <option value="category.aspx?cid=<%=kid %>&ordertype=1">价格从低到高</option>
                        <option value="category.aspx?cid=<%=kid %>&ordertype=0">价格从高到低</option>
                    </select>
                </span>
            </div>
            <div class="category_headers_sec">
                <div class="result"><%=pcount %>结果</div>
                <div class="prepage">30看  每页</div>
                <div class="pagelist">
                    <webdiyer:AspNetPager ID="kindPager" runat="server" AlwaysShow="True" PageSize="30" ShowNavigationToolTip="True" OnPageChanged="kindPager_PageChanged" CssClass="number" ShowFirstLast="false" NextPageText="下一页" PrevPageText="上一页" >
                        </webdiyer:AspNetPager>
                </div>
                <span class="sj"><img src="images/triangle.png" width="50" height="20" /></span>
            </div>
            <ul class="procon selling">
                <asp:Repeater ID="Rp_productList" runat="server">
                    <ItemTemplate>
                        <li class="pro_section ">
                            <a href="product.aspx?id=<%#Eval("id") %>">
                                <img src="/<%#Eval("imgUrl") %>" width="150" height="150" />
                            </a>
                            <p class="prodes">
                                <a href="product.aspx?id=<%#Eval("id") %>"  title="<%#Eval("PName") %>"><%#Eval("PName") %></a>
                            </p>
                            <a href="product.aspx?id=<%#Eval("id") %>">
                                <p class="price"><%#Eval("salePrice") %></p>
                                <p class="savedl">SAVE $<%#Convert.ToDouble(Eval("costprice"))-Convert.ToDouble(Eval("saleprice")) %></p> 
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
                    </li>  --%> 
                                   
            </ul>
        </div>                  
	</div>
</asp:Content>
