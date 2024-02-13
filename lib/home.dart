import 'package:flutter/material.dart';
import 'package:hogi_milk/providers/data_provider.dart';
import 'package:hogi_milk/widgets/animated_avatar.dart';
import 'package:hogi_milk/widgets/animated_button.dart';

import 'package:hogi_milk/widgets/custom_form.dart';
import 'package:hogi_milk/widgets/image_only_slider.dart';
import 'package:hogi_milk/widgets/image_slider.dart';
import 'package:hogi_milk/widgets/review_slider.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();

  void scrollToForm() {
    // Scroll to the position of the form widget
    itemScrollController.scrollTo(
        index: 17,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500)
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataManager = Provider.of<DataManager>(context, listen: true);
    final Map images = dataManager.images;
    List<Widget> widgets = [
      // Photo taking 70% of the height
      // Photo taking 70% of the height
      Consumer<DataManager>(
        builder: (context, data, child) {
          if (data.images.isEmpty) {
            return Container(
                height: 500, color: Colors.grey.shade100);
          }
          // Use yourProvider to access the data or methods provided by your provider
          return SizedBox(
            width: double.infinity,
            height: 500,
            child: Image.network(
              images['img1'],
              fit: BoxFit.cover,
            ),
          );
        },
      ),

      // // Two descriptions and call to action taking 30% of the height
      Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          // color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Row(
                children: [
                  Icon(Icons.check),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'အစာမစား၊ လေ့ကျင့်ခန်းမလုပ်၊ မောပန်းခြင်းမရှိ',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              const Row(
                children: [
                  Icon(Icons.check),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'ဘေးထွက်ဆိုးကျိုးလုံးဝမရှိဘဲ သဘာဝအတိုင်းပါပဲ။',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 64,
                    height: 48,
                    child: Image.asset("assets/gift-box.gif"),
                  ),
                  const Spacer(),
                  GradientButton(
                    onPressed: scrollToForm,
                    color1: Colors.yellow,
                    color2: Colors.orange,
                    buttonText: '50% လျှော့ဈေး',
                    textColor: Colors.black,
                    borderColor: Colors.black,
                  ),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all<
                  //             Color>(
                  //         const Color.fromARGB(255, 255, 166, 33)),
                  //     elevation: MaterialStateProperty.all(4),
                  //     shape: MaterialStateProperty.all<
                  //         RoundedRectangleBorder>(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(32.0),
                  //         side: const BorderSide(
                  //             color: Colors.black, width: 2),
                  //       ),
                  //     ),
                  //     padding: MaterialStateProperty.all<
                  //         EdgeInsetsGeometry>(
                  //       const EdgeInsets.symmetric(
                  //           vertical: 12, horizontal: 32),
                  //     ),
                  //   ),
                  //   onPressed: scrollToForm,
                  //   child: const Text(
                  //     '50 % လျှော့ဈေး',
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  const Spacer(),

                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                    child: SizedBox(
                      width: 64,
                      height: 48,
                      child: Image.asset("assets/gift-box.gif"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //Doctor's Advice
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "ဆရာဝန်၏အကြံဉာဏ်",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 64),
            padding: const EdgeInsets.fromLTRB(16, 96, 16, 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.greenAccent.shade100,
            ),
            child: const Column(
              children: [
                Text(
                  'WHO မှ Dr. Melissa',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  "Hogi MILK သည် အမေရိကန်ပြည်ထောင်စုမှ သီးနှံအစေ့အဆန်များ၊ သဘာဝပါဝင်ပစ္စည်းများမှ အဆင့်မြင့် NANO ကောက်နှံများကို ခွဲထုတ်သည့်နည်းပညာဖြင့် ထုတ်လုပ်ထားသော နို့ထွက်ပစ္စည်းဖြစ်ပြီး ပါဝင်ပစ္စည်းများတွင်ပါရှိသော အနှစ်သာရများကို ထိန်းသိမ်းပေးကာ အဆိုပါ အနှစ်သာရများကို မှန်ကန်သော ဦးတည်ရာသို့ ပို့ဆောင်ပေးကာ အကောင်းဆုံးထိရောက်မှုကို ယူဆောင်လာပေးပါသည်။ စျေးကွက်တွင် သမားရိုးကျ ခံတွင်းထုတ်ကုန်များထက် ထို့အပြင် Hogi Milk ထုတ်ကုန်များသည် သောက်သုံးရေတွင် လွယ်ကူစွာ ပျော်ဝင်နိုင်သောကြောင့် အာနိသင်ထက် အဆများစွာ ပိုမြန်စေပြီး ဝမ်းဗိုက်၊ ဝမ်းဗိုက်၊ ခြေသလုံး၊ ခြေသလုံးကြွက်သားများနှင့် ခါးရှိ အဆီပိုများကို ဖယ်ရှားပေးပါသည်။ အဘယ်ကြောင့်ဆိုသော် Hogi Milk သည် FDA မှ ထောက်ခံချက်ရရှိထားသောကြောင့်ဖြစ်သည်။\n"
                      "\nHogi Milk တွင် အလွန်နူးညံ့သိမ်မွေ့သော သဘာဝပါဝင်ပစ္စည်းများဖြစ်သည့် Almonds၊ walnuts၊ hazelnuts၊ သီဟိုဠ်စေ့၊ chia အစေ့များ၊ ပြောင်းဖူးစေ့များ၊ oats၊ Hachiစေ့များ၊ ပဲပိစပ်နှင့် ကောက်နှံလုံးညို၊ သက်သတ်လွတ်ခေါက်ဆွဲနှင့် အခြားအရေးကြီးသော အာဟာရတစ်မျိုးဖြစ်သည်။ ဤအရာများသည် ခန္ဓာကိုယ်ကျန်းမာ ၊ ဘေးကင်းရန် ၊ ဘေးထွက်ဆိုးကျိုးမရှိဘဲ နှင့် စျေးကြီးသော ခွဲစိတ်မှုမရှိဘဲ လှပသောခန္ဓာကိုယ်ကို ပိုင်ဆိုင်ရန် ကူညီပေးသော ပါဝင်ပစ္စည်းများဖြစ်သည်။ အပြုသဘောဆောင်သောတုံ့ပြန်ချက်စာရင်းဇယားများအရ၊ ပျမ်းမျှအားဖြင့် 3 ပတ်လျှင် hogi နို့ 3 ဗူးမှ 5 ဗူးကိုအသုံးပြုသောဖောက်သည်များသည် 5-10 ကီလိုဂရမ်ဆုံးရှုံးလိမ့်မည်၊ အထူးသဖြင့်ကိုယ်အလေးချိန်ပြန်မတက်လာသောကြောင့်အမေရိကန်၊ ကနေဒါရှိဖောက်သည်သန်းပေါင်းများစွာသည်အမေရိကန်၊ ၊ဂျပန် ၊ကိုရီးယား ၊မလေးရှား ... ယုံကြည်စိတ်ချစွာ အသုံးပြုနိုင်ပါသည် ။ WHO စံချိန်စံညွှန်းများနှင့် နိုင်ငံတကာကျွမ်းကျင်သူတစ်ဦးအနေဖြင့် ကျွန်ုပ်သည် Hgoi နို့ထွက်ပစ္စည်းများကို ပြီးပြည့်စုံသော ခန္ဓာကိုယ်ပုံသဏ္ဍာန်နှင့် ကျန်းမာရေးကောင်းမွန်ရန်အတွက် ယခုအသုံးပြုပါဟု အကြံပြုအပ်ပါသည်။",
                  style: TextStyle(height: 1.8),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.0),
            ),
            child: const CircleAvatar(
              radius: 64.0,
              backgroundImage: AssetImage('assets/doctor.jpg'),
            ),
          ),
        ],
      ),
      // Image Carousel
      Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Default text color
                ),
                children: [
                  TextSpan(
                    text: 'HOGI ',
                    style: TextStyle(
                        color:
                        Colors.red), // Change the color of 'HOGI'
                  ),
                  TextSpan(
                    text: '၏ထိရောက်မှု',
                    style: TextStyle(
                        color: Colors
                            .black87), // Change the color of '၏ထိရောက်မှု'
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(4, 8, 4, 24),
              child: Text(
                'ဖောက်သည်အများအပြားသည် ၂၁ ရက်အကြာတွင်အသုံးပြုပြီးအောင်မြင်စွာကိုယ်အလေးချိန်ကျခဲ့သည်။',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.8),
              ),
            ),
            const ImageCarousel(),
            const SizedBox(height: 16),
            // FDA Proof text
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  height: 1.8,
                  color: Colors.black, // Default text color
                ),
                children: [
                  TextSpan(
                    text: 'Hogi',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: ' သည်\n',
                    style: TextStyle(color: Colors.black87),
                  ),
                  TextSpan(
                    text:
                    'FDA', // Remain the same color as the default text color
                    style: TextStyle(color: Colors.green),
                  ),
                  TextSpan(
                    text: ' လက်မှတ်ရှိသည်။',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // FDA Proof Letter
      Container(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          color: Colors.grey.shade50,
          height: 500,
          child: Image.asset('assets/fda.jpg')),
      // Call To Action Button
      Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        alignment: Alignment.center,
        color: const Color.fromRGBO(220, 252, 202, 0.6),
        child: SizedBox(
          width: 200,
          height: 56,
          child: GradientButton(
            onPressed: scrollToForm,
            color1: Colors.yellow,
            color2: Colors.orange,
            buttonText: '50% လျှော့ဈေး',
            textColor: Colors.black,
            borderColor: Colors.black,
          ),
        ),
      ),
      // Another Image Carousel
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: ReviewCarousel(),
      ),

      // About Hogi Milk
      Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.center,
        color: Colors.greenAccent.shade100,
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'မင်းရဲ့ယုံကြည်မှုကို ပြန်ယူလာပြီး မင်းရဲ့အကောင်းဆုံး\nခန္ဓာကိုယ်ကို ဖော်ပြပါ။',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/hogi.jpg',
            fit: BoxFit.contain,
          ),
          const Padding(
            padding:
            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(children: [
              Text('ခန္ဓာကိုယ်က အမြဲတမ်း ကျန်းမာတယ်။',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text(
                'ကောင်းမွန်တဲ့ အသီးအနှံတွေနဲ့ ဟင်းသီးဟင်းရွက်တွေကို ရောစပ်ပြီး ခန္ဓာကိုယ်အတွက် ကောင်းမွန်တဲ့ အကျိုး\nကျေးဇူးတွေနဲ့ အဆီစုပ်ယူမှုကို လျှော့ချပေးပါတယ်။',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.8),
              ),
            ]),
          ),
          const Padding(
            padding:
            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(children: [
              Text('အစာရှောင်ခြင်း၊ အစာစားခြင်းအား နှုတ်ဆက်ပါ။',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text(
                'အဆီပြန်ခြင်းအတွက် စိတ်ပူစရာမလိုဘဲ အရသာရှိသော အစားအစာများကို ဆက်လက်စားသုံးနိုင်ရန် ကူညီပေးသော အစားအစာ အစားထိုးခြင်း။ မောပန်းနွမ်းနယ်ပြီး အစာစားချင်စိတ်လည်း မရှိတော့ပါ။',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.8),
              ),
            ]),
          ),
          const Padding(
            padding:
            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(children: [
              Text(
                  'ပိုကောင်းတဲ့ဇီဝဖြစ်စဉ်။ ပိုကောင်းတဲ့အာဟာရစုပ်ယူမှု။',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text(
                'ဗီတာမင်နှင့် သတ္တုဓာတ်များ ကြွယ်ဝစွာပါဝင်ပြီး အမျှင်ဓာတ်ကြွယ်ဝစွာ ဇီဝကမ္မဖြစ်စဉ်ကို အားကောင်းစေသည်။ ကိုယ်အလေးချိန်ကျတဲ့အခါ ကျန်းမာရေးကို အထောက်အကူပြုပါတယ်။',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.8),
              ),
            ]),
          )
        ]),
      ),
      // Glowing Skin
      Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: Text(
                'အသားအရေကို ဖြူဝင်းစေပြီး \nအသားအရေကို ချောမွေ့စေပါသည်။',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Image.asset(
              'assets/glow.jpg',
              fit: BoxFit.contain,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 24, 12, 0),
              child: Text(
                'Hogi တွင် အရေပြားဖွဲ့စည်းတည်ဆောက်ပုံအတွက်သာမက အသားအရေကို အစိုဓာတ်ထိန်းပေးကာ နုပျိုသောအသားအရေအတွက် ကော်လာဂျင်တည်ဆောက်မှုကို ကာကွယ်ပေးသည့် omega 3 ပါ၀င်သော အပင်ပရိုတင်းများစွာ ပါဝင်ပါသည်။ Hogi တွင်ပါဝင်သော ဗီတာမင်စီ၊ ဗီတာမင် E သည် ကော်လာဂျင်ထုတ်လုပ်မှုကို လှုံ့ဆော်ပေးပြီး အိုမင်းရင့်ရော်မှုကို တားဆီးပေးပြီး ကျန်းမာနုပျိုသော အသားအရေကို ထိန်းသိမ်းပေးသည်။',
                style: TextStyle(height: 1.8),
              ),
            ),
          ],
        ),
      ),
      // Promotion Image
      Consumer<DataManager>(builder: (context, data, child) {
        if (data.images.isEmpty) {
          return Container(height: 300, color: Colors.grey.shade300);
        }
        return Image.network(images['img2'], fit: BoxFit.contain);
      }),
      // Badges
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const Text(
              'ကြီးမားသောမြှင့်တင်ရေး',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Image.asset('assets/badges.png', fit: BoxFit.cover)
          ],
        ),
      ),
      // Special Discounts
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/promo1.png', fit: BoxFit.cover),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: GradientButton(
                  onPressed: scrollToForm,
                  color1: Colors.red,
                  color2: Colors.orange,
                  buttonText: 'မှာယူရန်နှိပ်ပါ',
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Image.asset('assets/promo2.png', fit: BoxFit.cover),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: GradientButton(
                  onPressed: scrollToForm,
                  color1: Colors.red,
                  color2: Colors.orange,
                  buttonText: 'မှာယူရန်နှိပ်ပါ',
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Image.asset('assets/promo3.png', fit: BoxFit.cover),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: GradientButton(
                  onPressed: scrollToForm,
                  color1: Colors.red,
                  color2: Colors.orange,
                  buttonText: 'မှာယူရန်နှိပ်ပါ',
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Image.asset('assets/promo4.png', fit: BoxFit.cover),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: GradientButton(
                  onPressed: scrollToForm,
                  color1: Colors.red,
                  color2: Colors.orange,
                  buttonText: 'မှာယူရန်နှိပ်ပါ',
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      // Warning
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Image.asset('assets/alert.png'),
        ),
      ),
      Container(
        color: Colors.red,
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: const Text(
          'ကုန်ပစ္စည်းအတုများ လက်ခံရရှိခြင်းမှ ရှောင်ကြဉ်ရန်၊ ကျေးဇူးပြု၍ ဘေလ်ပေါ်ရှိ ပေးပို့သူ အချက်အလက်ကို စစ်ဆေးပြီး ဓာတ်ပုံတွင် ပြထားသည့်အတိုင်း ပေးပို့သူ အချက်အလက်ဖြင့် မှန်ကန်သော မှာယူမှုကိုသာ လက်ခံပါ။',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.8),
          textAlign: TextAlign.center,
        ),
      ),
      // Post Address
      Image.asset('assets/address.PNG', fit: BoxFit.contain),
      // Order Form
      const MyForm(),
      Container(
        padding: const EdgeInsets.symmetric(
            vertical: 24.0, horizontal: 16),
        color: const Color.fromRGBO(220, 252, 202, 0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'အဝလွန်ခြင်း၏ဆိုးကျိုးများ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 32.0),
            Image.asset('assets/obese.png', fit: BoxFit.cover),
            const SizedBox(height: 24.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    'အစာခြေစနစ်နှင့်ပတ်သက်သောရောဂါများ ဥပမာ ဇီဝဖြစ်စဉ်မမှန်ခြင်း၊ သည်းခြေကျောက်တည်ခြင်း။',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        height: 1.8,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    'အဆီများသောသွေးနှင့် ဦးနှောက်သွေးကြောဆိုင်ရာ မတော်တဆမှုကဲ့သို့သော နှလုံးသွေးကြောဆိုင်ရာရောဂါများ ခံစားရနိုင်ခြေ၊ နှလုံးနှင့်ပတ်သက်သောရောဂါများ။',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        height: 1.8,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    'အရိုးနှင့် အဆစ်များနှင့် ပတ်သက်သော ရောဂါများဖြစ်သည့် အဆစ်အမြစ်ရောင်ခြင်း၊ အရိုးအဆစ်ရောင်ခြင်း၊ ရောင်ရမ်းခြင်းနှင့် spondylosis။',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        height: 1.8,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    'ဆီးချိုရောဂါ၊ ဂေါက်။',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        height: 1.8,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            Image.asset('assets/advantage.jpg', fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/h1.png'),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'US မှ 100% Colostrum ',
                                style: TextStyle(color: Colors.red),
                              ),
                              TextSpan(
                                text:
                                'Hogi နည်းပညာမြင့်နို့ရည်သည် ၎င်း၏ထိရောက်မှု၊ ဘေးကင်းမှု၊ နူးညံ့သိမ်မွေ့မှုနှင့် ဘေးထွက်ဆိုးကျိုးမရှိသောကြောင့် အဝလွန်လူနာများအတွက် နံပါတ် ၁ အာဟာရကုထုံးဖြစ်သည်။',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/h2.png'),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                'Hogi သည် ခန္ဓာကိုယ်အတွက် 100% အာဟာရဓာတ်များ ပါ၀င်သည် ။ ',
                                style: TextStyle(color: Colors.red),
                              ),
                              TextSpan(
                                text:
                                'ဆန်အနှစ်၊ ပဲညွှန့်မှုန့်၊ ပြောင်းဖူးကစီဓာတ်၊ ဆန်လုံးညို၊ ဂျုံလုံး၊ ပဲပင်ပေါက်၊ ပဲပင်ပေါက်၊ chia စေ့များ၊ ဆာချီစေ့များ၊ ဖွဲနုဓာတ်၊ သတ္တုဓာတ်နှင့် အက်ဆစ်.',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/h3.png'),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'အမေရိက၏ ထိပ်တန်း ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Phytosome ',
                                style: TextStyle(color: Colors.red),
                              ),
                              TextSpan(
                                text:
                                'နည်းပညာသည် ပျက်စီးနေသော ကိုယ်တွင်းအင်္ဂါများကို ပြန်လည်ထူထောင်ရန်နှင့် အင်ဆူလင်ထုတ်လုပ်မှုကို ပြင်းထန်စွာ လှုံ့ဆော်ပေးနိုင်စွမ်းရှိသည်။',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: const Color.fromRGBO(220, 252, 202, 0.6),
        padding:
        const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'HOGI\n',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text: '၏လုပ်ဆောင်ချက်၏ယန္တရား',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(28, 0, 194, 1),
                      border: Border.all(
                          width: 4,
                          color: Colors.white.withOpacity(0.5)),
                      shape: BoxShape.circle),
                  child: const Text(
                    '၁ပတ်',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          height: 0),
                      children: [
                        TextSpan(
                          text: '1-2 ကီလိုဂရမ်ဆုံးရှုံးသည်: \n',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text:
                          'အစားအစာအစားထိုး၊ ကျန်းမာရေးဖြည့်စွက်မှု၊ စွမ်းအင်ထောက်ပံ့မှု',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(28, 0, 194, 1),
                      border: Border.all(
                          width: 4,
                          color: Colors.white.withOpacity(0.5)),
                      shape: BoxShape.circle),
                  child: const Text(
                    '၂ပတ်',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          height: 0),
                      children: [
                        TextSpan(
                          text: '2 ပတ် 3-4 ကီလိုဂရမ်ဆုံးရှုံးသည်: \n',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text:
                          'ဗီတာမင်နှင့် သတ္တုဓာတ်များဖြင့် ခိုင်ခံ့စေသည်။ အမျှင်ဓာတ်ကြွယ်ဝပြီး ခန္ဓာကိုယ်တွင်း ဇီဝဖြစ်ပျက်မှုကို မြှင့်တင်ပေးပါတယ်။',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(28, 0, 194, 1),
                      border: Border.all(
                          width: 4,
                          color: Colors.white.withOpacity(0.5)),
                      shape: BoxShape.circle),
                  child: const Text(
                    '၁လ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          height: 0),
                      children: [
                        TextSpan(
                          text: '၁ လ 5-6 ကီလိုဂရမ်ဆုံးရှုံး:\n',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text:
                          'အဆီစုပ်ယူမှုကို လျှော့ချပေးပြီး ကိုယ်အလေးချိန်ကို ထိန်းပေးသည်။',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      // Lab Photos
      Container(
        color: const Color.fromRGBO(220, 252, 202, 0.6),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'ခေတ်မီထုတ်လုပ်ရေးနည်းပညာသည် ကမ္ဘာပေါ်တွင် နံပါတ်တစ်ဖြစ်သည်။',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 440,
              child: Stack(
                children: [
                  Positioned(
                    top: 150,
                    left: 112,
                    child: SizedBox(
                      width: 130,
                      height: 178,
                      child: Image.asset(
                        'assets/sample.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 16,
                    child: AnimatedGrowShrinkWidget(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            )),
                        width: 154,
                        height: 154,
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/lab1.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 16,
                    child: AnimatedGrowShrinkWidget(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            )),
                        width: 120,
                        height: 120,
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/lab2.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 176,
                    left: 12,
                    child: AnimatedGrowShrinkWidget(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            )),
                        width: 92,
                        height: 92,
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/lab5.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 142,
                    right: 4,
                    child: AnimatedGrowShrinkWidget(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            )),
                        width: 100,
                        height: 100,
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/lab4.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 6,
                    bottom: 10,
                    child: AnimatedGrowShrinkWidget(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            )),
                        width: 146,
                        height: 146,
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/lab5.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 6,
                    bottom: 12,
                    child: AnimatedGrowShrinkWidget(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            )),
                        width: 146,
                        height: 146,
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/lab6.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -8,
                    bottom: 24,
                    child: AnimatedGrowShrinkWidget(
                      child: Container(
                        width: 164,
                        height: 164,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            )),
                        child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/lab3.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // How to make
      Container(
        color: const Color.fromRGBO(220, 252, 202, 0.6),
        child: Column(children: [
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                //height: 0
              ),
              children: [
                TextSpan(
                  text: 'အမြင့်ဆုံးထိရောက်မှုဖြင့် ',
                ),
                TextSpan(
                  text: 'HOGI ',
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(
                  text: 'ကိုအသုံးပြုနည်း',
                ),
              ],
            ),
          ),
          Image.asset('assets/how.png', fit: BoxFit.contain),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 16),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    height: 2),
                children: [
                  TextSpan(
                    text: 'အသုံးပြုရန် လမ်းညွှန်ချက်များ-',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(
                    text:
                    '3-5 ဇွန်းကို 55-56 ဒီဂရီ မှည့် 150ml ဖြင့် ရောမွှေပါ။ 180ml လောက်ရအောင် မွှေပါ။',
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/freq.png', fit: BoxFit.contain),
          const SizedBox(height: 32),
          // FDA Badges
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 161, 83),
              ),
              children: [
                TextSpan(
                  text: 'FDA, GMP, ISO\n',
                ),
                TextSpan(
                  text: 'မှ အပြည့်အဝထောက်ခံချက်',
                  style: TextStyle(
                      color: Colors
                          .black87), // Change the color of '၏ထိရောက်မှု'
                ),
              ],
            ),
          ),
          Image.asset('assets/fdaicons.png', fit: BoxFit.contain),
          Container(
            margin: const EdgeInsets.fromLTRB(56, 16, 56, 56),
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color.fromARGB(255, 255, 33, 17),
                  elevation: 8,
                ),
                onPressed: scrollToForm,
                child: const Text(
                  'ယခုမှာယူပါ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
        ]),
      ),
      // Image Only Slider
      const ImageOnlySlider(),
      // Top Comments
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ထိပ်တန်းမှတ်ချက်',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: Colors.green,
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/comment1.jpg',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Thar Lay',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    'ဘုရားရေ! ဒီထုတ်ကုန်ကိုသုံးပြီး 3 ပတ်အကြာမှာ 4 ပေါင်ကျသွားတယ်။ အဲဒါက ဘေးကင်းတယ်၊ ထိရောက်တယ်၊ အသုံးပြုရလွယ်ကူတယ်။',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 1.8),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: Colors.green,
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/comment2.jpg',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'May Myat Mon',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    'ဒီထုတ်ကုန်ကို သုံးနေတာ 2 လရှိပြီ ရလဒ်တွေက မျှော်လင့်ထားတာထက် ကျော်လွန်နေပါပြီ။ အိပ်ရေးမဝတော့ဘူး။ ဒီမနက် အိပ်ရာက အရမ်း တက်ကြွနေပြီး အခုတော့ အားအင်တွေ ပြည့်နေပြီ ။ တစ်ခါမှ ဒီလောက်မသက်သာဖူးဘူး။',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 1.8),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: Colors.green,
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/comment3.jpg',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Alex sandro',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    '5 ဗူးကို ခဏလောက်သုံးပြီးရင် အသားအရေက အရမ်းကောင်းလာပြီး တစ်ကိုယ်လုံး သန်စွမ်းလာပါပြီ။ မျက်နှာ ဖြူ ပြာ မရှိတော့ဘူး။ HOGI MILK က တကယ်ကို အကြံပြုလိုပါတယ်။',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 1.8),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: Colors.green,
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/comment4.jpg',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Zar Lay',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    '3 ဗူးဝယ်ပြီး 1 ဗူးပဲကျန်တော့တာ တကယ်စိတ်ရှည်ဖို့ပဲလိုတာပါ။ အလယ်မှာသာသုံးရင် အလုပ်မဖြစ်ပါဘူး။',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        height: 1.8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Warning
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Image.asset('assets/alert.png'),
        ),
      ),
      Container(
        color: Colors.red,
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: const Text(
          'ကုန်ပစ္စည်းအတုများ လက်ခံရရှိခြင်းမှ ရှောင်ကြဉ်ရန်၊ ကျေးဇူးပြု၍ ဘေလ်ပေါ်ရှိ ပေးပို့သူ အချက်အလက်ကို စစ်ဆေးပြီး ဓာတ်ပုံတွင် ပြထားသည့်အတိုင်း ပေးပို့သူ အချက်အလက်ဖြင့် မှန်ကန်သော မှာယူမှုကိုသာ လက်ခံပါ။',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.8),
          textAlign: TextAlign.center,
        ),
      ),
      // Post Address
      Image.asset('assets/address.PNG', fit: BoxFit.contain),
      // Order Form
      const MyForm(),
      // Comments
      Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'အားလုံးမှတ်ချက်',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'မှတ်ချက် ၆၇၆',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const Text(
                  'ဖြင့် စီစဉ်သည်။',
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Colors.grey.shade300, width: 2)),
                  child: const Text(
                    'ဇာတ်လိုက်',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
              ],
            ),
            Divider(
              height: 40,
              color: Colors.grey.shade200,
              thickness: 2,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/user1.jpg'),
                  ),
                  // Container(
                  //   width: 56.0,
                  //   height: 56.0,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey, // Placeholder color
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  //   // Placeholder for user photo
                  //   // You can replace this with your actual user photo widget
                  //   child:
                  //       const Icon(Icons.person, color: Colors.white),
                  // ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jacqueline Jurado',
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'ကုန်ပစ္စည်းများကို အလွန်လျင်မြန်စွာ လက်ခံရရှိပြီး သေသေချာချာ ထုပ်ပိုးပေးပါသည်။',
                          style: TextStyle(
                              height: 1.8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              'Like - Feedback',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 12),
                            ),
                            const SizedBox(width: 12.0),
                            Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.thumb_up,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54),
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              '9 hours ago',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blue),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: const Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                AssetImage('assets/profile.jpg'),
                              ),
                              // Container(
                              //   width: 56.0,
                              //   height: 56.0,
                              //   decoration: BoxDecoration(
                              //     color: Colors
                              //         .grey, // Placeholder color
                              //     borderRadius:
                              //         BorderRadius.circular(8.0),
                              //   ),
                              //   // Placeholder for user photo
                              //   // You can replace this with your actual user photo widget
                              //   child: const Icon(Icons.person,
                              //       color: Colors.white),
                              // ),
                              SizedBox(width: 12.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hogi',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'ကျွန်ုပ်၏ထုတ်ကုန်များကို ယုံကြည်စွာအသုံးပြုသည့်အတွက် ကျေးဇူးတင်ပါသည်။',
                                      style: TextStyle(
                                          height: 1.8,
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.w400),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          'Feedback - ',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          '52 minutes ago',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/user2.jpg'),
                  ),
                  // Container(
                  //   width: 56.0,
                  //   height: 56.0,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey, // Placeholder color
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  //   // Placeholder for user photo
                  //   // You can replace this with your actual user photo widget
                  //   child:
                  //       const Icon(Icons.person, color: Colors.white),
                  // ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Scarlet Rodriguez',
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'အွန်လိုင်းမှာ မှာတာနဲ့ပတ်သက်ပြီး လုံခြုံမှုမရှိခဲ့ဖူးပေမယ့် ဒီတစ်ခါတော့ ဝယ်ဖို့ကြိုးစားပြီး ရလဒ်တွေက အရမ်းတန်ပါတယ်။',
                          style: TextStyle(
                              height: 1.8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              'Like - Feedback',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 12),
                            ),
                            const SizedBox(width: 12.0),
                            Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.thumb_up,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '6',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54),
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              '9 days ago',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/user3.jpg'),
                  ),
                  // Container(
                  //   width: 56.0,
                  //   height: 56.0,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey, // Placeholder color
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  //   // Placeholder for user photo
                  //   // You can replace this with your actual user photo widget
                  //   child:
                  //       const Icon(Icons.person, color: Colors.white),
                  // ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Yadanar Oo',
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'တစ်လလောက်သုံးထားလို့ ကောင်းကောင်းအိပ်မပျော်တော့ဘူး။',
                          style: TextStyle(
                              height: 1.8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              'Like - Feedback',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 12),
                            ),
                            const SizedBox(width: 12.0),
                            Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.thumb_up,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54),
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              '16 hours ago',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/user4.jpg'),
                  ),
                  // Container(
                  //   width: 56.0,
                  //   height: 56.0,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey, // Placeholder color
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  //   // Placeholder for user photo
                  //   // You can replace this with your actual user photo widget
                  //   child:
                  //       const Icon(Icons.person, color: Colors.white),
                  // ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Agnes D. Jalli',
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '၁လလောက်သုံးထားလို့ ကောင်းကောင်းအိပ်ပျော်သွားလို့ အသားအရည်က ဖြူဝင်းလာပါတယ် သြော် ငါလည်း 5 ကီလိုကျသွားတာ မေ့သွားတယ်။',
                          style: TextStyle(
                              height: 1.8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              'Like - Feedback',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 12),
                            ),
                            const SizedBox(width: 12.0),
                            Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.thumb_up,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54),
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              '3 days ago',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/user5.jpg'),
                  ),
                  // Container(
                  //   width: 56.0,
                  //   height: 56.0,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey, // Placeholder color
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  //   // Placeholder for user photo
                  //   // You can replace this with your actual user photo widget
                  //   child:
                  //       const Icon(Icons.person, color: Colors.white),
                  // ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ladi',
                          style:
                          TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '8/2021 အပိုင်းအစကို စတင်ပါ။ ဆေးရုံတွင်အလုပ်လုပ်သောဆရာဝန်၏အစ်ကိုကဤအန္တရာယ်ကင်းသောကိုယ်အလေးချိန်ထုတ်ကုန်ကိုအကြံပြုသည်။ 90 ကီလိုဂရမ်ကနေ 76 ကီလိုဂရမ်အထိဆုံးရှုံးခဲ့သည်။',
                          style: TextStyle(
                              height: 1.8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              'Like - Feedback',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 12),
                            ),
                            const SizedBox(width: 12.0),
                            Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.thumb_up,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '112',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54),
                            ),
                            const SizedBox(width: 4.0),
                            const Text(
                              '1 day ago',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        color: Colors.green[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'HOGI',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ဧည့်ဝန်ဆောင်မှု',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'ပြန်ပို့ခြင်းနှင့်\nသင်္ဘောမူဝါဒ',
                              style: TextStyle(height: 1.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.article,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'သတ်မှတ်ချက်များ',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 36), // Add some space between the columns
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.lock,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'ကိုယ်ရေးအချက်\nအလက်မူဝါဒ',
                              style: TextStyle(height: 1.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.message,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text('ဆက်သွယ်ရန်'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/payments.png',
              width: 200,
              height: 100,
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 360,
          ),
          child: ScrollablePositionedList.builder(
              itemCount: widgets.length,
              itemScrollController: itemScrollController,
              scrollOffsetController: scrollOffsetController,
              itemPositionsListener: itemPositionsListener,
              scrollOffsetListener: scrollOffsetListener,
              itemBuilder: (context,index){
                return widgets[index];
              }
          ),
        ),
      ),
    );
  }
}
