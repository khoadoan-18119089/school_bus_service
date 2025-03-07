import 'package:school_bus_service/commom/lotties.dart';

class LocalData {
  LocalData._();
  factory LocalData() => intanse;
  static final LocalData intanse = LocalData._();

  List<Map<String, String>> get onboarding {
    return [
      {
        'LOTTIE': MyLotties.onBoardingBus,
        'TITLE': 'Đặt xe',
        'SUBTITLE':
            'Bạn đang tìm kiếm một phương tiện di chuyển nhanh chóng, tiện lợi và tiết kiệm để đưa con đến trường? Đặt xe qua ứng dụng SBS chính là giải pháp hoàn hảo dành cho bạn!',
      },
      {
        'LOTTIE': MyLotties.onBoardingSaving,
        'TITLE': 'Giá cả hợp lý',
        'SUBTITLE':
            'Bạn có thể dễ dàng so sánh giá cả của các hãng xe khác nhau trước khi đặt xe. Thanh toán dễ dàng: Bạn có thể thanh toán bằng tiền mặt hoặc ví điện tử một cách nhanh chóng và tiện lợi.',
      },
      {
        'LOTTIE': MyLotties.onBoardingUtility,
        'TITLE': 'Tiện ích',
        'SUBTITLE':
            'Chỉ với vài thao tác đơn giản trên điện thoại thông minh, bạn có thể dễ dàng đặt xe mọi lúc mọi nơi, không cần tốn thời gian. An toàn: Các ứng dụng đặt xe uy tín đều có quy trình tuyển chọn và quản lý tài xế chặt chẽ, đảm bảo an toàn cho con bạn.',
      }
    ];
  }
}
