<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/Main.Master" AutoEventWireup="true" CodeBehind="TTGiaoNhan.aspx.cs" Inherits="Website_Acecook.TTGiaoNhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .content h1{
            font-family:Bahnschrift SemiBold;
        }

        .content h2{
            font-family:Bahnschrift SemiBold;
            text-align:justify;
        }

        .content ul{
            font-family: Bahnschrift Light;
            font-size:18px;
            text-align:justify;
        }

        .content ol{
            font-family: Bahnschrift Light;
            font-size:18px;
        }

        .content p{
            font-family: Bahnschrift Light;
            font-size:18px;
            margin-left:20px;
            text-align:justify;
        }
    
    </style>
<div class="content">
    <h1>THÔNG TIN GIAO NHẬN HÀNG</h1>

  <h2>1. THỜI GIAN GIAO HÀNG DỰ KIẾN</h2>
  <ul>
    <li><strong>Khu vực giao hàng:</strong> Thành phố Hồ Chí Minh.</li>
    <li><strong>Thời gian giao hàng:</strong> Từ 2-3 ngày</li>
    <li><strong>Khung giờ giao hàng:</strong> Khung giờ giao hàng của các đơn vị vận chuyển sẽ 
        bắt đầu từ 08:00 đến 20:00 tối (tùy thuộc vào giờ làm việc từng đơn vị vận chuyển).</li>
    <li><strong>Phương thức giao hàng:</strong> Giao hàng đến địa chỉ người dùng yêu cầu.</li>
  </ul>

  <h2>2. PHÍ VẬN CHUYỂN</h2>
  <ul>
    <li><strong>Freeship:</strong> Cho đơn hàng có giá trị trước khuyến mãi từ 300.000 đồng.</li>
    <li><strong>Phí vận chuyển:</strong> Phụ thuộc vào khối lượng và khoảng cách vận chuyển.</li>
  </ul>

  <h2>3. HỦY ĐƠN HÀNG</h2>
  <p>Acecook sẽ cố gắng xử lý tất đơn hàng trong vòng <strong>24h </strong>kể từ khi Quý khách đặt hàng.</p>
  <p>Đơn hàng chỉ có thể hủy khi ở trạng thái <strong> Đợi xử lý & Đang xử lý </strong>. Khi đơn hàng chuyển sang trạng thái 
     <strong> Đã giao nhà vận chuyển </strong> trở đi, chúng tôi không thể hủy đơn hàng.</p>
  <p>Để hủy Đơn hàng, Quý khách vui lòng thông báo qua:</p>
  <p><strong>Email:</strong> acecookvn@acecookvietnam.com</p>
  <p><strong>Hotline: 033 222 8146 &nbsp;&nbsp; 091 228 5207 </strong>(07:30 – 16:20)</p>

  <h2>4. XÁC NHẬN ĐƠN HÀNG</h2>
    <ul>
        <li><strong>Xác nhận qua điện thoại:</strong>chỉ áp dụng cho các đơn hàng chưa có đủ thông tin giao hàng cần thiết hoặc khách hàng có ghi chú yêu cầu này.</li>
        <li><strong>Xác nhận qua tin nhắn SMS hoặc Email:</strong>áp dụng cho tất cả đơn hàng có đầy đủ thông tin giao hàng.</li>
    </ul>
    <p><strong>Lưu ý:</strong> email xác nhận đơn hàng có thể nằm trong hộp thư rác, Quý khách vui lòng tìm kiếm “Acecookeshop” trong thanh tìm kiếm 
    của hộp thư khi không nhận được email xác nhận.</p>
    <p><strong>Đơn hàng sẽ tự động hủy nếu:</strong></p>
    <ul>
        <li>Nhân viên tổng đài của AcecookEshop không liên lạc được với khách hàng để xác nhận thông tin đơn hàng.</li>
        <li>Nhân viên giao hàng hoặc nhân viên của Acecook không liên lạc được với Khách hàng tại thời điểm giao hàng (tối đa 3 cuộc gọi và mỗi lần cách nhau 10 phút).</li>
    </ul>

  <h2>5. QUY TRÌNH GIAO NHẬN HÀNG</h2>

  <h2>Quy định gửi hàng</h2>
  <p>Acecook cam kết hàng hóa nguyên đai, nguyên kiện và mới 100%. Tuy nhiên, trong quá trình vận chuyển có thể phát sinh các rủi ro, bể vỡ ngoài ý muốn. Quý khách hàng cần thực hiện các bước sau khi nhận hàng:</p>
  <ol>
    <li>Mở gói hàng và đối chiếu hàng hóa với hoá đơn tính tiền.</li>
    <li>Kiểm tra sản phẩm thực tế có đúng với sản phẩm mà Khách hàng đã đặt mua hay không.</li>
    <li>Kiểm tra bao bì và sản phẩm có bị hư hại do quá trình vận chuyển hay không.</li>
  </ol>
  <p>Nếu không hài lòng với bất kỳ điều nào trong 3 điều trên, Khách hàng có thể yêu cầu Nhân viên giao hàng xác nhận và trả lại hàng.</p>
  <p>Trong trường hợp sản phẩm bị hư hại/gãy/bể quá 50%, và quý khách đã thanh toán online thành công, AcecookEshop sẽ giao lại kiện hàng mới gồm những sản phẩm đúng như đơn đặt hàng trong 10 ngày làm việc.</p>
  <p>AcecookEshop sẽ không chịu trách nhiệm giải quyết khiếu nại về việc thiếu hàng hoặc giao sai hàng sau khi Khách hàng đã ký nhận và thanh toán.</p>

  <h2>Quy định thanh toán</h2>
  <ul>
    <li>Khách hàng chọn hình thức COD "Thanh toán trực tiếp khi nhận hàng" thì thanh toán trực tiếp cho nhân viên giao hàng ngay sau khi nhận hàng.</li>
    <li>Với các hình thức thanh toán Online khác như thanh toán qua thẻ (ATM, thẻ quốc tế Visa/ Master/ JCB...) hoặc qua cổng VNPAY QR code, chuyển khoản, khách hàng chỉ nhận hàng và ký nhận với nhân viên giao hàng.</li>
    <li>Với các đơn hàng đã thanh toán Online, nếu có phát sinh chi phí giao hàng thì khách hàng sẽ thanh toán trực tiếp khoản phí này cho nhân viên giao nhận.</li>
  </ul>
</div>
</asp:Content>
