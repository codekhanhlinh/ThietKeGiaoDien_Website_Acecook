<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MuaHang_TruocDK,DN.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Website_Acecook.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
         .table-dn{
            width:800px;
            height:500px;
            margin-left: auto;
            margin-right: auto;
        }

        .Text-DN{
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

        .frames-login{
          margin-left:250px;
          margin-right:250px;
        }


        .btn-dn{
            font-family: Bahnschrift SemiBold;
            font-size: 17px;
            cursor:pointer;
            background-color: #f80000;
            border:none;
            color:white;
            border-radius:5px;
            vertical-align:middle;
            height:40px;
            width:100px;
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
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script>
        function onSubmit(token) {
            document.getElementById("btnLogin").click();
        }

        document.getElementById("btnLogin").addEventListener("click", function (event) {
            grecaptcha.execute();
        });
    </script>
    <table class="table-dn">
        <tr>
            <td>
                <div class="frames-login">
                    <asp:Panel ID="Panel1" runat="server" Height="40px" CssClass="panel-text-dk">
                        <strong>
                            <asp:Label ID="Label1" runat="server" CssClass="Text-DN" Text="ĐĂNG NHẬP"></asp:Label>
                        </strong>
                    </asp:Panel>
                    <div>
                        <input type="text" class="frame-input" placeholder="Email của bạn">
                    </div>
                    <div>
                        <input type="text" class="frame-input" placeholder="Mật khẩu">
                    </div>
                    <table class="text-dn">
                        <tr>
                            <td>
                                <button id="btnLogin" class="btn-dn" runat="server">
                                    Đăng nhập
                                </button>
                            </td>
                            <td>
                                <p>Bạn chưa có tài khoản ?</p>
                                <p>Bạn quên mật khẩu ?</p>
                            </td>
                            <td>
                                <p><a href="DangKy.aspx">Đăng ký</a></p>
                                <p style="color:#0A66C2">Quên mật khẩu</p>
                            </td>
                        </tr>
                    </table>
                     <div class="g-recaptcha" data-sitekey="6LeyZYEpAAAAAJHg9a2492oaJi3BTr5Sd2J5RZFK" 
                         data-callback="onSubmit" data-action="submit"></div>
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
