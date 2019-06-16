<%@ Page Title="Reservation" MetaDescription="Strana za rezervaciju" MetaKeywords="Rezervacija" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="rezervacija.aspx.cs" Inherits="Sajt.rezervacija" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 228px;">
        <tr>
            <td style="width: 180px">
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Izaberite datum"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 260px">
                <asp:Label ID="Label1" runat="server"  Font-Size="Large" Text="Izaberite vreme"></asp:Label>
            </td>
            <td style="width: 417px">
                <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Popunite podatke"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 180px; height: 255px">
                <asp:Calendar ID="Calendar1" runat="server" DayNameFormat="Shortest" FirstDayOfWeek="Sunday" Height="180px" ShowGridLines="True" Width="227px" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
            <td style="height: 255px; width: 260px">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataTextField="vreme" DataValueField="idrez" Height="19px" Width="125px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="width: 417px; height: 255px">
                <asp:Panel ID="Panel1" runat="server" Height="187px">
                    <table style="width:79%; height: 132px;">
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Ime:"></asp:Label>
                            </td>
                            <td style="width: 254px">
                                <asp:TextBox ID="TextBoxIme" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxIme" EnableClientScript="False" ErrorMessage="Ime mora biti popunjeno!" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Telefon:"></asp:Label>
                            </td>
                            <td style="width: 254px">
                                <asp:TextBox ID="TextBoxTelefon" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxTelefon" EnableClientScript="False" ErrorMessage="Telefon mora biti unesen!" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="width: 254px">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="width: 254px">
                                <asp:Button ID="btnPosalji" runat="server" OnClick="btnPosalji_Click" Text="Rezervisi" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 180px; height: 79px"></td>
            <td style="height: 79px; width: 260px">
                <asp:Label ID="Label6" runat="server" ForeColor="#0066FF" Font-Size="Larger" Text="Rezervacija obavljena." Visible="false"></asp:Label>
            </td>
            <td style="width: 417px; height: 79px"></td>
        </tr>
    </table>
</asp:Content>
