<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="Proiect.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateCollums="false"
                

                <%Theme properties %>

                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                
                <Columns>
                    <asp:TemplateField HeaderText="Nume">
                        <ItemTemplate>
                            <%--<asp:Label Text='<%# Eval("Nume") %>' runat="server" />--%>
                            <asp:Label Text="Anghel"  />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="txtNume" Text='<%# Eval("Nume") %>' runat="server" />--%>
                            <asp:TextBox ID="txtNume" Text="nume" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNumeFooter"  />
                        </FooterTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Prenume">
                        <ItemTemplate>
                           <%-- <asp:Label Text='<%# Eval("Prenume") %>' runat="server" />--%>
                            <asp:Label Text="Marius"  />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="txtPrenume" Text='<%# Eval("Prenume") %>' runat="server" />--%>
                            <asp:TextBox ID="txtPrenume" Text="prenume"  />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPrenumeFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowFooter="True" ShowHeaderWhenEmpty="true"

            OnRowCommand="GridView2_RowCommand"

            DataSourceID="student" CellPadding="4" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle ForeColor="#330099" BackColor="White" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />

            <Columns>

                <asp:TemplateField HeaderText="Nume">
                        <ItemTemplate>
                            <asp:Label Text="Anghel" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>        
                            <asp:TextBox ID="txtNume" Text="nume" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNumeFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                <asp:TemplateField HeaderText="Prenume">
                        <ItemTemplate>
                            <asp:Label Text="Marius" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>        
                            <asp:TextBox ID="txtPrenume" Text="prenume" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPrenumeFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                <asp:TemplateField HeaderText="Numar de telefon">
                        <ItemTemplate>
                            <asp:Label Text="0729888523" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>        
                            <asp:TextBox ID="txtTelefon" Text="telefon" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtTelefon" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                    <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                    <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="AddNew" Width="20px" Height="20px"/>
                </FooterTemplate>
            </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
        <asp:Label ID="lblErorMessage" Text="" runat="server" ForeColor="Red" />

        <asp:SqlDataSource ID="student" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
