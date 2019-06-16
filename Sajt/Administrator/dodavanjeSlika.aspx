<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="dodavanjeSlika.aspx.cs" Inherits="Sajt.Administrator.dodavanjeSlika" EnableEventValidation="false" %>
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
                <table style="width: 100%; height: 134px;">
                <tr>
                    <td style="width: 403px">
                        <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Dodavanje slika"></asp:Label>
                    </td>
                    <td class="modal-sm" style="width: 310px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 403px">
                        <asp:GridView ID="GridView1" runat="server" CellSpacing="4" Width="262px" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="590px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="naziv" HeaderText="Naziv" SortExpression="naziv" />
                                <asp:TemplateField HeaderText="Slika">
                                    <ItemTemplate>
                                        <asp:Image ID="Slika" runat="server" Width="100%" ImageUrl='<%# Bind("putanja") %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Image ID="Slika" runat="server" Width="100%" ImageUrl='<%# Bind("putanja") %>' />
                                        <asp:FileUpload ID="FileUploadEditSlika" runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                    </td>
                    <td class="modal-sm" style="width: 310px">
                        <asp:Panel ID="Panel1" runat="server" Height="94px" Width="270px">
                            <table style="width:89%; height: 89px;">
                                <tr>
                                    <td style="width: 80px">
                                        <asp:Label ID="Label2" runat="server" Text="Naziv:"></asp:Label>
                                    </td>
                                    <td style="width: 195px">
                                        <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">
                                        <asp:Label ID="Label3" runat="server" Text="Slika:"></asp:Label>
                                    </td>
                                    <td style="width: 195px">
                                        <asp:FileUpload ID="FileUploadSlika" runat="server" Width="73px" Height="16px" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 80px">&nbsp;</td>
                                    <td style="width: 195px">
                                        <asp:Button ID="btnUnesi" runat="server" Text="Unesi" OnClick="btnUnesi_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 403px">&nbsp;</td>
                    <td class="modal-sm" style="width: 310px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
          </table>
</asp:Content>
