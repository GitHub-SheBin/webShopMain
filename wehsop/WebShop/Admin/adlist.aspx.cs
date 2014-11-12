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
    public partial class adlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pageDataBind();
            }
        }

        protected void pageDataBind() {
            var templist = publicBLL.getdbContext().db_adinfo.Where(o=>true);
            rp_adlist.DataSource = publicBLL.ListToDataTable<db_adinfo>(templist.ToList());
            rp_adlist.DataBind();
        }

        protected void rp_adlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete") {
                var tempId = Convert.ToInt32(e.CommandArgument); 
                var context = publicBLL.getdbContext();
                var tempItem = tempId.getEnityById<db_adinfo>(context);
               
                context.db_adinfo.Remove(tempItem);
                try {
                    context.SaveChanges();
                    Response.Write("<script>alert('删除成功！');</script>");
                }
                catch {
                    Response.Write("<script>alert('删除失败！');</script>");
                }

                Response.Write(string.Format("<script>window.location.href='adlist.aspx'</script>"));
           }
        }


    }
}