<%@ Page Title="About me" MetaDescription="Strana o autoru" MetaKeywords="O meni" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Sajt.about" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="page-header">
                    Stefan Popovic 328/15
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="thumbnail">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">Opste informacije</h2>
                        </div>
                        <div class="panel-body">
                            <span>Rodjen u Cupriji 02.04.1994<br/><br/>
							Zavrsio Gimnaziju u Krusevcu<br/>
							Informaticki smer<br/><br/>
                            Fakultet: Visoka ICT 328/15<br/>
							Kontakt: stefan.popovic.328.15@ict.edu.rs<br/>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="thumbnail">
                    <img src="/img/me.jpg"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
