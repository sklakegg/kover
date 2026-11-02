import 'package:html/dom.dart' as dom;
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/epub_html_constants.dart';
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/preprocessing/epub_page_preprocessor_operation.dart';

/// Marks the resume paragraph with a class so the stylesheet can highlight it.
final class ResumeHighlightOperation extends EpubPagePreprocessorOperation {
  ResumeHighlightOperation({
    required this.scrollId,
    this.className = EpubHtmlConstants.resumeClass,
  });

  final String? scrollId;
  final String className;

  @override
  void enter(dom.Element element) {
    final scrollId = this.scrollId;
    if (scrollId == null) return;

    if (element.attributes[EpubHtmlConstants.scrollIdAttribute] == scrollId) {
      element.classes.add(className);
    }
  }
}
