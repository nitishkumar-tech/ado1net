<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView1.aspx.cs" Inherits="ado1net.GridView1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td>
                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvFirst" runat="server" ForeColor="Red" ErrorMessage="Plesr Enter Username" ControlToValidate="txtUsername">
                        </asp:RequiredFieldValidator>--%>
                       
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Plesr Enter Password" ControlToValidate="txtPassword">
                        </asp:RequiredFieldValidator>--%>

                    </td>
                </tr>
                <td></td>
                <tr>
                    <td></td>

                    <td>
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />

                        <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" />

                        <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" />
                    </td>
                </tr>
            </table>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="grdData" runat="server"
                            AutoGenerateColumns="false"
                            DataKeyNames="userid"
                            PageSize="5"
                            AllowPaging="true"
                            OnPageIndexChanging="grdData_PageIndexChanging"
                            OnRowEditing="grdData_RowEditing"
                            OnRowCancelingEdit="grdData_RowCancelingEdit"
                            OnRowUpdating="grdData_RowUpdating" OnRowDeleting="grdData_RowDeleting">

                            <Columns>
                                <asp:TemplateField HeaderText="Username">

                                    <ItemTemplate>
                                        <asp:Label ID="lblUsername" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtUsername" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Password">

                                    <ItemTemplate>
                                        <asp:Label ID="lblPassword" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="btnsEdit" runat="server" Text="Edit" CommandName="Edit" />
                                        <asp:Button ID="btnsDelete" runat="server" Text="Delete" CommandName="Delete" />
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:Button ID="btnsUpdate" runat="server" Text="Update" CommandName="Update" />
                                        <asp:Button ID="btnsCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <table align="center">
                <tr>
                    <td>
                        <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
                    </td>
                </tr>

            </table>

    </form>
</body>
</html>
