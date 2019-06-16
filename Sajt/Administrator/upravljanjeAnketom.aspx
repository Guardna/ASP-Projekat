<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeAnketom.aspx.cs" Inherits="Sajt.Administrator.upravljanjeAnketom" EnableEventValidation="false" %>
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
                <table style="width: 100%; height: 160px;">
                <tr>
                    <td style="width: 510px">
                        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Upravljanje Anketom"></asp:Label>
                    </td>
                    <td style="width: 268px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 510px">
                        <asp:GridView ID="GridView1" runat="server" Width="262px" CellSpacing="4" AutoGenerateColumns="False" Height="167px" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="idpoll" HeaderText="ID" ReadOnly="True" SortExpression="idpoll" Visible="true" />
                                <asp:BoundField DataField="naziv" HeaderText="Naziv" ReadOnly="True" SortExpression="naziv" Visible="true" />
                                <asp:BoundField DataField="glasovi" HeaderText="Glasovi" ReadOnly="True" SortExpression="glasovi" Visible="true" />
                                <asp:TemplateField HeaderText="Izbrisi">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Izbrisi" CommandName="Delete" CommandArgument='<%# Eval("idpoll") %>' ID="btnIzbrisi" OnClick="btnIzbrisi_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Izmeni">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Izmeni" CommandName="Update" CommandArgument='<%# Eval("idpoll") + ";" + Eval("naziv") + ";" + Eval("glasovi") %>' ID="btnIzmeni" OnClick="btnIzmeni_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                    <td style="width: 268px">
                        <asp:Panel ID="Panel1" runat="server" Height="160px" Visible="false">
                            <table style="width:100%; height: 128px;">
                                <tr>
                                    <td style="height: 52px; width: 42px">
                                        <asp:Label ID="Label2" runat="server" Text="Naziv:"></asp:Label>
                                    </td>
                                    <td style="height: 52px; width: 5px">
                                        <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="height: 52px">
                                        <asp:TextBox ID="TextBox3" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 42px">
                                        <asp:Label ID="Label3" runat="server" Text="Glasovi:"></asp:Label>
                                    </td>
                                    <td style="width: 5px">
                                        <asp:TextBox ID="TextBoxGlasovi" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 42px">&nbsp;</td>
                                    <td style="width: 5px">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Izmeni" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 510px">&nbsp;</td>
                    <td style="width: 268px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                </table>
</asp:Content>
