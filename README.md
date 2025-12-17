# Component Builder

A fluent Component Builder pattern for Flutter that reduces widget nesting
complexity by providing readable, chainable wrapper methods.

## Motivation

Flutter widget trees can become deeply nested and hard to read:

```dart
SafeArea(
  child: Expanded(
    child: SingleChildScrollView(
      child: Text('Hello'),
    ),
  ),
);


final widget = ComponentBuilder()
  .child(const Text('Hello'))
  .wrapSafeArea()
  .wrapExpanded()
  .wrapSingleChildScrollView()
  .build();


Features

Fluent builder API

Immutable widget composition

Reduces visual nesting

IDE-friendly and readable

License

MIT


⚠️ Önemli:
- `TODO`  
- `example text`  
- `package template`  

**Hiçbiri kalmayacak.**

---

### 2️⃣ Tekrar publish et



flutter pub publish


Bu sefer:
- dependency uyarıları yine çıkabilir → **önemsiz**
- LICENSE → geçer
- README → geçer
- Paket → **yayınlanır**

---

## Son durum

Bu publish geçerse:
- `component_builder` pub.dev’de **resmen listelenir**
- Başka projelerde şu satır **çalışır**:

```yaml
dependencies:
  component_builder: ^0.0.1