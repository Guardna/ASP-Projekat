<%@ Page Title="Login" MetaDescription="Strana za login" MetaKeywords="Login strana" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Sajt.login" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 62%; height: 180px; margin-right: 0px;">
        <tr>
            <td style="width: 172px">&nbsp;</td>
            <td class="modal-sm" style="width: 230px">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Logovanje admina"></asp:Label>
            </td>
            <td style="width: 123px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 172px">
                <asp:Label ID="Label2" runat="server" Text="Korisnicko ime:"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 230px">
                <asp:TextBox ID="TextBoxKorIme" runat="server"></asp:TextBox>
            </td>
            <td style="width: 123px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxKorIme" EnableClientScript="False" ErrorMessage="Korisnicko ime mora biti popunjeno!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 172px">
                <asp:Label ID="Label3" runat="server" Text="Lozinka:"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 230px">
                <asp:TextBox ID="TextBoxLozinka" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="width: 123px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxLozinka" EnableClientScript="False" ErrorMessage="Lozinka mora biti upisana!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 172px">&nbsp;</td>
            <td class="modal-sm" style="width: 230px">
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Ne postoji administrator sa tim ukorisnickim imenom i lozinkom!!"></asp:Label>
            </td>
            <td style="width: 123px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 172px">&nbsp;</td>
            <td class="modal-sm" style="width: 230px">
                <asp:Button ID="btnLog" runat="server" OnClick="btnLog_Click" Text="Uloguj se" />
            </td>
            <td style="width: 123px">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
