library;

// Main App Vars
const String appName = "آزادی فلاتر";
const String appDescription =
    "این برنامه برای برنامه نویسان فلاتر در ایران ساخته شده. به کمک آن میتوانید تحریم های وضع شده از طرف گوگل و gradle را دور بزنید و با اینترنت معمولی از فلاتر استفاده کنید.";
const String myChannel = "کانال من";
const String infoText = "درباره برنامه";
const String supportMe = "حمایت از من";

// Flutter Section
const String req = "پیش نیاز ها";
const String flutterDownload = "دانلود فلاتر";
const String flutterDownloadDesc =
    "دانلود فلاتر و SDK های اندروید (در صورت نیاز) از سرور داخلی";
const String flutterDownloadLink = 'ghasemimasoud.ir';
const String flutterDownloadLinkPath = '/flutter-freedom/flutter-sdk.html';

// Android SDK Section
const String sdkDownload = 'دانلود SDK های اندروید';
const String sdkDownloadDesc =
    'دانلود SDK های اندروید و متعلقات آن از سرور داخلی مایکت (در صورت نیاز)';
const String sdkDownloadLink = 'ghasemimasoud.ir';
const String sdkDownloadLinkPath = '/flutter-freedom/android-sdk.html';

// ENV VAR Section
const String envVarSet = "تنظیم مقادیر ENV";
const String envVarSetLabel = "تنظیم Environment Variable";
const String envVarDel = "حذف مقادیر";
const String envVarSetDesc =
    "این کار به منظور استفاده از Package Repository (PUB) برای دانلود و استفاده از پکیج های دارت و فلاتر میباشد.\nمیرور مورد نظر خود را انتخاب کنید سپس دکمه تنظیم مقادیر رو کلیک  کنید.\nاین کار را فقط یک بار برای همیشه انجام دهید.";

// init.d Section
const String initdSetLabel = 'تنظیم میرور gradle مایکت';
const String initdSet = 'تنظیم میرور مایکت';
const String initdDel = 'حذف میرور مایکت';
const String initdDesc =
    'این میرور به شما اجازه می‌دهد بدون نیاز به سرور های gradle و با استفاده از سرور های مایکت، اپلیکیشن خود را بر روی شبیه ساز اجرا و از آن خروجی apk نیز بگیرید. \nاین کار را فقط یک بار برای همیشه انجام دهید.';

// Gradle Section
const String gradleSet = 'تنظیم فایل gradle-wrapper';
const String gradleSetButtonText = 'تنظیم فایل';
const String gradleUnSet = 'بازگردانی فایل gradle-wrapper';
const String gradleUnSetButtonText = 'بازگردانی فایل';
const String gradleSetDesc =
    'بعد از کلیک بر روی دکمه زیر، فولدر پروژه فلاتر خود را انتخاب کنید. \nدقت کنید که فولدری که انتخاب میکنید همان فولدر حاوی فایل pubspec.yaml باشد.\nاین کار را برای هر پروژه یکبار انجام دهید.';

// Logic Vars

enum SelectedPubMirror { myket, runflare, flutterIoCn }

enum SelectedGradleMirror { myket, runflare }

SelectedPubMirror selectedPubMirror = SelectedPubMirror.myket;
SelectedGradleMirror selectedGradleMirror = SelectedGradleMirror.myket;

enum GradleWrapperAction { modify, unModify }

// Toasts

const String envCreatedText = "با موفقیت تنظیم شد";
const String envRemovedText = "با موفقیت حذف شد";
const String errorText = 'خطا';
const String fileCreatedText = "فایل با موفقیت اضافه شد";
const String fileRemovedText = "فایل با موفقیت حذف شد";
const String fileChangedText = "فایل اصلاح شد";
const String fileNotExistText = "فایلی وجود ندارد";
const String fileAlreadyExistText = "فایل از قبل ساخته شده";
const String userFolderNotFoundText = "فولدر یوزر پیدا نشد";
const String pickerDialogTitle =
    "Flutter Project Folder Containing Pubspec.yaml";
const String notFlutterProjectText =
    "فولدر انتخاب شده یک پروژه فلاتر نمی‌باشد.";
const String noGradleFileText = "فایل gradle-wrapper.properties پیدا نشد.";
