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
    public partial class UserAddressList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
             if(Request.QueryString["cid"]!=null){
                 int tempId = Convert.ToInt32(Request.QueryString["cid"].ToString());
                userAddressPager.RecordCount = publicBLL.getWhereCount<db_UserAddressInfo>(o=>o.UserId==tempId);
                rp_userAddressDataBind(tempId);
             }
            }
        }

        protected void userAddressPager_PageChanged(object sender, EventArgs e)
        {
            int tempId = Convert.ToInt32(Request.QueryString["cid"].ToString());

            rp_userAddressDataBind(tempId);
        }

        protected void rp_userAddress_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                if (publicBLL.deleteItemById<db_UserInfo>(Convert.ToInt32(e.CommandArgument)))
                {
                    Response.Write("<script>alert('删除成功！');</script>");

                }
                else
                {
                    Response.Write("<script>alert('删除失败！');</script>");
                }
                Response.Write(string.Format("<script>window.location.href='{0}'</script>", Request.RawUrl));
            }
        }

        protected void rp_userAddressDataBind(int uid) {
            List<db_UserAddressInfo> tempList = publicBLL.getOrdePagerByList<db_UserAddressInfo>(userAddressPager.StartRecordIndex, userAddressPager.EndRecordIndex, i => i.UserId==uid, o => o.Id);
            rp_userAddress.DataSource = publicBLL.ListToDataTable(tempList);
            rp_userAddress.DataBind();
        }
    }
}