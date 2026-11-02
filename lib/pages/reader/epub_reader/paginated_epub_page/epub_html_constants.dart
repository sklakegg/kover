/// HTML attributes and classes used internally by the paginated EPUB pipeline.
///
/// Kept inside the subtree so the pipeline can be extracted as a standalone
/// library.
sealed class EpubHtmlConstants {
  static const String kavitaWrapperClass = 'book-content';
  static const String koverWrapperClass = 'kover-content';
  static const String scrollIdAttribute = 'scroll-id';
  static const String textIndentAttribute = 'text-indent-applied';
  static const String splitParagraphAttribute = 'split-paragraph';
  static const String splitStartAttribute = 'split-start';
  static const String splitEndAttribute = 'split-end';
  static const String nodeIndexAttribute = 'kover-node-index';
  static const String resumeClass = 'epub-resume';
}
