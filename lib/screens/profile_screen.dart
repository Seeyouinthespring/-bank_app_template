import 'package:bank_app_template/components/linear_gradient_decoration_widget.dart';
import 'package:bank_app_template/components/sum_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../components/linear_gradient_icon_button_widget.dart';
import '../models/navigation_index_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Color(0xFF02A1FB),
      ),
    );

    return SafeArea(
      maintainBottomViewPadding: true,
      child: Container(
        color: const Color(0xFF0268C6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearGradientDecorationWidget(
              childWidget:  Container(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 25, top: 3),
                child: Row(
                  children: [
                    Consumer<NavigationIndexModel>(
                      builder: (context, service, child){
                        return IconButton(
                          onPressed: () {
                            service.resetRoute();
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Color(0xFFD0EEFF),
                          ),
                        );
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Профиль',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/svg/logout.svg',
                        width: 24,
                        height: 24,
                        color: const Color(0xFFD1EAFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Color(0xFFF4F5FA),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 33, bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          'https://www.shareicon.net/data/128x128/2016/05/29/772559_user_512x512.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const Text(
                      'Васильков Кирилл Александрович',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF222A34),
                      ),
                    ),
                    const Text(
                      '+7 922 123 45 67',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xFF8A898E),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Color(0xFFC4C4C4),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: const SumLabelWidget(
                                mainTitle: '1 485,67 ₽',
                                alterTitle: 'Кошелек ImPay',
                              )
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SumLabelWidget(
                              mainTitle: '5 485,67',
                              alterTitle: 'Накопленно бонусов',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 25, top: 3),
                        child: Row(
                          children: [
                            LinearGradientIconButtonWidget(
                              iconData: Icons.person,
                              onPressed: () {},
                            ),
                            const Expanded(
                              child: Text(
                                'Мои данные',
                                style: TextStyle(
                                  color: Color(0xFF222A34),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                size: 26,
                                color: Color(0xFF8A898E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: 25,
                        ),
                        child: Row(
                          children: [
                            LinearGradientIconButtonWidget(
                              iconData: Icons.question_mark,
                              onPressed: () {},
                            ),
                            const Expanded(
                              child: Text(
                                'Помощь',
                                style: TextStyle(
                                  color: Color(0xFF222A34),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
