<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CURD.aspx.cs" Inherits="LoginDetails.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>

    <script>
        function myfunction() {
            var username = document.getElementById("<%= txtUsername.ClientID %>").value;
            var password = document.getElementById("<%= txtPassword.ClientID %>").value;

            if (username === "" || password === "") {
                alert("Please fill in both fields.");
                return false;
            }
            return true;
        }
    </script>
</head>

<body style="height: 83px; width: 716px">
    <form id="form1" runat="server">
        <div>

            <table align="center">
                <tr>
                    <td>
                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfusername" runat="server"
                            ControlToValidate="txtUsername"
                            ErrorMessage="Username is required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <!-- FIXED -->
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfpassword" runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password is required"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    </td>
                    <td>
                        <!-- FIXED -->
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                            OnClientClick="return myfunction()"
                            OnClick="btnSubmit_Click" />
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                    </td>
                </tr>
            </table>

            <table align="center">
                <tr>
                    <td>
                        <asp:Label ID="lblSearch" runat="server" Text="Search"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="grdData" runat="server"></asp:GridView>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>