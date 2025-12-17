import 'package:flutter/cupertino.dart';

/// Desteklenen platformlar
enum ComponentBuilderDevice {
  android,
  ios,
}

/// Widget zincirini kurup build eden builder sınıfı
class ComponentBuilder {
  final Widget? _child;

  const ComponentBuilder._(this._child);

  factory ComponentBuilder() => const ComponentBuilder._(null);

  /// Başlangıç widget'ı
  ComponentBuilder child(Widget widget) => ComponentBuilder._(widget);

  ComponentBuilder wrapSafeArea({bool top = true, bool bottom = true}) =>
      ComponentBuilder._(SafeArea(top: top, bottom: bottom, child: _child!));

  ComponentBuilder wrapExpanded({int flex = 1}) =>
      ComponentBuilder._(Expanded(flex: flex, child: _child!));

  ComponentBuilder wrapFlexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      ComponentBuilder._(Flexible(flex: flex, fit: fit, child: _child!));

  ComponentBuilder wrapSingleChildScrollView(
          {Axis scrollDirection = Axis.vertical}) =>
      ComponentBuilder._(
          SingleChildScrollView(scrollDirection: scrollDirection, child: _child!));

  /// Build işlemi: iOS için Cupertino dönüştürmesi yapılır
  Widget build({required ComponentBuilderDevice device}) {
    assert(_child != null, 'ComponentBuilder.build() called with no child');

    if (device == ComponentBuilderDevice.ios) {
      return _convertToCupertino(_child!);
    }

    return _child!;
  }

  Widget _convertToCupertino(Widget widget) {
    if (widget is Text) {
      return CupertinoTheme(data: const CupertinoThemeData(), child: widget);
    }

    if (widget is SingleChildScrollView) {
      return CupertinoScrollbar(child: _convertToCupertino(widget.child ?? const SizedBox()));
    }

    if (widget is SafeArea) {
      return SafeArea(child: _convertToCupertino(widget.child));
    }

    if (widget is Expanded) {
      return Expanded(flex: widget.flex, child: _convertToCupertino(widget.child));
    }

    if (widget is Flexible) {
      return Flexible(
          flex: widget.flex, fit: widget.fit, child: _convertToCupertino(widget.child));
    }

    // Diğer widgetlar için dönüşüm yok, aynen döner
    return widget;
  }
}
