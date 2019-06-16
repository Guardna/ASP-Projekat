using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sajt.DataLayer;

namespace Sajt.BusinessLayer
{
    public class MenuDb : DbItem
    {
        #region Podaci
        private int idmenu;
        private string naziv;
        private string opis;
        private int cena;
        #endregion
        #region Svojstva
        public int Idmenu
        {
            get { return idmenu; }
            set { idmenu = value; }
        }
        public string Naziv
        {
            get { return naziv; }
            set { naziv = value; }
        }
        public string Opis
        {
            get { return opis; }
            set { opis = value; }
        }
        public int Cena
        {
            get { return cena; }
            set { cena = value; }
        }
        #endregion
        public override string ToString()
        {
            return this.idmenu.ToString() + " " + this.naziv + " " + this.opis + " " + this.cena;
        }
    }
    public class KriterijumMenu : KriterijumZaSelekciju
    {
        public string Naziv { get; set; }
        public string Opis { get; set; }
        public int Cena { get; set; }
    }

    public abstract class OpMenuBase : Operacija
    {
        public KriterijumMenu Kriterijum { get; set; }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            IEnumerable<MenuDb> iemenu;
            if ((this.Kriterijum == null) || (this.Kriterijum.Naziv == null)
                 && (this.Kriterijum.Opis == null))
                iemenu = from Menu in entiteti.menus
                              select new MenuDb
                              {
                                  Idmenu = Menu.idmenu,
                                  Naziv = Menu.naziv,
                                  Opis = Menu.opis,
                                  Cena = Menu.cena
                              };
            else
                iemenu = from Menu in entiteti.menus
                              where ((this.Kriterijum.Naziv == null) ? true :
                                           this.Kriterijum.Naziv == Menu.naziv) &&
                                    ((this.Kriterijum.Opis == null) ? true :
                                           this.Kriterijum.Opis == Menu.opis) &&
                                    ((this.Kriterijum.Cena == null) ? true :
                                           this.Kriterijum.Cena == Menu.cena)
                              select new MenuDb
                              {
                                  Idmenu = Menu.idmenu,
                                  Naziv = Menu.naziv,
                                  Opis = Menu.opis,
                                  Cena = Menu.cena
                              };
            MenuDb[] niz = iemenu.ToArray();


            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
    public class OpMenuSelect : OpMenuBase
    {
    }
    public class OpMenuInsert : OpMenuBase
    {
        private MenuDb menu;
        public MenuDb Menu
        {
            get { return menu; }
            set { menu = value; }
        }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.menu != null) && !string.IsNullOrEmpty(this.menu.Naziv) &&
                !string.IsNullOrEmpty(this.menu.Opis))
                entiteti.MenuInsert(this.menu.Naziv, this.menu.Opis, this.menu.Cena);
            return base.izvrsi(entiteti);
        }
    }
    public class OpMenuUpdate : OpMenuBase
    {
        private MenuDb menu;
        public MenuDb Menu
        {
            get { return menu; }
            set { menu = value; }
        }

        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if ((this.menu != null) && (this.menu.Idmenu) > 0 &&
                !string.IsNullOrEmpty(this.menu.Naziv) &&
                !string.IsNullOrEmpty(this.menu.Opis))
                entiteti.MenuUpdate(this.menu.Idmenu, this.menu.Naziv, this.menu.Opis, this.menu.Cena);
            return base.izvrsi(entiteti);
        }

    }
    public class OpMenuDelete : OpMenuBase
    {
        private int idMenu;
        public int IdMenu
        {
            get { return idMenu; }
            set { idMenu = value; }
        }
        public override OperacijaRezultat izvrsi(restoranbazaEntities entiteti)
        {
            if (this.idMenu > 0)
                entiteti.MenuDelete(this.idMenu);
            return base.izvrsi(entiteti);
        }

    }
}