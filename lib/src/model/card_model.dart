import 'meta_model.dart';
import 'node_model.dart';
import 'style_model.dart';

/// CardModel — DSL 卡片的顶层数据结构
///
/// 对应 JSON 的最外层：
/// {
///   "version": "1.0.0",
///   "meta": {...},
///   "root": {...},       ← 组件树根节点
///   "data": {...},       ← 默认数据（数据绑定 fallback）
///   "styles": {...}      ← 命名样式表
/// }
class CardModel {
  // DSL 协议版本号（如 "1.0.0"），用于兼容性判断
  final String dslVersion;

  // 卡片元信息（id、名称、权限等），可选
  final MetaModel? meta;

  // 组件树根节点
  final NodeModel root;

  // 默认数据，作为 {{key}} 绑定的 fallback
  final Map<String, dynamic> data;

  // 命名样式表，供 styleRef 引用
  final Map<String, StyleModel> styles;

  // 命名样式表，供 styleRef 引用
  const CardModel({
    required this.dslVersion,
    this.meta,
    required this.root,
    this.data = const {},
    this.styles = const {},
  });
}
