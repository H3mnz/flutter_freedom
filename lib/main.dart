import 'lib.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(500, 900),
    minimumSize: Size(500, 900),
    maximumSize: Size(500, 900),

    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    windowButtonVisibility: false,
    titleBarStyle: TitleBarStyle.normal,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setMaximizable(false);
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setResizable(false);
    await windowManager.setFullScreen(false);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  GlobalKey<NavigatorState>? get navigatorKey => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Flutter Freedom",
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "IranSans"),
      locale: Locale("fa"),
      supportedLocales: [Locale("fa")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text(appName),
          centerTitle: true,
          backgroundColor: Colors.green.shade900,
        ),
        floatingActionButton: FloatingInfoButton(),
        floatingActionButtonLocation: .startFloat,
        body: MainBody(),
      ),
    );
  }
}

class FloatingInfoButton extends StatelessWidget {
  const FloatingInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.green.shade700,
      onPressed: () => showAbout(context),
      child: FaIcon(FontAwesomeIcons.info),
    );
  }
}
