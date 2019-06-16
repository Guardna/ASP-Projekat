using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sajt
{
    public partial class kontakt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidatorPoruka_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Trim().Length > 10)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void ButtonPosalji_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string imePrezime = TextBoxImePrezime.Text;
                string email = TextBoxEmail.Text;
                string poruka = TextBoxPoruka.Text;

                BulletedListIspis.Items.Clear();
                BulletedListIspis.Items.Add(imePrezime);
                BulletedListIspis.Items.Add(email);
                BulletedListIspis.Items.Add(poruka);
            }
        }
    }
}