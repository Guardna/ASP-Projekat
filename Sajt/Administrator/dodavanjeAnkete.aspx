<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="dodavanjeAnkete.aspx.cs" Inherits="Sajt.Administrator.dodavanjeAnkete" EnableEventValidation="false" %>
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
            <table style="width: 100%; height: 193px;">
                <tr>
                    <td style="width: 466px">
                        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Dodavanje ankete"></asp:Label>
                    </td>
                    <td class="modal-sm" style="width: 298px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 466px">
                        <asp:GridView ID="GridView1" runat="server" CellSpacing="4" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="false">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="idpoll" HeaderText="ID" ReadOnly="True" SortExpression="idpoll" Visible="true" />
                                <asp:BoundField DataField="naziv" HeaderText="Naziv" ReadOnly="True" SortExpression="naziv" Visible="true" />
                                <asp:BoundField DataField="glasovi" HeaderText="Glasovi" ReadOnly="True" SortExpression="glasovi" Visible="true" />
                            </Columns>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                    </td>
                    <td class="modal-sm" style="width: 298px">
                        <asp:Panel ID="Panel1" runat="server" Height="134px">
                            <table style="width:100%; height: 108px;">
                                <tr>
                                    <td style="width: 132px">
                                        <asp:Label ID="Label2" runat="server" Text="Naziv:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 132px">
                                        <asp:Label ID="Label3" runat="server" Text="Glasovi:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxGlasovi" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 132px">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnUnesi" runat="server" OnClick="Button1_Click" Text="Unesi" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 466px">&nbsp;</td>
                    <td class="modal-sm" style="width: 298px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
</asp:Content>
