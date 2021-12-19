import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

const double _containerWidth = 450.0;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuilt App!');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        child: HomePage(),
        builder: (c, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.selectedThemeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: AppColors.getMaterialColorFromColor(themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: AppColors.getMaterialColorFromColor(themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
            ),
            home: child,
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme & Primary Color Switcher'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
          width: _containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('Theme'),
              ),
              ThemeSwitcher(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('Primary Color'),
              ),
              PrimaryColorSwitcher(),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeMode selectedThemeMode = appThemes[0].mode;

  setSelectedThemeMode(ThemeMode _themeMode) {
    selectedThemeMode = _themeMode;
    notifyListeners();
  }

  Color selectedPrimaryColor = AppColors.primaryColors[0];

  setSelectedPrimaryColor(Color _color) {
    selectedPrimaryColor = _color;
    notifyListeners();
  }
}

class ThemeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (c, themeProvider, _) => SizedBox(
        height: (_containerWidth - (17 * 2) - (10 * 2)) / 3,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          crossAxisCount: appThemes.length,
          children: List.generate(
            appThemes.length,
            (i) {
              bool _isSelectedTheme = appThemes[i].mode == themeProvider.selectedThemeMode;
              return GestureDetector(
                onTap: _isSelectedTheme ? null : () => themeProvider.setSelectedThemeMode(appThemes[i].mode),
                child: AnimatedContainer(
                  height: 100,
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: _isSelectedTheme ? Theme.of(context).primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Theme.of(context).primaryColor),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(appThemes[i].icon),
                          Text(
                            appThemes[i].title,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PrimaryColorSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (c, themeProvider, _) => SizedBox(
        height: (_containerWidth - (17 * 2) - (10 * 2)) / 3,
        child: GridView.count(
          crossAxisCount: AppColors.primaryColors.length,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          children: List.generate(
            AppColors.primaryColors.length,
            (i) {
              bool _isSelectedColor = AppColors.primaryColors[i] == themeProvider.selectedPrimaryColor;
              return GestureDetector(
                onTap: _isSelectedColor ? null : () => themeProvider.setSelectedPrimaryColor(AppColors.primaryColors[i]),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColors[i],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isSelectedColor ? 1 : 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AppColors {
  static List<String> hexColors = [
    'd23156',
    '16b9fd',
    '13d0c1',
    'e5672f',
    'b73d99',
  ];

  static List<Color> get primaryColors {
    List<Color> _primaryColors = [];

    for (String hexColor in hexColors) {
      Color _color = Color(int.parse('0xff$hexColor'));
      _primaryColors.add(_color);
    }

    return _primaryColors;
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    String colorHex = color.value.toRadixString(16).substring(2);
    List<int> _shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    Map<int, Color> _colorShades = {};
    for (int i = 0; i < _shades.length; i++) {
      String _opacityHex = (255 / _shades.length + ((255 / _shades.length) * i)).ceil().toRadixString(16);
      Color _colorShade = Color(int.parse('0x$_opacityHex$colorHex'));
      _colorShades[_shades[i]] = _colorShade;
    }
    return MaterialColor(int.parse('0xff$colorHex'), _colorShades);
  }
}

class AppTheme {
  ThemeMode mode;
  String title;
  IconData icon;

  AppTheme({
    required this.mode,
    required this.title,
    required this.icon,
  });
}

List<AppTheme> appThemes = [
  AppTheme(
    mode: ThemeMode.light,
    title: 'Light',
    icon: Icons.brightness_5_rounded,
  ),
  AppTheme(
    mode: ThemeMode.dark,
    title: 'Dark',
    icon: Icons.brightness_2_rounded,
  ),
  AppTheme(
    mode: ThemeMode.system,
    title: 'Auto',
    icon: Icons.brightness_4_rounded,
  ),
];
