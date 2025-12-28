# 💡 Light Meter (Auto Dark Mode)

Ứng dụng đo cường độ ánh sáng môi trường (Lux) và tự động thay đổi giao diện (Sáng/Tối) để bảo vệ mắt người dùng.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Sensor](https://img.shields.io/badge/Sensor-Light-orange?style=for-the-badge)


## ✨ Tính năng chính

* **Đo độ sáng Real-time:** Hiển thị chỉ số Lux chính xác từ cảm biến quang học.
* **Tự động chuyển Theme:** * Nếu `Lux < 50`: Chuyển sang **Dark Mode** (Nền tối, chữ trắng).
    * Nếu `Lux >= 50`: Chuyển sang **Light Mode** (Nền sáng, chữ đen).
* **Phân loại môi trường:** Hiển thị trạng thái (Tối om, Đèn ngủ, Ngoài trời...).

## 🛠 Thư viện & Kỹ thuật

* **Package:** `light` (Phiên bản mới nhất).
* **Stream Subscription:** Lắng nghe luồng dữ liệu liên tục từ cảm biến để cập nhật UI tức thì (`setState`).

## 🚀 Cách chạy ứng dụng

1.  **Clone dự án & Cài đặt:**
    ```bash
    flutter pub get
    ```
2.  **Chạy ứng dụng:**
    ```bash
    flutter run
    ```

## 🧪 Hướng dẫn Test trên Máy Ảo (Emulator)

Vì Laptop không có cảm biến ánh sáng, bạn cần giả lập:
1.  Chạy App trên Android Emulator.
2.  Mở **Extended Controls** (...) -> Chọn **Virtual Sensors**.
3.  Chọn tab **Light**.
4.  Kéo thanh trượt **Lux**:
    * Kéo về **0**: App chuyển màu đen.
    * Kéo lên cao (**1000+**): App chuyển màu trắng sáng.

## 👨‍💻 Tác giả
* **Họ và tên:** Lê Mạnh Hùng Anh
* **Dự án:** Bài tập thực hành cảm biến Flutter
