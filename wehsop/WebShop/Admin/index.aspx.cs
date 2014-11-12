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
    public partial class index : System.Web.UI.Page
    {
        public int uid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin_UserName"] == null)
                {

                    Response.Write("<script>window.location.href='login.aspx'</script>");
                    Response.End();
                }
                string userName = Session["Admin_UserName"].ToString();
                lb_AdminName.Text = userName;
                var tempItm = publicBLL.getWhereList<db_AdminInfo>(o => o.AdminName == userName).FirstOrDefault<db_AdminInfo>();
                if (tempItm != null)
                {
                    uid = tempItm.Id;
                }
            }
        }

        protected void Lb_SignOut_Click(object sender, EventArgs e)
        {
            if (Session["Admin_UserName"] != null)
            {
                Session["Admin_UserName"] = null;
                Response.Write("<script>window.location.href='login.aspx'</script>");
            }
        }
    }
}