using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Model;
using WebShop.BLL;
using System.Data;

namespace WebShop.Web
{
    public partial class category : System.Web.UI.Page
    {
        public string kindName = string.Empty;

        public int kid = 0;

        public int CKid = 0;

        public bool orderty = true;

        public string pcount = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                int tkind = 0;
                
                if (Request.QueryString["kid"] != null)
                {
                    try
                    {
                        tkind = Convert.ToInt32(Request.QueryString["kid"]);

                    }
                    catch { }
                }
                if(Request.QueryString["cid"]!=null){
                    try {
                        var cid = Convert.ToInt32(Request.QueryString["cid"]);
                        kid = cid;
                        tkind = cid.getEnityById<db_sonkindInfo>().kindid;
                    }
                    catch { }
                }
                kindName = tkind.getEnityById<db_KindInfo>().KindName;
                CKid = tkind;
                Rp_kindListDataBind(tkind);
                orderty = Request.QueryString["ordertype"] == "0" ? false : true;
            }
        }


        protected void Rp_kindListDataBind(int id)
        {
            var temp = id.getEnityById<db_sonkindInfo>();

            var templist = publicBLL.getWhereList<db_sonkindInfo>(o => o.kindid == id);
            if (Request.QueryString["cid"] == null)
            {
                if (templist.Count() > 0) { kid = templist.First().id; }
            }

                Rp_kindList.DataSource = publicBLL.ListToDataTable<db_sonkindInfo>(templist);

           
            
            Rp_kindList.DataBind();


        }

        protected void Rp_kindList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink HLinfo = e.Item.FindControl("sonKind") as HyperLink;
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int tempId = Convert.ToInt32(drv["id"]);
                HLinfo.NavigateUrl = string.Format("category.aspx?cid={0}",drv["id"]);
                int count = publicBLL.getWhereCount<db_ProductInfo>(o=>o.KindId==tempId);
               
                HLinfo.Text = string.Format("{0}({1})",drv["name"],count);

                if (Request.QueryString["cid"] == null)
                {
                    if (e.Item.ItemIndex == 0)
                    {
                        kid = Convert.ToInt32(drv["id"]);
                        pcount = count.ToString();
                       
                        kindPager.RecordCount = publicBLL.getWhereCount<db_ProductInfo>(o => o.CanSaleTime < DateTime.Now & o.KindId == kid);
                        Rp_productListDataBind();
                    }
                }
                else {
                    if (Request.QueryString["cid"].ToString() == drv["id"].ToString())
                    {
                        pcount = count.ToString();
                     
                       kindPager.RecordCount = publicBLL.getWhereCount<db_ProductInfo>(o => o.CanSaleTime < DateTime.Now & o.KindId == kid);
                       Rp_productListDataBind();
                    }
                }
                
               
            }
        }

        protected void kindPager_PageChanged(object sender, EventArgs e)
        {
            Rp_productListDataBind();
        }

        protected void Rp_productListDataBind() {
            var templist = publicBLL.getOrdePagerByList<db_ProductInfo>(kindPager.StartRecordIndex,kindPager.EndRecordIndex,o=>o.KindId==kid&o.CanSaleTime<DateTime.Now,o=>o.SalePrice,orderty);
            Rp_productList.DataSource = publicBLL.ListToDataTable<db_ProductInfo>(templist);
            Rp_productList.DataBind();
        
        }
    }
}