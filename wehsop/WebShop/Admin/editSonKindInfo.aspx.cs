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
    public partial class editSonKindInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"] == null ? "0" : Request.QueryString["id"].ToString());
                lb_id.Text = id.ToString();
                dl_FatherKindDataBind(id);
                pageDataBind(id);

            }
        }

        //protected void dl_FatherKindDataBind()
        //{
        //    var tempList = publicBLL.getWhereList<db_KindInfo>(o => o.isFather == true);
        //    dl_FatherKind.Items.Add(new ListItem("无", "0"));
        //    foreach (var item in tempList)
        //    {
        //        dl_FatherKind.Items.Add(new ListItem(item.KindName, item.Id.ToString()));
        //    }
        //}

        protected void pageDataBind(int id)
        {
            var tempItem = id.getEnityById<db_sonkindInfo>();
            if (tempItem != null)
            {
                tb_content.Text = tempItem.pagecontent;
                tb_Name.Text = tempItem.name;
                

            }
        }

        protected void dl_FatherKindDataBind(int id) {
            var tempList = publicBLL.getdbContext().db_KindInfo.Where(o=>true);
            
            dl_FkindInfo.Items.Add(new ListItem("无","0"));
            foreach(var item in tempList){
                dl_FkindInfo.Items.Add(new ListItem(item.KindName,item.Id.ToString()));
            }
            dl_FkindInfo.SelectedValue = id.ToString();
        }

        protected void bt_Sure_Click(object sender, EventArgs e)
        {
            bool Isinsert = false;
            db_sonkindInfo temp;
            var context = publicBLL.getdbContext();
            if (lb_id.Text.ToString() == "0" || string.IsNullOrEmpty(lb_id.Text.ToString()))
            {
                temp = new db_sonkindInfo();
                Isinsert = true;
            }
            else
            {
                temp = Convert.ToInt32(lb_id.Text).getEnityById<db_sonkindInfo>(context);
            }


            try
            {
                if (tb_content.Text.Trim() == string.Empty | tb_Name.Text.Trim() == string.Empty|dl_FkindInfo.SelectedValue=="0")
                {
                    throw new Exception();
                }
                temp.pagecontent = tb_content.Text;
                temp.kindid = Convert.ToInt32(dl_FkindInfo.SelectedValue);
                temp.kindName = Convert.ToInt32(dl_FkindInfo.SelectedValue).getEnityById<db_KindInfo>().KindName;
                temp.name = tb_Name.Text;
                
                
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
                    context.db_sonkindInfo.Add(temp);
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
    }
}