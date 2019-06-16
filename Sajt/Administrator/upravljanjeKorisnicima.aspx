<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeKorisnicima.aspx.cs" Inherits="Sajt.Administrator.upravljanjeKorisnicima" EnableEventValidation="false" %>
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
            <td style="width: 387px">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Upravljanje korisnika"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 409px">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 387px; height: 179px;">
                <asp:GridView ID="GridView1" runat="server" Width="286px" CellSpacing="4" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="179px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ime" HeaderText="Ime korisnika" SortExpression="ime" Visible="true" />
                        <asp:BoundField DataField="prezime" HeaderText="Prezime korisnika" SortExpression="prezime" Visible="true" />
                        <asp:BoundField DataField="mail" HeaderText="Email korisnika" SortExpression="mail" Visible="true" />
                        <asp:TemplateField HeaderText="Brisanje korisnika">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Izbrisi" CommandName="Delete" CommandArgument='<%# Eval("idkorisnik") %>' ID="btnIzbrisi" OnClick="btnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Izmena korisnika">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Izmeni" CommandName="Update" CommandArgument='<%# Eval("idkorisnik") + ";" + Eval("ime") + ";" + Eval("prezime") + ";" + Eval("mail") %>' ID="btnIzmeni" OnClick="btnIzmeni_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
            <td class="modal-sm" style="width: 409px; height: 179px;">
                <asp:Panel ID="Panel1" runat="server" Height="185px" Visible="false">
                    <table style="width: 100%; height: 117px;">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Ime:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" Visible="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Prezime:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Potvrdi" OnClick="Button1_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="height: 179px"></td>
        </tr>
        <tr>
            <td style="width: 387px">
                &nbsp;</td>
            <td class="modal-sm" style="width: 409px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
