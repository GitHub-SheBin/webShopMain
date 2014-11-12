using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Model;
using WebShop.BLL;

namespace WebShop.Admin
{
    public partial class productImgList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                int tempId = Convert.ToInt32(Request.QueryString["cid"].ToString());
                int CountNum = publicBLL.getWhereCount<db_ProductImgInfo>(o => o.productId==tempId);
                productImgPager.RecordCount = CountNum;
                rp_productImgDataBind(tempId);
                
            }
        }

        protected void rp_productImg_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                var context=publicBLL.getdbContext();
                var tempId = Convert.ToInt32(e.CommandArgument);
                var tempItem=tempId.getEnityById<db_ProductImgInfo>(context);
                try{
                    context.SaveChanges();
                    Response.Write("<script>alert('删除成功！');</script>");

                }
                catch
                {
                    Response.Write("<script>alert('删除失败！');</script>");
                }
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
            }
        }

        protected void productImgPager_PageChanged(object sender, EventArgs e)
        {
            int tempId = Convert.ToInt32(Request.QueryString["cid"].ToString());

            rp_productImgDataBind(tempId);
        }

        protected void rp_productImgDataBind(int cid) {

            List<db_ProductImgInfo> tempList = publicBLL.getOrdePagerByList<db_ProductImgInfo>(productImgPager.StartRecordIndex, productImgPager.EndRecordIndex, i => i.productId==cid, o => o.Id);
            rp_productImg.DataSource = publicBLL.ListToDataTable(tempList);
            rp_productImg.DataBind();
        }
    }
}