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
    public partial class upravljanjeRezervacijama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpRezervacijaSelect op = new OpRezervacijaSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                RezervacijaDb[] rezervacija = items.Cast<RezervacijaDb>().ToArray();

                GridView1.DataSource = rezervacija;
                GridView1.DataBind();
            }
        }

        protected void btnIzbrisi_Click(object sender, EventArgs e)
        {
            Button taster = (Button)sender;
            int idRez = Convert.ToInt32(taster.CommandArgument);
            OpRezervacijaDelete op = new OpRezervacijaDelete();
            op.IdRez = idRez;
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            DbItem[] items = obj.DbItems;
            RezervacijaDb[] rezervacija = items.Cast<RezervacijaDb>().ToArray();

            GridView1.DataSource = rezervacija;
            GridView1.DataBind();
        }

        protected void btnIzmeni_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button taster = (Button)sender;
            string[] arg = taster.CommandArgument.ToString().Split(';');
            TextBox1.Text = arg[0];
            TextBoxIme.Text = arg[1];
            TextBoxTelefon.Text = arg[2];
            TextBoxDatum.Text = arg[3];
            TextBoxVreme.Text = arg[4];
        }

        protected void ButtonIzmeni_Click(object sender, EventArgs e)
        {
            int idRez = Int32.Parse(TextBox1.Text);
            string ime = TextBoxIme.Text;
            string telefon = TextBoxTelefon.Text;
            string datum = TextBoxDatum.Text;
            string vreme = TextBoxVreme.Text;
            OpRezervacijaUpdate op = new OpRezervacijaUpdate();
            op.Rezervacija = new RezervacijaDb { IdRez = idRez, Ime = ime, Telefon = telefon, Datum = datum, Vreme = vreme };
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                RezervacijaDb[] rezervacija = items.Cast<RezervacijaDb>().ToArray();

                GridView1.DataSource = rezervacija;
                GridView1.DataBind();
            }
        }
    }
}