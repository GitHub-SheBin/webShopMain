<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="EditProductInfo.aspx.cs" Inherits="WebShop.Admin.EditProductInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main-content" style="width:80%;">
      
              <div class="content-box">
              <!-- Start Content Box -->
              <div class="content-box-header">
                <h3 style="cursor: s-resize;">添加/修改页面展示信息</h3>
        
                <div class="clear"></div>
              </div>
              <!-- End .content-box-header -->
              <div class="content-box-content">
                <div style="display: block;" class="tab-content default-tab" id="tab1">
                  <!-- This is the target div. id must match the href of this div's tab -->
                  <div class="notification attention png_bg"> <a href="#" class="close"><img src="../resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close"></a>
                    <div>您可以通过此页面对相应的页面展示信息进行修改或添加页面展示信息！</div>
                  </div>
                 
                      <table >
                           <thead></thead>
                          <tfoot></tfoot>
                        <tbody>
                          <tr class="alt-row ">
                            <td class="auto-style1 tdText" style="width:15%">
                              标题名：
                            </td>
                            <td style="width:300px;">
                                <asp:TextBox ID="tb_Name" runat="server" CssClass="text-input" Width="300px" style="float:left;"></asp:TextBox>
                              
                                <asp:Literal ID="lb_id" runat="server" Visible="false"></asp:Literal>
                            </td>
                    
                          </tr>
                          <tr class="">
                            <td class="auto-style1 tdText">
                              展示内容：
                            </td>
                            <td style="width:300px;">
                                <asp:TextBox ID="tb_content" runat="server" CssClass="text-input" TextMode="MultiLine" Height="93px" Width="381px" ></asp:TextBox>
                                
                               
                            </td>
                    
                          </tr>
                          <tr class="alt-row  ">
                            <td class="auto-style1 tdText">
                              展示图片上传：
                            </td>
                            <td style="width:300px;">
                                <asp:FileUpload ID="ImgFU" runat="server" CssClass="ImgUrlFU"  ></asp:FileUpload>
                                
                            </td>
                          </tr>
                          <tr class="" >
                            <td class="auto-style1 tdText">
                              是否为热门：
                            </td>
                            <td>
                                <asp:DropDownList ID="dl_IsHot" runat="server" CssClass="dropDownlistClass">
                                  
                                    <asp:ListItem Text="否" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                                </asp:DropDownList>

                                
                                排序号：
                                <asp:TextBox ID="tb_HotOrder" runat="server" CssClass="text-input"></asp:TextBox>
                                
                            </td>                 
                          </tr>
                            <tr class=" alt-row" >
                                <td class="auto-style1 tdText">
                                  是否为顶尖：
                                </td>
                                <td>
                                    <asp:DropDownList ID="dl_isTop" runat="server" CssClass="dropDownlistClass">
                                  
                                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                                    </asp:DropDownList>

                                     
                                    排序号：
                                    <asp:TextBox ID="tb_TopOrder" runat="server" CssClass="text-input"></asp:TextBox>
                                   
                                </td>                 
                          </tr>
                            <tr class="" >
                            <td class="auto-style1 tdText">
                              类别：
                            </td>
                            <td>
                                <asp:DropDownList ID="dl_productClass" runat="server" CssClass="dropDownlistClass">
                                    
                                </asp:DropDownList>
                                
                            </td>                 
                          </tr>
                           <tr class=" alt-row" >
                            <td class="auto-style1 tdText">
                              原价：
                            </td>
                            <td>
                                <asp:TextBox ID="tb_CostPrice" runat="server" CssClass="text-input"></asp:TextBox>元
                               
                            </td>                 
                          </tr>
                           <tr class="" >
                            <td class="auto-style1 tdText">
                              销售价：
                            </td>
                            <td>
                                <asp:TextBox ID="tb_salPrice" runat="server" CssClass="text-input"></asp:TextBox>元
                                
                            </td>                 
                          </tr>
                          <tr class=" alt-row" >
                            <td class="auto-style1 tdText">
                             淘宝链接：
                            </td>
                            <td>
                                <asp:TextBox ID="tb_taobaoUrl" runat="server" Width="469px" CssClass="text-input"></asp:TextBox>
                               
                            </td>                 
                          </tr>
                            <tr class="" >
                            <td class="auto-style1 tdText">
                             品牌名：
                            </td>
                            <td>
                                <asp:TextBox ID="tb_BrandName" runat="server" CssClass="text-input"></asp:TextBox>
                               
                            </td>                 
                          </tr>
                        </tbody>
                      </table>
                      <asp:Button ID="bt_Sure"  runat="server"  Text="确定操作" CssClass="button buttomClass"   OnClick="bt_Sure_Click"></asp:Button>
                

                </div>
                <!-- End #tab1 -->
        
                <!-- End #tab2 -->
              </div>
              <!-- End .content-box-content -->
            </div>
        
    </div>
</asp:Content>
