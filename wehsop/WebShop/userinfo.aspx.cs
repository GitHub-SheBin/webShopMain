﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.Web
{
    public partial class userinfo : System.Web.UI.Page
    {
        public string id = "0";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                id = Session["userId"].ToString();
            }
        }
    }
}