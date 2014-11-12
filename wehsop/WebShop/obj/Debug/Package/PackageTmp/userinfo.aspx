<%@ Page Title="" Language="C#" MasterPageFile="/Web.Master" AutoEventWireup="true" CodeBehind="userinfo.aspx.cs" Inherits="WebShop.Web.userinfo" %>
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
        	<dt><a href="userinfo.aspx">个人设置</a></dt>
        	<dd><a href="userinfo.aspx">个人资料</a></dd>
        	<dd><a href="setpw.aspx">修改密码</a></dd>
        	<dd><a href="setpw.aspx">修改密码</a> 收货地址</dd>
        </dl>
    </div>
    <div class="infocon">
    	<p class="infocon_tit">个人资料</p>
        <div class="infocon_box">
        	<p>昵称： <input type="text" value="sdfds " class="nc" /></p>
        	<p>性别： <input type="radio" name="sex" />男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" />女</p>
        	<p>生日：</p>
        	<p>邮箱： <input type="text" class="yxipt" value="sadfsd@163.com"/> <a href="javascript:;" class="change_yx">修改</a><span style="padding:0 10px; color:#666">已验证</span></p>
        </div>
        <p style="text-align:center; margin-top:100px;"><a href="javascript:;"><img src="images/submit.jpg" width="117" height="30" /></a></p>
    </div>
</asp:Content>
