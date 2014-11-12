using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.BLL;
using WebShop.Model;
using System.Data;

namespace WebShop.Admin
{
    public partial class KindList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                    int totalOrders = publicBLL.getWhereCount<db_KindInfo>(o => true);
                    kindPager.RecordCount = totalOrders;
                    rp_KindDataBind(0);
                
            }
        }

        protected void shopManagePager_PageChanged(object sender, EventArgs e)
        {
            int cid = Convert.ToInt32(Request.QueryString["cid"].ToString());
            rp_KindDataBind(cid);
        }

        protected void rp_Kind_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            { 
                var context=publicBLL.getdbContext();
                var tempId = Convert.ToInt32(e.CommandArgument);
                var tempItem = tempId.getEnityById<db_KindInfo>(context);
               
                var tempSonKindList = context.db_sonkindInfo.Where(o=>o.kindid==tempId);
                foreach(var item in tempSonKindList){
                    var tempProductList = context.db_ProductInfo.Where(o=>o.KindId==item.id);
                    foreach(var prodcutItem in tempProductList){
                        var tempImgList = context.db_ProductImgInfo.Where(o=>o.productId==prodcutItem.Id);
                        foreach(var imgItem in tempImgList){
                            context.db_ProductImgInfo.Remove(imgItem);
                        }
                        context.db_ProductInfo.Remove(prodcutItem);
                    }
                    context.db_sonkindInfo.Remove(item);
                }
                context.db_KindInfo.Remove(tempItem);
                try{
                    context.SaveChanges();
                    Response.Write("<script>alert('删除成功！');</script>");
                }catch{
                    Response.Write("<script>alert('删除失败！');</script>");
                }

                Response.Write(string.Format("<script>window.location.href='kindlist.aspx'</script>"));
            }
        }

        protected void rp_Kind_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink HLinfo = e.Item.FindControl("HLinfo") as HyperLink;
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int tempId = Convert.ToInt32(drv["id"]);
               
                    int dataCount = publicBLL.getWhereCount<db_sonkindInfo>(o => o.kindid ==tempId);
                    HLinfo.NavigateUrl = string.Format("sonKindList.aspx?cid={0}", tempId);
                    HLinfo.Text = string.Format("共有{0}种二级类别", dataCount);

               

                
            }
        }

        protected void rp_KindDataBind(int cid) {
            List<db_KindInfo> tempList = publicBLL.getPageByT<db_KindInfo>(kindPager.StartRecordIndex, kindPager.EndRecordIndex,o=>true, o => o.Id);
            rp_Kind.DataSource = publicBLL.ListToDataTable(tempList);
            rp_Kind.DataBind();
        
        }
    }
}