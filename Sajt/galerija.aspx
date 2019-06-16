<%@ Page Title="Paging" MetaDescription="Listanje menija" MetaKeywords="Stranicenje" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="galerija.aspx.cs" Inherits="Sajt.galerija" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 256px;">
        <tr>
            <td style="width: 229px; height: 69px;"></td>
            <td style="width: 322px; height: 69px;">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Stranicenje"></asp:Label>
            </td>
            <td style="height: 69px"></td>
        </tr>
        <tr>
            <td style="width: 229px">
                &nbsp;</td>
            <td style="width: 322px">
                <asp:GridView ID="GridView1" runat="server" Width="280px" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="naziv" HeaderText="Naziv" SortExpression="naziv" Visible="true" />
                        <asp:BoundField DataField="opis" HeaderText="Opis" SortExpression="opis" Visible="true" />                      
                        <asp:BoundField DataField="cena" HeaderText="Cena" SortExpression="cena" Visible="true" />
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/strelica.png" ShowSelectButton="true" SelectText="" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" DataKeyNames="idmenu" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="50px" Width="125px">
                    <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="naziv" HeaderText="Naziv" ReadOnly="True" SortExpression="naziv" />
                        <asp:BoundField DataField="opis" HeaderText="Opis" ReadOnly="True" SortExpression="opis" />
                        <asp:BoundField DataField="cena" HeaderText="Cena" ReadOnly="True" SortExpression="cena" />
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td style="width: 229px">&nbsp;</td>
            <td style="width: 322px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
