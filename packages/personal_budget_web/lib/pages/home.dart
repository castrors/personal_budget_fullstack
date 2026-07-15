import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'landing-page', [
      // 1. Hero Section
      div(classes: 'hero', [
        div(classes: 'hero-text', [
          span(classes: 'badge', [text('✨ Antigravity Budget Full-Stack')]),
          h1([text('Gerencie seu orçamento com estilo e simplicidade')]),
          p([
            text(
              'O Antigravity Budget une o design Bento moderno ao Material Design 3, oferecendo um controle financeiro pessoal incrivelmente elegante e 100% open-source.'
            )
          ]),
          div(classes: 'hero-actions', [
            a(
              classes: 'btn btn-primary',
              href: 'https://github.com/castrors/personal_budget_fullstack',
              target: Target.blank,
              [text('Ver no GitHub')]
            ),
            a(
              classes: 'btn btn-secondary',
              href: 'about',
              [text('Saber Mais')]
            ),
          ]),
        ]),
        
        // 2. Interactive App Mockup Preview
        div(classes: 'hero-preview', [
          div(classes: 'mock-app', [
            // Mock App Header
            div(classes: 'mock-header', [
              div(classes: 'mock-profile', [
                div(classes: 'mock-avatar', []),
                span([text('Olá, João')]),
              ]),
              div(classes: 'mock-bell', []),
            ]),

            // Mock Balance Card
            div(classes: 'mock-card mock-balance-card', [
              span(classes: 'card-label', [text('Saldo Total')]),
              h2([text(r'R$ 12.450,80')]),
              div(classes: 'card-actions', [
                div(classes: 'mock-btn mock-btn-white', [text('+ Adicionar')]),
                div(classes: 'mock-btn mock-btn-trans', [text('⇄ Transferir')]),
              ]),
            ]),

            // Mock Split Card (Entradas / Saídas)
            div(classes: 'mock-split-row', [
              div(classes: 'mock-card split-col income-col', [
                span(classes: 'card-label', [text('Entradas')]),
                h3([text(r'R$ 8.200,00')]),
              ]),
              div(classes: 'mock-card split-col expense-col', [
                span(classes: 'card-label', [text('Saídas')]),
                h3([text(r'R$ 3.749,20')]),
              ]),
            ]),

            // Mock Transaction
            div(classes: 'mock-card mock-transactions-card', [
              span(classes: 'card-label-dark', [text('Transações Recentes')]),
              div(classes: 'mock-transaction-item', [
                div(classes: 'tx-icon grocery', [text('🛒')]),
                div(classes: 'tx-info', [
                  span(classes: 'tx-title', [text('Supermarket')]),
                  span(classes: 'tx-date', [text('Hoje')]),
                ]),
                span(classes: 'tx-amount expense', [text(r'- R$ 150,00')]),
              ]),
              div(classes: 'mock-transaction-item', [
                div(classes: 'tx-icon dining', [text('🍔')]),
                div(classes: 'tx-info', [
                  span(classes: 'tx-title', [text('Jantar com amigos')]),
                  span(classes: 'tx-date', [text('Ontem')]),
                ]),
                span(classes: 'tx-amount expense', [text(r'- R$ 120,00')]),
              ]),
            ]),
          ]),
        ]),
      ]),

      // 3. Bento Grid Features Section
      div(classes: 'features-section', [
        h2(classes: 'section-title', [text('Por que escolher o Antigravity Budget?')]),
        div(classes: 'bento-grid', [
          div(classes: 'bento-item item-1', [
            div(classes: 'bento-icon', [text('⚡')]),
            h3([text('Performance Nativa')]),
            p([text('Construído inteiramente em Dart/Flutter para máxima performance e feedback tátil fluido.')]),
          ]),
          div(classes: 'bento-item item-2', [
            div(classes: 'bento-icon', [text('🎨')]),
            h3([text('Design Bento M3')]),
            p([text('Interface limpa baseada no conceito Bento e Material Design 3 para excelente legibilidade.')]),
          ]),
          div(classes: 'bento-item item-3', [
            div(classes: 'bento-icon', [text('🔒')]),
            h3([text('100% Seguro')]),
            p([text('Seus dados financeiros permanecem sob seu controle local e no seu servidor de preferência.')]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.landing-page', [
      css('&').styles(
        maxWidth: 1200.px,
        margin: .symmetric(horizontal: .auto),
        padding: .symmetric(vertical: 4.em, horizontal: 2.em),
      ),
    ]),
    
    // Hero Styles
    css('.hero', [
      css('&').styles(
        display: .flex,
        flexDirection: .row,
        alignItems: .center,
        justifyContent: .spaceBetween,
        gap: Gap.all(4.em),
        margin: .only(bottom: 5.em),
      ),
      css('@media (max-width: 900px)', [
        css('&').styles(
          flexDirection: .column,
          textAlign: .center,
          gap: Gap.all(3.em),
        ),
      ]),
    ]),
    
    css('.hero-text', [
      css('&').styles(
        flex: Flex(grow: 1, shrink: 1),
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: Gap.all(1.5.em),
      ),
      css('@media (max-width: 900px)', [
        css('&').styles(alignItems: .center),
      ]),
      css('h1').styles(
        fontSize: 3.2.rem,
        fontWeight: .w800,
        lineHeight: 1.2.em,
        color: const Color('#001E2F'),
      ),
      css('p').styles(
        fontSize: 1.15.rem,
        lineHeight: 1.6.em,
        color: const Color('#41474D'),
      ),
    ]),

    css('.badge', [
      css('&').styles(
        backgroundColor: const Color('#E0E2EC'),
        color: const Color('#004AC6'),
        padding: .symmetric(vertical: 6.px, horizontal: 16.px),
        radius: .circular(30.px),
        fontSize: 0.85.rem,
        fontWeight: .w700,
      ),
    ]),

    css('.hero-actions', [
      css('&').styles(
        display: .flex,
        gap: Gap.all(1.em),
      ),
    ]),

    // Button Styles
    css('.btn', [
      css('&').styles(
        padding: .symmetric(vertical: 14.px, horizontal: 28.px),
        radius: .circular(16.px),
        fontSize: 1.rem,
        fontWeight: .w600,
        textDecoration: TextDecoration(line: .none),
        transition: const Transition('all', duration: Duration(milliseconds: 200)),
      ),
      css('&.btn-primary').styles(
        backgroundColor: const Color('#004AC6'),
        color: Colors.white,
      ),
      css('&.btn-primary:hover').styles(
        backgroundColor: const Color('#00318C'),
      ),
      css('&.btn-secondary').styles(
        border: Border.all(color: const Color('#72777F'), width: 1.px),
        color: const Color('#004AC6'),
      ),
      css('&.btn-secondary:hover').styles(
        backgroundColor: const Color('#E0E2EC'),
      ),
    ]),

    // App Preview Styles
    css('.hero-preview', [
      css('&').styles(
        flex: Flex(grow: 1, shrink: 1),
        display: .flex,
        justifyContent: .center,
        width: 100.percent,
      ),
    ]),

    css('.mock-app', [
      css('&').styles(
        width: 100.percent,
        maxWidth: 380.px,
        backgroundColor: const Color('#F1F3F9'),
        radius: .circular(32.px),
        border: Border.all(color: const Color('#D8DBE3'), width: 8.px),
        padding: .all(20.px),
        display: .flex,
        flexDirection: .column,
        gap: Gap.all(16.px),
        shadow: BoxShadow(color: const Color('#00000020'), blur: 24.px, offsetX: 0.px, offsetY: 12.px),
      ),
    ]),

    css('.mock-header', [
      css('&').styles(
        display: .flex,
        justifyContent: .spaceBetween,
        alignItems: .center,
        padding: .symmetric(horizontal: 4.px),
      ),
      css('.mock-profile').styles(
        display: .flex,
        alignItems: .center,
        gap: Gap.all(8.px),
        fontWeight: .w600,
      ),
      css('.mock-avatar').styles(
        width: 32.px,
        height: 32.px,
        radius: .circular(16.px),
        backgroundColor: const Color('#004AC6'),
      ),
      css('.mock-bell').styles(
        width: 12.px,
        height: 12.px,
        radius: .circular(6.px),
        backgroundColor: const Color('#BA1A1A'),
      ),
    ]),

    css('.mock-card', [
      css('&').styles(
        backgroundColor: Colors.white,
        radius: .circular(24.px),
        padding: .all(16.px),
        display: .flex,
        flexDirection: .column,
        gap: Gap.all(8.px),
      ),
      css('&.mock-balance-card').styles(
        backgroundColor: const Color('#004AC6'),
        color: Colors.white,
        raw: {'background-image': 'linear-gradient(135deg, #004AC6 0%, #002A75 100%)'},
      ),
      css('.card-label').styles(
        fontSize: 0.8.rem,
        opacity: 0.8,
      ),
      css('.card-label-dark').styles(
        fontSize: 0.85.rem,
        fontWeight: .w700,
        color: const Color('#72777F'),
        margin: .only(bottom: 4.px),
      ),
      css('h2').styles(
        fontSize: 1.8.rem,
        fontWeight: .w800,
        letterSpacing: (-0.5).px,
      ),
      css('h3').styles(
        fontSize: 1.15.rem,
        fontWeight: .w700,
      ),
    ]),

    css('.card-actions', [
      css('&').styles(
        display: .flex,
        gap: Gap.all(8.px),
        margin: .only(top: 8.px),
      ),
      css('.mock-btn').styles(
        flex: Flex(grow: 1),
        padding: .symmetric(vertical: 8.px),
        radius: .circular(12.px),
        fontSize: 0.75.rem,
        fontWeight: .w700,
        textAlign: .center,
      ),
      css('.mock-btn-white').styles(
        backgroundColor: Colors.white,
        color: const Color('#004AC6'),
      ),
      css('.mock-btn-trans').styles(
        backgroundColor: const Color('#ffffff20'),
        color: Colors.white,
      ),
    ]),

    css('.mock-split-row', [
      css('&').styles(
        display: .flex,
        gap: Gap.all(12.px),
      ),
      css('.split-col').styles(
        flex: Flex(grow: 1),
      ),
      css('.income-col h3').styles(
        color: const Color('#006C49'),
      ),
      css('.expense-col h3').styles(
        color: const Color('#BA1A1A'),
      ),
    ]),

    css('.mock-transaction-item', [
      css('&').styles(
        display: .flex,
        alignItems: .center,
        gap: Gap.all(12.px),
        padding: .symmetric(vertical: 8.px),
        raw: {'border-bottom': '0.5px solid #E0E2EC'},
      ),
      css('.tx-icon').styles(
        width: 32.px,
        height: 32.px,
        radius: .circular(8.px),
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        fontSize: 1.rem,
      ),
      css('.tx-icon.grocery').styles(
        backgroundColor: const Color('#E8F5E9'),
      ),
      css('.tx-icon.dining').styles(
        backgroundColor: const Color('#FFE0B2'),
      ),
      css('.tx-info').styles(
        display: .flex,
        flexDirection: .column,
        flex: Flex(grow: 1),
      ),
      css('.tx-title').styles(
        fontSize: 0.85.rem,
        fontWeight: .w600,
      ),
      css('.tx-date').styles(
        fontSize: 0.7.rem,
        color: const Color('#72777F'),
      ),
      css('.tx-amount').styles(
        fontSize: 0.85.rem,
        fontWeight: .w700,
      ),
      css('.tx-amount.expense').styles(
        color: const Color('#BA1A1A'),
      ),
    ]),

    // Bento Grid Section Styles
    css('.features-section', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        gap: Gap.all(2.em),
      ),
      css('.section-title').styles(
        fontSize: 2.rem,
        fontWeight: .w800,
        textAlign: .center,
        color: const Color('#001E2F'),
        margin: .only(bottom: 1.em),
      ),
    ]),

    css('.bento-grid', [
      css('&').styles(
        display: .grid,
        gap: Gap.all(1.5.em),
        raw: {'grid-template-columns': 'repeat(auto-fit, minmax(280px, 1fr))'},
      ),
    ]),

    css('.bento-item', [
      css('&').styles(
        backgroundColor: Colors.white,
        radius: .circular(24.px),
        padding: .all(2.em),
        border: Border.all(color: const Color('#E0E2EC'), width: 1.px),
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: Gap.all(1.em),
        transition: const Transition('all', duration: Duration(milliseconds: 250)),
      ),
      css('&:hover').styles(
        transform: Transform.translate(y: (-4).px),
        shadow: BoxShadow(color: const Color('#00000008'), blur: 16.px, offsetX: 0.px, offsetY: 8.px),
        border: Border.all(color: const Color('#C4C6CF'), width: 1.px),
      ),
      css('.bento-icon').styles(
        width: 48.px,
        height: 48.px,
        radius: .circular(16.px),
        backgroundColor: const Color('#E8F0FF'),
        color: const Color('#004AC6'),
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        fontSize: 1.5.rem,
      ),
      css('h3').styles(
        fontSize: 1.25.rem,
        fontWeight: .w700,
        color: const Color('#001E2F'),
      ),
      css('p').styles(
        fontSize: 0.95.rem,
        lineHeight: 1.5.em,
        color: const Color('#41474D'),
      ),
    ]),
  ];
}
