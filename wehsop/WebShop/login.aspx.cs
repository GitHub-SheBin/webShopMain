using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.BLL;
using WebShop.Model;

namespace WebShop.Web
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_ULK_Click(object sender, ImageClickEventArgs e)
        {
            var pwd = tb_pwd.Text.Trim().md5_pwd();
            var AdmiName = tb_userName.Text.Trim();
            var context = publicBLL.getdbContext();
            var tempItem = context.db_UserInfo.Where(o => o.UserName == AdmiName).FirstOrDefault();

            if (tempItem != null & pwd == tempItem.UserPwd)
            {
                Session["UserName"] = AdmiName;
                Session["userId"] = tempItem.Id;
                Response.Write("<script>window.location.href='index.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('登录名或密码出错！');</script>");
            }
        }

        protected void bt_RLK_Click(object sender, ImageClickEventArgs e)
        {
            var context = publicBLL.getdbContext();
            db_UserInfo temp = new db_UserInfo();
            try {
                temp.UserName= tb_NewUserName.Text;
                temp.UserEmail = tb_NewUserName.Text;
                temp.UserSex = "男";
                temp.UserPwd = tb_Fpwd.Text.md5_pwd();
                temp.UserCreateTime = DateTime.Now;
                temp.UserLastLoginTime = DateTime.Now;
                temp.UserEmail = string.Empty;
                temp.fristQ = dl_FQ.SelectedValue;
                temp.secondQ = dl_SQ.SelectedValue;
                temp.fristA = tb_FA.Text;
                temp.secondA = tb_SA.Text;
                temp.User = string.Empty;
                temp.UserBrithday = string.Empty;
                context.db_UserInfo.Add(temp);
                context.SaveChanges();
                Session["UserName"] = temp.UserName;
                Session["userId"] = temp.Id;
                Response.Write("<script>window.location.href='index.aspx'</script>");
            }
            catch {
                Response.Write("<script>alert('注册信息出错！');</script>");
                Response.Write("<script>window.location.href='login.aspx'</script>");
                Response.End();
            }
           
            

        }
    }
}