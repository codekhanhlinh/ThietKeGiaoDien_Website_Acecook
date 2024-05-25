<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/SanPham_trcDN.Master" AutoEventWireup="true" CodeBehind="SanPham_trcDN.aspx.cs" Inherits="Website_Acecook.SanPham_trcDN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
         integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
         crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .item{
            padding-right:25px;
           /* margin-right: 25px; */
            margin-left: 30px;
            font-family:Bahnschrift SemiBold; 
            font-size:15px;
            text-align:center;
            margin-top:20px;
        }
        .price-label{
            border:1px none;
            padding:5px;
            background-color:#fdb9b9;
        }

        .auto-style4 {
            text-align: center;
        }

        .themgiohang{
            border:none; 
            background:none;
            
        }

        .imageInButton {
            text-align:center;
        }

        .add-to-cart{
            
            width:auto;
            height:auto;
        }

        .border-add-to-cart{
            border:solid 1px;
            border-color:#f80000;
            border-radius:20px;
            width:auto;
            height:auto;
        }

        .discount-circle {
            position: absolute;
            top: 10px;
            left: 10px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: red;
            color: white;
            text-align: center;
            line-height: 50px;
            font-size: 14px;
            font-weight: bold;
            z-index: 10;
        }
        
    </style>
    <div>
        <table style="width: 800px">
                <tr>
                    <td style="width:2px; background-color:#f80000"></td>
                    <td class="auto-style4">
                        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E9FFCA" BorderStyle="None" 
                            BorderWidth="1px" CellPadding="4" DataKeyField="MaSP" RepeatColumns="3" Width="700px" DataKeyNames="MaSP"
                            CellSpacing="2">
                            <ItemTemplate>
                                <div class="item" <%--style="text-align:center"--%>>
                                    <asp:Literal ID="litDiscount" runat="server" Text='<%# GetDiscountHtml(Eval("Discount")) %>'></asp:Literal>
                                    <asp:ImageButton ID="imgBtnChiTiet" runat="server" ImageUrl='<%# Eval("Hinh") %>' Height="305px" Width="305px"
                                        OnCommand="imgBtnChiTiet_Command" CommandArgument='<%# Eval("MaSP") %>' CommandName="ViewDetails" />
                                    <asp:Label ID="TenSanPham" runat="server" Text='<%# Eval("TenSP") %>' Height="50px" Width="250px"/>
                                    <br />
                                    <asp:Label ID="GiaLabel" CssClass="price-label" runat="server" 
                                        Text='<%# String.Format("{0:N0} đ", Eval("DonGia")) %>'></asp:Label>
                                    <br />
                                    <br />
                                     <!-- Hiển thị icon sao đánh giá -->
                                    <div>
                                        <asp:Literal ID="litRatingStars" runat="server" Text='<%# GetRatingStarsHtml(Eval("Rating")) %>'></asp:Literal>
                                    </div>
                                    <br />
                                    <div class="border-add-to-cart">
                                      <asp:ImageButton ID="btnThemGioHang" runat="server" CssClass="add-to-cart" OnCommand="btnThemGioHang_Command" 
                                        CommandArgument='<%# Eval("MaSP") %>' CommandName="AddToCart" ImageUrl="/Icons/basket-32.png" 
                                        AlternateText="Add to Cart"/>
                                    </div>
                                </div>  
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        </asp:DataList>
                    </td>
                    <td style="width:2px; background-color:#f80000"></td>
                </tr>
        </table> 
    </div>
</asp:Content>
