part of style;

mixin Themes {
  static void initUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
    ));
  }

  static TextStyle customColor(
    //
    double fontSize, {
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static OutlineInputBorder notFocused({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: color ?? Palette.greyStroke));
  }

  static OutlineInputBorder focused({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: color ?? Palette.primaryColor));
  }

  static InputDecoration formStyle(String hintText,
      {Widget? icon, Color? textColor}) {
    return InputDecoration(
      hintText: hintText,
      suffixIcon: icon ?? null,
      border: InputBorder.none,
      focusedBorder: Themes.focused(color: Palette.green),
      enabledBorder: Themes.notFocused(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      hintStyle: Themes.customColor(
        14,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      labelStyle: Themes.customColor(
        14,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
    );
  }

  static InputDecoration formStyleBordered(String labelText,
      {Color? borderColor, Widget? icon, double? fontSize}) {
    return InputDecoration(
      labelText: labelText,
      suffixIcon: icon ?? null,
      contentPadding: const EdgeInsets.all(16),
      hintStyle: Themes.customColor(14, color: Palette.primaryColor),
      labelStyle: Themes.customColor(
        fontSize ?? 14,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: Themes.focused(color: borderColor ?? Palette.primaryColor),
      focusedBorder: Themes.focused(color: borderColor ?? Palette.primaryColor),
      enabledBorder: Themes.focused(color: borderColor ?? Palette.primaryColor),
    );
  }

  static InputDecoration dropdown({Color? borderColor, Widget? icon}) {
    return InputDecoration(
      suffixIcon: icon ?? null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      hintStyle: Themes.customColor(14, color: Palette.primaryTextColor),
      labelStyle: Themes.customColor(14, color: Palette.primaryTextColor),
      helperStyle: Themes.customColor(14, color: Palette.primaryTextColor),
      border: Themes.focused(color: borderColor ?? Palette.primaryColor),
      focusedBorder:
          Themes.focused(color: borderColor ?? Palette.primaryTextColor),
      enabledBorder:
          Themes.focused(color: borderColor ?? Palette.primaryTextColor),
    );
  }

  static ThemeData theme(BuildContext context) {
    return ThemeData.light().copyWith(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.black,
        cardColor: Palette.primaryLighter,
        unselectedWidgetColor: Palette.primaryLighter,
        disabledColor: Colors.black.withOpacity(0.15),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Palette.primaryColor,
          onSurface: Colors.black,
        ),
        datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: Palette.primaryColor,
            headerForegroundColor: Palette.primaryColor));
  }
}
