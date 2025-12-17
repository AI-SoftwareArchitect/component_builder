<div align="center">

# 🧱 Component Builder

**A fluent, immutable Component Builder pattern for Flutter.**

[![pub package](https://img.shields.io/pub/v/component_builder.svg?color=blue)](https://pub.dev/packages/component_builder)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**PUB.DEV**: https://pub.dev/packages/component_builder
```bash
component_builder: ^0.0.2
````
Dramatically reduces widget tree nesting complexity and enables **device-aware rendering** at build time.

[Quick Start](#-core-idea) • [Device-Aware](#-device-aware-rendering-v2-feature) • [Philosophy](#-philosophy)

</div>

---

## 🚀 Why Component Builder Exists

Flutter’s declarative UI is powerful, but deeply nested widget trees quickly become hard to read and maintain. **ComponentBuilder flips the mental model.**

### Comparison

| The Old Way (Deep Nesting) | The ComponentBuilder Way (Fluent) |
| :--- | :--- |
| ```dart
SafeArea(
  child: Expanded(
    child: SingleChildScrollView(
      child: Text('Hello'),
    ),
  ),
);
``` | ```dart
ComponentBuilder()
  .child(const Text('Hello'))
  .wrapSafeArea()
  .wrapExpanded()
  .wrapSingleChildScrollView()
  .build();
``` |

> Visual nesting forces developers to mentally parse layout structure instead of focusing on intent.

---

## 💡 Core Idea

Instead of nesting widgets, you progressively wrap a component using a builder-style API. It’s readable, predictable, and IDE-friendly.

```dart
final widget = ComponentBuilder()
  .child(const Text('Hello'))
  .wrapSafeArea()
  .wrapExpanded()
  .wrapSingleChildScrollView()
  .build(device: COMPONENT_BUILDER_DEVICES.Android);
