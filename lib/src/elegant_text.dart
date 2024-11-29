/// Represents a fragment with text and associated options.
class CopperframeElegantFragment {
  /// Options associated with the fragment. Ex: bold, italic, RTL, icon, ...
  final List<String> options;

  /// Text content of the fragment.
  final String text;

  /// Creates an immutable instance of [CopperframeElegantFragment].
  const CopperframeElegantFragment({
    required this.options,
    required this.text,
  });

  /// Creates a [CopperframeElegantFragment] from a JSON object.
  factory CopperframeElegantFragment.fromJson(Map<String, dynamic> json) {
    return CopperframeElegantFragment(
      options: List<String>.from(json['options']),
      text: json['text'],
    );
  }

  /// Converts the [CopperframeElegantFragment] to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'options': options,
      'text': text,
    };
  }
}

/// Represents a row containing multiple fragments and associated options.
class CopperframeElegantRow {
  /// Options associated with the row. Ex: h1, h2, ..., quote, code, bullet, icon,
  final List<String> options;

  /// List of fragments contained in the row.
  final List<CopperframeElegantFragment> fragments;

  /// Creates an immutable instance of [CopperframeElegantRow].
  const CopperframeElegantRow({
    required this.options,
    required this.fragments,
  });

  /// Creates a [CopperframeElegantRow] from a JSON object.
  factory CopperframeElegantRow.fromJson(Map<String, dynamic> json) {
    return CopperframeElegantRow(
      options: List<String>.from(json['options']),
      fragments: (json['fragments'] as List)
          .map((fragment) => CopperframeElegantFragment.fromJson(
              fragment as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts the [CopperframeElegantRow] to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'options': options,
      'fragments': fragments.map((fragment) => fragment.toJson()).toList(),
    };
  }
}

/// Represents a text structure containing multiple rows and associated options.
class CopperframeElegantSection {
  /// Options associated with the text. Ex: title, description, copyright, license, ...dc core metadata,
  final List<String> options;

  /// List of rows contained in the text.
  final List<CopperframeElegantRow> rows;

  /// Creates an immutable instance of [CopperframeElegantSection].
  const CopperframeElegantSection({
    required this.options,
    required this.rows,
  });

  /// Creates a [CopperframeElegantSection] from a JSON object.
  factory CopperframeElegantSection.fromJson(Map<String, dynamic> json) {
    return CopperframeElegantSection(
      options: List<String>.from(json['options']),
      rows: (json['rows'] as List)
          .map((row) =>
              CopperframeElegantRow.fromJson(row as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts the [CopperframeElegantSection] to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'options': options,
      'rows': rows.map((row) => row.toJson()).toList(),
    };
  }
}
