using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sajt.DataLayer;

namespace Sajt.BusinessLayer
{
    public class AdminDb : DbItem
    {
        #region Podaci
        private int idAdmin;
        private string korIme;
        private string lozinka;
        #endregion
        #region Svojstva
        public int IdAdmin
        {
            get { return idAdmin; }
            set { idAdmin = value; }
        }
        public string KorIme
        {
            get { return korIme; }
            set { korIme = value; }
        }
        public string Lozinka
        {
            get { return lozinka; }
            set { lozinka = value; }
        }
        #endregion
        public override string ToString()
        {
            return this.idAdmin.ToString() + " " + this.korIme + " " + this.lozinka;
        }
    }

    public class KriterijumAdmin : KriterijumZaSelekciju
    {
        public string korIme { get; set; }
        public string Lozinka { get; set; }
    }

    public abstract class OpAdminBase : Operacija
    {
        public KriterijumAdmin Kriterijum { get; set; }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            IEnumerable<AdminDb> ieadmin;
            if ((this.Kriterijum == null) || (this.Kriterijum.korIme == null)
                 && (this.Kriterijum.Lozinka == null))
                ieadmin = from Admin in entiteti.admins
                          select new AdminDb
                          {
                              IdAdmin = Admin.idadmin,
                              KorIme = Admin.kor_ime,
                              Lozinka = Admin.lozinka
                          };
            else
                ieadmin = from admin in entiteti.admins
                          where ((this.Kriterijum.korIme == null) ? true :
                                       this.Kriterijum.korIme == admin.kor_ime) &&
                                ((this.Kriterijum.Lozinka == null) ? true :
                                       this.Kriterijum.Lozinka == admin.lozinka)
                          select new AdminDb
                          {
                              IdAdmin = admin.idadmin,
                              KorIme = admin.kor_ime,
                              Lozinka = admin.lozinka
                          };
            AdminDb[] niz = ieadmin.ToArray();


            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
    public class OpAdminSelect : OpAdminBase
    {
    }
}