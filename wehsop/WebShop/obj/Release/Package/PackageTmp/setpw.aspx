<%@ Page Title="" Language="C#" MasterPageFile="/Web.Master" AutoEventWireup="true" CodeBehind="setpw.aspx.cs" Inherits="WebShop.Web.setpw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userside">
    	<p style="font-size:20px; color:#0052a0; font-weight:bold; height:30px; line-height:30px; text-align:center">用户中心</p>
        <dl class="userside_dl dl1">
        	<dt>订单管理</dt>
        	<dd>我的订单</dd>
        	<dd>我的团购</dd>
        </dl>
        <dl class="userside_dl dl2">
        	<dt>个人设置</dt>
        	<dd>个人资料</dd>
        	<dd>修改密码</dd>
        	<dd>收货地址</dd>
        </dl>
    </div>
    <div class="infocon">
    	<p class="infocon_tit">修改密码</p>
        <div class="infocon_box">
        	<div class="mesipt">
                <p>旧密码</p>
                <p><input class="oldpw" type="password" /></p>
                <p>新密码</p>
                <p><input class="newpw" type="password" /></p>
                <p>确认新密码</p>
                <p><input class="confirmpw" type="password" /></p>
                <p>验证码</p>    
                <p>
                	<input class="yzcode" type="text" />
                </p> 
                <p style="color:#666; padding:0">点击图片更换验证码</p> 
                <p style="margin-top:30px;"><a class="setpw" href=""><img src="images/setpw.jpg" width="117" height="30" /></a></p>
            </div>
        </div>   
        
    </div>
</asp:Content>
