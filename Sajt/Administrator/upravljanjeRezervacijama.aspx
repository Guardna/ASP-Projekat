<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeRezervacijama.aspx.cs" Inherits="Sajt.Administrator.upravljanjeRezervacijama" EnableEventValidation="false" %>
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
            <table style="width: 100%; height: 227px;">
                <tr>
                    <td style="width: 530px">
                        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Upravljanje rezervacijama"></asp:Label>
                    </td>
                    <td class="modal-sm" style="width: 317px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 530px">
                        <asp:GridView ID="GridView1" runat="server" Width="294px" CellSpacing="4" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="ime" HeaderText="Ime" ReadOnly="True" SortExpression="ime" Visible="true" />
                                <asp:BoundField DataField="telefon" HeaderText="Telefon" ReadOnly="True" SortExpression="telefon" Visible="true" />
                                <asp:BoundField DataField="datum" HeaderText="Datum" ReadOnly="True" SortExpression="datum" Visible="true" />
                                <asp:BoundField DataField="vreme" HeaderText="Vreme" ReadOnly="True" SortExpression="vreme" Visible="true" />
                                <asp:TemplateField HeaderText="Izbrisi">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Izbrisi" CommandName="Delete" CommandArgument='<%# Eval("idrez") %>' ID="btnIzbrisi" OnClick="btnIzbrisi_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Izmeni">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Izmeni" CommandName="Update" CommandArgument='<%# Eval("idrez") + ";" + Eval("ime") + ";" + Eval("telefon") + ";" + Eval("datum") + ";" + Eval("vreme") %>' ID="btnIzmeni" OnClick="btnIzmeni_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                    </td>
                    <td class="modal-sm" style="width: 317px">
                        <asp:Panel ID="Panel1" runat="server" Height="161px" Visible="false">
                            <table style="width:100%; height: 159px;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Ime:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxIme" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                                    </td>
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
                                        <asp:Button ID="ButtonIzmeni" runat="server" OnClick="ButtonIzmeni_Click" Text="Izmeni" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 530px">&nbsp;</td>
                    <td class="modal-sm" style="width: 317px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
</asp:Content>
