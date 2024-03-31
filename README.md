# 1. Payment

## 1.1 VNPAY - Thông tin tích hợp cho Merchant Cổng TT VNPAY

### Thông tin cấu hình

- Terminal ID / Mã Website (vnp_TmnCode): `SH6LPNPH`
- Secret Key / Chuỗi bí mật tạo checksum (vnp_HashSecret): `ONVKCQFGVETIWZGWSQRWHKGAUGSBVBWP`
- Url thanh toán môi trường TEST (vnp_Url): `https://sandbox.vnpayment.vn/paymentv2/vpcpay.html`

### Thông tin truy cập Merchant Admin để quản lý giao dịch

- Địa chỉ: https://sandbox.vnpayment.vn/merchantv2/
- Tên đăng nhập: `lop9a1bs2@gmail.com`
- Mật khẩu: `Huynhanhvu856169`

### Kiểm tra (test case) – IPN URL

- Kịch bản test (SIT): https://sandbox.vnpayment.vn/vnpaygw-sit-testing/user/login
- Tên đăng nhập: `lop9a1bs2@gmail.com`
- Mật khẩu: `Huynhanhvu856169`

### Tài liệu

- Tài liệu hướng dẫn tích hợp: https://sandbox.vnpayment.vn/apis/docs/gioi-thieu, https://sandbox.vnpayment.vn/apis/docs/thanh-toan-pay/pay.html
- Code demo tích hợp: https://sandbox.vnpayment.vn/apis/vnpay-demo/code-demo-tích-hợp

### Thẻ test

| Field          |        Value        |
| -------------- | :-----------------: |
| Ngân hàng      |         NCB         |
| Số thẻ         | 9704198526191432198 |
| Tên chủ thẻ    |    NGUYEN VAN A     |
| Ngày phát hành |        07/15        |
| Mật khẩu OTP   |       123456        |