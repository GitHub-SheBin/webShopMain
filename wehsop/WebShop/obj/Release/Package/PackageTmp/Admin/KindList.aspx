﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="KindList.aspx.cs" Inherits="WebShop.Admin.KindList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer"  TagPrefix="webdiyer"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function doAction() {
             var actionValue = document.getElementById("dl_ActionList").value;

             switch (actionValue) {

                 case "2":
                     deleteSomeItem();
                     break;
             }

         }
         function deleteSomeItem() {
             var checkAll = document.getElementsByName("cb_son");
             var idList = "";

             for (var i = 0; i < checkAll.length; i++) {
                 if (checkAll[i].checked == true) {
                     idList += checkAll[i].value + "-";
                 }

             }
             if (idList == "") {
                 alert("请选择至少一条记录！");
                 return;
             }
             $.ajax({
                 url: 'deleteSomeItem.ashx',
                 async: false,
                 type: 'POST',

                 data: { id: idList, type: "pageContentClass" },

                 success: function (data) {
                     if (data == "0") {
                         alert("删除成功！");

                     } else {
                         alert(data + "条记录删除未成功！");

                     }
                     window.location.href = "pageContentClassList.aspx";
                 }

             });
         }

         
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="main-content" style="width:90%;">
       <div class="content-box" style="width:95%;">
          <!-- Start Content Box -->
          <div class="content-box-header">
            <h3>页面编辑类别信息管理</h3>
            
            <div class="clear"></div>
          </div>
          <!-- End .content-box-header -->
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <!-- This is the target div. id must match the href of this div's tab -->
              <div class="notification attention png_bg"> <a href="#" class="close"><img src="resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                <div>页面编辑类别信息管理，您可以通过此页面对页面编辑类别信息进行管理！ </div>
              </div>
               
                    <table>
                <thead style="font-size:initial;">
                    <tr>
                    <td colspan="6">
                      <div class="bulk-actions align-left">
                          <select name="dropdown" id="dl_ActionList">
                              <option value="0">请选择一种操作...</option>
                              
                              <option value="2">批量删除</option>
                          </select>
                        <input type="button" class="button" onclick="doAction()" value="执行操作"/> </div>
                        <div class="pagination">
                          
                         <webdiyer:AspNetPager ID="kindPager" runat="server" AlwaysShow="True" PageSize="15" ShowNavigationToolTip="True" OnPageChanged="shopManagePager_PageChanged" CssClass="number" >
                        </webdiyer:AspNetPager>
                        
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
                    <th style="width:10%">种类名</th>
                    <th style="width:20%">种类说明</th>
                    <th style="width:15%">种类下信息</th>
                    
                    
                    <th style="width:10%"></th>
                      <th></th>
                  </tr>
                </thead>
                <tfoot>
                  
                </tfoot>
                <tbody>
                    
                    <asp:Repeater ID="rp_Kind" runat="server" OnItemCommand="rp_Kind_ItemCommand" OnItemDataBound="rp_Kind_ItemDataBound">
                       <ItemTemplate>
                              <tr>
                                <td>
                                 <input type="checkbox" name="cb_son" value='<%#Eval("id") %>' />
                                 
                                </td>
                                <td>
                                   <%#Eval("KindName") %></td>
                                <td><%#Eval("pagecontent") %></td>
                                  <td>
                                      <asp:HyperLink ID="HLInfo" runat="server"></asp:HyperLink>

                                  </td>
                                
                               
                                <td>
                                  <!-- Icons -->
                                  <a href="EditKindList.aspx?id=<%#Eval("id") %>" title="Edit"><img src="resources/images/icons/pencil.png" alt="Edit" /></a> 
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
