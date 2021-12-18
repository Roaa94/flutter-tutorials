import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

const double _containerWidth = 450.0;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            theme: AppThemes.mainTheme(isDark: false, primaryColor: themeProvider.selectedPrimaryColor),
            darkTheme: AppThemes.mainTheme(isDark: true, primaryColor: themeProvider.selectedPrimaryColor),
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
          width: _containerWidth,
          child: Consumer<ThemeProvider>(
            builder: (c, themeProvider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Theme'),
                  ),
                  ThemeSwitcher(
                    selectedThemeMode: themeProvider.selectedThemeMode,
                    onThemeModeSelected: (ThemeMode _selectedThemeMode) => themeProvider.setSelectedThemeMode(_selectedThemeMode),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Primary Color'),
                  ),
                  PrimaryColorSwitcher(
                    selectedPrimaryColor: themeProvider.selectedPrimaryColor,
                    onPrimaryColorSelected: (Color _selectedPrimaryColor) => themeProvider.setSelectedPrimaryColor(_selectedPrimaryColor),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeMode selectedThemeMode = ThemeMode.system;
  Color selectedPrimaryColor = const Color(0xff16b9fd);

  setSelectedThemeMode(ThemeMode _themeMode) {
    selectedThemeMode = _themeMode;
    notifyListeners();
  }

  setSelectedPrimaryColor(Color _color) {
    selectedPrimaryColor = _color;
    notifyListeners();
  }

  static List<Color> appPrimaryColorOptions = const [
    Color(0xff16b9fd),
    Color(0xffd23156),
    Color(0xff13d0c1),
    Color(0xffe5672f),
    Color(0xffb73d99),
  ];

  static List<AppTheme> appThemes = [
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

class AppThemes {
  static ThemeData mainTheme({required bool isDark, required Color primaryColor}) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primarySwatch: Colors.purple,
      primaryColor: primaryColor,
    );
  }
}

class ThemeSwitcher extends StatelessWidget {
  final ThemeMode selectedThemeMode;
  final ValueChanged<ThemeMode> onThemeModeSelected;

  const ThemeSwitcher({
    required this.selectedThemeMode,
    required this.onThemeModeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (_containerWidth - (17 * 2) - (10 * 2)) / 3,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        crossAxisCount: ThemeProvider.appThemes.length,
        children: List.generate(
          ThemeProvider.appThemes.length,
              (i) {
            bool _isSelectedTheme = ThemeProvider.appThemes[i].mode == selectedThemeMode;
            return GestureDetector(
              onTap: _isSelectedTheme ? null : () => onThemeModeSelected(ThemeProvider.appThemes[i].mode),
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
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(ThemeProvider.appThemes[i].icon),
                        Text(
                          ThemeProvider.appThemes[i].title,
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
    );
  }
}

class PrimaryColorSwitcher extends StatelessWidget {
  final Color selectedPrimaryColor;
  final ValueChanged<Color> onPrimaryColorSelected;

  const PrimaryColorSwitcher({
    required this.selectedPrimaryColor,
    required this.onPrimaryColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (_containerWidth - (17 * 2) - (10 * 2)) / 3,
      child: GridView.count(
        crossAxisCount: ThemeProvider.appPrimaryColorOptions.length,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        children: List.generate(
          ThemeProvider.appPrimaryColorOptions.length,
              (i) {
            bool _isSelectedColor = ThemeProvider.appPrimaryColorOptions[i] == selectedPrimaryColor;
            return GestureDetector(
              onTap: _isSelectedColor ? null : () => onPrimaryColorSelected(ThemeProvider.appPrimaryColorOptions[i]),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: ThemeProvider.appPrimaryColorOptions[i],
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
    );
  }
}
