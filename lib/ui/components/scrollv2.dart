import 'package:flutter/material.dart';

class ScrollComponent extends StatefulWidget {
  final Widget child;
  final bool showScrollbars;

  const ScrollComponent({
    required this.child,
    this.showScrollbars = true,
    super.key,
  });

  @override
  State<ScrollComponent> createState() => _ScrollComponentState();
}

class _ScrollComponentState extends State<ScrollComponent> {
  final _horizontalController = ScrollController();
  final _verticalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Evita minWidth/minHeight infinitos
        final hasBoundedW = constraints.hasBoundedWidth;
        final hasBoundedH = constraints.hasBoundedHeight;

        final minW = hasBoundedW ? constraints.maxWidth : 0.0;
        final minH = hasBoundedH ? constraints.maxHeight : 0.0;

        Widget content = ConstrainedBox(
          constraints: BoxConstraints(
            // Em geral só o minWidth já resolve o caso de tabela “expandir”.
            // Deixe minHeight = 0 quando não for bounded para evitar erros.
            minWidth: minW,
            minHeight: minH,
          ),
          child: widget.child,
        );

        // Scroll vertical com filtro de notificação
        content = Scrollbar(
          controller: _verticalController,
          thumbVisibility: widget.showScrollbars,
          notificationPredicate: (notif) => notif.metrics.axis == Axis.vertical,
          child: SingleChildScrollView(
            controller: _verticalController,
            primary: false, // não usar PrimaryScrollController do pai
            scrollDirection: Axis.vertical,
            child: content,
          ),
        );

        // Scroll horizontal em volta, também filtrado
        content = Scrollbar(
          controller: _horizontalController,
          thumbVisibility: widget.showScrollbars,
          notificationPredicate: (notif) => notif.metrics.axis == Axis.horizontal,
          child: SingleChildScrollView(
            controller: _horizontalController,
            primary: false,
            scrollDirection: Axis.horizontal,
            child: content,
          ),
        );

        return content;
      },
    );
  }
}
