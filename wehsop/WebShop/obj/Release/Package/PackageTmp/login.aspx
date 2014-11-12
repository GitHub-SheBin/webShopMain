<%@ Page Title="" Language="C#" MasterPageFile="/Web.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebShop.Web.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/login.css"/>

    <script type="text/javascript">
        function check() {
            var Fpwd = document.getElementById("ContentPlaceHolder1_tb_Fpwd").value;
            var Spwd = document.getElementById("ContentPlaceHolder1_tb_Spwd").value;
            var userName = document.getElementById("ContentPlaceHolder1_tb_NewUserName").value;
            var FQ = document.getElementById("ContentPlaceHolder1_dl_FQ").value;
            var fa = document.getElementById("ContentPlaceHolder1_tb_FA").value;
            var sq = document.getElementById("ContentPlaceHolder1_dl_SQ").value;
            var sa = document.getElementById("ContentPlaceHolder1_tb_SA").value;
            if (Fpwd == "" | Spwd == "" | userName == "" | FQ == "0" | sq == "0" | sa == "" | fa == "") {
                alert("必填信息未填写！");
                return false;
            }
            if (Fpwd != Spwd) {
                alert("密码输入未一致！");
                return false;
            }
            if (FQ == sq) {
                alert("密码问题选择一致！");
                return false;
            }
            return true;
        }


        function checkLogin() {
            var userName = document.getElementById("ContentPlaceHolder1_tb_userName").value;
            var pwd = document.getElementById("ContentPlaceHolder1_tb_pwd").value;
            if (userName == "" | pwd == "") {
                alert("用户名或密码未填写！");
                return false;
            }

            return true;

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
	<div class="loginblock">
    	<p class="blotit">已有一个账号？</p>
        <div class="blocon">
        	<p>用户名/Email:
                
                <asp:TextBox ID="tb_userName" runat="server"></asp:TextBox>

        	</p>
            <p>登陆密码：
                
                <asp:TextBox ID="tb_pwd" runat="server" TextMode="Password"></asp:TextBox>

            </p>
            <p><a class="forgerpd" href="javascript:;">忘记密码？</a></p>
        </div>
        <p style="padding-left:50px; padding-top:20px;">
           
            <asp:ImageButton ID="bt_ULK" runat="server"  ImageUrl="images/greendl.jpg" Width="98" Height="30" OnClick="bt_ULK_Click" OnClientClick="return checkLogin();"/>
            
            

        </p>
    </div>
    <div class="regblock">
    	<p class="blotit">新用户？</p>
        <div class="blocon">
        	<p>注册邮箱:
                
                <asp:TextBox ID="tb_NewUserName" runat="server"></asp:TextBox>
        	</p>
            <p>创建密码：
                
                <asp:TextBox ID="tb_Fpwd" runat="server" TextMode="Password"></asp:TextBox>
            </p>
            <p>密码确认：
                
                
                <asp:TextBox ID="tb_Spwd" runat="server" TextMode="Password"></asp:TextBox>

            </p>
            
        </div>
        <p style="padding:20px;padding-left:50px; ">请填写密保问题<span style="color:#6b6b6b;padding:0 10px; font-weight:normal;">密保问题用于验证您的身份，请认真填写以便记忆</span></p>
        <div class="mbcon">
        	<div>
                <p><span style="padding:0 10px;">问题一</span>
                   <%-- <select class="mbque" onchange="javascript:;" style="vertical-align:middle; background-color:White">
                            <option value="">请选择密保问题</option>
                            <option value="">aaaa</option>
                            <option value="">bbbb</option>
                    </select>--%>
                    <asp:DropDownList ID="dl_FQ" runat="server" style="vertical-align:middle; background-color:White" class="mbque" >
                        <asp:ListItem Value="0" Text="请选择密保问题" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="你的真实姓名？" Text="你的真实姓名？"></asp:ListItem>
                        <asp:ListItem Value="您的父亲姓名？" Text="您的父亲姓名？"></asp:ListItem>
                        <asp:ListItem Value="您的母亲姓名？" Text="您的母亲姓名？"></asp:ListItem>
                    </asp:DropDownList>   
                </p>
                <p>
                    <span style="padding:0 10px;">答　案</span>
                    
                    <asp:TextBox ID="tb_FA" runat="server" class="daan" ></asp:TextBox>
                </p>
            </div>
            <div>
                <p><span style="padding:0 10px;">问题二</span>
                        <asp:DropDownList ID="dl_SQ" runat="server" style="vertical-align:middle; background-color:White" class="mbque">
                        <asp:ListItem Value="0" Text="请选择密保问题" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="你的真实姓名？" Text="你的真实姓名？"></asp:ListItem>
                        <asp:ListItem Value="您的父亲姓名？" Text="您的父亲姓名？"></asp:ListItem>
                        <asp:ListItem Value="您的母亲姓名？" Text="您的母亲姓名？"></asp:ListItem>
                    </asp:DropDownList>  
                            
                </p>
                
                <p>
                    <span style="padding:0 10px;">答　案</span>
                    <asp:TextBox ID="tb_SA" runat="server" class="daan" ></asp:TextBox>
                </p>
            </div>
        </div>
        <p style="padding:20px;padding-left: 120px;">

            <asp:ImageButton ID="bt_RLK" runat="server" ImageUrl="images/orangezc.jpg" Width="117" Height="30" OnClick="bt_RLK_Click"  OnClientClick="return check();"/>
           
            <%--<a href="javascript:;"><img src="images/orangezc.jpg" width="117" height="30" />

            </a></p>--%>
    </div>    
</asp:Content>
