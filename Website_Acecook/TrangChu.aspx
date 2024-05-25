<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Main.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="Website_Acecook.TrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" 
       integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
       crossorigin="anonymous" referrerpolicy="no-referrer" />
   <style>
        .img-container {
            position: relative; /* Ensure positioning context */
            display: inline-block; /* Ensure inline display */
            text-align:center;
        }

        .img-container img {
            margin-top: 10px;
            display: block; /* Ensure the image is displayed as a block element */
            width:1505px;
        }

        .social-icons {
            position: absolute;
            bottom: 10px;
            right: 10px; /* Adjusted to place icons at the bottom right corner */
            display: flex;
            flex-direction: column; /* Display icons vertically */
            align-items: flex-end; /* Align icons to the right */
            transform: translateY(-70%); /* Dịch chuyển lên trên 50% chiều cao của social-icons để căn giữa */
        }

        .social-icon {
            margin-right: 10px;
            border: 2px solid #fff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center; /* Đảm bảo biểu tượng nằm ở giữa theo chiều dọc */
            margin-bottom:10px;
        }

        .social-icon span {
            display: inline-block;
            vertical-align: middle; /* Đảm bảo biểu tượng nằm ở giữa theo chiều ngang */
        }

       
    </style>

    <div class="img-container">
        <img src="https://acecookvietnam.vn/wp-content/uploads/2017/08/TaoQuan-Banner-1440x550.png"/>
        <div class="social-icons">
            <div class="social-icon">
                <span>
                    <i class="fa-brands fa-facebook-f fa-beat fa-lg" style="color: #2f579d;"></i>
                </span>
            </div>

            <div class="social-icon">
                <span>
                    <i class="fa-brands fa-youtube fa-beat fa-lg" style="color: #d73747;"></i>
                </span>
            </div>

            <div class="social-icon">
                <span>
                    <i class="fa-brands fa-instagram fa-beat fa-lg" style="color: #d7428a;"></i>
                </span>
            </div>

             <div class="social-icon">
                <span>
                   <i class="fa-brands fa-tiktok fa-beat fa-lg" style="color: #1a1c1e;"></i>
                </span>
            </div>
        </div>
    </div>
</asp:Content>
