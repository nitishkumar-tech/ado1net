using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ado1net
{
    public partial class GridView1 : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select * from login1", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
            con.Close();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into login1 values('" + txtUsername.Text + "','" + txtPassword.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("login details submitted Successfully");
            con.Close();
            BindGridData();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update login1 set password='" + txtPassword.Text + "' where username='" + txtUsername.Text + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("login details updated Successfully");
            con.Close();
            BindGridData();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from login1 where username='" + txtUsername.Text + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("Login details deleted successfully");
            con.Close();
            BindGridData();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from login1 where username LIKE '%" + txtUsername.Text + "%'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
            con.Close();
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
            int UID = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);
            string username = ((TextBox)grd.FindControl("txtUsername")).Text;
            string password = ((TextBox)grd.FindControl("txtPassword")).Text;
            SqlCommand cmd = new SqlCommand("Update login1 set Username=@username,Password=@password where userid=@userid", con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@userid", UID);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();
        }

        protected void grdData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            GridViewRow grd = grdData.Rows[e.RowIndex];
            int userid = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("Delete from login1 where userid=@userid", con);
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();
        }
    }
}


