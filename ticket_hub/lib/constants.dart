class Statics {
  static var isLightMode = true;
  static var darkModeBackground = 'assets/images/dark_background.png';
  static var lightModeBackground = 'assets/images/light_background.png';

  static background() {
    if (isLightMode) return lightModeBackground;
    return darkModeBackground;
  }
}
