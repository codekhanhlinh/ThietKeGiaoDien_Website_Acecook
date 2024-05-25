<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Main.Master" AutoEventWireup="true" CodeBehind="CHTG.aspx.cs" Inherits="Website_Acecook.CHTG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    /* Ẩn tất cả các phần tử span */
    span {
      display: none;
      margin-left:45px;
      font-family:Bahnschrift SemiBold;
      font-size:15px;
      color:#f80000;
    }
    ul{
         margin-left:45px;
    }
   /* .sp{
        margin-top:10px;
        margin-bottom:15px;
    }
*/
        .content button{
            text-align:left;
            width:550px;
        }

        .content .buttons button:hover {
            text-decoration-color: #f80000;
        }

        .content p{
            font-family:Bahnschrift SemiBold;
            font-size:15px;
            margin-left:0;
        }
        .content img{
            vertical-align:middle;
        }

    .buttons{
        margin-top:10px;
        vertical-align:middle;
    }
  </style>
    <div class="content">
    <div>
        <p style="font-size:25px; margin-left:30px; color:#f80000;">CÁC CÂU HỎI THƯỜNG GẶP</p>
    </div>
    <div>
       <div class="buttons">
           <button onclick="showDeliveryTime()">
            <p>
                <img src="Icons/question-25.png" />Thời gian giao hàng dự kiến là bao lâu ?</p>
           </button>
       </div>
        <div>
           <span id="deliveryTime">
                Từ 2-3 ngày.
           </span>
        </div>
    </div>

    <div>
        <div class="buttons">
            <button onclick="showDelivery()">
            <p>
                <img src="Icons/question-25.png" />Phí vận chuyển là bao nhiêu ?</p>
            </button>
        </div>
        <div>
            <span id="delivery">
            Phụ thuộc vào khối lượng và khoảng cách vận chuyển.
            </span>
        </div>
    </div>

    <div>
        <div class="buttons">
            <button onclick="showComparenoodles()">
            <p>
                <img src="Icons/question-25.png" />Mì chiên và mì không chiên khác nhau như thế nào ?</p>
            </button>
        </div>
        <div>
            <span id="comparenoodles">
                <img src="Icons/So-sanh-mi.png" style="height:400px; width:350px"/>
            </span>
        </div>
    </div>

    <div>
        <div class="buttons">
            <button onclick="showNote()">
            <p>
                <img src="Icons/question-25.png" />Khi mua mì ăn liền thì lưu ý những gì ?</p>
            </button>
        </div>
        <div>
            <span id="note">
               <p>Một số lưu ý khi mua mì ăn liền: </p>
                <ul>
                    <li>
                        Chọn các sản phẩm có bao bì nguyên vẹn, không bị rách, hỏng và vẫn giữ nguyên độ phồng.
                    </li>

                    <li>
                        Hãy kiểm tra ngày sản xuất và hạn sử dụng được in trên bao bì.
                    </li>
                </ul>
            </span>
        </div>
    </div>

    <div>
        <div class="buttons">
            <button onclick="showQuestion1()">
            <p>
                <img src="Icons/question-25.png" />Mì ăn liền có gây ung thư ?</p>
            </button>
        </div>
        <div>
            <span id="question1">
                <p>Mì ăn liền ra đời tại Nhật Bản và cũng được coi là phát minh vĩ đại của thế kỷ 20, đã trải qua hơn 60 năm tồn tại và phát triển, trở thành một thực phẩm phổ biến với người dân trên toàn cầu. Qua thời gian, công nghệ sản xuất mì ăn liền được cải tiến ngày một hiện đại và kiểm soát chặt chẽ các tiêu chuẩn vệ sinh an toàn thực phẩm. Bên cạnh đó, các thành phần chính và hàm lượng các chất phụ gia thực phẩm sử dụng trong mì ăn liền đều phải tuân thủ theo quy định và quản lý của của cơ quan Nhà nước có thẩm quyền.
Trên thế giới chưa từng ghi nhận một kết quả nghiên cứu khoa học nào đủ tin cậy để khẳng định mì ăn liền gây ung thư hay có thể gây hại cho sức khỏe.</p>
            </span>
        </div>
    </div>

    <div>
        <div class="buttons">
            <button onclick="showQuestion2()">
            <p>
                <img src="Icons/question-25.png" />Mì ăn liền có chứa nhiều Transfat, dễ gây ra các bệnh về tim mạch không ?</p>
            </button>
        </div>
        <div>
            <span id="question2">
                <p>
                    Tổ chức Y tế Thế giới (WHO) khuyến cáo, tiêu thụ Trans fat nên dưới 1% tổng năng lượng một ngày để phòng bệnh tim mạch. Nếu nhu cầu năng lượng trung bình của người trưởng thành là 2,000 kcal/ngày thì lượng Trans fat nên dưới 20 kcal (~2g).
Tại cửa hàng chúng tôi, chúng tôi thực hiện kiểm soát Trans fat từ khâu nhập dầu nguyên liệu và hạn chế tối đa việc phát sinh Trans fat trong quá trình sản xuất mì ăn liền. Kết quả phân tích Trans fat trong các sản phẩm mì ăn liền của cửa hàng chúng tôi rất thấp, chỉ dưới 0,04g/khẩu phần. Theo quy định của FDA (Cục quản lý thực phẩm và dược phẩm Hoa Kỳ), 
                    nếu sản phẩm có chứa dưới 0,5g Trans fat / khẩu phần ăn thì được phép công bố “0 gam Trans fat”.
                </p>
            </span>
        </div>
    </div>

    <div>
        <div class="buttons">
            <button onclick="showQuestion3()">
            <p>
                <img src="Icons/question-25.png" />Mỗi ngày nền ăn tối đa bao nhiêu gói mì ?</p>
            </button>
        </div>
        <div>
            <span id="question3">
                <p>
                   2-3 gói
                </p>
            </span>
        </div>
    </div>

    <div>
        <div class="buttons">
            <button onclick="showQuestion4()">
            <p>
                <img src="Icons/question-25.png" />Bao bì ly/ tô/ khay nhựa chứa thực phẩm ăn liền có an toàn không ?</p>
            </button>
        </div>
        <div>
            <span id="question4">
                <p>
                   Bao bì ly / tô / khay nhựa chứa mì ăn liền của cửa hàng là loại chuyên dụng dùng cho thực phẩm và được cung ứng từ các đối tác uy tín, đạt chứng nhận an toàn trong thực phẩm.

                </p>
                <p>
                    Bao bì được kiểm soát chất lượng tuân thủ theo “Quy chuẩn kỹ thuật quốc gia về an toàn vệ sinh đối với bao bì, dụng cụ bằng nhựa tổng hợp tiếp xúc trực tiếp thực phẩm QCVN 12-1: 2011/BYT” và 
                    Quy định Cộng đồng chung Châu Âu (Regulation EU No10/2011).
                </p>
            </span>
        </div>
    </div>
    </div>
    <script>
        // Biến trạng thái để kiểm tra span đã được hiển thị hay chưa
        var deliveryTimeShown = false;
        var deliveryShown = false;

        function showDeliveryTime() {
            var deliveryTimeSpan = document.getElementById("deliveryTime");
            if (!deliveryTimeShown) {
                deliveryTimeSpan.style.display = "inline";
                deliveryTimeShown = true;
            } else {
                deliveryTimeSpan.style.display = "none";
                deliveryTimeShown = false;
            }
        }

        function showDelivery() {
            var deliverySpan = document.getElementById("delivery");
            if (!deliveryShown) {
                deliverySpan.style.display = "inline";
                deliveryShown = true;
            } else {
                deliverySpan.style.display = "none";
                deliveryShown = false;
            }
        }

        function showComparenoodles(){
            var deliverySpan = document.getElementById("comparenoodles");
            if (!deliveryShown) {
                deliverySpan.style.display = "inline";
                deliveryShown = true;
            } else {
                deliverySpan.style.display = "none";
                deliveryShown = false;
            }
        }


        function showNote() {
            var deliverySpan = document.getElementById("note");
            if (!deliveryShown) {
                deliverySpan.style.display = "inline";
                deliveryShown = true;
            } else {
                deliverySpan.style.display = "none";
                deliveryShown = false;
            }
        }


        function showQuestion1() {
            var deliverySpan = document.getElementById("question1");
            if (!deliveryShown) {
                deliverySpan.style.display = "inline";
                deliveryShown = true;
            } else {
                deliverySpan.style.display = "none";
                deliveryShown = false;
            }
        }
    </script>
</asp:Content>
