import 'package:jaspr/dom.dart';

// As your CSS styles are defined using just Dart, you can simply
// use global variables or methods for common things like colors.
const primaryColor = Color('#01589B');

// Defines the global CSS styles for this project.
//
// By using the @css annotation, these will be rendered automatically to CSS and included in your page.
@css
List<StyleRule> get styles => [
  css.import('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Outfit:wght@500;600;700;800&display=swap'),
  css('html, body').styles(
    width: 100.percent,
    minHeight: 100.vh,
    padding: .zero,
    margin: .zero,
    backgroundColor: const Color('#F9FAFD'),
    fontFamily: const .list([FontFamily('Inter'), FontFamilies.sansSerif]),
    color: const Color('#1A1C1E'),
  ),
  css('h1, h2, h3, h4').styles(
    fontFamily: const .list([FontFamily('Outfit'), FontFamilies.sansSerif]),
    margin: .zero,
  ),
];
