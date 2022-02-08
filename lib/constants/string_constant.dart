String formatHtmlString(String string) {
  return string
      .replaceAll("<p>", "")
      .replaceAll("</p>", "")
      .replaceAll("Dean&#8217;s", "") // Paragraphs
      .replaceAll("&#8217;s", "")
      .replaceAll("<p>", "")
      .replaceAll("[&hellip;]", "")
      .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')
      .trim(); // Whitespace
}
