<%@ Page Title="Kontakt" MetaDescription="Kontakt forma" MetaKeywords="Kontakt" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="kontakt.aspx.cs" Inherits="Sajt.kontakt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="page-header">
                    Contact us
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="thumbnail">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">Where to find us</h2>
                        </div>
                        <div class="panel-body">
                            <span>
                                Address: Cvijićeva 110, Beograd 103614, Serbia<br/><br/>
                                Hours: Monday to Sunday 12PM-12PM<br/>                              
                                Phone: +381 11 3295351<br/>
                                Reviews: 4.6 stars out of 5						
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="thumbnail">
                    <img src="/img/location.png"/>
                </div>
            </div>
        </div>
            <table style="width: 100%; height: 135px;">
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="Label1" runat="server" Text="Ime i prezime:"></asp:Label>
                    </td>
                    <td class="modal-sm" style="width: 342px">
                        <asp:TextBox ID="TextBoxImePrezime" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 273px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxImePrezime" EnableClientScript="False" ErrorMessage="Polje ime i prezime mora biti popunjeno!" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="modal-sm" style="width: 342px">
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 273px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" EnableClientScript="False" ErrorMessage="Polje email mora biti popunjeno!" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" EnableClientScript="False" ErrorMessage="Email nije u dobrom formatu!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:Label ID="Label3" runat="server" Text="Poruka:"></asp:Label>
                    </td>
                    <td class="modal-sm" style="width: 342px">
                        <asp:TextBox ID="TextBoxPoruka" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td style="width: 273px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPoruka" EnableClientScript="False" ErrorMessage="Polje poruke mora biti popunjeno!" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidatorPoruka" runat="server" ClientValidationFunction="porukaProvera" ControlToValidate="TextBoxPoruka" EnableClientScript="False" ErrorMessage="Poruka mora da sadrzi minimalno 10 karaktera!" ForeColor="Red" OnServerValidate="CustomValidatorPoruka_ServerValidate">*</asp:CustomValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 262px">&nbsp;</td>
                    <td class="modal-sm" style="width: 342px">
                        <asp:Button ID="ButtonPosalji" runat="server" OnClick="ButtonPosalji_Click" Text="Posalji" />
                    </td>
                    <td style="width: 273px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 262px">
                        <asp:BulletedList ID="BulletedListIspis" runat="server">
                        </asp:BulletedList>
                    </td>
                    <td class="modal-sm" style="width: 342px">&nbsp;</td>
                    <td style="width: 273px">
                        <asp:ValidationSummary ID="ValidationSummaryGreske" runat="server" />
                    </td>
                </tr>
            </table>
    </div>
</asp:Content>
