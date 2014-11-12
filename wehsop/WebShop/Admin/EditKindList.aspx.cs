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
    public partial class EditKindList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                int id = Convert.ToInt32(Request.QueryString["id"] == null ? "0" : Request.QueryString["id"].ToString());
                lb_id.Text = id.ToString();
                pageDataBind(id);
                
            }
        }

       

        

        protected void bt_Sure_Click(object sender, EventArgs e)
        {
            bool Isinsert = false;
            db_KindInfo temp;
            var context = publicBLL.getdbContext();
            if (lb_id.Text.ToString() == "0" || string.IsNullOrEmpty(lb_id.Text.ToString()))
            {
                temp = new db_KindInfo();
                Isinsert = true;
            }
            else
            {
                temp = Convert.ToInt32(lb_id.Text).getEnityById<db_KindInfo>(context);
            }


            try
            {
                if (tb_content.Text.Trim() == string.Empty | tb_Name.Text.Trim() == string.Empty)
                {
                    throw new Exception();
                }
                temp.pagecontent = tb_content.Text;
                temp.KindName = tb_Name.Text;
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
                    context.db_KindInfo.Add(temp);
                }
                context.SaveChanges();
                Response.Write("<script>alert('操作成功！');</script>");
                Response.Write(string.Format("<script>window.location.href='KindList.aspx'</script>"));
            }
            catch
            {
                Response.Write("<script>alert('操作失败！');</script>");
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
            }
        }

        protected void pageDataBind(int id) {
            var tempItem = id.getEnityById<db_KindInfo>();
            if(tempItem!=null){
                tb_content.Text = tempItem.pagecontent;
                tb_Name.Text = tempItem.KindName;
            }
        }

        
    }
}