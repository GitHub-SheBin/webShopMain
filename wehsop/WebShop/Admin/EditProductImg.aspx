<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="EditProductImg.aspx.cs" Inherits="WebShop.Admin.EditProductImg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main-content" style="width:80%;">
      
              <div class="content-box">
              <!-- Start Content Box -->
              <div class="content-box-header">
                <h3 style="cursor: s-resize;">添加/修改产品图片集信息</h3>
        
                <div class="clear"></div>
              </div>
              <!-- End .content-box-header -->
              <div class="content-box-content">
                <div style="display: block;" class="tab-content default-tab" id="tab1">
                  <!-- This is the target div. id must match the href of this div's tab -->
                  <div class="notification attention png_bg"> <a href="#" class="close"><img src="../resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close"/></a>
                    <div>您可以通过此页面对相应的产品图片集信息进行修改或添加产品图片集展示信息！</div>
                  </div>
                  
                      <table >
                           <thead></thead>
                          <tfoot></tfoot>
                        <tbody>
                          
                          <tr class="alt-row  ">
                            <td class="auto-style1 tdText" style="width: 10%;">
                              展示图片上传：
                            </td>
                            <td style="width:300px;">
                                <asp:FileUpload ID="ImgFU" runat="server" CssClass="ImgUrlFU"  ></asp:FileUpload>
                                
                                 <asp:Literal ID="lb_id" runat="server" Visible="false"></asp:Literal>
                            </td>
                          </tr>
                         
                            <tr class="" >
                            <td class="auto-style1 tdText">
                              所属产品：
                            </td>
                            <td>
                                <asp:DropDownList ID="dl_product" runat="server" CssClass="dropDownlistClass">
                                    
                                </asp:DropDownList>
                               
                            </td>                 
                          </tr>
                            <tr class="alt-row">
                            <td class="auto-style1 tdText">
                             排序号:
                            </td>
                            <td style="text-align:center;" >
                                <asp:TextBox ID="tb_orderNum" runat="server" CssClass="text-input" Width="300px" style="float:left;" ></asp:TextBox>
                                
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
