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
    public partial class dodavanjeAnkete : System.Web.UI.Page
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            string naziv = TextBoxNaziv.Text;
            int glasovi = Int32.Parse(TextBoxGlasovi.Text);

            OpPollInsert op = new OpPollInsert();
            op.Poll = new PollDb { Naziv = naziv, Glasovi = glasovi };
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