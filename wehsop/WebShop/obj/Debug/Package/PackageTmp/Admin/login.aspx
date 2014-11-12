<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebShop.Admin.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>管理员登录</title>
<!--                       CSS                       -->
<!-- Reset Stylesheet -->
<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
<!-- Main Stylesheet -->
<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />
<!--                       Javascripts                       -->
<!-- jQuery -->
<script type="text/javascript" src="Scripts/jquery-1.8.2.min.js"></script>
<!-- jQuery Configuration -->
<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="resources/scripts/facebox.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
</head>
<body id="login">
<div id="login-wrapper" class="png_bg">
  <div id="login-top">
    <h1>管理系统</h1>
    <!-- Logo (221px width) -->
    <a href="#"><img id="logo" src="resources/images/logo.png" alt="管路系统" /></a> </div>
  <!-- End #logn-top -->
  <div id="login-content">
    <form id="Form1"  runat="server">
      <div class="notification information png_bg">
        <div> 请输出管理员账号和密码以完成登录！</div>
      </div>
      <p>
        <label>管理员账号</label>
        <asp:TextBox ID="tb_UserName" runat="server" CssClass="text-input"></asp:TextBox>
      </p>
      <div class="clear"></div>
      <p>
        <label>密码</label>
          <asp:TextBox ID="tb_Pwd" runat="server" CssClass="text-input" TextMode="Password"></asp:TextBox>
      </p>
      <div class="clear"></div>
      
      <div class="clear"></div>
      <p>
          <asp:Button ID="bt_Login" CssClass="button" Text="登 录" runat="server" OnClick="bt_Login_Click" />
         
      </p>
      <div class="clear"></div>
      
     
    </form>
  </div>
  <!-- End #login-content -->
</div>
<!-- End #login-wrapper -->
</body>
</html>
