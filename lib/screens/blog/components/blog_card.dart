import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_circle_avatar.dart';
import 'package:school_bus_service/components/cus_image.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/horizontal_card.dart';

class BlogCard extends HorizontalCard {
  BlogCard({super.key});

  @override
  double get height => 190;

  @override
  Color? get color => const Color(0XFFE3F5FC);

  @override
  BorderSide get side => const BorderSide(
        width: 2,
        color: Color(0XFF1E5568),
      );

  @override
  Widget get headCard => Column(
        children: [
          CusImage.border(
            // 'https://xeduadonhocsinh.com/wp-content/uploads/2021/03/56673162_2368054453423857_6772261435415199744_o-1024x683.jpg',
            'https://lh3.googleusercontent.com/a/ACg8ocKqi2O79oTg840_6X3y_foj2mALLts9XCDpP3kVqS5RzxHd090=s288-c-no',
            borderRadius: BorderRadius.circular(16.0),
            height: 102,
            width: 125,
            fit: BoxFit.fill,
          ),
          const Row(
            children: [
              CusCircleAvatar(
                null,
                size: 32,
              ),
              SizedBox(width: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CusText.titleSmall(
                    'Hồng Thịnh',
                    fontSize: 18,
                  ),
                  CusText.labelMedium('22/7/2024'),
                ],
              )
            ],
          )
        ],
      );

  @override
  List<Widget> get contentChildren => [
        const CusText.titleSmall(
          'Đảm bảo an toàn với dịch vụ xe đưa đón học sinh',
          maxLines: 2,
          fontSize: 20,
        ),
        const CusText.labelMedium(
          'Dịch vụ đặt xe bùng nổ trong những năm gần đây, trở thành lựa chọn di chuyển phổ biến cho mọi người bởi sự tiện lợi,....',
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )
      ];
}
