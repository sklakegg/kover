import 'package:html/dom.dart' as dom;
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/preprocessing/epub_page_preprocessor_operation.dart';
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/extensions/dom.dart';
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/epub_html_constants.dart';

final class ScrollIdOperation extends EpubPagePreprocessorOperation {
  @override
  void enter(dom.Element element) {
    element.attributes[EpubHtmlConstants.scrollIdAttribute] = element.xpath();
  }
}
