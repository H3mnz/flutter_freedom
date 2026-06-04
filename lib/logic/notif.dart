import '../lib.dart';

void showNotification(String text) {
  BotToast.showCustomText(
    toastBuilder: (cancelFunc) {
      return Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontWeight: .bold),
            ),
          ),
        ),
      );
    },
  );
}

void showError(String text) {
  BotToast.showCustomText(
    toastBuilder: (cancelFunc) {
      return Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontWeight: .bold),
            ),
          ),
        ),
      );
    },
  );
}

void showAlert(String text) {
  BotToast.showCustomText(
    toastBuilder: (cancelFunc) {
      return Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.yellow.shade700,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontWeight: .bold),
            ),
          ),
        ),
      );
    },
  );
}

void showAbout(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: appName,
    applicationVersion: "1.0",
    children: [
      Text(
        "برنامه آزادی فلاتر توسط مسعود قاسمی، جهت رفع محدودیت های موجود در برابر برنامه نویسان فلاتر در ایران ساخته شده است.\nاین برنامه تحت لیسانس GPL v3.0 به صورت OpenSource منتشر شده. هر گونه کپی برداری و استفاده از آن فقط به شرط اشتراک تغییرات به صورت رایگان بلامانع میباشد.",
        // "این برنامه توسط مسعود قاسمی برای تمامی برنامه نویسان فلاتر سرزمین ایران ساخته شده است. هزینه استفاده از آن دعای خیر شما دوست عزیز میباشد.",
      ),
      SizedBox(height: 10),
      Row(
        mainAxisSize: .min,
        mainAxisAlignment: .end,
        children: [
          Tooltip(
            message: "گیتهاب پروژه",
            child: IconButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(
                    "https://github.com/MadhouseSigma/flutter-freedom-iran",
                  ),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.github,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Tooltip(
            message: "کانال تلگرام",
            child: IconButton(
              onPressed: () {
                launchUrl(Uri.parse("https://t.me/flutterfreedom"));
              },
              icon: FaIcon(
                FontAwesomeIcons.telegram,
                size: 30,
                color: Colors.blue.shade300,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
