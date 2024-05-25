using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Website_Acecook.CTSanPham_TrcDN;

namespace Website_Acecook
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    // Retrieve the cart items and total amount from session variables
                    List<Product> cartItems = Session["CartItems"] as List<Product>;
                    decimal totalAmount = (decimal)(Session["TotalAmount"] ?? 0);

                    // Bind cart items to GridView
                    GridViewDonDatHang.DataSource = cartItems ?? new List<Product>();
                    GridViewDonDatHang.DataBind();

                    // Display the total amount
                    lblTotalAmount.Text = $"{totalAmount.ToString("N0")} VNĐ";
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (log it, display an error message, etc.)
                // For simplicity, you can display a generic error message to the user.
                lblTotalAmount.Text = "An error occurred while processing your request.";
            }
        }
        protected void rblPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            //// Kiểm tra giá trị đã chọn của RadioButtonList
            //if (rblPaymentMethod.SelectedValue == "BANK")
            //{
            //    // Nếu là BANK, hiển thị divBank
            //    divBank.Style["display"] = "block";
            //}
            //else
            //{
            //    // Ngược lại, ẩn divBank
            //    divBank.Style["display"] = "none";
            //}
        }

        protected void btnDatHangTT_Click(object sender, EventArgs e)
        {
            // Failed login
            string errorMessage = "Đơn đặt hàng đã được đặt thành công";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + errorMessage + "');", true);
        }

       
    }
}