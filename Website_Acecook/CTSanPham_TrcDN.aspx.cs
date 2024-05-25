using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website_Acecook
{
    public partial class CTSanPham_TrcDN : System.Web.UI.Page
    {
        private readonly CSDL kn = new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra xem có tham số MaSP được truyền qua không
                if (Request.QueryString["MaSP"] != null)
                {
                    // Lấy giá trị của tham số MaSP từ URL
                    string maSP = Request.QueryString["MaSP"];

                    // Tải và hiển thị chi tiết sản phẩm
                    LoadProductDetails(maSP, kn);

                    // Cập nhật số lượng hiển thị trên icon giỏ hàng
                    UpdateCartCount();
                }
            }
        }

        public class ProductDetails
        {
            public DataTable ProductTable { get; set; }
            public DataTable ProductDetailsTable { get; set; }
        }
        public void LoadProductDetails(string maSP, CSDL kn)
        {
            ProductDetails productDetails = GetProductDetailsFromDatabase(maSP, kn);

            // Access the ProductTable property of ProductDetails
            DataTable dt = productDetails.ProductTable;

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                lblTenSP.Text = row["TenSP"].ToString();
                lblTinhTrang.Text = row["TT"].ToString();
                lblTP.Text = row["TP"].ToString() ;
                if (!string.IsNullOrEmpty(row["DonGia"].ToString()))
                {
                    decimal gia = decimal.Parse(row["DonGia"].ToString().Replace(" đ", "").Replace(",", ""));
                    lblGia.Text = string.Format("{0:N0} đ", gia);
                }
                // Assuming "Hinh" is the column that contains the image URL in the database
                imgSanPham.ImageUrl = row["Hinh"].ToString();
            }
        }

        public static ProductDetails GetProductDetailsFromDatabase(string maSP, CSDL kn)
        {
            string query = "SELECT * FROM SanPham WHERE MaSP = @MaSP";

            SqlParameter[] parameters = { new SqlParameter("@MaSP", maSP) };

            ProductDetails productDetails = new ProductDetails();

            // Assuming kn.GetData returns a DataTable for ProductTable
            productDetails.ProductTable = kn.GetData(query, parameters);

            // Assuming you have another method to get details, adjust this accordingly
            // productDetails.ProductDetailsTable = ...

            return productDetails;
        }

        public class Product
        {
            public string TenSanPham { get; set; }

            // Nếu bạn muốn theo dõi số lượng sản phẩm, thì sử dụng thuộc tính SoLuong
            public int SoLuong { get; set; }

            public string Hinh { get; set; }

            public decimal Gia { get; set; }


            // Constructor để khởi tạo đối tượng Product
            public Product(string tenSanPham, int soLuong, string hinh, decimal gia)
            {
                TenSanPham = tenSanPham;
                SoLuong = soLuong;// Số lượng mặc định là 1 nếu bạn muốn theo dõi số lượng
                Hinh = hinh;
                Gia = gia;
            }
        }
        protected void btnGioHang_Click(object sender, EventArgs e)
        {
            string maSP = Request.QueryString["MaSP"];
            ProductDetails productDetails = GetProductDetailsFromDatabase(maSP, kn);

            // Check if ProductTable is not null
            if (productDetails != null && productDetails.ProductTable != null && productDetails.ProductTable.Rows.Count > 0)
            {
                DataRow row = productDetails.ProductTable.Rows[0];

                // Lấy thông tin sản phẩm từ trang web
                string tenSP = lblTenSP.Text; // Tên sản phẩm, bạn có thể thay đổi tùy thuộc vào cách bạn lưu thông tin sản phẩm
                int soLuong = Convert.ToInt32(quantity.Text);

                // Lấy giá từ cơ sở dữ liệu
                decimal gia = decimal.Parse(row["DonGia"].ToString().Replace(" đ", "").Replace(",", ""));

                // Lấy đường dẫn hình ảnh từ cơ sở dữ liệu
                string hinhAnh = row["Hinh"].ToString();

                // Tạo đối tượng sản phẩm và gán giá trị cho thuộc tính Hinh
                Product product = new Product(tenSP, soLuong, hinhAnh, gia);

                // Thêm sản phẩm vào giỏ hàng
                AddToCart(product, soLuong);

                // Cập nhật số lượng hiển thị trên icon giỏ hàng
                UpdateCartCount();
            }
            else
            {
                // Handle the case where the product details are not found
                // You may want to show an error message or redirect the user
            }
        }


        public void AddToCart(Product product, int quantity)
        {
            //Lấy giỏ hàng từ Session
            List<Product> cart = HttpContext.Current.Session["Cart"] as List<Product>;

            if (cart == null)
            {
                // Nếu giỏ hàng chưa tồn tại, tạo mới
                cart = new List<Product>();
            }

            // Kiểm tra xem sản phẩm có trong giỏ hàng chưa
            Product existingProduct = cart.Find(item => item.TenSanPham == product.TenSanPham);

            if (existingProduct != null)
            {
                // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                existingProduct.SoLuong += quantity;
            }
            else
            {
                // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới vào
                cart.Add(product);
            }

            // Lưu giỏ hàng vào Session
            HttpContext.Current.Session["Cart"] = cart;
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
        public void AddToCartFromButton(string maSP)
        {
            CSDL kn = new CSDL();
            // Tạo một đối tượng ProductDetails để lấy thông tin sản phẩm từ cơ sở dữ liệu
            ProductDetails productDetails = GetProductDetailsFromDatabase(maSP, kn);

            // Lấy thông tin sản phẩm từ đối tượng ProductDetails
            DataRow row = productDetails.ProductTable.Rows[0];

            string tenSP = row["TenSP"].ToString();
            decimal gia = decimal.Parse(row["DonGia"].ToString().Replace(" đ", "").Replace(",", ""));
            string hinhAnh = row["Hinh"].ToString();

            // Tạo một đối tượng Product và thêm vào giỏ hàng
            Product product = new Product(tenSP, 1, hinhAnh, gia);
            AddToCart(product, 1);

            // Cập nhật số lượng hiển thị trên icon giỏ hàng
            UpdateCartCount();
        }
    }
}