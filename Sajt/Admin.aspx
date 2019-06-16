<%@ Page Title="Admin" MetaDescription="Strana za admina" MetaKeywords="Admin strana" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Sajt.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h3 class="page-header">
                    Admin panel
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-4"><a href="/Administrator/upravljanjeKorisnicima.aspx">Upravljanje korisnicima</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeKorisnika.aspx">Dodavanje korisnika</a></div>
            <div class="col-4"><a href="/Administrator/upravljanjeSlikama.aspx">Upravljanje slikama</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeSlika.aspx">Dodavanje slika</a></div>
            <div class="col-4"><a href="/Administrator/upravljanjeAnketom.aspx">Upravljanje anketom</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeAnkete.aspx">Dodavanje ankete</a></div>
            <div class="col-4"><a href="/Administrator/upravljanjeRezervacijama.aspx">Upravljanje rezervacijama</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeRezervacije.aspx">Dodavanje rezervacija</a></div>
                <br />
                <asp:Button ID="btnLogOut" runat="server" OnClick="btnLogOut_Click" Text="Izloguj se" />
            </div>
        </div>
</asp:Content>
