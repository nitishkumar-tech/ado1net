<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterGrid.aspx.cs" Inherits="ado1net.RegisterGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table  align="center" >
                <tr>
                    <td>
                        Registeration Form
                    </td>
                </tr>
            </table>
            <table align="center">
                <tr>
                    <td>
                        <asp:Label ID="lblfirst" runat="server" Text="First Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtfirst" runat="server"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbllast" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtlast" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblpassword" Text="Password" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtpassword" TextMode="Password" runat="server"></asp:TextBox>
                    </td>
                </tr>
               <tr>
                   <td>
                       <asp:Label ID="lblconfirm" Text="Confirm Password" runat="server"></asp:Label>
                   </td>
                   <td>
                       <asp:TextBox ID="txtconfirm" TextMode="Password" runat="server"></asp:TextBox>
                   </td>
               </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblemail" Text="Email" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblphone" Text="Phone number" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                           </td>
    </tr>
    <td></td>
    <tr>
        <td></td>

        <td>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />

            <%--<asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" />

            <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" />--%>
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
     AllowPaging="true"  OnPageIndexChanging="grdData_PageIndexChanging" OnRowCancelingEdit="grdData_RowCancelingEdit" OnRowEditing="grdData_RowEditing"  OnRowUpdating="grdData_RowUpdating" OnRowDeleting="grdData_RowDeleting">
         <Columns>
            <asp:TemplateField HeaderText="Firstname">
             <ItemTemplate>
                 <asp:Label ID="lblfname" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
             </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtfname" runat="server" Text='<%#Bind("firstname") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Lastname">
                 <ItemTemplate>
                     <asp:Label ID="lbllname" runat="server" Text='<%#Bind("lastname") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtlname" runat="server" Text='<%#Bind("lastname") %>'></asp:TextBox>
                 </EditItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Password">
                 <ItemTemplate>
                     <asp:Label ID="lblpassword" runat="server" Text='<%#Bind("password") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                <asp:TextBox ID="txtpassword" runat="server" Text='<%#Bind("password") %>'></asp:TextBox>
                 </EditItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Confirm Password">
    <ItemTemplate>
        <asp:Label ID="lblcpassword" runat="server" Text='<%#Bind("confirmpassword") %>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
   <asp:TextBox ID="txtcpassword" runat="server" Text='<%#Bind("confirmpassword") %>'></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>
                          <asp:TemplateField HeaderText="Email">
    <ItemTemplate>
        <asp:Label ID="lblemail" runat="server" Text='<%#Bind("Email") %>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
   <asp:TextBox ID="txtemail" runat="server" Text='<%#Bind("Email") %>'></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>

             <asp:TemplateField HeaderText="PhoneNumber">
                 <ItemTemplate>
               <asp:Label ID="lblphn" runat="server" Text='<%#Eval("phonenumber") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtphn" runat="server" Text='<%#Eval("phonenumber") %>'></asp:TextBox>
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
        </div>
    </form>
</body>
</html>
