// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:personal_budget_web/components/header.dart' as _header;
import 'package:personal_budget_web/constants/theme.dart' as _theme;
import 'package:personal_budget_web/pages/about.dart' as _about;
import 'package:personal_budget_web/pages/home.dart' as _home;
import 'package:personal_budget_web/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _header.Header: ClientTarget<_header.Header>('header'),
    _about.About: ClientTarget<_about.About>('about'),
    _home.Home: ClientTarget<_home.Home>('home'),
  },
  styles: () => [
    ..._theme.styles,
    ..._app.App.styles,
    ..._header.Header.styles,
    ..._about.About.styles,
    ..._home.Home.styles,
  ],
);
