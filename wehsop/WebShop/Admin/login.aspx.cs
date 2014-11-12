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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { }
        }

        protected void bt_Login_Click(object sender, EventArgs e)
        {
            var pwd = tb_Pwd.Text.Trim().md5_pwd();
            var AdmiName = tb_UserName.Text.Trim();
            var context = publicBLL.getdbContext();
            var tempItem = context.db_AdminInfo.Where(o => o.AdminName == AdmiName).FirstOrDefault();

            if (tempItem != null & pwd == tempItem.AdminPwd)
            {
                Session["Admin_UserName"] = AdmiName;
                Response.Write("<script>window.location.href='index.aspx';</script>");
            }
            else { 
                 Response.Write("<script>alert('登录名或密码出错！');</script>");
            }
            
        }
    }
}