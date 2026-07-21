# lite_card_flutter

A lightweight Server-Driven UI card rendering engine for Flutter.

Render JSON DSL into Flutter Widget trees — no JS engine, no runtime overhead, just data-driven cards.

[中文文档](./README_CN.md)

## Features

- **JSON DSL → Flutter Widget** — Parse and render cards from a declarative JSON protocol
- **Flexbox Layout** — Full Yoga-compatible layout system (direction, justifyContent, alignItems, gap, padding)
- **Data Binding** — `{{key}}` template expressions with runtime data injection
- **Style System** — Inline styles + named stylesheet references with merge support
- **Action Handling** — Tap, longPress and custom events with callback to host app
- **Zero Dependencies** — Pure Dart, no third-party packages beyond Flutter SDK
- **Cross-Platform DSL** — Same JSON protocol works with C++ LVGL renderer for embedded devices

## Quick Start

```dart
import 'package:lite_card_flutter/lite_card_flutter.dart';

// Parse and render a card
final card = DslParser.parse(jsonString);

// Use in widget tree
LiteCardWidget(
  card: card,
  data: {'title': 'Hello', 'temperature': '26°C'},
  onAction: (action) {
    print('Action: ${action.type}, params: ${action.params}');
  },
)
```

## DSL Example

```json
{
  "version": "1.0.0",
  "root": {
    "type": "view",
    "layout": {
      "direction": "column",
      "padding": [16, 16, 16, 16],
      "gap": 12
    },
    "style": {
      "backgroundColor": "#1E88E5",
      "borderRadius": 16
    },
    "children": [
      {
        "type": "text",
        "content": "{{location}}",
        "style": {"fontSize": 14, "color": "#FFFFFFAA"}
      },
      {
        "type": "view",
        "layout": {"direction": "row", "alignItems": "center", "gap": 16},
        "children": [
          {
            "type": "image",
            "src": "{{iconUrl}}",
            "layout": {"width": 64, "height": 64}
          },
          {
            "type": "text",
            "content": "{{temperature}}°",
            "style": {"fontSize": 48, "color": "#FFFFFF", "fontWeight": "bold"}
          }
        ]
      }
    ]
  },
  "data": {
    "location": "杭州",
    "iconUrl": "https://example.com/sunny.png",
    "temperature": "26"
  }
}
```

## Architecture

```
JSON DSL string
    ↓ DslParser
CardModel (Node tree + styles + data)
    ↓ LiteCardEngine
Flutter Widget tree
```

| Layer | Responsibility |
|-------|---------------|
| **Model** | Data classes: CardModel, NodeModel, LayoutModel, StyleModel, ActionModel |
| **Parser** | JSON string → Model objects (with depth limit & validation) |
| **Engine** | Model → Widget tree (component registry, style resolver) |
| **Components** | Individual widget builders: view, text, image, button, spacer, divider |

## Supported Components

| Type | Description |
|------|-------------|
| `view` | Flex container (Row/Column based on layout.direction) |
| `text` | Text with style and data binding |
| `image` | Network/asset image with placeholder |
| `button` | Tappable button with action |
| `spacer` | Flexible space |
| `divider` | Horizontal divider |

## Related Projects

| Project | Description |
|---------|-------------|
| [lite-card-flutter](https://github.com/card-kit/lite-card-flutter) | Flutter rendering engine (this repo) |
| lite-card-cpp | C++ LVGL + Yoga renderer for watches/glasses (planned) |
| lify | DAG card editor Flutter app (planned) |

## License

MIT
