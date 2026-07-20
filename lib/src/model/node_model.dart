import 'style_model.dart';
import 'layout_model.dart';
import 'action_mode.dart';

/// NodeModel — 组件树中的单个节点
/// 对应 JSON 中的每个节点对象：
/// {
///   "type": "view",          ← 组件类型
///   "layout": {...},         ← 布局属性（Flexbox）
///   "style": {...},          ← 内联视觉样式
///   "styleRef": "title",     ← 引用 styles 表中的命名样式
///   "children": [...],       ← 子节点（仅容器类型有）
///   "actions": {...},        ← 交互事件
///   ...其他组件特有属性
/// }
class NodeModel {
  // 组件类型：view, text, image, button, spacer, divider
  final String type;

  // 布局属性（Flexbox），控制位置和尺寸
  final LayoutModel? layout;

  // 内联视觉样式
  final StyleModel? style;

  // 引用 styles 表中的命名样式
  final String? styleRef;

  // 子节点列表（仅 view 等容器类型有）
  final List<NodeModel> children;

  // 交互事件绑定
  final Map<String, ActionModel>? actions;

  // 组件特有属性（text 的 content、image 的 src 等）
  // 用 Map 存储，不同组件类型有不同的属性
  final Map<String, dynamic> props;

  const NodeModel({
    required this.type,
    this.layout,
    this.style,
    this.styleRef,
    this.children = const [],
    this.actions,
    this.props = const {},
  });

  /// 快捷访问：获取 text 组件的 content
  String? get content => props['content'] as String?;

  /// 快捷访问：获取 image 组件的 src
  String? get src => props['src'] as String?;

  /// 快捷访问：获取 text 组件的 maxLines
  int? get maxLines => props['maxLines'] as int?;

  /// 快捷访问：获取 image 组件的 fit
  String? get fit => props['fit'] as String?;

  /// 快捷访问：获取 button 组件的 label
  String? get label => props['label'] as String?;
}
