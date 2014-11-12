using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Model;
using WebShop.BLL;
using System.Data;

namespace WebShop.Admin
{
    public partial class sonKindlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var cid = 0;
                int totalOrders = 0;
                
                if(Request.QueryString["cid"]!=null){
                    try {
                        cid = Convert.ToInt32(Request.QueryString["cid"]);

                    }
                    catch {
                        
                    }
                }
                if (cid != 0)
                {
                    totalOrders = publicBLL.getWhereCount<db_sonkindInfo>(o => o.kindid == cid);
                }
                else {
                    totalOrders = publicBLL.getWhereCount<db_sonkindInfo>(o=>true);
                }
                kindPager.RecordCount = totalOrders;
                rp_KindDataBind(cid);

            }
        }

        protected void rp_Kind_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink HLinfo = e.Item.FindControl("HLinfo") as HyperLink;
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int tempId = Convert.ToInt32(drv["id"]);

                int dataCount = publicBLL.getWhereCount<db_ProductInfo>(o => o.KindId == tempId);
                HLinfo.NavigateUrl = string.Format("productList.aspx?cid={0}", tempId);
                HLinfo.Text = string.Format("共有{0}种商品", dataCount);




            }
        }

        protected void rp_Kind_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                var tempId = Convert.ToInt32(e.CommandArgument); 
                var context = publicBLL.getdbContext();
                var tempItem = tempId.getEnityById<db_sonkindInfo>(context);
            
                

                var tempProductList = context.db_ProductInfo.Where(o => o.KindId == tempItem.id);
                    foreach (var prodcutItem in tempProductList)
                    {
                        var tempImgList = context.db_ProductImgInfo.Where(o => o.productId == prodcutItem.Id);
                        foreach (var imgItem in tempImgList)
                        {
                            context.db_ProductImgInfo.Remove(imgItem);
                        }
                        context.db_ProductInfo.Remove(prodcutItem);
                    }
                    context.db_sonkindInfo.Remove(tempItem);
                
                
                try
                {
                    context.SaveChanges();
                    Response.Write("<script>alert('删除成功！');</script>");
                }
                catch
                {
                    Response.Write("<script>alert('删除失败！');</script>");
                }

                Response.Write(string.Format("<script>window.location.href='kindlist.aspx'</script>"));
            }
        }

        protected void kindPager_PageChanged(object sender, EventArgs e)
        {
            int cid = 0;
            if(Request.QueryString["cid"]==null){
                try { cid = Convert.ToInt32(Request.QueryString["cid"]); }
                catch { }
               
            }
            rp_KindDataBind(cid);
        }

        protected void rp_KindDataBind(int cid) {
            List<db_sonkindInfo> tempList = new List<db_sonkindInfo>();
            if (cid != 0)
            {
                tempList = publicBLL.getPageByT<db_sonkindInfo>(kindPager.StartRecordIndex, kindPager.EndRecordIndex, o => true, o => o.id);
            }
            else {
                tempList = publicBLL.getPageByT<db_sonkindInfo>(kindPager.StartRecordIndex, kindPager.EndRecordIndex, o => o.kindid==cid, o => o.id);
            }
            
            rp_Kind.DataSource = publicBLL.ListToDataTable(tempList);
            rp_Kind.DataBind();
        }
    }
}