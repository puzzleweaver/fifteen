import 'package:flutter/material.dart';

class JsonWidget<T> extends StatefulWidget {
  final String asset;
  final Widget Function(BuildContext context, T t) builder;
  final T Function(String contents) getObject;
  const JsonWidget({
    super.key,
    required this.asset,
    required this.builder,
    required this.getObject,
  });

  @override
  State<StatefulWidget> createState() => JsonWidgetState<T>();
}

class JsonWidgetState<T> extends State<JsonWidget<T>> {
  T? t;

  @override
  void initState() {
    _loadAsset();
    super.initState();
  }

  void _loadAsset() async {
    String data = await DefaultAssetBundle.of(context).loadString(widget.asset);
    setState(
      () => t = widget.getObject(data),
    );
  }

  @override
  Widget build(BuildContext context) {
    T? t = this.t;
    if (t == null) return const Center(child: CircularProgressIndicator());
    return widget.builder(context, t);
  }
}
