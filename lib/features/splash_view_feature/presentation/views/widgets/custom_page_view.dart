import 'package:ecommerceapp/utils/assets.dart';
import 'package:flutter/material.dart';

import 'page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.myController});

  final PageController myController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: myController,
        scrollDirection: Axis.horizontal,
        children: [
          PageViewItem(
            isVisible:
                (myController.hasClients ? myController.page!.round() : 0) == 0,
            backgroundImage: Assets.imagesOnboardingViewBackGroung1,
            image: Assets.imagesOnBoardingImage1,
            title: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'مرحبًا بك في',
                    style: TextStyle(
                      color: Color(0xFF0C0D0D),
                      fontSize: 23,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' Fruit',
                    style: TextStyle(
                      color: Color(0xFF1B5E37),
                      fontSize: 23,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'HUB',
                    style: TextStyle(
                      color: Color(0xFFF4A91F),
                      fontSize: 23,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            subTitle: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 37),
              child: Text(
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4E5556),
                  fontSize: 13,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          PageViewItem(
            isVisible:
                (myController.hasClients ? myController.page!.round() : 0) == 0,
            backgroundImage: Assets.imagesOnboardingviewBackGround2,
            image: Assets.imagesOnBoardingimage2,
            title: const Text(
              'ابحث وتسوق',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0C0D0D),
                fontSize: 23,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
              ),
            ),
            subTitle: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 37),
              child: Text(
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4E5456),
                  fontSize: 13,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
