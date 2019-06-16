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
    public partial class registracija : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OpKorisnikSelect op = new OpKorisnikSelect();
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                KorisnikDb[] korisnici = items.Cast<KorisnikDb>().ToArray();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ime = TextBoxIme.Text;
            string prezime = TextBoxPrezime.Text;
            string mail = TextBoxEmail.Text;

            OpKorisnikInsert op = new OpKorisnikInsert();
            op.Korisnik = new KorisnikDb { Ime = ime, Prezime = prezime, Mail = mail };
            OperacijaRezultat obj = OperationManager.Singleton.izvrsiOperaciju(op);

            if ((obj == null) || (!obj.Status))
                return;
            else
            {
                DbItem[] items = obj.DbItems;
                KorisnikDb[] korisnici = items.Cast<KorisnikDb>().ToArray();
            }
        }
    }
}