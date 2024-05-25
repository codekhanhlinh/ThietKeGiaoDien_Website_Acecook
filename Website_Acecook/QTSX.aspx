<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Main.Master" AutoEventWireup="true" CodeBehind="QTSX.aspx.cs" Inherits="Website_Acecook.QTSX" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .video-container {
            position: relative; /* Đặt vị trí tương đối để hình ảnh nền có thể được đặt bên dưới */
            width: 100%;  /*Chiều rộng của video container sẽ chiếm toàn bộ chiều rộng của màn hình */
            height: 100vh;  /*Chiều cao của video container sẽ chiếm toàn bộ chiều cao của màn hình */
            overflow: hidden; /* Ẩn phần của hình ảnh nền sẽ vượt ra ngoài phần tử container */
            display: flex;
            justify-content: center; /* Căn giữa ngang */
            align-items: center; /* Căn giữa dọc */
            margin-bottom:10px;
        }

        .background-image {
            position: absolute; /* Đặt vị trí tuyệt đối để hình ảnh nền có thể nằm dưới video */
            top: 0; /* Đặt vị trí top ở góc trên cùng bên trái */
            left: 0; /* Đặt vị trí left ở góc trên cùng bên trái */
            width: 100%; /* Chiều rộng của hình ảnh nền sẽ chiếm toàn bộ chiều rộng của container */
            height: 100%; /* Chiều cao của hình ảnh nền sẽ chiếm toàn bộ chiều cao của container */
            object-fit: cover; /* Hình ảnh sẽ được tự động điều chỉnh kích thước để phù hợp với container */
            z-index: -1; /* Đặt z-index để đảm bảo hình ảnh nền nằm dưới video */
        }

        .video {
            width: 100%; /* Chiều rộng của video */
            height: 100%; /* Chiều cao của video */
        }
    </style>
    <h2 style="font-family: Bahnschrift SemiBold; color: #f80000; margin-bottom:15px">QUY TRÌNH SẢN XUẤT MÌ ĂN LIỀN ACECOOK VIETNAM</h2>
    <div class="video-container">
         <img class="background-image" src="https://acecookvietnam.vn/wp-content/uploads/2017/07/banner-gioithieu.png" alt="Background Image">
        <iframe width="1230" height="600" src="https://www.youtube.com/embed/D0Gq0IxoX54?si=darlrApSY211pAqN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; 
            picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
</asp:Content>
