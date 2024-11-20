class CopperframePage<C> {
  final String id;
  final String headline;
  final String breadcrumb;
  final String description;
  final String pageType;
  final List<String> relatedLinks;
  final List<String> significantLinks;
  final String rights;
  final C body;
}

class CopperframeElegantRow {

}
class CopperframeElegantText {
  final List<CopperframeElegantRow> rows;

}