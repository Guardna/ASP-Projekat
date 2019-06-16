using Sajt.BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sajt
{
    public partial class galerija : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpMenuSelect op = new OpMenuSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                MenuDb[] menu = items.Cast<MenuDb>().ToArray();

                GridView1.DataSource = menu;
                GridView1.DataBind();

                DetailsView1.DataSource = menu;
                DetailsView1.DataBind();

                DetailsView1.Visible = false;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

            OpMenuSelect op = new OpMenuSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                MenuDb[] menu = items.Cast<MenuDb>().ToArray();

                GridView1.DataSource = menu;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.PageIndex = GridView1.SelectedIndex;
            DetailsView1.Visible = true;
        }
    }
}