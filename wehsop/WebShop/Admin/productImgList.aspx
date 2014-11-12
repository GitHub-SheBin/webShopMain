<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="productImgList.aspx.cs" Inherits="WebShop.Admin.productImgList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>


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

                 data: { id: idList, type: "productImg" },

                 success: function (data) {
                     if (data == "0") {
                         alert("删除成功！");

                     } else {
                         alert(data + "条记录删除未成功！");

                     }
                     window.location.href = "productImgList.aspx";
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
            <h3>产品图片集信息管理</h3>
            
            <div class="clear"></div>
          </div>
          <!-- End .content-box-header -->
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <!-- This is the target div. id must match the href of this div's tab -->
              <div class="notification attention png_bg"> <a href="#" class="close"><img src="resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                <div> 产品图片信息管理，您可以通过此页面对产品图片信息进行管理！ </div>
              </div>
               
                    <table>
                <thead style="font-size:initial;">
                      <tr>
                    <td colspan="7">
                      <div class="bulk-actions align-left">
                          <select name="dropdown" id="dl_ActionList">
                              <option value="0">请选择一种操作...</option>
                              
                              <option value="2">批量删除</option>
                          </select>
                        <input type="button" class="button" onclick="doAction()" value="执行操作"/> </div>
                        <div class="pagination">
                          
                         <%--<webdiyer:AspNetPager ID="shopManagePager" runat="server" AlwaysShow="True" PageSize="15" ShowNavigationToolTip="True" onPageChanging="shopManagePager_PageChanging" CssClass="number" >
                        </webdiyer:AspNetPager>--%>
                        
                            <webdiyer:AspNetPager ID="productImgPager" runat="server" AlwaysShow="true" PageSize="15" ShowNavigationToolTip="true" OnPageChanged="productImgPager_PageChanged" CssClass="number"></webdiyer:AspNetPager>
                          </div>
                      <!-- End .pagination -->
                      <div class="clear"></div>
                    </td>
                  </tr>
                  <tr>
                    <th style="width:4%">
                      <input class="check-all" type="checkbox" />
                    </th>
                   
                    <th style="width:20%">缩略图</th>
                    <th style="width:10%">排序号</th>
                    
                    <th style="width:10%"></th>
                      <th></th>
                  </tr>
                </thead>
                <tfoot>
                  
                </tfoot>
                <tbody>
                  
                    <asp:Repeater ID="rp_productImg" runat="server" OnItemCommand="rp_productImg_ItemCommand">
                       <ItemTemplate>
                              <tr>
                                <td>
                                 <input type="checkbox" name="cb_son" value='<%#Eval("id") %>' />
                                 
                                </td>
                              
                                <td><img src="/<%#Eval("imgUrl") %>"  style="width:200px;height:200px;"/></td>                           
                               <td><%#Eval("orderNum") %></td>
                                <td>
                                  <!-- Icons -->
                                  <a href="EditProductImg.aspx?id=<%#Eval("id") %>" title="Edit"><img src="resources/images/icons/pencil.png" alt="Edit" /></a> 
                                  <asp:LinkButton ID="lb_Detele" runat="server" CommandName="delete" CommandArgument='<%#Eval("id") %>'><img src="resources/images/icons/cross.png" alt="Delete" /></asp:LinkButton>
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
