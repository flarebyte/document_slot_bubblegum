/// A Flutter widget for a simplified document browser with the following features:
///
/// - **Supported Document Types**:
///   - Rich Text: Styled rows with text fragments, headers, quotes, lists, and hyperlinks.
///   - Media: Images, sound, and video with metadata like copyright and accessibility info.
///   - Extensible: Future support for additional types like tables or charts.
///
/// - **Navigation**:
///   - Back and forth navigation for up to 10 recently viewed documents.
///   - Hyperlinks to navigate between documents.
///   - Clear indication of the newest and oldest documents.
///
/// - **Serialization**:
///   - Documents use a JSON-compatible schema with common metadata (e.g., title)
///     and type-specific details.
///
/// - **UI Features**:
///   - Accessible and internationalized, supporting RTL and multiple languages.
///   - Responsive layout using slot-based resizing (e.g., via slotboard_copperframe).
///
/// - **Limitations**:
///   - Read-only documents (no editing).
///   - No tab-based navigation to keep the UI clean.
///   - Rich text uses a simplified, opinionated schema for styling.
///
/// This widget provides an extensible and user-friendly solution for viewing and
/// navigating various types of documents in a consistent and accessible manner.

library document_slot_bubblegum;

export 'src/document_slot_material.dart';
export 'src/elegant_text.dart';
