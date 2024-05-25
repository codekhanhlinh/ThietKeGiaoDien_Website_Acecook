<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MuaHang_TruocDK,DN.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="Website_Acecook.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .child-img {
            max-height: 30px;
            margin-left:70px;
        }

        .thongtinkh{
            font-family:Bahnschrift SemiBold;
          
        }

        p{
            color: #f80000;
        }

        .txtTT{
            border: solid 2px;
            border-color:#f80000;
            width:500px;
            height:30px;
        }
        
        .dathangTT{
            border:none;
            font-family:Bahnschrift SemiBold;
            font-size:20px;
            width:200px;
            background-color:#f80000;
            color:white;
        }
    </style>
    <table style="width:500px; float:left">
        <tr>
            <td>
                 <div class="thongtinkh">
                    <div>
                        <p style="font-size:25px; margin-top:20px;">THÔNG TIN GIAO HÀNG</p>
                            <div style="text-align:left;">
                                <div>
                                Họ và tên:<br />
                                    <input type="text" class="txtTT" placeholder="Vui lòng nhập họ và tên...">
                                </div>
                                <br />
                                <div>
                                Số điện thoại:<br />
                                    <input type="text" class="txtTT" placeholder="Vui lòng nhập số điện thoại...">
                                </div>
                                <div>
                                Email:<br />
                                    <input type="text" class="txtTT" placeholder="Vui lòng email...">
                                </div>
                                <div>
                                Địa chỉ nhận hàng:<br />
                                     <input type="text" class="txtTT" placeholder="Vui lòng nhập địa chỉ...">
                                </div>
                                 Ghi chú: <br />
                                <asp:TextBox ID="txtGhiChu" runat="server" CssClass="txtTT" Width="500px" Height="40px"></asp:TextBox>              
                
             
                                <br />
                
             
                    Phương thức thanh toán: <br />
                    <div style="height:500px">
                        <table style="width:500px; float:left">
                        <tr>
                            <td>
                                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="auto-style1" BorderWidth="0" Height="300px" AutoPostBack="true" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged">
                                        <asp:ListItem Value="COD">
                                            <img src="https://hstatic.net/0/0/global/design/seller/image/payment/cod.svg?v=6" alt="cod" style="width: 35px; height: 35px; vertical-align: middle;" />
                                            <span style="font-family: Bahnschrift; font-size: 15px; color: #000000; margin-left: 5px;">Thanh toán khi giao hàng (COD)</span>
                                        </asp:ListItem>
                                        <asp:ListItem Value="BANK">
                                            <img src="/Icons/bank-transfer-47.png" alt="bank" style="width: 35px; height: 35px; vertical-align: middle;" />
                                            <span style="font-family: Bahnschrift; font-size: 15px; color: #000000; margin-left: 5px;">Chuyển khoản qua ngân hàng</span>
                                        </asp:ListItem>
                                        <asp:ListItem Value="ONEPAY-ATM">
                                            <img src="https://hstatic.net/0/0/global/design/seller/image/payment/onepay.svg?v=6" 
                                                alt="card" style="width: 35px; height: 35px; vertical-align: middle;" />
                                            <span style="font-family: Bahnschrift; font-size: 15px; color: #000000; margin-left: 5px;">
                                                Thẻ ATM nội địa qua cổng OnePay</span><br />
                                            <img class="child-img" src="https://hstatic.net/0/0/global/design/seller/image/payment/type_atm.svg?v=6">
                                        </asp:ListItem>
                                        <asp:ListItem  Value="ONEPAYS">
                                            <img src="https://hstatic.net/0/0/global/design/seller/image/payment/onepay.svg?v=6" 
                                                alt="card" style="width: 35px; height: 35px; vertical-align: middle;" />
                                            <span style="font-family: Bahnschrift; font-size: 15px; color: #000000; margin-left: 5px;">
                                                Thẻ Visa/Master/JCB/Amex/CUP qua cổng OnePay
                                            </span> 
                                            <br />
                                            <img class="child-img" src="https://hstatic.net/0/0/global/design/seller/image/payment/visa_master_jcb_amex_cup.svg?v=6">
                                        </asp:ListItem>
                                        <asp:ListItem  Value="MOMO">
                                            <img src="/Icons/bank-transfer-47.png"  
                                                alt="card" style="width: 35px; height: 35px; vertical-align: middle;" />
                                            <span style="font-family: Bahnschrift; font-size: 15px; color: #000000; margin-left: 5px;">
                                                Ví điện tử: MoMo
                                            </span> 
                                            <br />
                                            <img class="child-img" src="Icons/momo.png" />
                                        </asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                        </tr>
                        </table>
               
                    </div>
              
   
                </div>
                </div>
            </div>
            </td>
        </tr>
    </table>
     <div style="font-family:Bahnschrift; text-align:center; width:800px; float:right;">
                   <h2 style="font-family:Bahnschrift; font-size:20px">Thông tin sản phẩm</h2>
                   <asp:GridView ID="GridViewDonDatHang" runat="server" AutoGenerateColumns="False" CssClass="grid">
                        <Columns>
                            <asp:TemplateField ItemStyle-BorderStyle="None">
                                <ItemTemplate>
                                    <asp:Image ID="imgHinh" runat="server" ImageUrl='<%# Eval("Hinh") %>' Height="120" Width="120" CssClass="hinh" />
                                </ItemTemplate>
                                <HeaderStyle ForeColor="Black" BorderStyle="None" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenSanPham" HeaderText="Sản Phẩm" SortExpression="TenSanPham" ItemStyle-BorderStyle="None" ItemStyle-Width="300px">
                                <HeaderStyle ForeColor="White" BorderStyle="None" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" ItemStyle-BorderStyle="None" ItemStyle-Width="50px">
                                <HeaderStyle ForeColor="White" BorderStyle="None" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gia" HeaderText="Đơn Giá" DataFormatString="{0:N0}" ItemStyle-BorderStyle="None" ItemStyle-Width="100px">
                                <HeaderStyle ForeColor="White" BorderStyle="None" />
                            </asp:BoundField>
                            <asp:TemplateField  ItemStyle-Width="100px" ItemStyle-BorderStyle="None">
                                <ItemTemplate>
                                    <%# (Convert.ToDecimal(Eval("Gia")) * Convert.ToInt32(Eval("SoLuong"))).ToString("N0") %>
                                </ItemTemplate>
                                <HeaderStyle  ForeColor="White" BorderStyle="None" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                <br />
                <div style="text-align:left; font-family:Bahnschrift; color:#f80000">
                    Tổng tiền thanh toán: <asp:Label ID="lblTotalAmount" runat="server" ForeColor="Black"></asp:Label>
                </div>
                 <div style="text-align:center; margin-top:20px;">
                     <asp:Button ID="btnDatHangTT" runat="server" Text="ĐẶT HÀNG" CssClass="dathangTT" OnClick="btnDatHangTT_Click" />
                 </div>
            </div>
    
</asp:Content>
