<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MuaHang_TruocDK,DN.Master" AutoEventWireup="true" CodeBehind="GioHang_TrcDN.aspx.cs" Inherits="Website_Acecook.GioHang_TrcDN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .centered-content {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .customGridView {
            font-family: Bahnschrift SemiBold;
            color:#f80000;
            margin-left:30px;
            font-size:18px;
        }
        .customGridView td {
            text-align: center;
            color:black;
            font-size:20px;
        }
        .hinh{
            margin-top:15px;
        }

        .button-sl{
             font-family:Bahnschrift SemiBold;
             font-size:18px;
             border: 1px solid;
             border-color:#f80000;
             width:30px;
             height:25px;
        }
        .button-sl:hover{
            background-color:#87B44B;
        }

        .soluong{
            Width:30px;
            font-family:Bahnschrift SemiBold;
            font-size:20px;
            text-align:center;
            height:30px;
            border:none;
        }
            .thongtinsp{
                width:1000px;
            }

          .thongtinsp{
            box-sizing: border-box; /* Đảm bảo padding và border không làm thay đổi chiều rộng */
            display: inline-block;
            vertical-align: top; 
          }
/*
          .thongtinkh{
              margin-left:10px;
              margin-top:30px;
              width:400px;
              font-family:Bahnschrift;
              text-align:center;
          }*/
          .txtTT{
              color:black;
              border:solid 2px;
              color:#f80000;
              height:30px;
          }
          .align-left {
            text-align: left;
            font-size:18px;
          }

        .label-tong {
            font-family:Bahnschrift SemiBold;
            margin-right:5px;
        }
        .txtTT{
            font-family: Bahnschrift SemiBold;
            font-size: 20px;
        }

        .buttonmh{
            border: solid 2px;
            border-color: #f80000;
            font-family:Bahnschrift SemiBold;
            font-size:20px;
            vertical-align:central;
            margin-left:500px;
            margin-bottom:20px;
        }

        .buttonmh:hover{
             background-color: #f80000;
        }
        .auto-style1 {
            width: 1000px;
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
           
        }

        .thongbaogiohang{
            font-family:Bahnschrift SemiBold;
            color:darkred;
            margin-bottom:10px;
        }

       
    </style>
    <div class="centered-content">
         <div class="auto-style1">
            <asp:GridView ID="GridView1" runat="server" CssClass="customGridView" 
                AutoGenerateColumns="False" 
                BorderStyle="None" 
                OnRowCommand="GridView1_RowCommand" 
                DataKeyNames="TenSanPham"
                OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:TemplateField ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                        <ItemTemplate>
                            <asp:Image ID="imgHinh" runat="server" ImageUrl='<%# Eval("Hinh") %>' Height="150" Width="150" CssClass="hinh" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenSanPham" HeaderText="Tên Sản Phẩm" SortExpression="TenSanPham" ItemStyle-Width="300px" 
                        ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-CssClass="align-left"/>
                    <asp:TemplateField HeaderText="Số Lượng" ItemStyle-Width="130px" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                        <ItemTemplate>
                            <asp:Button ID="btnIncrease" runat="server" Text="+" CommandName="Increase" CommandArgument='<%#
                                Container.DataItemIndex %>' OnCommand="AdjustQuantity_Command" CssClass="button-sl"></asp:Button>
                            <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Eval("SoLuong") %>' CssClass="soluong"></asp:TextBox>
                            <asp:Button ID="btnDecrease" runat="server" Text="-" CommandName="Decrease" CommandArgument='<%# 
                                Container.DataItemIndex %>' OnCommand="AdjustQuantity_Command" CssClass="button-sl"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Gia" HeaderText="Đơn giá" SortExpression="SoLuong" 
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" DataFormatString="{0:N0}"/>
                    <asp:TemplateField HeaderText="Thành tiền" ItemStyle-Width="150px" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None">
                        <ItemTemplate>
                            <%# String.Format("{0:N0} đồng", Convert.ToDecimal(Eval("Gia")) * Convert.ToInt32(Eval("SoLuong"))) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" DeleteText="Xóa" 
                        ControlStyle-BorderStyle="None" ControlStyle-ForeColor="#f80000"/>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblEmptyCart" runat="server" CssClass="thongbaogiohang"></asp:Label>
            <br />
             <asp:Label ID="lblTongThanhToan" runat="server" Text="Tổng tiền:" CssClass="label-tong"></asp:Label>
             <asp:TextBox ID="txtTongThanhToan" runat="server" CssClass="txtTT" ReadOnly="true"></asp:TextBox>
             <br />
             <br />
             <asp:Button ID="btnMuaHang" runat="server" Text="THANH TOÁN" OnClick="btnMuaHang_Click" CssClass="buttonmh"/>
        </div>
             </div>
</asp:Content>
