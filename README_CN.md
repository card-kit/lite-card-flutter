# lite_card_flutter

轻量级 Server-Driven UI 卡片渲染引擎（Flutter 端）。

接收 JSON DSL 描述 → 解析 → 渲染为 Flutter Widget 树。无 JS 引擎、无运行时开销，纯数据驱动。

[English](./README.md)

## 特性

- **JSON DSL → Flutter Widget** — 从声明式 JSON 协议解析并渲染卡片
- **Flexbox 布局** — 完整的 Yoga 兼容布局系统（direction、justifyContent、alignItems、gap、padding）
- **数据绑定** — `{{key}}` 模板表达式，运行时注入数据
- **样式系统** — 内联样式 + 命名样式表引用，支持合并覆盖
- **交互事件** — tap、longPress 等事件回调给宿主 App
- **零第三方依赖** — 纯 Dart 实现，仅依赖 Flutter SDK
- **跨端 DSL** — 同一份 JSON 协议可用于 C++ LVGL 渲染端（手表/眼镜等受限设备）

## 快速上手

```dart
import 'package:lite_card_flutter/lite_card_flutter.dart';

// 解析卡片
final card = DslParser.parse(jsonString);

// 在 Widget 树中使用
LiteCardWidget(
  card: card,
  data: {'title': 'Hello', 'temperature': '26°C'},
  onAction: (action) {
    print('Action: ${action.type}, params: ${action.params}');
  },
)
```

## DSL 示例

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

## 架构

```
JSON DSL 字符串
    ↓ DslParser
CardModel（节点树 + 样式表 + 数据）
    ↓ LiteCardEngine
Flutter Widget 树
```

| 层 | 职责 |
|----|------|
| **Model** | 数据类：CardModel、NodeModel、LayoutModel、StyleModel、ActionModel |
| **Parser** | JSON 字符串 → Model 对象（含深度限制和校验） |
| **Engine** | Model → Widget 树（组件注册表、样式解析器） |
| **Components** | 各组件的 Widget 构建：view、text、image、button、spacer、divider |

## 支持的组件

| 类型 | 说明 |
|------|------|
| `view` | Flex 容器（基于 layout.direction 决定 Row/Column） |
| `text` | 文本，支持样式和数据绑定 |
| `image` | 网络/本地图片，支持占位图 |
| `button` | 可点击按钮，绑定 action |
| `spacer` | 弹性占位 |
| `divider` | 分割线 |

## 相关项目

| 项目 | 说明 |
|------|------|
| [lite-card-flutter](https://github.com/card-kit/lite-card-flutter) | Flutter 渲染端（本仓库） |
| lite-card-cpp | C++ LVGL + Yoga 渲染端，用于手表/眼镜（规划中） |
| lify | DAG 卡片编排端 Flutter App（规划中） |

## 许可证

MIT
