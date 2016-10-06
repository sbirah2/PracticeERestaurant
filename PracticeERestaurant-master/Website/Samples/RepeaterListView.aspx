<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RepeaterListView.aspx.cs" Inherits="Samples_RepeaterListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Nested Repeater</h1>
    <!-- the outer repeater is for each orw in the overall dataset-->
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <!-- the inner repeater will handle the List<T> that is on each row of the overall dataset -->
            <asp:Repeater ID="FoodItemList" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <ItemTemplate>
                    <%# Eval("ItemID") %>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FoodDescription") %>'></asp:Label>
                    <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>

                <%--    // took field - typecasted to decimal - converted whole thing in String //--%>

                    <span class="badge"><%# Eval("TimesServed") %>Servings</span>
                    </br>
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
    <h1>Repeater with ListView</h1>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <asp:ListView ID="ListView1" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <ItemTemplate>
                    <tr>
                        <td style="padding:15px">
                             <%# Eval("ItemID") %>
                        </td>
                        <td style="width:200px">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("FoodDescription") %>'></asp:Label>
                        </td>
                        <td>
                             <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>
                        </td>
                        <td>
                            <span class="badge"><%# Eval("TimesServed") %>Servings</span>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <th runat="server">ID</th>
                            <th runat="server">Item</th>
                            <th runat="server">$</th>
                            <th runat="server">Servings</th>
                             <%-- Made our own headings --%>
                        </tr>
                        <tr runat="server" id="itemPlaceholder">

                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </ItemTemplate>
    </asp:Repeater>
     <asp:ObjectDataSource ID="MenuCategoryFoodItemsODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="MenuCategoryFoodItemsDTO_Get" 
         TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
</asp:Content>

