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
    public partial class EditProductInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"] == null ? "0" : Request.QueryString["id"].ToString());
                lb_id.Text = id.ToString();

                productInfoDataBind(id);
            }
        }

        protected void bt_Sure_Click(object sender, EventArgs e)
        {
            HttpFileCollection files = HttpContext.Current.Request.Files;
            string EditFileName = Guid.NewGuid().ToString();
            string tmp = files[0].FileName;
            bool Isinsert = false;
            db_ProductInfo temp;
            var context = publicBLL.getdbContext();
            if (lb_id.Text.ToString() == "0" || string.IsNullOrEmpty(lb_id.Text.ToString()))
            {
                temp = new db_ProductInfo();
                Isinsert = true;
            }
            else
            {
                temp = Convert.ToInt32(lb_id.Text.ToString()).getEnityById<db_ProductInfo>(context);
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

                string uppath = Server.MapPath("/upload/product/");
                files[0].SaveAs(uppath + EditFileName + ext.ToLower());
                temp.ImgUrl = "upload/product/" + EditFileName + ext.ToLower();
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
                if (tb_Name.Text.Trim() == string.Empty | tb_content.Text.Trim() == string.Empty|tb_CostPrice.Text.Trim()==string.Empty|tb_salPrice.Text.Trim()==string.Empty
                    |tb_taobaoUrl.Text.Trim()==string.Empty|tb_BrandName.Text.Trim()==string.Empty)
                {
                    throw new Exception();
                }
                temp.PContent = tb_content.Text;
                if ( Convert.ToBoolean(Convert.ToInt32(dl_IsHot.SelectedValue)))
                {
                temp.HotOrder = Convert.ToInt32(tb_HotOrder.Text);
                }
                temp.PName = tb_Name.Text;
                temp.IsHot = Convert.ToBoolean(Convert.ToInt32(dl_IsHot.SelectedValue));
                temp.KindId = Convert.ToInt32(dl_productClass.SelectedValue);
                temp.isTop = Convert.ToBoolean(Convert.ToInt32(dl_isTop.SelectedValue));
                if (Convert.ToBoolean(Convert.ToInt32(dl_isTop.SelectedValue)))
                {
                temp.TopOrder = Convert.ToInt32(tb_TopOrder.Text);
                }
                temp.CostPrice = Convert.ToDouble(tb_CostPrice.Text);
                temp.SalePrice = Convert.ToDouble(tb_salPrice.Text);
                temp.taobaoUrl = tb_taobaoUrl.Text;
                temp.BrandName = tb_BrandName.Text;
                if (Isinsert) {
                    temp.CanSaleTime = DateTime.Now;
                    temp.createTime = DateTime.Now;
                }
            }
            catch
            {
                Response.Write("<script>alert('必填信息未填写！');</script>");
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
                Response.End();
            }
            try
            {
                if (Isinsert)
                {
                    context.db_ProductInfo.Add(temp);
                }
                context.SaveChanges();
                Response.Write("<script>alert('操作成功！');</script>");
                Response.Write(string.Format("<script>window.location.href='productList.aspx?cid={0}'</script>", temp.KindId));
            }
            catch
            {
                Response.Write("<script>alert('操作失败！');</script>");
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
            }
        }

        protected void productInfoDataBind(int id) {
            db_ProductInfo tempItem = id.getEnityById<db_ProductInfo>();
            dl_productClassDataBind();
            if (tempItem != null)
            {
                
                tb_Name.Text = tempItem.PName;
                tb_content.Text = tempItem.PContent;
                dl_productClass.SelectedValue = tempItem.KindId.ToString();
                tb_HotOrder.Text = tempItem.HotOrder.ToString();
                tb_TopOrder.Text = tempItem.TopOrder.ToString();
                dl_IsHot.SelectedValue = tempItem.IsHot == false ? "0" : "1";
                dl_isTop.SelectedValue = tempItem.isTop == false ? "0" : "1";
                tb_taobaoUrl.Text = tempItem.taobaoUrl;
                tb_salPrice.Text = tempItem.SalePrice.ToString();
                tb_CostPrice.Text = tempItem.CostPrice.ToString();
                tb_BrandName.Text = tempItem.BrandName;
                return;
            }
        
        }

        protected void dl_productClassDataBind() {
            var tempList = publicBLL.getWhereList<db_sonkindInfo>(o=>true);
            dl_productClass.Items.Add(new ListItem("无","0"));
            foreach(var item in tempList){
                dl_productClass.Items.Add(new ListItem(item.name,item.id.ToString()));
            }
        }
    }
}