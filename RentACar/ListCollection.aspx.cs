using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using RentACar.Models;

namespace RentACar
{
    public partial class ListCollection : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            if (!IsPostBack) // Sayfa ilk yüklendiğinde çalışır
            {
                LoadRequests();
            }
        }

        protected void ListButton_Click(object sender, EventArgs e)
        {
            LoadRequests(); // Butona basıldığında da yeniler
        }

        private void LoadRequests()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            List<CarRequest> requests = new List<CarRequest>();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT StartDate, EndDate, CarType, CarModel FROM CarRequests ORDER BY StartDate DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        requests.Add(new CarRequest
                        {
                            StartDate = reader.GetDateTime(0),
                            EndDate = reader.GetDateTime(1),
                            CarType = reader.GetString(2),
                            CarModel = reader.GetString(3)
                        });
                    }
                }
            }

            RequestGrid.DataSource = requests;
            RequestGrid.DataBind();
        }
    }
}