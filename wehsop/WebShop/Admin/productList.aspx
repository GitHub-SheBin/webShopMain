<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminWeb.Master" AutoEventWireup="true" CodeBehind="productList.aspx.cs" Inherits="WebShop.Admin.productList" %>

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

                data: { id: idList, type: "productInfo" },

                success: function (data) {
                    if (data == "0") {
                        alert("删除成功！");

                    } else {
                        alert(data + "条记录删除未成功！");

                    }
                    window.location.href = "productInfoList.aspx";
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
            <h3>产品信息管理</h3>
            
            <div class="clear"></div>
          </div>
          <!-- End .content-box-header -->
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <!-- This is the target div. id must match the href of this div's tab -->
              <div class="notification attention png_bg"> <a href="#" class="close"><img src="resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                <div> 产品信息管理，您可以通过此页面对产品信息进行管理！ </div>
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
                        <div class="clear"></div>
                        <div>
                            产品名：<asp:TextBox ID="tb_PName" runat="server" CssClass="text-input"></asp:TextBox>
                            品牌名：<asp:TextBox ID="tb_brand" runat="server" CssClass="text-input"></asp:TextBox>
                            种类名：<asp:TextBox ID="tb_KindName" runat="server" CssClass="text-input"></asp:TextBox>
                           

                            <asp:Button ID="bt_submit" runat="server" Text="搜 索" class="button"  OnClick="bt_submit_Click" />
                        </div>

                        <div class="pagination">
                          
                         <%--<webdiyer:AspNetPager ID="shopManagePager" runat="server" AlwaysShow="True" PageSize="15" ShowNavigationToolTip="True" onPageChanging="shopManagePager_PageChanging" CssClass="number" >
                        </webdiyer:AspNetPager>--%>
                        
                            <webdiyer:aspnetpager ID="productInfoListPager" runat="server" AlwaysShow="true" PageSize="15" ShowNavigationToolTip="true" OnPageChanged="productInfoListPager_PageChanged" CssClass="number"></webdiyer:aspnetpager>
                          </div>
                      <!-- End .pagination -->
                      <div class="clear"></div>
                    </td>
                  </tr>
                  <tr>
                    <th style="width:4%">
                      <input class="check-all" type="checkbox" />
                    </th>
                    <th style="width:10%">产品名</th>
                    <th style="width:15%">缩略图</th>
                    <th style="width:15%">产品介绍</th>
                    <th style="width:8%">热门</th>
                    <th style="width:8%">热门排序号</th>
                    <th style="width:8%">顶</th>
                    <th style="width:8%">顶排序号</th>
                    <th style="width:15%">图集</th>
                    
                    <th style="width:5%">操作</th>
                      <th></th>
                  </tr>
                </thead>
                <tfoot>
                  
                </tfoot>
                <tbody>
                   
                    <asp:Repeater ID="rp_productList" runat="server" OnItemCommand="rp_productList_ItemCommand" OnItemDataBound="rp_productList_ItemDataBound">
                       <ItemTemplate>
                              <tr>
                                <td>
                                 <input type="checkbox" name="cb_son" value='<%#Eval("id") %>' />
                                 
                                </td>
                                <td>
                                   <%#Eval("pname") %></td>
                                <td><img src="/<%#Eval("imgUrl") %>"  style="width:200px;height:200px;"/></td>
                               
                                <td><%#Eval("pContent") %></td>
                                <td><%#Eval("isHot")=="False"?"是":"否" %></td>
                                <td><%#Eval("Hotorder") %></td>
                                  <td>
                                      <%#Eval("isTop")=="Fasle"?"是":"否" %>
                                  </td>
                                  <td><%#Eval("Toporder") %></td>
                                  <td>
                                      <asp:HyperLink ID="HLimg" runat="server"></asp:HyperLink>
                                  </td>
                               
                                <td>
                                  <!-- Icons -->
                                  <a href="EditproductInfo.aspx?id=<%#Eval("id") %>" title="Edit"><img src="resources/images/icons/pencil.png" alt="Edit" /></a> 
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
</asp:Content>
