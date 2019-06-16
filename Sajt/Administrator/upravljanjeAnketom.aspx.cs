using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sajt.BusinessLayer;

namespace Sajt.Administrator
{
    public partial class upravljanjeAnketom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpPollSelect op = new OpPollSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                PollDb[] poll = items.Cast<PollDb>().ToArray();

                GridView1.DataSource = poll;
                GridView1.DataBind();
            }
        }

        protected void btnIzbrisi_Click(object sender, EventArgs e)
        {
            Button taster = (Button)sender;
            int idPoll = Convert.ToInt32(taster.CommandArgument);
            OpPollDelete op = new OpPollDelete();
            op.IdPoll = idPoll;
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            DbItem[] items = obj.DbItems;
            PollDb[] poll = items.Cast<PollDb>().ToArray();

            GridView1.DataSource = poll;
            GridView1.DataBind();
        }

        protected void btnIzmeni_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button taster = (Button)sender;
            string[] arg = taster.CommandArgument.ToString().Split(';');
            TextBox3.Text = arg[0];
            TextBoxNaziv.Text = arg[1];
            TextBoxGlasovi.Text = arg[2];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idPool = Int32.Parse(TextBox3.Text);
            string naziv = TextBoxNaziv.Text;
            int glasovi = Int32.Parse(TextBoxGlasovi.Text);
            OpPollUpdate op = new OpPollUpdate();
            op.Poll = new PollDb { IdPoll = idPool, Naziv = naziv, Glasovi = glasovi };
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                PollDb[] poll = items.Cast<PollDb>().ToArray();

                GridView1.DataSource = poll;
                GridView1.DataBind();
            }
        }
    }
}