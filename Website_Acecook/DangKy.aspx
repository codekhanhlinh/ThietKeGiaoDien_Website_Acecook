<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MuaHang_TruocDK,DN.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="Website_Acecook.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .table-dk{
            width:800px;
            height:500px;
            margin-left: auto;
            margin-right: auto;
        }

        .Text-DK{
             font-family: Bahnschrift SemiBold;
             font-size:30px;
        }

        .panel-text-dk{
            margin-top:0;
            text-align:center;
            border-bottom:solid 2px;
        }

        .frame-input{
            width: 300px;
            margin-top:20px;
            padding: 10px;
            font-family: Bahnschrift SemiBold;
            font-size: 18px;
            border:solid 1px;
            outline: none; /* Loại bỏ khung đen */
            border-radius: 20px;
        }

        input.frame-input{
            width:400px;
        }

        .frames-signup{
          margin-left:250px;
          margin-right:250px;
        }


        .lable-gt{
            font-family: Bahnschrift SemiBold;
            font-size: 18px;
            margin-top: 15px;
        }

        .btn-dk{
            font-family: Bahnschrift SemiBold;
            font-size: 20px;
            cursor:pointer;
            background-color: #f80000;
            border:none;
            color:white;
            border-radius:5px;
            vertical-align:middle;
            height:40px;
        }

        .table-gg-fb button{
            font-family: Bahnschrift SemiBold;
            font-size: 18px;
            width:200px;
            height:30px;
            border:none;
            color: white;
            cursor:pointer;
        }

        .btn-gg{
            background-color:#c71610;
        }

        .btn-fb{
            background-color:#1877F2;
            margin-left:5px;
        }

        p{
            font-family: Bahnschrift SemiBold;
            font-size: 17px;
        }

        a{
            text-decoration:none;
            color:#0A66C2
        }
    </style>
    <table class="table-dk">
        <tr>
            <td>
                <div class="frames-signup">
                    <asp:Panel ID="Panel1" runat="server" Height="40px" CssClass="panel-text-dk">
                        <strong>
                            <asp:Label ID="Label1" runat="server" CssClass="Text-DK" Text="ĐĂNG KÝ"></asp:Label>
                        </strong>
                    </asp:Panel>
                    <div>
                        <input type="text" class="frame-input" placeholder="Họ và tên">
                    </div>
                    <div class="lable-gt">
                        <label>
                          <input type="radio" name="gender" value="male">
                          Nam
                        </label>
                        <label>
                          <input type="radio" name="gender" value="female">
                          Nữ
                        </label>
                    </div>
                    <div>
                        <input type="text" class="frame-input" placeholder="dd/mm/yyyy">
                    </div>
                    <div>
                        <input type="text" class="frame-input" placeholder="Email">
                    </div>
                    <div>
                        <input type="text" class="frame-input" placeholder="Mật khẩu">
                    </div>
                    <table class="text-dn">
                        <tr>
                            <td>
                                <button class="btn-dk">
                                    Đăng ký
                                </button>
                            </td>
                            <td>
                                <p>Bạn đã có tài khoản ?</p>
                            </td>
                            <td>
                                <p>
                                    <a href="DangNhap.aspx">
                                        Đăng nhập ngay
                                    </a>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <p>Hoặc đăng nhập bằng:</p>
                        <table class="table-gg-fb">
                            <tr>
                                <td>
                                    <button class="btn-gg">
                                        Đăng nhập Google
                                    </button>
                                </td>
                                <td>
                                    <button class="btn-fb">
                                        Đăng nhập Facebook
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
