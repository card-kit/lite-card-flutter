/// StyleModel — 节点的视觉样式
///
/// 控制外观（颜色、字体、圆角、边框等），不控制位置尺寸。
/// 位置尺寸由 LayoutModel 负责。
class StyleModel {
  // --- 通用视觉属性 ---

  /// 背景色：#RRGGBB 或 #AARRGGBB
  final String? backgroundColor;

  /// 圆角：单值或 [topLeft, topRight, bottomRight, bottomLeft]
  final dynamic borderRadius;

  /// 边框宽度
  final double? borderWidth;

  /// 边框颜色
  final String? borderColor;

  /// 透明度 0~1
  final double? opacity;

  // --- 文本样式属性 ---

  /// 字号
  final double? fontSize;

  /// 文字颜色
  final String? color;

  /// 字重：normal | bold | 100~900
  final String? fontWeight;

  /// 字体
  final String? fontFamily;

  /// 文本对齐：start | center | end
  final String? textAlign;

  /// 行高（倍数）
  final double? lineHeight;

  /// 字间距
  final double? letterSpacing;

  const StyleModel({
    this.backgroundColor,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.opacity,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.textAlign,
    this.lineHeight,
    this.letterSpacing,
  });
}
