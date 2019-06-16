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
    public partial class dodavanjeRezervacije : System.Web.UI.Page
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

        protected void ButtonUnesi_Click(object sender, EventArgs e)
        {
            string ime = TextBoxIme.Text;
            string telefon = TextBoxTelefon.Text;
            string datum = TextBoxDatum.Text;
            string vreme = TextBoxVreme.Text;

            OpRezervacijaInsert op = new OpRezervacijaInsert();
            op.Rezervacija = new RezervacijaDb { Ime = ime, Telefon = telefon, Datum = datum, Vreme = vreme };
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