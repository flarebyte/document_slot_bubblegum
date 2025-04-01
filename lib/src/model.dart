class CopperframeDocumentPlaceholder {
  String title;
  String kind;
  String summary;
  String bgStyle;
  String height;
  String width;
}

class CopperframeDocumentLocators {
  String main;
  String preview;
}

class CopperframeDocumentSection {
  String kind;
  CopperframeDocumentPlaceholder placeholder;
  CopperframeDocumentLocators locators;
  String updateFrequency;
}

class CopperframeDocumentRow {
  List<CopperframeDocumentSection> sections;
}

class CopperframeDocument {
  String title;
  List<CopperframeDocumentRow> rows;
}
