<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="adlist.aspx.cs" Inherits="WebShop.Admin.adlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main-content" style="width:90%;">
       <div class="content-box" style="width:95%;">
          <!-- Start Content Box -->
          <div class="content-box-header">
            <h3>首页广告信息管理</h3>
            
            <div class="clear"></div>
          </div>
          <!-- End .content-box-header -->
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <!-- This is the target div. id must match the href of this div's tab -->
              <div class="notification attention png_bg"> <a href="#" class="close"><img src="resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                <div>首页广告信息管理信息管理，您可以通过此页面对首页广告信息管理信息进行管理！ </div>
              </div>
               
                    <table>
                <thead style="font-size:initial;">
                    <tr>
                    <td colspan="7">
                      <div class="bulk-actions align-left">
                          <select name="dropdown" id="dl_ActionList" hidden="hidden">
                              <option value="0">请选择一种操作...</option>
                              
                              <option value="2">批量删除</option>
                          </select>
                        <input type="button" class="button" onclick="doAction()" value="执行操作" hidden="hidden"/> </div>
                        <div class="pagination">
                          
                         
                        
                            <%--<webdiyer:AspNetPager ID="pageContentPager" runat="server" AlwaysShow="true" PageSize="15" ShowNavigationToolTip="true" OnPageChanged="pageContentPager_PageChanged" CssClass="number"></webdiyer:AspNetPager>--%>
                          </div>
                      <!-- End .pagination -->
                      <div class="clear"></div>
                    </td>
                  </tr>
                  <tr>
                    <th style="width:4%">
                      <input class="check-all" type="checkbox" />
                    </th>
                    <th style="width:10%">广告名称</th>
                    <th style="width:20%">广告图片</th>
                    <th style="width:15%">链接地址</th>
                    <th style="width:15%">广告位置</th>
                    
                    <th style="width:10%"></th>
                      <th></th>
                  </tr>
                </thead>
                <tfoot>
                  
                </tfoot>
                <tbody>
                    
                    <asp:Repeater ID="rp_adlist" runat="server" OnItemCommand="rp_adlist_ItemCommand">
                       <ItemTemplate>
                              <tr>
                                <td>
                                 <input type="checkbox" name="cb_son" value='<%#Eval("id") %>' />
                                 
                                </td>
                                <td>
                                   <%#Eval("name") %></td>
                                <td><img src="/<%#Eval("imgUrl") %>"  style="width:200px;height:200px;"/></td>
                                  <td>
                                      <%#Eval("webUrl") %>

                                  </td>
                                <td><%#Eval("isTop").ToString()=="False"?"右侧广告":"首页轮换广告" %></td>
                               
                                <td>
                                  <!-- Icons -->
                                  <a href="editAdList.aspx?id=<%#Eval("id") %>" title="Edit"><img src="resources/images/icons/pencil.png" alt="Edit" /></a> 
                                  <asp:LinkButton ID="lb_Detele" runat="server" CommandName="delete" CommandArgument='<%#Eval("id") %>' OnClientClick="confirm('确定要删除该顶类?此顶类下类别也一同被删除'))"><img src="resources/images/icons/cross.png" alt="Delete" /></asp:LinkButton>
                                </td>
                              </tr>
                       </ItemTemplate>
                    </asp:Repeater>
                 
                 
                </tbody>
              </table>
              
            </div>

          </div>
        </div>
    </div>
</asp:Content>
