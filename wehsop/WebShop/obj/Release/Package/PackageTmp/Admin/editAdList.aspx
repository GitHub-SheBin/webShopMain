<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="editAdList.aspx.cs" Inherits="WebShop.Admin.editAdList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main-content" style="width:80%;">
      
              <div class="content-box">
              <!-- Start Content Box -->
              <div class="content-box-header">
                <h3 style="cursor: s-resize;">添加/修改首页广告种类信息</h3>
        
                <div class="clear"></div>
              </div>
              <!-- End .content-box-header -->
              <div class="content-box-content">
                <div style="display: block;" class="tab-content default-tab" id="tab1">
                  <!-- This is the target div. id must match the href of this div's tab -->
                  <div class="notification attention png_bg"> <a href="#" class="close"><img src="../resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close"></a>
                    <div>您可以通过此页面对相应的产品种类信息进行修改或添加产品种类信息！</div>
                  </div>
                  
                      <table >
                           <thead></thead>
                          <tfoot></tfoot>
                        <tbody>
                          <tr class="alt-row ">
                            <td class="auto-style1 tdText">
                              广告名：
                            </td>
                            <td style="width:300px;">
                                <asp:TextBox ID="tb_Name" runat="server" CssClass="text-input" Width="300px" ></asp:TextBox>
                                
                                <asp:Literal ID="lb_id" runat="server" Visible="false"></asp:Literal>
                            </td>
                    
                          </tr>
                          
                          <tr class="">
                            <td class="auto-style1 tdText">
                              图片上传：
                            </td>
                            <td style="width:300px;">
                                
                                <asp:FileUpload ID="fp_imgUrl" runat="server"  CssClass="ImgUrlFU" />
                                
                            </td>
                    
                          </tr>
                         
                            <tr class="alt-row ">
                                <td class="auto-style1 tdText">
                                  链接地址：
                                </td>
                                <td style="width:300px;">
                                    <asp:TextBox ID="tb_webUrl" runat="server" CssClass="text-input" Width="400px"></asp:TextBox>
                                    
                                </td>
                            </tr>


                            <tr class=""alt-row ">
                                <td class="auto-style1 tdText">
                                  广告位置：
                                </td>
                                <td style="width:300px;">
                                
                                    <asp:DropDownList ID="dl_isTop" runat="server" CssClass="dropDownlistClass">
                                        <asp:ListItem Value="1" Text="首页轮换"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="右侧广告"></asp:ListItem>
                                    </asp:DropDownList>
                                
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
        
    </div>
</asp:Content>
