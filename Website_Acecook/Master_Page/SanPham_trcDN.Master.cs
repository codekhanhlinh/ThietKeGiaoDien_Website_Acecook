using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website_Acecook.Master_Page
{
    public partial class SanPham_trcDN : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DanhMuc();
        }
        CSDL kn = new CSDL();
        private void DanhMuc()
        {
            DataTable dt = kn.GetData("select * from LoaiSP");
            if (dt.Rows.Count > 0)
            {
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }

        protected void DLDanhMuc_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "DanhMucClick")
            {
                string maLoai = e.CommandArgument.ToString();

                // Chuyển người dùng đến trang "SanPham.aspx" và truyền tham số "maloai" trong URL
                Response.Redirect("/SanPham_trcDN.aspx?maloai=" + maLoai);
            }
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string searchTerm = txtTenSanPham.Text.Trim();
            Session["SearchTerm"] = searchTerm;
            Response.Redirect("/SanPham_trcDN.aspx");
        }

       
    }
}