/// ActionModel — 交互事件定义
///
/// 对应 JSON 中的 actions:
/// {
///   "onTap": {
///     "type": "navigate",
///     "params": {"target": "detail_page", "id": "123"}
///   }
/// }
///
/// 不同 action type 的 params 约定：
/// - navigate: {"target": "page_name", ...extraParams}
/// - openUrl: {"url": "https://..."}
/// - refresh: {} (无参数)
/// - showMenu: {"items": [...]}
/// - custom: {"name": "eventName", ...extraParams}
/// - callSkill: {"skillId": "xxx", ...extraParams}
class ActionModel {
  /// 动作类型：navigate | openUrl | refresh | showMenu | custom | callSkill
  final String type;

  /// 参数，不同 type 有不同的 key 约定
  /// 用 Map 统一存储，保持扩展性
  final Map<String, dynamic> params;

  const ActionModel({required this.type, this.params = const {}});
}
