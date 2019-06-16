using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using Sajt.BusinessLayer;

namespace Sajt
{
    public partial class aboutus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chart1.Visible = false;
            Label2.Visible = false;           

            OpPollSelect op = new OpPollSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                PollDb[] pool = items.Cast<PollDb>().ToArray();

                RadioButtonList1.DataSource = items;
                RadioButtonList1.DataBind();

                Chart1.DataSource = items;
                Chart1.DataBind();
            }
        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            //int selectedValue = Convert.ToInt32(RadioButtonList1.SelectedValue);
            //Response.Write(selectedValue);
            //int id = selectedValue;
            /*int idpoll = Int32.Parse(RadioButtonList1.SelectedValue);

            OpPollUpdateVotes op = new OpPollUpdateVotes();
            op.Poll = new PollDb { IdPoll = idpoll };
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                PollDb[] poll = items.Cast<PollDb>().ToArray();
            }*/

            RadioButtonList1.Visible = false;
            Chart1.Visible = true;
            Label2.Visible = true;
        }
    }
}