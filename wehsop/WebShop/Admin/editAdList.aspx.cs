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
    public partial class editAdList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"] == null ? "0" : Request.QueryString["id"].ToString());
                lb_id.Text = id.ToString();

                pageDatabind(id);
            }
        }

        protected void pageDatabind(int id) {
            db_adinfo tempItem = id.getEnityById<db_adinfo>();
           
            if (tempItem != null)
            {

                tb_Name.Text = tempItem.name;
                tb_webUrl.Text = tempItem.webUrl;
                dl_isTop.SelectedValue = tempItem.isTop == true ? "1" : "0";
                return;
            }
        }

        protected void bt_Sure_Click(object sender, EventArgs e)
        {
            HttpFileCollection files = HttpContext.Current.Request.Files;
            string EditFileName = Guid.NewGuid().ToString();
            string tmp = files[0].FileName;
            bool Isinsert = false;
            db_adinfo temp;
            var context = publicBLL.getdbContext();
            if (lb_id.Text.ToString() == "0" || string.IsNullOrEmpty(lb_id.Text.ToString()))
            {
                temp = new db_adinfo();
                Isinsert = true;
            }
            else
            {
                temp = Convert.ToInt32(lb_id.Text.ToString()).getEnityById<db_adinfo>(context);
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

                string uppath = Server.MapPath("/upload/ad/");
                files[0].SaveAs(uppath + EditFileName + ext.ToLower());
                temp.imgUrl = "upload/ad/" + EditFileName + ext.ToLower();
            }
            else
            {
                if (Isinsert)
                {
                    Response.Write("<script>alert('未选择图片！');</script>");
                    Response.Write("<script>window.location.href=editAdList'</script>");
                    Response.End();
                }
            }
            try
            {
                if (tb_Name.Text.Trim() == string.Empty |tb_webUrl.Text==string.Empty)
                {
                    throw new Exception();
                }
                temp.name = tb_Name.Text;
                temp.webUrl = tb_webUrl.Text;
                temp.isTop = dl_isTop.SelectedValue == "1" ? true : false;
            }
            catch
            {
                Response.Write("<script>alert('必填信息未填写！');</script>");
                Response.Write("<script>window.location.href=editAdList'</script>");
                Response.End();
            }
            try
            {
                if (Isinsert)
                {
                    context.db_adinfo.Add(temp);
                }
                context.SaveChanges();
                Response.Write("<script>alert('操作成功！');</script>");
                Response.Write("<script>window.location.href='adlist.aspx'</script>");
            }
            catch
            {
                Response.Write("<script>alert('操作失败！');</script>");
                Response.Write("<script>window.location.href=editAdList'</script>");
            }

        }
    }
}