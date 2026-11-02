import 'package:html/dom.dart' as dom;
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/preprocessing/epub_page_preprocessor_operation.dart';
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/epub_html_constants.dart';

/// Assigns a 0-based preorder index to every element in the tree.
///
/// The index is written to [EpubHtmlConstants.nodeIndexAttribute].
final class NodeIndexingOperation extends EpubPagePreprocessorOperation {
  var _nextIndex = 0;

  @override
  void start(dom.DocumentFragment root) {
    _nextIndex = 0;
  }

  @override
  void enter(dom.Element element) {
    element.attributes[EpubHtmlConstants.nodeIndexAttribute] =
        '${_nextIndex++}';
  }
}
