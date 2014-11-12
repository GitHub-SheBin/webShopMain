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
    public partial class WeB : System.Web.UI.MasterPage
    {

        public string url = "login.aspx";

        public int kid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                if (Session["UserName"]!=null|Session["userId"]!=null) {
                    url = string.Format("userinfo.aspx?id={0}",Session["userId"].ToString());
                    var tempItem = publicBLL.getWhereList<db_KindInfo>(o =>true).FirstOrDefault();
                    if(tempItem!=null){
                        kid = tempItem.Id;
                    }
                }
                Rp_kindListDataBind();
            }
        }

        protected void Rp_kindListDataBind() {
            Rp_kindList.DataSource = publicBLL.ListToDataTable<db_KindInfo>(publicBLL.getWhereList<db_KindInfo>(o=>true));
            Rp_kindList.DataBind();
        }

    }
}