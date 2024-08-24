import 'package:flutter/material.dart';

import '../../style/style.dart';

class VScaffoldWidget extends StatelessWidget {
  const VScaffoldWidget(
      {required this.scaffoldTitle,
      required this.scaffoldBody,
      this.scaffoldFAB,
      this.appbarColor,
      this.isLoading});
  final bool? isLoading;
  final Color? appbarColor;
  final String scaffoldTitle;
  final Widget scaffoldBody;
  final Widget? scaffoldFAB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              isLoading == null ? true : isLoading == false,
          elevation: 0,
          backgroundColor: appbarColor ?? Palette.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            scaffoldTitle,
            style: Themes.customColor(15,
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          toolbarHeight: 45,
          actions: [
            // NetworkWidget(),
            // SizedBox(
            //   width: 24,
            // )
          ],
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButton: scaffoldFAB,
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Palette.containerBackgroundColor.withOpacity(0.1)),
              padding: EdgeInsets.all(8),
              child: scaffoldBody,
            )));
  }
}

class VTab extends StatelessWidget {
  final Color color;
  final String text;
  final bool isCurrent;
  final double? height = 20;

  const VTab({
    Key? key,
    required this.color,
    required this.text,
    required this.isCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isCurrent ? color : Colors.transparent,
          border: isCurrent ? null : Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: Themes.customColor(10,
              color: isCurrent ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // @override
  // Size get preferredSize {
  //   return Size.fromHeight(height!);
  // }
}
