<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="dodavanjeKorisnika.aspx.cs" Inherits="Sajt.Administrator.dodavanjeKorisnika" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class="col-4"><a href="/Administrator/upravljanjeKorisnicima.aspx">Upravljanje korisnicima</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeKorisnika.aspx">Dodavanje korisnika</a></div>
            <div class="col-4"><a href="/Administrator/upravljanjeSlikama.aspx">Upravljanje slikama</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeSlika.aspx">Dodavanje slika</a></div>
            <div class="col-4"><a href="/Administrator/upravljanjeAnketom.aspx">Upravljanje anketom</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeAnkete.aspx">Dodavanje ankete</a></div>>
            <div class="col-4"><a href="/Administrator/upravljanjeRezervacijama.aspx">Upravljanje rezervacijama</a></div>
            <div class="col-4"><a href="/Administrator/dodavanjeRezervacije.aspx">Dodavanje rezervacija</a></div>
    </div>
    <table style="width:100%;">
        <tr>
            <td style="width: 344px">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Dodavanje korisnika"></asp:Label>
            </td>
            <td style="width: 397px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 344px">
                <asp:GridView ID="GridView1" runat="server" CellSpacing="4" Width="329px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ime" HeaderText="Ime korisnika" SortExpression="ime" Visible="true" />
                        <asp:BoundField DataField="prezime" HeaderText="Prezime korisnika" SortExpression="prezime" Visible="true" />
                        <asp:BoundField DataField="mail" HeaderText="Email korisnika" SortExpression="mail" Visible="true" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td style="width: 397px">
                <asp:Panel ID="Panel1" runat="server" Height="126px">
                    <table style="width:100%; height: 123px;">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Ime:"></asp:Label>
                            </td>
                            <td class="modal-sm" style="width: 298px">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Prezime:"></asp:Label>
                            </td>
                            <td class="modal-sm" style="width: 298px">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
                            </td>
                            <td class="modal-sm" style="width: 298px">
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="modal-sm" style="width: 298px">
                                <asp:Button ID="btnUnesi" runat="server" OnClick="btnUnesi_Click" Text="Unesi" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 344px">&nbsp;</td>
            <td style="width: 397px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
