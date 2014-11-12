using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.BLL;
using WebShop.Model;
using System.Data;

namespace WebShop.Admin
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected Func<db_UserInfo,bool> where = o => o.Id > 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
               
                rp_userInfoDataBind();
            }
        }

        protected void userPager_PageChanged(object sender, EventArgs e)
        {
            rp_userInfoDataBind();
        }

        protected void rp_userInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int tempId=Convert.ToInt32(e.CommandArgument);
                publicBLL.RealdeleteItem<db_UserAddressInfo>(o=>o.UserId==tempId);
                if (publicBLL.deleteItemById<db_ProductImgInfo>(Convert.ToInt32(e.CommandArgument)))
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

        protected void bt_submit_Click(object sender, EventArgs e)
        {
            if(tb_UserName.Text!=string.Empty){
                where += o => o.UserName == tb_UserName.Text.Trim();
            }
            if(dl_UserSex.SelectedValue!="0"){
              
                where += o => o.UserSex == dl_UserSex.SelectedValue;
            }
            rp_userInfoDataBind();
        }

        protected void rp_userInfoDataBind() {
            userPager.RecordCount = publicBLL.getWhereCount<db_UserInfo>(where);
            List<db_UserInfo> tempList = publicBLL.getOrdePagerByList<db_UserInfo>(userPager.StartRecordIndex, userPager.EndRecordIndex, where, o => o.UserCreateTime, false);
            rp_userInfo.DataSource = publicBLL.ListToDataTable(tempList);
            rp_userInfo.DataBind();    
        
        }

        protected void rp_userInfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink HLinfo = e.Item.FindControl("HLinfo") as HyperLink;
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int tempId = Convert.ToInt32(drv["id"]);
                int dataCount = publicBLL.getWhereCount<db_UserAddressInfo>(o => o.UserId == tempId);
                HLinfo.NavigateUrl = string.Format("UserAddressList.aspx?cid={0}", tempId);
                HLinfo.Text = string.Format("共有{0}条信息", dataCount);
            }
        }
    }
}