import 'package:flutter_test/flutter_test.dart';
import 'package:kover/pages/reader/epub_reader/paginated_epub_page/paginated_epub_page_settings.dart';
import 'package:kover/pages/reader/epub_reader/paginated_epub_page_provider.dart';
import 'package:kover/riverpod/providers/settings/epub_reader_settings.dart';

void main() {
  test('maps reader settings to paginated page settings', () {
    const settings = EpubReaderSettingsState(
      horizontalMarginSize: 12,
      verticalMarginSize: 18,
      fontSize: 20,
      paragraphSpacing: 1.2,
      lineHeight: 1.8,
      wordSpacing: 2,
      letterSpacing: 1,
      fontFamily: 'Book Font',
      highlightResumePoint: false,
      removeParagraphIndent: true,
      textAlignment: .justify,
      mode: .spreads,
    );

    final mapped = paginatedEpubPageSettings(settings);

    expect(mapped.horizontalMarginSize, 12);
    expect(mapped.verticalMarginSize, 18);
    expect(mapped.fontSize, 20);
    expect(mapped.paragraphSpacing, 1.2);
    expect(mapped.lineHeight, 1.8);
    expect(mapped.wordSpacing, 2);
    expect(mapped.letterSpacing, 1);
    expect(mapped.fontFamily, 'Book Font');
    expect(mapped.removeParagraphIndent, isTrue);
    expect(mapped.textAlignment, PaginatedEpubPageTextAlignment.justify);
    expect(mapped.mode, PaginatedEpubPageMode.spreads);
  });
}
