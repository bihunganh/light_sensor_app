import 'dart:async';
import 'package:flutter/material.dart';
import 'package:light/light.dart'; // Import thư viện mới tên là 'light'

class LightMeter extends StatefulWidget {
  const LightMeter({super.key});

  @override
  State<LightMeter> createState() => _LightMeterState();
}

class _LightMeterState extends State<LightMeter> {
  int _luxValue = 0;
  StreamSubscription? _subscription;
  String _status = "Đang chờ cảm biến...";

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    try {
      // Khởi tạo đối tượng Light từ thư viện mới
      Light light = Light();

      // Lắng nghe sự thay đổi ánh sáng
      _subscription = light.lightSensorStream.listen((lux) {
        // Cập nhật giao diện khi có số liệu mới
        setState(() {
          _luxValue = lux;
          _status = getLightStatus(lux);
        });
      }, onError: (error) {
        print("Lỗi cảm biến: $error");
        setState(() => _status = "Lỗi đọc cảm biến");
      });
    } catch (e) {
      print("Không thể khởi động cảm biến: $e");
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  // Hàm phân loại độ sáng
  String getLightStatus(int lux) {
    if (lux < 10) return "🌑 TỐI OM (Phòng kín)";
    if (lux < 100) return "🔅 SÁNG MỜ (Đèn ngủ)";
    if (lux < 500) return "💡 SÁNG VỪA (Trong nhà)";
    return "☀️ RẤT SÁNG (Ngoài trời)";
  }

  @override
  Widget build(BuildContext context) {
    // Nếu lux < 50 thì bật chế độ tối (Dark Mode)
    final bool isDark = _luxValue < 50;

    // Màu sắc giao diện
    final Color bgColor = isDark ? const Color(0xFF121212) : Colors.white;
    final Color textColor = isDark ? Colors.white : Colors.black;
    final Color iconColor = isDark ? Colors.grey : Colors.orangeAccent;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Light Meter"),
        backgroundColor: isDark ? Colors.black26 : Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lightbulb, size: 100, color: iconColor),
            const SizedBox(height: 30),
            Text(
              "$_luxValue LUX",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: textColor
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _status,
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}