<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="EditAdminInfo.aspx.cs" Inherits="WebShop.Admin.EditAdminInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main-content" style="width:80%;">
      
              <div class="content-box">
              <!-- Start Content Box -->
              <div class="content-box-header">
                <h3 style="cursor: s-resize;">添加/修改管理员信息</h3>
        
                <div class="clear"></div>
              </div>
              <!-- End .content-box-header -->
              <div class="content-box-content">
                <div style="display: block;" class="tab-content default-tab" id="tab1">
                  <!-- This is the target div. id must match the href of this div's tab -->
                  <div class="notification attention png_bg"> <a href="#" class="close"><img src="../resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close"/></a>
                    <div>您可以通过此页面对相应的管理员进行修改或添加管理员信息！</div>
                  </div>
                  
                      <table >
                           <thead></thead>
                          <tfoot></tfoot>
                        <tbody>
                          <tr class="alt-row ">
                            <td class="auto-style1 tdText">
                              用户名：
                            </td>
                            <td style="width:300px;">
                                <asp:TextBox ID="tb_Name" runat="server" CssClass="text-input" Width="300px" ></asp:TextBox>
                                
                                <asp:Literal ID="lb_id" runat="server" Visible="false"></asp:Literal>
                            </td>
                    
                          </tr>
                          <tr class="alt-row ">
                            <td class="auto-style1 tdText">
                              密码：
                            </td>
                            <td style="width:300px;">
                                <asp:TextBox ID="tb_Pwd" runat="server" CssClass="text-input" Width="300px" ></asp:TextBox>
                                
                                <asp:Literal ID="Literal3" runat="server" Visible="false"></asp:Literal>
                            </td>
                    
                         </tr>
                         <tr class="">
                           <td class="auto-style1 tdText">
                              真实姓名：
                            </td>
                            <td style="width:300px;">
                                <asp:TextBox ID="tb_TrueName" runat="server" CssClass="text-input" Width="300px" ></asp:TextBox>
                                
                                <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
                            </td>
                          </tr>
                          
                         
                           

                        </tbody>
                      </table>
                      <asp:Button ID="bt_Sure"  runat="server"  Text="确定操作" CssClass="button buttomClass"   OnClick="bt_Sure_Click" ></asp:Button>
                  
                </div>
                <!-- End #tab1 -->
        
                <!-- End #tab2 -->
              </div>
              <!-- End .content-box-content -->
            </div>
</asp:Content>
