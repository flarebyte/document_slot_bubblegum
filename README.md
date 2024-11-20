# document\_slot\_bubblegum

![Experimental](https://img.shields.io/badge/status-experimental-blue)

> Tiny windows for big infos in Flutter

A Flutter widget for viewing and navigating various document types (rich
text, images, sound, video) with accessibility, i18n, and responsive design.

![Hero image for document\_slot\_bubblegum](doc/document_slot_bubblegum.jpeg)

Highlights:

-   Supports multiple document types, including rich text, images, sound,
    and video.
-   JSON-compatible document schemas with extensibility for future types
    like tables and charts.
-   Browser-like navigation for up to 10 recently viewed documents.
-   Accessible and internationalized UI, with RTL and multilingual support.
-   Slot-based resizing for consistent integration across app layouts.

A few examples:

BubblegumMessageSlot Example:

```dart
BubblegumMessageSlot(
  slot: _infoSlot,
  messages: loopData.slotMessages.current().value,
  options: BubblegumMessageSlotOptsBuilder()
    .setIconCollection(IconRepo.iconCollection)
    .setGroupMessagesByLevel(true)
    .setOnTapHint('Fix the content')
    .setOnMessageTap((message) => setState(() {
      clickCounter++;
    }))
    .build(),
)

```

## Documentation and links

-   [Code Maintenance :wrench:](MAINTENANCE.md)
-   [Code Of Conduct](CODE_OF_CONDUCT.md)
-   [Contributing :busts\_in\_silhouette: :construction:](CONTRIBUTING.md)
-   [Architectural Decision Records :memo:](DECISIONS.md)
-   [Contributors
    :busts\_in\_silhouette:](https://github.com/flarebyte/document_slot_bubblegum/graphs/contributors)
-   [Dependencies](https://github.com/flarebyte/document_slot_bubblegum/network/dependencies)
-   [Glossary
    :book:](https://github.com/flarebyte/overview/blob/main/GLOSSARY.md)
-   [Software engineering principles
    :gem:](https://github.com/flarebyte/overview/blob/main/PRINCIPLES.md)
-   [Overview of Flarebyte.com ecosystem
    :factory:](https://github.com/flarebyte/overview)
-   [Dart dependencies](DEPENDENCIES.md)
-   [Usage](USAGE.md)
-   [Example](example/example.dart)

## Related

-   [slotboard\_copperframe](https://github.com/flarebyte/slotboard_copperframe)
