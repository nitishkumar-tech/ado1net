using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ado1net
{
    public partial class RegisterGrid : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=register;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGridData();
            
        }
        private void BindGridData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from register", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds= new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
            con.Close();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(
               "insert into register(firstname,lastname,password,confirmpassword,Email,phonenumber) " +
               "values('" + txtfirst.Text + "','" + txtlast.Text + "','" + txtpassword.Text + "','" + txtconfirm.Text + "','" + txtemail.Text + "','" + txtphone.Text + "')",
               con);
            cmd.ExecuteNonQuery();
            Response.Write("login details submitted Successfully");
            con.Close() ;
            BindGridData();
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdData.PageIndex = e.NewPageIndex;
            BindGridData();
        }

        protected void grdData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdData.EditIndex = e.NewEditIndex;
            BindGridData();
        }
        protected void grdData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdData.EditIndex = -1;
            BindGridData();
        }
        protected void grdData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            con.Open();
            GridViewRow grd = grdData.Rows[e.RowIndex];
            int userid = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);
            string firstname=((TextBox)grd.FindControl("txtfname")).Text;
            string lastname = ((TextBox)grd.FindControl("txtlname")).Text;
            string password = ((TextBox)grd.FindControl("txtpassword")).Text;
            string confpassword= ((TextBox)grd.FindControl("txtcpassword")).Text;
            string email = ((TextBox)grd.FindControl("txtemail")).Text;
            string phonenumber = ((TextBox)grd.FindControl("txtphn")).Text;
            SqlCommand cmd = new SqlCommand("update  register set firstname=@firstname,lastname=@lastname,password=@password,confirmpassword=@confirmpassword,Email=@Email,phonenumber=@phonenumber where userid=@userid", con);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@lastname", lastname);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@confirmpassword", confpassword);
            cmd.Parameters.AddWithValue("@Email",email);
            cmd.Parameters.AddWithValue("@phonenumber", password);
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();


        }

        protected void grdData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            GridViewRow grd = grdData.Rows[e.RowIndex];
            int UID = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("Delete from register where userid=@userid", con);
            cmd.Parameters.AddWithValue("@userid", UID);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();
        }
    }
}