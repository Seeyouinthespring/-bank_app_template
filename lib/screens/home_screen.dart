
import 'package:bank_app_template/components/header_text_widget.dart';
import 'package:bank_app_template/components/linear_gradient_decoration_widget.dart';
import 'package:bank_app_template/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../components/favorite_card_widget.dart';
import '../components/news_card_widget.dart';
import '../models/navigation_index_model.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController(text: '');

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
        color:const Color(0xFF0268C6),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearGradientDecorationWidget(
                  childWidget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Consumer<NavigationIndexModel>(
                        builder: (context, service, child){
                          return SizedBox(
                            height: 52,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      service.resetRoute(route: Routes.profile);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                          child: Image.network('https://www.shareicon.net/data/128x128/2016/05/29/772559_user_512x512.png',
                                            height: 32,
                                            width: 32,
                                          ),
                                        ),
                                        const Text('Кирилл', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, size: 33, color: Colors.white,)),
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: Container(
                                        height: 18, width: 18,
                                        decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(9))),
                                        child: const Center(child: Text('3', style: TextStyle(color: Colors.white, fontSize: 12),),),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(
                        height: 44,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Баланс кошелька ImPay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                            Text('5 485,67 ₽', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),)
                          ],
                        ),
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Container(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6)), color: Color(0x1AFFFFFF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400 ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Поиск',
                                    hintStyle: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400 ),
                                    contentPadding: EdgeInsets.only(left: 14, right: 12, bottom: 10),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.search, color: Colors.white, size: 24,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                      color: Color(0xFFF4F5FA)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 12),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const HeaderTextWidget(text: "ИЗБРАННОЕ"),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: FavouriteCardWidget(
                                  iconPath: "assets/svg/my_payments.svg",
                                  text: "Мои платежи",
                                ),
                              ),
                              const SizedBox(width: 16,),
                              const Expanded(
                                flex: 1,
                                child: FavouriteCardWidget(
                                  iconPath: "assets/svg/tickets.svg",
                                  text: "Билеты",
                                ),
                              ),
                              const SizedBox(width: 16,),
                              const Expanded(
                                flex: 1,
                                child: FavouriteCardWidget(
                                  iconPath: "assets/svg/coupon.svg",
                                  text: "Карты лояльности",
                                ),
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                flex: 1,
                                child: FavouriteCardWidget(
                                  iconPath: "assets/svg/qr.svg",
                                  text: "QR-оплата",
                                  onTap: (){
                                    Navigator.of(context).pushNamed(Routes.qr);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12, top: 12),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const HeaderTextWidget(text: "НОВОСТИ"),
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.keyboard_arrow_right, size: 26, color: Color(0xFFBFBFBF),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              NewsCardWidget(
                                imageUrl: "https://cdnn.1prime.ru/images/83106/60/831066076.jpg",
                                text: "Суперакция от Веккер Закажи окно до конца сентября и получи мегаскидку плюсь бонусы на счёт.",
                              ),
                              NewsCardWidget(
                                imageUrl: "https://cdn.bfm.ru/news/maindocumentphoto/2022/12/04/lori-0038062746-bigwww.jpg",
                                text: "Суперакция от Веккер Закажи окно до конца сентября и получи мегаскидку плюсь бонусы на счёт.",
                              ),
                              NewsCardWidget(
                                imageUrl: "https://www.oreanda-news.com/appdata/previews/445/aimg_93x16000_1482348_head_0_jpg/head_0s830x553.jpg",
                                text: "Суперакция от Веккер Закажи окно до конца сентября и получи мегаскидку плюсь бонусы на счёт.",
                              ),
                            ],
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
      ),
    );
  }
}
