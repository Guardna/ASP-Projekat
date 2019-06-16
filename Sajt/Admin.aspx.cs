using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sajt.BusinessLayer;

namespace Sajt
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kor_ime"] == null || Session["lozinka"] == null)
            {
                Response.Redirect("/login.aspx");
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("kor_ime");
            Session.Remove("lozinka");
            Response.Redirect("/login.aspx");
        }
    }
}