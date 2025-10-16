using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using RentACar.Models;

namespace RentACar
{
    public partial class ReqCollection : Page
    {
        private Dictionary<string, List<string>> carModels = new Dictionary<string, List<string>>()
        {
            { "Sedan", new List<string> { "Fiat Egea", "Renault Symbol", "Renault Megane" } },
            { "SUV", new List<string> { "Fiat Egea Cross", "Peugeot 3008", "Nissan Qashqai" } }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            if (!IsPostBack)
            {
                CarModel.Items.Clear();
                CarModel.Items.Add(new System.Web.UI.WebControls.ListItem("-- Select --", ""));
            }
        }

        protected void CarType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedType = CarType.SelectedValue;
            CarModel.Items.Clear();
            CarModel.Items.Add(new System.Web.UI.WebControls.ListItem("-- Select --", ""));

            if (carModels.ContainsKey(selectedType))
            {
                foreach (var model in carModels[selectedType])
                {
                    CarModel.Items.Add(new System.Web.UI.WebControls.ListItem(model, model));
                }
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (CarModel == null) return;

                string model = CarModel.SelectedValue ?? "";

                string cnnStr = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(cnnStr))
                {
                    conn.Open();
                    string query = "INSERT INTO CarRequests (StartDate, EndDate, CarType, CarModel) VALUES (@Start, @End, @Type, @Model)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        if (!DateTime.TryParse(StartDate.Text, out DateTime startDate) ||
                            !DateTime.TryParse(EndDate.Text, out DateTime endDate))
                            return;

                        cmd.Parameters.AddWithValue("@Start", startDate);
                        cmd.Parameters.AddWithValue("@End", endDate);
                        cmd.Parameters.AddWithValue("@Type", CarType.SelectedValue);
                        cmd.Parameters.AddWithValue("@Model", model);

                        cmd.ExecuteNonQuery();
                    }
                }

                StartDate.Text = "";
                EndDate.Text = "";
                CarType.SelectedIndex = 0;
                CarModel.Items.Clear();
                CarModel.Items.Add(new System.Web.UI.WebControls.ListItem("-- Select --", ""));
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
