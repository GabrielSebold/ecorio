import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecorio/ecorio_app.dart';

void main() {
  testWidgets('Busca por material e filtro sem ponto cadastrado', (tester) async {
    await tester.pumpWidget(const EcoRioApp());
    await tester.tap(find.text('Guia'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'pilhas');
    await tester.pumpAndSettle();
    expect(find.text('1 categorias encontradas'), findsOneWidget);
    await tester.tap(find.text('Pilhas e baterias'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Consultar pontos de demonstração'));
    await tester.tap(find.text('Consultar pontos de demonstração'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Nenhum ponto cadastrado'), findsOneWidget);
  });
  testWidgets('Interesse em campanha pode ser marcado e desmarcado', (tester) async {
    await tester.pumpWidget(const EcoRioApp());
    await tester.tap(find.text('Campanhas'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Tenho interesse').first);
    await tester.tap(find.text('Tenho interesse').first);
    await tester.pumpAndSettle();
    expect(find.text('Interesse marcado nesta sessão'), findsOneWidget);
    await tester.tap(find.text('Interesse marcado nesta sessão'));
    await tester.pumpAndSettle();
    expect(find.text('Interesse marcado nesta sessão'), findsNothing);
  });
}
