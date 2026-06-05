import 'lib.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(appDescription),
              //! Flutter Download
              StepWidget(
                label: req,
                desc: flutterDownloadDesc,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    AppButton(
                      height: 50,
                      width: 180,
                      label: flutterDownload,
                      icon: Icons.link,
                      onPressed: () {
                        launchUrl(
                          Uri.https(
                            flutterDownloadLink,
                            flutterDownloadLinkPath,
                          ),
                        );
                      },
                    ),
                    AppButton(
                      height: 50,
                      width: 220,
                      label: sdkDownload,
                      icon: Icons.link,
                      onPressed: () {
                        launchUrl(
                          Uri.https(sdkDownloadLink, sdkDownloadLinkPath),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.white,
                height: 20,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
              const AutoSetStep(),

              StepWidget(
                label: "لینک های کمکی",
                desc: "وبسایت ها و ابزار کمکی ",
                widget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Tooltip(
                          message:
                              "مخزن پکیج های فلاتر در دامنه مایکت. به راحتی جستجو کنید و مستندات را بخوانید",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Colors.white,
                            label: "pub.dev Mirror",
                            onPressed: () {
                              launchUrl(Uri.parse("https://pub.myket.ir"));
                            },
                          ),
                        ),
                        Tooltip(
                          message: "میرور های مایکت برای استفاده های متفاوت",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Colors.blue,
                            label: "Myket Mirrors",
                            onPressed: () {
                              launchUrl(Uri.parse("https://maven.myket.ir"));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Tooltip(
                          message:
                              "معرفی پکیج های مفید فلاتر به صورت دسته بندی شده",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Color.fromARGB(255, 30, 212, 253),
                            label: "FlutterGems",
                            onPressed: () {
                              launchUrl(Uri.parse("https://fluttergems.dev/"));
                            },
                          ),
                        ),
                        Tooltip(
                          message: "میرور های رانفلر برای استفاده های متفاوت",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Color.fromARGB(255, 245, 158, 17),
                            label: "Runflare Mirrors",
                            onPressed: () {
                              launchUrl(
                                Uri.parse("https://runflare.com/mirrors/"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Tooltip(
                          message: "تصاویر متن‌باز",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Color.fromARGB(255, 249, 250, 251),
                            label: "unDraw",
                            onPressed: () {
                              launchUrl(
                                Uri.parse("https://undraw.co/illustrations"),
                              );
                            },
                          ),
                        ),
                        Tooltip(
                          message: "آیکون های متن‌باز",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Color.fromARGB(255, 107, 155, 210),
                            label: "SVGRepo",
                            onPressed: () {
                              launchUrl(Uri.parse("https://www.svgrepo.com/"));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Tooltip(
                          message: "ریپو گیتهاب، بهشت فلاتر کارها",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Color.fromARGB(255, 249, 250, 251),
                            label: "awesome-flutter",
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                  "https://github.com/solido/awesome-flutter",
                                ),
                              );
                            },
                          ),
                        ),
                        Tooltip(
                          message: "وبسایت، پر از اپ ها و ویجت های پیش‌ساخته",
                          child: AppButton(
                            width: 200,
                            height: 50,
                            textColor: Color.fromARGB(255, 107, 155, 210),
                            label: "Flutter Awesome",
                            onPressed: () {
                              launchUrl(
                                Uri.parse("https://flutterawesome.com/"),
                              );
                            },
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
      ),
    );
  }
}
