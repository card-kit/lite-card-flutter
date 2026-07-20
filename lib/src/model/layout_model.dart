/// LayoutModel — 节点的布局属性
///
/// 对齐 Yoga/Flexbox 模型。每个节点天然是 flex 节点。
///
/// 容器属性（控制子节点排列）：
///   direction, justifyContent, alignItems, flexWrap, gap, padding
///
/// 自身属性（自己在父容器中的表现）：
///   flex, alignSelf, margin, width, height, ...
class LayoutModel {
  // --- 容器属性（有 children 时生效） ---

  /// 主轴方向：row | column
  final String? direction;

  /// 主轴对齐：start | center | end | spaceBetween | spaceAround | spaceEvenly
  final String? justifyContent;

  /// 交叉轴对齐：start | center | end | stretch | baseline
  final String? alignItems;

  /// 是否换行：nowrap | wrap
  final String? flexWrap;

  /// 子节点间距
  final double? gap;

  /// 内边距 [top, right, bottom, left]
  final List<double>? padding;

  // --- 自身属性（在父容器中的表现） ---

  /// flex grow 值
  final double? flex;

  /// 覆盖父容器的 alignItems：auto | start | center | end | stretch
  final String? alignSelf;

  /// 外边距 [top, right, bottom, left]
  final List<double>? margin;

  // --- 尺寸属性 ---

  /// 宽度：数值(px) 或 "match_parent" 或 "wrap_content"
  final dynamic width;

  /// 高度：数值(px) 或 "match_parent" 或 "wrap_content"
  final dynamic height;

  /// 最小宽度
  final double? minWidth;

  /// 最大宽度
  final double? maxWidth;

  /// 最小高度
  final double? minHeight;

  /// 最大高度
  final double? maxHeight;

  /// 宽高比
  final double? aspectRatio;

  const LayoutModel({
    this.direction,
    this.justifyContent,
    this.alignItems,
    this.flexWrap,
    this.gap,
    this.padding,
    this.flex,
    this.alignSelf,
    this.margin,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.aspectRatio,
  });
}
