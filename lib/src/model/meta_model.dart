/// MetaModel — 卡片元信息
///
/// 渲染引擎不直接使用这些信息，但透传给宿主 App。
/// 用于卡片管理、缓存、分发等平台层功能。
class MetaModel {
  /// 卡片唯一标识，推荐反向域名格式（如 "com.cardkit.weather"）
  final String? id;

  /// 人类可读名称
  final String? name;

  /// 卡片版本
  final String? version;

  /// 作者
  final String? author;

  /// 最低渲染引擎版本
  final String? minEngineVersion;

  /// 能力声明
  final List<String>? permissions;

  /// 目标平台
  final List<String>? platform;

  const MetaModel({
    this.id,
    this.name,
    this.version,
    this.author,
    this.minEngineVersion,
    this.permissions,
    this.platform,
  });
}
