<%@ Page Title="About us" MetaDescription="Strana o nama" MetaKeywords="About us" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="Sajt.aboutus" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="thumbnail">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">About us</h2>
                        </div>
                        <div class="panel-body">
                        <span>
                            <asp:Label runat="server" Font-Size="Large" Text="Good fresh food served graciously. That's what we do.
                            We offer a casual Serbian menu at our restoraunt
                            all crafted to work with the seasons, in a relaxed stylish setting.
                            It's been said that our name is an understatement. That's really great... but it's still good.">
                            </asp:Label>
                        </span>
                        </div>
                    </div>
                </div>
            </div>
                <table style="width: 100%; height: 366px;">
                    <tr>
                        <td style="width: 222px">&nbsp;</td>
                        <td style="width: 295px">
                            <asp:Label ID="Label1" runat="server" Font-Size="Large" Font-Bold="true" Text="Are you going to visit us ?"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 222px; height: 132px;">
                            &nbsp;</td>
                        <td style="width: 295px; height: 132px;">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataTextField="naziv" DataValueField="idpoll" CellPadding="0" CellSpacing="0" Height="74px" RepeatDirection="Horizontal" Width="380px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            </asp:RadioButtonList>
                        </td>
                        <td style="height: 132px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 222px">&nbsp;</td>
                        <td style="width: 295px">
                            <asp:Chart ID="Chart1" runat="server" Palette="SeaGreen">
                                <series>
                                    <asp:Series Name="Series1" XValueMember="naziv" YValueMembers="glasovi" YValuesPerPoint="2">
                                    </asp:Series>
                                </series>
                                <chartareas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </chartareas>
                            </asp:Chart>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Font-Size="Larger" Text="Hvala na odgovoru." ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                </table>
        </div>
    </div>
</asp:Content>
