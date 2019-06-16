<%@ Page Title="Registration" MetaDescription="Strana za registraciju" MetaKeywords="Registracija" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="registracija.aspx.cs" Inherits="Sajt.registracija" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 52%; height: 372px;">
        <tr>
            <td style="width: 307px; height: 35px;"></td>
            <td style="width: 211px; height: 35px;">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Registracija korisnika"></asp:Label>
            </td>
            <td style="height: 35px; width: 269px;"></td>
        </tr>
        <tr>
            <td style="width: 307px; height: 30px;">
                <asp:Label ID="Label2" runat="server" Text="Ime:"></asp:Label>
            </td>
            <td style="width: 211px; height: 30px;" class="modal-sm">
                <asp:TextBox ID="TextBoxIme" runat="server"></asp:TextBox>
            </td>
            <td style="height: 30px; width: 269px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxIme" ErrorMessage="Ime je obavezno!" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxIme" ErrorMessage="Ime nije u dobrom formatu!" ForeColor="Red" ValidationExpression="[A-Z][a-z]{2,19}" EnableClientScript="False"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 307px; height: 31px;">
                <asp:Label ID="Label3" runat="server" Text="Prezime:"></asp:Label>
            </td>
            <td style="width: 211px; height: 31px;" class="modal-sm">
                <asp:TextBox ID="TextBoxPrezime" runat="server"></asp:TextBox>
            </td>
            <td style="height: 31px; width: 269px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPrezime" ErrorMessage="Prezime je obavezno!" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxPrezime" ErrorMessage="Prezime nije u dobrom formatu!" ForeColor="Red" ValidationExpression="[A-Z][a-z]{3,20}" EnableClientScript="False"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 307px; height: 31px;">
                <asp:Label ID="Label4" runat="server" Text="Email adresa:"></asp:Label>
            </td>
            <td style="width: 211px; height: 31px;" class="modal-sm">
                <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td style="height: 31px; width: 269px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email je obavezan!" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email nije u dobrom formatu!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 307px; height: 31px;">
                Korisnicko ime:<br />
            </td>
            <td style="width: 211px; height: 31px;" class="modal-sm">
                <asp:TextBox ID="TextBoxKorIme" runat="server"></asp:TextBox>
            </td>
            <td style="height: 31px; width: 269px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Polje mora biti popunjeno!" ControlToValidate="TextBoxKorIme" EnableClientScript="False" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 307px; height: 31px;">
                Lozinka:<br />
            </td>
            <td style="width: 211px; height: 31px;" class="modal-sm">
                <asp:TextBox ID="TextBoxLozinka" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="height: 31px; width: 269px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Polje mora biti popunjeno!" ControlToValidate="TextBoxLozinka" EnableClientScript="False" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 307px; height: 31px;">
                Lozinka ponovo:<br />
            </td>
            <td style="width: 211px; height: 31px;" class="modal-sm">
                <asp:TextBox ID="TextBoxLozinkaPonovo" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="height: 31px; width: 269px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Polje mora biti popunjeno!" ControlToValidate="TextBoxLozinkaPonovo" EnableClientScript="False" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 307px; height: 31px;">
                &nbsp;</td>
            <td style="width: 211px; height: 31px;" class="modal-sm">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxLozinka" ControlToValidate="TextBoxLozinkaPonovo" Display="Dynamic" ErrorMessage="Lozinke moraju biti iste!" EnableClientScript="False" ForeColor="Red"></asp:CompareValidator>
            </td>
            <td style="height: 31px; width: 269px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 307px; height: 31px;">
                &nbsp;</td>
            <td style="width: 211px; height: 31px;" class="modal-sm">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Registruj se" />
            </td>
            <td style="height: 31px; width: 269px;">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
