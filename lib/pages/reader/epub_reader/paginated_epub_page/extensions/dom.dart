import 'package:html/dom.dart';

extension XPathExtension on Element {
  /// Computes the XPath of this element relative to the root of the document.
  String xpath({bool pureXPath = false}) {
    var xpath = _getXPath(this, pureXPath: pureXPath);
    if (!xpath.startsWith('//') && !xpath.startsWith('id(')) {
      xpath = '//$xpath';
    }

    return xpath;
  }

  static String _getXPath(Element? element, {bool pureXPath = false}) {
    if (element == null || element.localName == null) {
      return '';
    }

    // Handle shortcuts (unless pureXPath is requested)
    if (!pureXPath && element.id.isNotEmpty) {
      return 'id("${element.id}")'.cssEscaped;
    }

    if (element.localName == 'body') {
      return 'body';
    }

    final parent = element.parent;
    if (parent == null) {
      return element.localName!.toLowerCase();
    }

    // Count same-tag siblings
    var siblingIndex = 1;
    final tagName = element.localName;

    for (final sibling in parent.children) {
      if (sibling == element) {
        break;
      }
      if (sibling.localName == tagName) {
        siblingIndex++;
      }
    }

    final currentPath = '${element.localName!.toLowerCase()}[$siblingIndex]';
    final parentPath = _getXPath(parent, pureXPath: pureXPath);

    return parentPath.isNotEmpty ? '$parentPath/$currentPath' : currentPath;
  }
}

extension CssEscapeExtension on String {
  String get cssEscaped => replaceAll('"', "'");
}

extension NodeExtensions on Node {
  bool get hasVisibleNodes {
    return isTextOrImage || nodes.any((node) => node.hasVisibleNodes);
  }

  bool get hasText {
    return (this is Text && text != null && text!.trim().isNotEmpty) ||
        (this is Element && nodes.any((node) => node.hasText));
  }

  bool get isTextOrImage {
    return (this is Text && text != null && text!.trim().isNotEmpty) ||
        (this is Element &&
            _imageTags.contains(
              (this as Element).localName,
            ));
  }

  static const _imageTags = {'img', 'svg'};
}
