using System;
using System.Data;
using System.Data.SqlClient;

namespace LoginDetails
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridData();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;Integrated Security=True");
            con.Open();

            SqlCommand cmd = new SqlCommand("insert into Logins values('" +txtUsername.Text  + "','" + txtPassword.Text + "')", con);

            cmd.ExecuteNonQuery();
            Response.Write("Login details submitted successfully");

            con.Close();
            BindGridData();
        }

        private void BindGridData()
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;Integrated Security=True");
            SqlDataAdapter da = new SqlDataAdapter("select * from Logins", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;Integrated Security=True");
            con.Open();

            SqlCommand cmd = new SqlCommand("update Logins set Password='" + txtPassword.Text + "' where Username='" + txtUsername.Text + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;Integrated Security=True");
            con.Open();

            SqlCommand cmd = new SqlCommand("delete from Logins where Username='" + txtUsername.Text + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;Integrated Security=True");

            SqlCommand cmd = new SqlCommand("select * from Logins where Username like '%" + txtSearch.Text + "%'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            grdData.DataSource = ds;
            grdData.DataBind();
        }
    }
}