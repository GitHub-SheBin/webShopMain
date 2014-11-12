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
    public partial class detail : System.Web.UI.Page
    {

        public string imgUrl = string.Empty;

        public string pname = string.Empty;

        public double salePrice = 0.0;

        public double costPrice = 0.0;

        public double savePrice = 0.0;

        public string pnum = "00000";

        public string taobaoUrl = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                int tempId = 0;
                if(Request.QueryString["id"]!=null){
                    try {
                        tempId = Convert.ToInt32(Request.QueryString["id"].ToString());
                        var tempItem = tempId.getEnityById<db_ProductInfo>();
                        imgUrl = tempItem.ImgUrl;
                        pname = tempItem.PName;
                        salePrice = Convert.ToDouble(tempItem.SalePrice);
                        costPrice = Convert.ToDouble(tempItem.CostPrice);
                        taobaoUrl = "http://"+tempItem.taobaoUrl;
                        savePrice = costPrice - salePrice;
                        pnum = tempId.ToString("D6");
                        Rp_productList.DataSource = publicBLL.ListToDataTable<db_ProductInfo>(publicBLL.getWhereList<db_ProductInfo>(o => o.BrandName == tempItem.BrandName&o.Id!=tempId).Take(9).ToList());
                        Rp_productList.DataBind();
                    }
                    catch {
                        Response.Write("<script>alert('index.aspx');</script>");
                    }
                
                }
            }
        }
    }
}