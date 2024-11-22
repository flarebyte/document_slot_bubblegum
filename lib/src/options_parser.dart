import 'package:args/args.dart';

/// Enumeration for text direction options
enum TextDirection { rtl, ltr, auto, notSupported }

/// A class representing the options for a Bubblegum Elegant Fragment
class BubblegumElegantFragmentOptions {
  /// Language code for the fragment (e.g., 'en', 'es')
  String? language;

  /// Direction of the text (RTL, LTR, auto)
  TextDirection? direction;

  /// Whether the text is bold
  bool bold;

  /// Whether the text is italic
  bool italic;

  /// Icon name for the start of the text
  String? iconStart;

  /// Icon name for the end of the text
  String? iconEnd;

  /// Tooltip text for the fragment
  String? tooltip;

  /// Unique identifier for the text fragment
  String? id;

  /// Caption for an associated button
  String? buttonCaption;

  /// Icon name for an associated button
  String? buttonIcon;

  /// Constructor for creating an instance of BubblegumElegantFragmentOptions
  BubblegumElegantFragmentOptions({
    this.language,
    this.direction,
    this.bold = false,
    this.italic = false,
    this.iconStart,
    this.iconEnd,
    this.tooltip,
    this.id,
    this.buttonCaption,
    this.buttonIcon,
  });

  /// Sets the text direction for the fragment
  void setDirection(String? direction) {
    switch (direction) {
      case "RTL":
        this.direction = TextDirection.rtl;
        break;
      case "LTR":
        this.direction = TextDirection.ltr;
        break;
      case "auto":
        this.direction = TextDirection.auto;
        break;
      default:
        this.direction = TextDirection.notSupported;
    }
  }

  /// Checks if the language field has a value
  bool hasLanguage() => language != null;

  /// Checks if the direction field has a value
  bool hasDirection() => direction != null;

  /// Checks if the iconStart field has a value
  bool hasIconStart() => iconStart != null;

  /// Checks if the iconEnd field has a value
  bool hasIconEnd() => iconEnd != null;

  /// Checks if the tooltip field has a value
  bool hasTooltip() => tooltip != null;

  /// Checks if the id field has a value
  bool hasId() => id != null;

  /// Checks if the buttonCaption field has a value
  bool hasButtonCaption() => buttonCaption != null;

  /// Checks if the buttonIcon field has a value
  bool hasButtonIcon() => buttonIcon != null;

  /// Factory method to create an instance of BubblegumElegantFragmentOptions from a list of command line arguments
  static BubblegumElegantFragmentOptions fromArgs(List<String> options) {
    var parser = ArgParser()
      ..addOption('language')
      ..addOption('direction')
      ..addFlag('bold', defaultsTo: false)
      ..addFlag('italic', defaultsTo: false)
      ..addOption('icon-start')
      ..addOption('icon-end')
      ..addOption('tooltip')
      ..addOption('id')
      ..addOption('button-caption')
      ..addOption('button-icon');

    var results = parser.parse(options);

    return BubblegumElegantFragmentOptions(
      language: results['language'],
      direction: results['direction'] != null
          ? _parseDirection(results['direction'])
          : null,
      bold: results['bold'],
      italic: results['italic'],
      iconStart: results['icon-start'],
      iconEnd: results['icon-end'],
      tooltip: results['tooltip'],
      id: results['id'],
      buttonCaption: results['button-caption'],
      buttonIcon: results['button-icon'],
    );
  }

  /// Helper method to parse a string into a [TextDirection] enum value
  static TextDirection _parseDirection(String direction) {
    switch (direction) {
      case "RTL":
        return TextDirection.rtl;
      case "LTR":
        return TextDirection.ltr;
      case "auto":
        return TextDirection.auto;
      default:
        return TextDirection.notSupported;
    }
  }

  @override
  String toString() {
    return 'BubblegumElegantFragmentOptions{language: $language, direction: $direction, bold: $bold, italic: $italic, iconStart: $iconStart, iconEnd: $iconEnd, tooltip: $tooltip, id: $id, buttonCaption: $buttonCaption, buttonIcon: $buttonIcon}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BubblegumElegantFragmentOptions &&
          runtimeType == other.runtimeType &&
          language == other.language &&
          direction == other.direction &&
          bold == other.bold &&
          italic == other.italic &&
          iconStart == other.iconStart &&
          iconEnd == other.iconEnd &&
          tooltip == other.tooltip &&
          id == other.id &&
          buttonCaption == other.buttonCaption &&
          buttonIcon == other.buttonIcon;

  @override
  int get hashCode =>
      language.hashCode ^
      direction.hashCode ^
      bold.hashCode ^
      italic.hashCode ^
      iconStart.hashCode ^
      iconEnd.hashCode ^
      tooltip.hashCode ^
      id.hashCode ^
      buttonCaption.hashCode ^
      buttonIcon.hashCode;
}

/// Enum representing the different types of rows available.
/// Possible values are: h1, h2, quote, code, bullet, icon, image.
enum RowType { h1, h2, h3, h4, quote, code, bullet, icon, image }

/// A class representing the options available for a row in BubblegumElegant.
class BubblegumElegantRowOptions {
  /// Row type indicating the type of the row. This can be one of the following:
  /// - h1: Header level 1
  /// - h2: Header level 2
  /// - quote: A blockquote
  /// - code: A code block
  /// - bullet: A bullet point
  /// - icon: An icon element
  /// - image: An image element
  final RowType rowType;

  /// The icon associated with the row, if applicable.
  /// This is used when the `rowType` is set to `icon`.
  final String? icon;

  /// The URL of the image associated with the row, if applicable.
  /// This is used when the `rowType` is set to `image`.
  final String? imageUrl;

  /// The label for the image, if applicable.
  /// This can be used as an alt text or description for the image.
  final String? imageLabel;

  /// The type of bullet used for the bullet row, if applicable.
  /// This is used when the `rowType` is set to `bullet`.
  final String? bulletType;

  /// Constructs an instance of [BubblegumElegantRowOptions].
  ///
  /// [rowType] is required to determine the type of row to create.
  /// [icon], [imageUrl], [imageLabel], and [bulletType] are optional fields
  /// that can be used based on the row type.
  BubblegumElegantRowOptions({
    required this.rowType,
    this.icon,
    this.imageUrl,
    this.imageLabel,
    this.bulletType,
  });

  /// Static method to create an instance of [BubblegumElegantRowOptions] from
  /// command line arguments.
  ///
  /// The arguments list should contain options like `--rowType`, `--icon`,
  /// `--imageUrl`, `--imageLabel`, and `--bulletType` to configure the row.
  ///
  /// Example usage:
  /// ```dart
  /// var options = BubblegumElegantRowOptions.fromArgs(['--rowType', 'h1', '--icon', 'example_icon']);
  /// ```
  static BubblegumElegantRowOptions fromArgs(List<String> args) {
    final parser = ArgParser()
      ..addOption('rowType',
          allowed:
              RowType.values.map((e) => e.toString().split('.').last).toList(),
          mandatory: true)
      ..addOption('icon')
      ..addOption('imageUrl')
      ..addOption('imageLabel')
      ..addOption('bulletType');

    final result = parser.parse(args);

    return BubblegumElegantRowOptions(
      rowType: RowType.values
          .firstWhere((e) => e.toString().split('.').last == result['rowType']),
      icon: result['icon'],
      imageUrl: result['imageUrl'],
      imageLabel: result['imageLabel'],
      bulletType: result['bulletType'],
    );
  }

  @override
  String toString() {
    return 'BubblegumElegantRowOptions{rowType: $rowType, icon: $icon, imageUrl: $imageUrl, imageLabel: $imageLabel, bulletType: $bulletType}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BubblegumElegantRowOptions &&
          runtimeType == other.runtimeType &&
          rowType == other.rowType &&
          icon == other.icon &&
          imageUrl == other.imageUrl &&
          imageLabel == other.imageLabel &&
          bulletType == other.bulletType;

  @override
  int get hashCode =>
      rowType.hashCode ^
      icon.hashCode ^
      imageUrl.hashCode ^
      imageLabel.hashCode ^
      bulletType.hashCode;
}

/// A class representing the options available for text in BubblegumElegant.
class BubblegumElegantTextOptions {
  /// The title associated with the text.
  final String title;

  /// A description of the text content.
  final String? description;

  /// The copyright information for the text.
  final String? copyright;

  /// The license associated with the text.
  final String? license;

  /// Constructs an instance of [BubblegumElegantTextOptions].
  ///
  /// [title] is required to identify the text content.
  /// [description], [copyright], and [license] are optional fields that can provide additional information.
  BubblegumElegantTextOptions({
    required this.title,
    this.description,
    this.copyright,
    this.license,
  });

  /// Static method to create an instance of [BubblegumElegantTextOptions] from
  /// command line arguments.
  ///
  /// The arguments list should contain options like `--title`, `--description`,
  /// `--copyright`, and `--license` to configure the text.
  ///
  /// Example usage:
  /// ```dart
  /// var textOptions = BubblegumElegantTextOptions.fromArgs(['--title', 'My Title', '--description', 'This is a description']);
  /// ```
  static BubblegumElegantTextOptions fromArgs(List<String> args) {
    final parser = ArgParser()
      ..addOption('title', mandatory: true)
      ..addOption('description')
      ..addOption('copyright')
      ..addOption('license');

    final result = parser.parse(args);

    return BubblegumElegantTextOptions(
      title: result['title'],
      description: result['description'],
      copyright: result['copyright'],
      license: result['license'],
    );
  }

  @override
  String toString() {
    return 'BubblegumElegantTextOptions{title: $title, description: $description, copyright: $copyright, license: $license}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BubblegumElegantTextOptions &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          copyright == other.copyright &&
          license == other.license;

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      copyright.hashCode ^
      license.hashCode;
}
