import 'package:equatable/equatable.dart';

enum PaginatedEpubPageMode { horizontal, vertical, spreads }

enum PaginatedEpubPageTextAlignment { left, right, justify, center }

/// Settings consumed by the paginated EPUB rendering pipeline.
///
/// This type is part of the standalone paginated EPUB subtree and must not
/// depend on app-level settings providers.
class const PaginatedEpubPageSettings({
  required final double horizontalMarginSize,
  required final double verticalMarginSize,
  required final double fontSize,
  required final double paragraphSpacing,
  required final double lineHeight,
  required final double wordSpacing,
  required final double letterSpacing,
  required final String? fontFamily,
  required final bool removeParagraphIndent,
  required final PaginatedEpubPageTextAlignment textAlignment,
  required final PaginatedEpubPageMode mode,
}) extends Equatable {
  @override
  List<Object?> get props => [
    horizontalMarginSize,
    verticalMarginSize,
    fontSize,
    paragraphSpacing,
    lineHeight,
    wordSpacing,
    letterSpacing,
    fontFamily,
    removeParagraphIndent,
    textAlignment,
    mode,
  ];
}
