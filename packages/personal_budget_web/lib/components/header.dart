import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/config.dart';
import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    var activePath = context.url;

    return header([
      nav([
        for (var route in [
          (label: 'Home', path: '/', target: '$basePath/'),
          (label: 'About', path: '/about', target: '$basePath/about'),
        ])
          div(classes: activePath == route.path ? 'active' : null, [
            a(href: route.target, [Component.text(route.label)]),
          ]),
        div([
          a(href: '$basePath/app/', target: Target.blank, [Component.text('App Demo ↗')]),
        ]),
        div([
          a(href: '$basePath/widgetbook/', target: Target.blank, [Component.text('Widgetbook ↗')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header', [
      css('&').styles(
        display: .flex,
        padding: .all(1.em),
        justifyContent: .center,
      ),
      css('nav', [
        css('&').styles(
          display: .flex,
          height: 3.em,
          radius: .all(.circular(10.px)), 
          overflow: .clip,
          justifyContent: .spaceBetween,
          backgroundColor: primaryColor,
        ),
        css('a', [
          css('&').styles(
            display: .flex,
            height: 100.percent,
            padding: .symmetric(horizontal: 2.em),
            alignItems: .center,
            color: Colors.white,
            fontWeight: .w700,
            textDecoration: TextDecoration(line: .none),
          ),
          css('&:hover').styles(
            backgroundColor: const Color('#0005'),
          ),
        ]),
        css('div.active', [
          css('&').styles(position: .relative()),
          css('&::before').styles(
            content: '',
            display: .block,
            position: .absolute(bottom: 0.5.em, left: 20.px, right: 20.px),
            height: 2.px,
            radius: .circular(1.px),
            backgroundColor: Colors.white,
          ),
        ])
      ]),
    ]),
  ];
}
