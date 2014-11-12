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
    public partial class EditAdminInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            publicBLL.ChkManage();
            int id = Convert.ToInt32(Request.QueryString["id"] == null ? "0" : Request.QueryString["id"].ToString());
            if (id == 0 & Session["Admin_UserName"] != null & Session["Admin_UserName"].ToString() != "admin")
            {
                Response.Write("<script>alert('只有Admin用户才可创建用户信息！');</script>");
                Response.Write(string.Format("<script>window.location.href='/AdminList.aspx'</script>"));
                Response.End();
            }
            lb_id.Text = id.ToString();

            AdminInfoDataBind(id);
        }

        protected void AdminInfoDataBind(int id) {
            db_AdminInfo tempItem = id.getEnityById<db_AdminInfo>();
            if (tempItem != null)
            {
                tb_Name.Text = tempItem.AdminName;
                
                tb_TrueName.Text = tempItem.realName;
             

                return;
            }
        }

        protected void bt_Sure_Click(object sender, EventArgs e)
        {
            bool Isinsert = false;
            db_AdminInfo temp;
            var context = publicBLL.getdbContext();
            if (lb_id.Text.ToString() == "0" || string.IsNullOrEmpty(lb_id.Text.ToString()))
            {
                temp = new db_AdminInfo();
                Isinsert = true;
            }
            else
            {
                temp = Convert.ToInt32(lb_id.Text).getEnityById<db_AdminInfo>(context);
            }


            try
            {
                if (tb_Name.Text.Trim() == string.Empty | tb_TrueName.Text.Trim() == string.Empty)
                {
                    throw new Exception();
                }

                temp.AdminName = tb_Name.Text;
                if(tb_Pwd.Text!=string.Empty){
                    temp.AdminPwd = tb_Pwd.Text.md5_pwd();
                }
                temp.realName = tb_TrueName.Text;
                


               
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
                    context.db_AdminInfo.Add(temp);
                }
                context.SaveChanges();
                Response.Write("<script>alert('操作成功！');</script>");
                Response.Write(string.Format("<script>window.location.href='index.aspx'</script>"));
            }
            catch
            {
                Response.Write("<script>alert('操作失败！');</script>");
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
            }
        }

       
    }
}