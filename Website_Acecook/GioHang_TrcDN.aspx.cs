﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Website_Acecook.CTSanPham_TrcDN;

namespace Website_Acecook
{
    public partial class GioHang_TrcDN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateCartCountFromSession();
                BindGridView();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateCart")
            {
                // Lấy giỏ hàng từ Session
                List<Product> cart = Session["Cart"] as List<Product>;

                if (cart != null)
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridView1.Rows[rowIndex];

                    TextBox txtSoLuong = row.FindControl("txtSoLuong") as TextBox;

                    if (txtSoLuong != null)
                    {
                        int newQuantity = Convert.ToInt32(txtSoLuong.Text);

                        // Kiểm tra xem số lượng mới có lớn hơn 0 không
                        if (newQuantity > 0)
                        {
                            // Cập nhật số lượng trong giỏ hàng
                            cart[rowIndex].SoLuong = newQuantity;

                            // Lưu giỏ hàng vào Session
                            Session["Cart"] = cart;

                            // Cập nhật lại GridView
                            BindGridView();
                        }
                    }
                }
            }
        }
        protected void BindGridView()
        {
            // Lấy giỏ hàng từ Session
            List<Product> cart = Session["Cart"] as List<Product>;

            // Kiểm tra xem giỏ hàng có sản phẩm không
            if (cart != null && cart.Count > 0)
            {
                // Hiển thị thông tin giỏ hàng trên GridView
                GridView1.DataSource = cart;
                GridView1.DataBind();
            }
            else
            {
                // Hiển thị thông báo khi giỏ hàng trống
                lblEmptyCart.Text = "Giỏ hàng của bạn trống!";

                // Có thể thêm dòng sau để đảm bảo rằng GridView không hiển thị dữ liệu cũ nếu có
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
            // Tính tổng thanh toán và gán giá trị cho TextBox
            decimal tongThanhToan = CalculateTotal();
            txtTongThanhToan.Text = tongThanhToan.ToString("N0");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Đặt giá trị của TextBox là số lượng hiện tại
                TextBox txtSoLuong = e.Row.FindControl("txtSoLuong") as TextBox;
                if (txtSoLuong != null)
                {
                    txtSoLuong.Text = DataBinder.Eval(e.Row.DataItem, "SoLuong").ToString();
                }
            }
        }

        protected void AdjustQuantity_Command(object sender, CommandEventArgs e)
        {
            // Lấy giỏ hàng từ Session
            List<Product> cart = Session["Cart"] as List<Product>;

            if (cart != null)
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Product product = cart[index];

                if (e.CommandName == "Increase")
                {
                    // Tăng số lượng sản phẩm
                    product.SoLuong++;
                }
                else if (e.CommandName == "Decrease")
                {
                    // Giảm số lượng sản phẩm, nhưng đảm bảo không âm
                    product.SoLuong = Math.Max(0, product.SoLuong - 1);
                }

                // Lưu giỏ hàng vào Session
                Session["Cart"] = cart;

                // Cập nhật lại GridView
                BindGridView();
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Lấy giỏ hàng từ Session
            List<Product> cart = Session["Cart"] as List<Product>;

            // Xác định dòng đang được xóa
            GridViewRow row = GridView1.Rows[e.RowIndex];

            // Lấy khóa chính (Tên sản phẩm) của dòng đang xóa
            string tenSP = GridView1.DataKeys[e.RowIndex].Values["TenSanPham"].ToString();

            // Xóa sản phẩm khỏi giỏ hàng
            if (cart != null)
            {
                Product productToRemove = cart.FirstOrDefault(p => p.TenSanPham == tenSP);
                if (productToRemove != null)
                {
                    cart.Remove(productToRemove);

                    // Lưu giỏ hàng vào Session
                    Session["Cart"] = cart;

                    // Cập nhật lại GridView
                    BindGridView();
                }
            }
        }
        private decimal CalculateTotal()
        {
            List<Product> cart = Session["Cart"] as List<Product>;
            decimal tongThanhToan = cart?.Sum(p => p.Gia * p.SoLuong) ?? 0;
            return tongThanhToan;
        }

        protected void btnMuaHang_Click(object sender, EventArgs e)
        {
            List<Product> cart = Session["Cart"] as List<Product>;
            decimal totalAmount = CalculateTotal();

            // Store the cart items and total amount in session variables
            Session["CartItems"] = cart;
            Session["TotalAmount"] = totalAmount;

            // Redirect to DonDatHang.aspx with query parameters
            Response.Redirect($"ThanhToan.aspx?totalAmount={totalAmount}");
        }

        private void UpdateCartCountFromSession()
        {
            // Kiểm tra xem giỏ hàng đã được lưu trong Session chưa
            List<Product> cart = Session["Cart"] as List<Product>;

            if (cart != null)
            {
                // Cập nhật số lượng sản phẩm trên nhãn lblSoLuong
                UpdateCartCount();
            }
        }

        public void UpdateCartCount()
        {
            // Lấy giỏ hàng từ Session
            List<Product> cart = Session["Cart"] as List<Product>;

            // Khai báo dictionary để lưu tên sản phẩm và số lượng
            Dictionary<string, int> cartItems = new Dictionary<string, int>();

            if (cart != null)
            {
                foreach (var product in cart)
                {
                    if (cartItems.ContainsKey(product.TenSanPham))
                    {
                        // Nếu tên sản phẩm đã có trong dictionary thì tăng số lượng lên
                        cartItems[product.TenSanPham] += 1; // Nếu muốn theo dõi số lượng, thì cập nhật lại theo SoLuong
                    }
                    else
                    {
                        // Nếu chưa có thì thêm mới và gán số lượng
                        cartItems.Add(product.TenSanPham, 1); // Nếu muốn theo dõi số lượng, thì cập nhật lại theo SoLuong
                    }
                }
            }

            // Tính tổng số lượng độc lập theo tên sản phẩm
            int count = cartItems.Sum(x => x.Value);

            // Tìm Label trong MasterPage
            Label lblSoLuong = Master?.FindControl("lblSoLuong") as Label;

            if (lblSoLuong != null)
            {
                // Gán số lượng mới vào Label
                lblSoLuong.Text = count.ToString();
            }
        }

    }
}