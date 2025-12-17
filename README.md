<div align="center">

# 🧱 Component Builder

**A fluent, immutable Component Builder pattern for Flutter.**

[![pub package](https://img.shields.io/pub/v/component_builder.svg?color=blue)](https://pub.dev/packages/component_builder)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

<p>Dramatically reduces widget tree nesting complexity and enables <b>device-aware rendering</b> at build time.</p>

[Quick Start](#core-idea) • [Device-Aware](#device-aware-rendering-v2-feature) • [Philosophy](#philosophy)

</div>

---

## 🚀 Why Component Builder Exists

Flutter’s declarative UI is powerful, but deeply nested widget trees quickly become hard to read and maintain:

<table>
<tr>
<th>The Old Way (Nesting)</th>
<th>The ComponentBuilder Way (Fluent)</th>
</tr>
<tr>
<td>

```dart
SafeArea(
  child: Expanded(
    child: SingleChildScrollView(
      child: Text('Hello'),
    ),
  ),
);
```dart
DartComponentBuilder()
  .child(const Text('Hello'))
  .wrapSafeArea()
  .wrapExpanded()
  .wrapSingleChildScrollView()
  .build();
```
</table>This visual nesting forces developers to mentally parse layout structure instead of focusing on intent. ComponentBuilder flips the mental model.💡 Core IdeaInstead of nesting widgets, you progressively wrap a component using a builder-style API.Dartfinal widget = ComponentBuilder()
  .child(const Text('Hello'))
  .wrapSafeArea()
  .wrapExpanded()
  .wrapSingleChildScrollView()
  .build(device: COMPONENT_BUILDER_DEVICES.Android);
Readable. Predictable. IDE-friendly.📱 Device-Aware Rendering (v2 Feature)ComponentBuilder can render the same widget tree differently depending on the target platform at build time.Dart.build(device: COMPONENT_BUILDER_DEVICES.IoS);
What happens on iOS?🛠️ Layout widgets are preserved.📜 Scroll views are adapted to CupertinoScrollbar.🔄 The structure is recursively transformed.⚡ No runtime platform checks or magic context dependencies.🛠 Supported Wrap MethodsEvery operation is immutable and returns a new ComponentBuilder instance.wrapSafeArea()wrapExpanded()wrapFlexible()wrapSingleChildScrollView()Immutability by DesignDartfinal base = ComponentBuilder().child(Text('Hello'));

final a = base.wrapSafeArea(); // a is new
final b = base.wrapExpanded(); // b is new, base remains untouched
⚖️ Platform Conversion PhilosophyComponentBuilder does not attempt full Material ↔ Cupertino parity. Instead:Structural widgets are adapted.Visual widgets are left untouched.Conversion is explicit and deterministic.🎯 When To Use This✅ Ideal Use Cases❌ Avoid Using ForDesign systems & primitivesVery small, one-off widgetsCross-platform screensPerformance-critical micro-widgetsComplex widget compositionSimple, flat layouts📝 Example: Real-World CompositionDartWidget buildCard() {
  return ComponentBuilder()
    .child(
      Container(
        padding: const EdgeInsets.all(16),
        child: const Text('Card Content'),
      ),
    )
    .wrapSafeArea()
    .wrapSingleChildScrollView()
    .build(device: COMPONENT_BUILDER_DEVICES.IoS);
}
🧪 TestingComponentBuilder is fully testable using flutter_test. No mocks or platform channels required.Dartexpect(find.byType(CupertinoScrollbar), findsOneWidget);
📜 LicenseLicensed under the MIT License.🧠 Philosophy"ComponentBuilder is not a shortcut. It is a discipline."It trades raw nesting for intention-revealing structure, and treats platform differences as a build-time concern—not a runtime accident.<div align="center">Built with ❤️ for the Flutter Community</div>
