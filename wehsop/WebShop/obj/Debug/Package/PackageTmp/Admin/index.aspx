<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebShop.Admin.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>管理员后台</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="/admin/resources/css/reset.css" type="text/css" media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="/admin/resources/css/style.css" type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="/admin/resources/css/invalid.css" type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript"  src="/admin/Scripts/jquery-1.8.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript" src="/admin/resources/scripts/simpla.jquery.configuration.js"></script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="/admin/resources/scripts/facebox.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="/admin/resources/scripts/jquery.wysiwyg.js"></script>
<!-- jQuery Datepicker Plugin -->
<script type="text/javascript" src="/admin/resources/scripts/jquery.datePicker.js"></script>
<script type="text/javascript" src="/admin/resources/scripts/jquery.date.js"></script>
    
<script type="text/javascript">
    function AaddClass() {
        $(this).addClass = "current";

    }

</script>
   
</head>
<body>
    <form id="Form1" runat="server">
        <div id="body-wrapper" >

          <!-- Wrapper for the radial gradient background -->
           <div id="sidebar" style="position:fixed; z-index:2">
            <div id="sidebar-wrapper">
              <!-- Sidebar with logo and menu -->
              <h1 id="sidebar-title">管 理 后 台</h1>
              <!-- Logo (221px wide) -->
              <img id="logo" src="/admin/resources/images/logo_new.png" alt="Simpla Admin logo" />
              <!-- Sidebar Profile links -->
              <div id="profile-links" style="font-size:large;"> Hello,<asp:Literal ID="lb_AdminName" runat="server" ></asp:Literal>
                <br />
                  <asp:LinkButton ID="Lb_SignOut" runat="server" style="font-size:large;" OnClick="Lb_SignOut_Click" >退 出</asp:LinkButton>
               <%-- <a href="#" title="Sign Out" style="font-size:large;">退 出</a> </div>--%>
              <ul id="main-nav" style="margin-left:0px;">
                <!-- Accordion Menu -->
                
                <li> <a href="#" class="nav-top-item">
                  <!-- Add the class "current" to current menu item -->
                  产品管理 </a>
                  <ul>
                    <li><a href="KindList.aspx" class="" onclick="AaddClass()" target="frmright">产品种类列表</a></li>
                      <li><a href="EditKindList.aspx?id=0" target="frmright"> 添加新产品种类 </a></li>
                      <li><a href="editSonKindInfo.aspx?id=0" target="frmright"> 添加新二级类别 </a></li>
                      <li><a href="EditProductInfo.aspx?id=0" target="frmright">添加新产品</a></li>
                      
                    <li><a href="EditProductImg.aspx?id=0" target="frmright">添加新产品图片集</a></li>
                    <!-- Add class "current" to sub menu items also -->
                  <!--2014.09.10不能再这样纵容2B培了，启动B计划-->
                  </ul>
                </li>
                   <li ><a href="#" class="nav-top-item">首页广告信息管理</a>
                    <ul>
                        <li><a href="adlist.aspx" class="" onclick="AaddClass()" target="frmright">广告信息列表</a></li>
                         <li><a href="editAdList.aspx" class="" onclick="AaddClass()" target="frmright">添加新广告信息</a></li>
                  </ul>  
                </li>
                <li ><a href="#" class="nav-top-item">用户信息管理</a>
                    <ul>
                        <li><a href="UserInfo.aspx" class="" onclick="AaddClass()" target="frmright">用户信息列表</a></li>
                  </ul>  
                </li>
                
                  
                <li> <a href="#" class="nav-top-item">配置 </a>
                  <ul>
                    
                    <li><a href='EditAdminInfo.aspx?id=<%=uid %>' class="" onclick="AaddClass()" target="frmright">修改当前管理员密码</a></li>
                    
                   
                  </ul>
                </li>
              </ul>
              <!-- End #main-nav -->
              
              <!-- End #messages -->
            </div>
            </div>
           
           </div>
          <!-- End #sidebar -->
            <iframe frameborder="0" id="frmright" name="frmright" scrolling="yes" src="KindList.aspx" style="height:2000px;visibility:inherit;width:100%;z-index:1;position: absolute;left: 0px;top: 0px;"></iframe>
            
          
          <!-- End #main-content -->
        </div>
    </form>
</body>
<!-- Download From www.exet.tk-->
</html>
