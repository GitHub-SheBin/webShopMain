<%@ Page Title="" Language="C#" MasterPageFile="/Web.Master" AutoEventWireup="true" CodeBehind="setaddr.aspx.cs" Inherits="WebShop.Web.setaddr" %>
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
    	<p class="infocon_tit">收货地址</p>
        <div class="infocon_box">
        	<div class="fill_mes">
                <p>
                    <label class="mes_l">收货人：</label><input class="shr" type="text"><span class="mes_des">请输入收货人姓名，最多五个汉字</span>
                </p>
                <p>
                    <label class="mes_l">邮编：</label><input class="yb" type="text"><span class="mes_des">请填写准确的邮编，以确保商品尽快送达</span>
                </p>
                <p>
                    <label class="mes_l">所在省市：</label><input type="text"><span class="mes_des">请输入收货人姓名，最多五个汉字</span>
                </p>
                <p>
                    <label class="mes_l">详细地址：</label><input class="addr" type="text"><span class="mes_des">请填写详细地址</span>
                </p>
                <p>
                    <label class="mes_l">移动电话：</label><input class="mobil" type="text"><span class="mes_des">请填写详细地址</span>
                </p>
                <p>
                    <label class="mes_l">固定电话：</label><input class="tel" type="text"><span class="mes_des">手机和固定电话至少有一项必填</span>
                </p>
       	    </div>
            <p style="text-align:right; padding-right:100px;"><a href="" class="addaddr"><img src="images/addaddr.jpg" width="117" height="30" /></a></p>        
        </div>   
        <p class="infocon_tit">已添加的地址：</p>
        <div>
        	<p style="height:30px; padding-left:20px;line-height:30px; font-size:14px; color:#666; padding-top:5px;">广东省 广州市 荔湾区 西园国际数码城2FC031 </p>
        </div>	
    </div>
</asp:Content>
