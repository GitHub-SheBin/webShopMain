using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Model;
using WebShop.BLL;

namespace WebShop.Web
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                pageDataBind();
            }
        }


        protected void pageDataBind()
        {
            Rp_HotProduct.DataSource = publicBLL.ListToDataTable<db_ProductInfo>(publicBLL.getWhereList<db_ProductInfo>(o => o.IsHot == true, o => o.HotOrder, false).Take(9).ToList());
            Rp_TopProduct.DataSource = publicBLL.ListToDataTable<db_ProductInfo>(publicBLL.getWhereList<db_ProductInfo>(o => o.isTop == true, o => o.TopOrder, false).Take(6).ToList());
            tp_topAdList.DataSource = publicBLL.ListToDataTable<db_adinfo>(publicBLL.getWhereList<db_adinfo>(o => o.isTop == true));
            rp_topImg.DataSource = publicBLL.ListToDataTable<db_adinfo>(publicBLL.getWhereList<db_adinfo>(o=>o.isTop==false));
            Rp_HotProduct.DataBind();
            Rp_TopProduct.DataBind();
            tp_topAdList.DataBind();
            rp_topImg.DataBind();
        }
    }
}