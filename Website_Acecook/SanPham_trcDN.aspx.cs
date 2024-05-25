using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Website_Acecook.CTSanPham_TrcDN;

namespace Website_Acecook
{
    public partial class SanPham_trcDN : System.Web.UI.Page
    {
        private readonly CSDL kn = new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    // Kiểm tra giỏ hàng trong Session
                    UpdateCartCountFromSession();

                    // Hiển thị tất cả sản phẩm ban đầu
                    LoadAllProducts();

                    if (Session["SearchTerm"] != null)
                    {
                        string searchTerm = Session["SearchTerm"].ToString();
                        LoadProductsBySearchTerm(searchTerm);
                        Session.Remove("SearchTerm");
                    }
                    else if (Request.QueryString["maloai"] != null)
                    {
                        string maLoai = Request.QueryString["maloai"];
                        LoadProductsByCategory(maLoai);
                    }
                }
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ
            }
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

        private void LoadProductsByCategory(string maLoai)
        {
            // Thực hiện truy vấn cơ sở dữ liệu để lấy sản phẩm dựa trên mã loại sản phẩm
            DataTable productsTable = GetProductsByCategoryFromDatabase(maLoai);

            // Gán dữ liệu vào DataList1
            DataList1.DataSource = productsTable;
            DataList1.DataBind();
        }

        private DataTable GetProductsByCategoryFromDatabase(string maLoai)
        {
            string query = "SELECT MaSP, TenSP, DonGia, Hinh, Rating FROM SanPham WHERE MaLSP = @maLoai";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@maLoai", maLoai)
            };

            DataTable dataTable = kn.GetData(query, parameters);

            return dataTable;
        }

        private void LoadProductsBySearchTerm(string searchTerm)
        {
            // Thực hiện truy vấn cơ sở dữ liệu để lấy sản phẩm dựa trên tên sản phẩm
            DataTable productsTable = GetProductsBySearchTermFromDatabase(searchTerm);

            // Gán dữ liệu vào DataList1
            DataList1.DataSource = productsTable;
            DataList1.DataBind();
        }


        protected void imgBtnChiTiet_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                // Get the product ID (MaSP) from the CommandArgument
                string maSP = e.CommandArgument.ToString();

                // Redirect to CTSanPham.aspx with the MaSP parameter
                Response.Redirect($"CTSanPham_TrcDN.aspx?MaSP={maSP}");
            }
        }

      
        private void LoadAllProducts()
        {
            // Thực hiện truy vấn cơ sở dữ liệu để lấy tất cả sản phẩm
            DataTable productsTable = GetAllProductsFromDatabase();

            // Gán dữ liệu vào DataList1
            DataList1.DataSource = productsTable;
            DataList1.DataBind();
        }

        private DataTable GetAllProductsFromDatabase()
        {
            string query = "SELECT MaSP, TenSP, DonGia, Hinh, Rating FROM SanPham";
            DataTable dataTable = kn.GetData(query);
            return dataTable;
        }

        private DataTable GetProductsBySearchTermFromDatabase(string searchTerm)
        {
            string query = "SELECT MaSP, TenSP, DonGia, Hinh, Rating FROM SanPham WHERE TenSP LIKE @searchTerm";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@searchTerm", "%" + searchTerm + "%")
            };

            DataTable dataTable = kn.GetData(query, parameters);

            return dataTable;
        }

        protected string GetRatingStarsHtml(object rating)
        {
            int ratingValue = Convert.ToInt32(rating);
            string starsHtml = string.Empty;

            for (int i = 0; i < 5; i++)
            {
                if (i < ratingValue)
                {
                    starsHtml += "<i class='fa-solid fa-star' style='color: gold;'></i>";
                }
                else
                {
                    starsHtml += "<i class='fa-solid fa-star' style='color: lightgray;'></i>";
                }
            }

            return starsHtml;
        }

        protected string GetDiscountHtml(object discount)
        {
            int discountValue = Convert.ToInt32(discount);
            if (discountValue > 0)
            {
                return $"<div class='discount-circle'>-{discountValue}%</div>";
            }
            return string.Empty;
        }

        protected void btnThemGioHang_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string maSP = e.CommandArgument.ToString();

                try
                {
                    CTSanPham_TrcDN cTSanPhamInstance = new CTSanPham_TrcDN();
                    cTSanPhamInstance.AddToCartFromButton(maSP);
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
                catch (Exception ex)
                {
                    // Xử lý ngoại lệ
                }
            }
        }
       


    }
}