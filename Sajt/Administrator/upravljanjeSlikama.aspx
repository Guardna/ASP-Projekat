<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="upravljanjeSlikama.aspx.cs" Inherits="Sajt.Administrator.upravljanjeSlikama" EnableEventValidation="false" %>
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
            <td style="width: 339px">
                <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Upravljanje slikama"></asp:Label>
            </td>
            <td style="width: 464px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 339px">
                <asp:GridView ID="GridView1" runat="server" Width="327px" CellSpacing="4" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="naziv" HeaderText="Naziv slike" SortExpression="naziv" />
                        <asp:TemplateField HeaderText="Slika">
                            <ItemTemplate>
                                <asp:Image ID="Slika" runat="server" Width="100px" Height="100px" ImageUrl='<%# Bind("putanja") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>                      
                        <asp:TemplateField HeaderText="Brisanje slike">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Izbrisi" CommandName="Delete" CommandArgument='<%# Eval("idslika") %>' ID="btnIzbrisi" OnClick="Unnamed1_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Izmeni sliku">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Izmeni" CommandName="Update" CommandArgument='<%# Bind("idslika") %>' ID="btnIzmeni" OnClick="btnIzmeni_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
            <td style="width: 464px">
                <asp:Panel ID="Panel1" runat="server" Height="180px" Visible="false">
                    <table style="width:100%; height: 139px;">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Naziv slike:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Putanja slike:"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUploadEditSlika" runat="server" Width="123px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnPotvrdi" runat="server" OnClick="Button1_Click" Text="Potvrdi" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 339px">&nbsp;</td>
            <td style="width: 464px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
