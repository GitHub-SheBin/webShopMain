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
    public partial class productList : System.Web.UI.Page
    {
        protected Func<db_ProductInfo, bool> where = o => o.Id>0;

       

        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                var cid = Request.QueryString["cid"];
                if(cid!=null){
                    int tempid=Convert.ToInt32(cid);
                    where += o => o.KindId==tempid;
                }
                productInfoListPager.RecordCount = publicBLL.getWhereCount<db_ProductInfo>(where);
                    rp_productListDataBind();
            }
        }

        protected void rp_productList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                var tempId = Convert.ToInt32(e.CommandArgument);
                //删除Item下分支
                var context = publicBLL.getdbContext();
                var tempItem = tempId.getEnityById<db_ProductInfo>(context);
                var tempList = context.db_ProductImgInfo.Where(o=>o.productId==tempId);
                foreach(var item in tempList){
                    context.db_ProductImgInfo.Remove(item);
                }
                context.db_ProductInfo.Remove(tempItem);
                try {
                    context.SaveChanges();
                    Response.Write("<script>alert('删除成功！');</script>");
                }
                catch {
                    Response.Write("<script>alert('删除失败！');</script>");
                }

               
                
                   
                
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
            }

        }

        protected void rp_productList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink HLinfo = e.Item.FindControl("HLimg") as HyperLink;
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int tempId = Convert.ToInt32(drv["id"]);
                int dataCount = publicBLL.getWhereCount<db_ProductImgInfo>(o => o.productId==tempId);
                HLinfo.NavigateUrl = string.Format("productImgList.aspx?cid={0}", tempId);
                HLinfo.Text = string.Format("共有{0}条信息", dataCount);
            }
        }

        protected void productInfoListPager_PageChanged(object sender, EventArgs e)
        {
            rp_productListDataBind();
        }

        protected void rp_productListDataBind() {
            List<db_ProductInfo> tempList = publicBLL .getOrdePagerByList<db_ProductInfo>(productInfoListPager.StartRecordIndex, productInfoListPager.EndRecordIndex, where,o=>o.createTime,false);
            rp_productList.DataSource =publicBLL.ListToDataTable(tempList);
            rp_productList.DataBind();    
        
        }

        protected void bt_submit_Click(object sender, EventArgs e)
        {
            if(tb_PName.Text!=string.Empty){
                where += o => o.PName == tb_PName.Text.Trim();
            }
            if(tb_KindName.Text!=string.Empty){
                where += o => o.db_sonkindInfo.name == tb_KindName.Text;
            }
            if(tb_brand.Text!=string.Empty){
                where += o => o.BrandName == tb_brand.Text.Trim();
            }
        }

    }
}