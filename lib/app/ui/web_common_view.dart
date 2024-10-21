import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebCommonView extends StatefulWidget {
  final Widget child;

  const WebCommonView({super.key, required this.child});

  @override
  State<WebCommonView> createState() => _WebCommonViewState();
}

class _WebCommonViewState extends State<WebCommonView> {
  bool isWebMobiles = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final isWebMobile =
        kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
    print("App Started ${isWebMobile ? "Web" : "Mobile"}");
    isWebMobiles = isWebMobile;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: isWebMobiles ? double.maxFinite : 400,
        child: widget.child,
      ),
    );
  }
}
