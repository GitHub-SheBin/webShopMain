using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.BLL;
using WebShop.Model;

namespace WebShop.Admin
{
    public partial class EditProductImg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"] == null ? "0" : Request.QueryString["id"].ToString());
                lb_id.Text = id.ToString();
                dl_productDataBind();
                productImgDataBind(id);

            }
        }

        protected void dl_productDataBind() {
            var tempList = publicBLL.getWhereList<db_ProductInfo>(o => o.Id > 0);
            dl_product.Items.Add(new ListItem("无","0"));
            foreach(var item in tempList){
                dl_product.Items.Add(new ListItem(item.PName,item.Id.ToString()));
            }
        
        }


        protected void productImgDataBind(int id) {
            db_ProductImgInfo tempItem = id.getEnityById<db_ProductImgInfo>();
            if (tempItem != null)
            {
                tb_orderNum.Text = tempItem.orderNum.ToString();
                dl_product.SelectedValue = tempItem.productId.ToString();

                return;
            }
            dl_product.SelectedValue = string.Empty;
            
        }

        protected void bt_Sure_Click(object sender, EventArgs e)
        {
            HttpFileCollection files = HttpContext.Current.Request.Files;
            string EditFileName = Guid.NewGuid().ToString();
            string tmp = files[0].FileName;
            bool Isinsert = false;
            db_ProductImgInfo temp;
            var context = publicBLL.getdbContext();
            if (lb_id.Text.ToString() == "0" || string.IsNullOrEmpty(lb_id.Text.ToString()))
            {
                temp = new db_ProductImgInfo();
                Isinsert = true;
            }
            else
            {
                temp = Convert.ToInt32(lb_id.Text.ToString()).getEnityById<db_ProductImgInfo>(context);
            }

            if (!string.IsNullOrEmpty(tmp))
            {
                string oldName = System.IO.Path.GetFileName(tmp);
                string ext = tmp.Substring(tmp.LastIndexOf('.'));
                if (ext != "" && ext.ToLower() != ".jpg" && ext.ToLower() != ".gif" && ext.ToLower() != ".bmp" && ext.ToLower() != ".jpeg" && ext.ToLower() != ".png")
                {
                    Response.Write("<script>alert('图片格式不正确!');</script>");
                    Response.End();
                }

                string uppath = Server.MapPath("/upload/productImg/");
                files[0].SaveAs(uppath + EditFileName + ext.ToLower());
                temp.ImgUrl = "upload/productImg/" + EditFileName + ext.ToLower();
            }
            else
            {
                if (Isinsert)
                {
                    Response.Write("<script>alert('未选择图片！');</script>");
                    Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
                    Response.End();
                }
            }
            try
            {
                if (tb_orderNum.Text.Trim()==string.Empty )
                {
                    throw new Exception();
                }
                
                temp.orderNum =Convert.ToInt32(tb_orderNum.Text);
                temp.productId = Convert.ToInt32(dl_product.SelectedValue);
                

            }
            catch
            {
                Response.Write("<script>alert('必填信息未填写活填写不正确！');</script>");
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
                Response.End();
            }
            try
            {
                if (Isinsert)
                {
                    context.db_ProductImgInfo.Add(temp);
                }
                context.SaveChanges();
                Response.Write("<script>alert('操作成功！');</script>");
                Response.Write(string.Format("<script>window.location.href='productImgList.aspx?cid={0}'</script>", temp.productId));
            }
            catch
            {
                Response.Write("<script>alert('操作失败！');</script>");
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
            }
        }
    }
}