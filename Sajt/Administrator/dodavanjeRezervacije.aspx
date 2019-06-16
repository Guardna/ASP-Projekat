<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="dodavanjeRezervacije.aspx.cs" Inherits="Sajt.Administrator.dodavanjeRezervacije" EnableEventValidation="false" %>
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
            <table style="width:100%; height: 207px;">
                <tr>
                    <td style="width: 380px">
                        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Dodavanje rezervacija"></asp:Label>
                    </td>
                    <td class="modal-sm" style="width: 361px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 380px">
                        <asp:GridView ID="GridView1" runat="server" Width="343px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="134px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ime" HeaderText="Ime" ReadOnly="True" SortExpression="ime" Visible="true" />
                                <asp:BoundField DataField="telefon" HeaderText="Telefon" ReadOnly="True" SortExpression="telefon" Visible="true" />
                                <asp:BoundField DataField="datum" HeaderText="Datum" ReadOnly="True" SortExpression="datum" Visible="true" />
                                <asp:BoundField DataField="vreme" HeaderText="Vreme" ReadOnly="True" SortExpression="vreme" Visible="true" />
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
                    <td class="modal-sm" style="width: 361px">
                        <asp:Panel ID="Panel1" runat="server" Height="138px">
                            <table style="width:100%; height: 132px;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Ime:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxIme" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Telefon:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxTelefon" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Datum:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDatum" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Vreme:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxVreme" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="ButtonUnesi" runat="server" OnClick="ButtonUnesi_Click" Text="Unesi" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 380px">&nbsp;</td>
                    <td class="modal-sm" style="width: 361px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
</asp:Content>
