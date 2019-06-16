using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sajt.BusinessLayer;

namespace Sajt
{
    public partial class rezervacija : System.Web.UI.Page
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

                DropDownList1.DataSource = rezervacija;
                DropDownList1.DataBind();
            }

            Label1.Visible = false;
            Label3.Visible = false;
            DropDownList1.Visible = false;
            Panel1.Visible = false;
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if(Calendar1.SelectedDate >= Calendar1.TodaysDate)
            {
                Label1.Visible = true;
                DropDownList1.Visible = true;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedValue == "Milos")
            {
                DropDownList1.Visible = true;          
            }
            else
            {
                DropDownList1.Visible = true;
                Panel1.Visible = true;
                Label3.Visible = true;
            }
        }

        protected void btnPosalji_Click(object sender, EventArgs e)
        {
            string datum = Calendar1.SelectedDate.ToShortDateString();
            string vreme = DropDownList1.SelectedItem.ToString();
            string ime = TextBoxIme.Text;
            string telefon = TextBoxTelefon.Text;

            OpRezervacijaInsert op = new OpRezervacijaInsert();
            op.Rezervacija = new RezervacijaDb { Ime = ime, Telefon = telefon, Datum = datum, Vreme = vreme };
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                RezervacijaDb[] rezervacija = items.Cast<RezervacijaDb>().ToArray();
            }

            Calendar1.Visible = false;
            DropDownList1.Visible = false;
            Panel1.Visible = false;
            Label6.Visible = true;
            Label2.Visible = false;
        }
    }
}