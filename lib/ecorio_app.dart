import 'package:flutter/material.dart';

import 'collection_map.dart';

const green = Color(0xFF17634A);
const guides = <(String, String, IconData)>[
  ('Papel', 'Jornais, caixas e papelão', Icons.description_outlined),
  ('Plástico', 'Garrafas e embalagens', Icons.water_drop_outlined),
  ('Vidro', 'Garrafas e potes', Icons.wine_bar_outlined),
  ('Metal', 'Latas e embalagens metálicas', Icons.inventory_2_outlined),
  ('Eletrônicos', 'Cabos e equipamentos', Icons.devices_outlined),
  (
    'Pilhas e baterias',
    'Pilhas e baterias portáteis',
    Icons.battery_charging_full_outlined,
  ),
];

class EcoRioApp extends StatelessWidget {
  const EcoRioApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'EcoRio',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: green),
      scaffoldBackgroundColor: const Color(0xFFF5F7F2),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF5F7F2),
        foregroundColor: green,
      ),
      cardTheme: const CardThemeData(elevation: 0, color: Colors.white),
    ),
    home: const EcoHome(),
  );
}

class EcoHome extends StatefulWidget {
  const EcoHome({super.key});
  @override
  State<EcoHome> createState() => _EcoHomeState();
}

class _EcoHomeState extends State<EcoHome> {
  int tab = 0, selectedPoint = 0;
  String query = '', category = 'Todos';
  final interests = <int>{};
  final search = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  Widget heading(String eyebrow, String title, String subtitle) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        eyebrow.toUpperCase(),
        style: const TextStyle(
          color: green,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          fontSize: 11,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          height: 1.12,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        subtitle,
        style: const TextStyle(color: Color(0xFF5E6B61), height: 1.5),
      ),
      const SizedBox(height: 24),
    ],
  );
  Widget notice(String text) => Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(bottom: 18),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF2D6),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.info_outline, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
      ],
    ),
  );

  void openGuide((String, String, IconData) item) => showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (context) => SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(item.$3, color: green, size: 42),
              const SizedBox(height: 16),
              Text(
                item.$1,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(item.$2),
              const Divider(height: 32),
              Text(
                guides.indexOf(item) >= 4
                    ? 'Busque pontos especializados e confirme os tipos de resíduos aceitos. A plataforma Penso, Logo Destino, do IMA/SC, permite pesquisar por município e tipo de resíduo.'
                    : 'Identifique o material e confirme as condições de recebimento com o serviço de coleta local. Materiais contaminados ou quebrados precisam de orientação específica.',
                style: const TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 20),
              const Text(
                'Conteúdo inicial para validação com a comunidade e o serviço local de coleta.',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    category = item.$1;
                    tab = 2;
                  });
                },
                child: const Text('Consultar pontos de demonstração'),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget home() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      heading(
        'Rio do Sul · SC',
        'Pequenas atitudes.\nUm rio de mudanças.',
        'Seu guia para aprender, separar e encontrar o destino dos resíduos.',
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.eco_outlined, color: Color(0xFFD6EAA8), size: 40),
            const SizedBox(height: 18),
            const Text(
              'Qual material você\nquer descartar?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                height: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Comece pelo guia de materiais.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => setState(() => tab = 1),
              child: const Text('Explorar o guia  →'),
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      const Text(
        'Descarte com informação',
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: const Icon(
            Icons.location_on_outlined,
            color: green,
            size: 32,
          ),
          title: const Text('Pontos de coleta'),
          subtitle: const Text('Explore o fluxo de consulta'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () => setState(() => tab = 2),
        ),
      ),
      Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: const Icon(Icons.event_outlined, color: green, size: 32),
          title: const Text('Campanhas da comunidade'),
          subtitle: const Text('Conheça a agenda demonstrativa'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () => setState(() => tab = 3),
        ),
      ),
      const SizedBox(height: 20),
      notice(
        'Protótipo acadêmico · Entrega 1. Pontos e campanhas são fictícios. Não utilize esses dados para deslocamentos.',
      ),
    ],
  );

  Widget guide() {
    final filtered = guides
        .where(
          (g) => '${g.$1} ${g.$2}'.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading(
          'Aprender para transformar',
          'Guia de materiais',
          'Encontre um material e consulte a orientação inicial.',
        ),
        TextField(
          controller: search,
          onChanged: (v) => setState(() => query = v),
          decoration: InputDecoration(
            hintText: 'Buscar papel, garrafas, pilhas…',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '${filtered.length} categorias encontradas',
          style: const TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 10),
        if (filtered.isEmpty)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text('Nenhum material encontrado. Tente outro termo.'),
          ),
        ...filtered.map(
          (g) => Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE8F1DE),
                child: Icon(g.$3, color: green),
              ),
              title: Text(
                g.$1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(g.$2),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => openGuide(g),
            ),
          ),
        ),
      ],
    );
  }

  Widget points() {
    final available = !['Eletrônicos', 'Pilhas e baterias'].contains(category);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading(
          'Encontre um destino',
          'Pontos de coleta',
          'Primeira versão da consulta por tipo de material.',
        ),
        notice(
          'Mapa real de Rio do Sul. Os marcadores são exemplos fictícios, sem serviço de coleta confirmado. Não se desloque até esses locais.',
        ),
        DropdownButtonFormField<String>(
          initialValue: category,
          decoration: const InputDecoration(
            labelText: 'Filtrar material',
            border: OutlineInputBorder(),
          ),
          items: [
            'Todos',
            ...guides.map((g) => g.$1),
          ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (v) => setState(() => category = v!),
        ),
        const SizedBox(height: 20),
        if (available) ...[
          CollectionMap(
            selectedPoint: selectedPoint,
            onSelectPoint: (value) => setState(() => selectedPoint = value),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'EXEMPLO FICTÍCIO',
                    style: TextStyle(
                      color: green,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ponto demonstrativo ${selectedPoint + 1}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Materiais: papel, plástico, vidro e metal.\nEndereço e horário: ainda não cadastrados.',
                    style: TextStyle(height: 1.7),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'A equipe confirmará os dados com os responsáveis antes de publicar locais reais.',
                  ),
                ],
              ),
            ),
          ),
        ] else
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Nenhum ponto cadastrado para este material nesta demonstração. Consulte a plataforma Penso, Logo Destino: pld.ima.sc.gov.br.',
            ),
          ),
      ],
    );
  }

  Widget campaigns() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      heading(
        'Juntos pela cidade',
        'Campanhas',
        'Uma agenda para aproximar a comunidade da reciclagem.',
      ),
      notice(
        'Campanhas fictícias, sem data ou local confirmados. A seleção fica apenas na memória desta sessão; não envia notificações.',
      ),
      for (int i = 0; i < 2; i++)
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.event_outlined, color: green),
                    SizedBox(width: 8),
                    Text(
                      'DEMONSTRAÇÃO',
                      style: TextStyle(
                        color: green,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  i == 0
                      ? 'Dia de separar e aprender'
                      : 'Eletrônicos com destino',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  i == 0
                      ? 'Proposta de encontro educativo sobre os materiais do dia a dia.'
                      : 'Proposta de ação para divulgar pontos especializados de recebimento.',
                ),
                const SizedBox(height: 12),
                const Text(
                  'Data e local a definir',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () => setState(() {
                    if (!interests.add(i)) {
                      interests.remove(i);
                    }
                  }),
                  icon: Icon(
                    interests.contains(i) ? Icons.check : Icons.bookmark_border,
                  ),
                  label: Text(
                    interests.contains(i)
                        ? 'Interesse marcado nesta sessão'
                        : 'Tenho interesse',
                  ),
                ),
              ],
            ),
          ),
        ),
    ],
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Row(
        children: [
          Icon(Icons.eco),
          SizedBox(width: 8),
          Text('EcoRio', style: TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 18),
          child: Center(
            child: Text(
              'ENTREGA 1',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
    body: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: SingleChildScrollView(
          key: ValueKey(tab),
          padding: const EdgeInsets.all(22),
          child: [home, guide, points, campaigns][tab](),
        ),
      ),
    ),
    bottomNavigationBar: NavigationBar(
      selectedIndex: tab,
      onDestinationSelected: (v) => setState(() => tab = v),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Início'),
        NavigationDestination(
          icon: Icon(Icons.menu_book_outlined),
          label: 'Guia',
        ),
        NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Pontos'),
        NavigationDestination(
          icon: Icon(Icons.event_outlined),
          label: 'Campanhas',
        ),
      ],
    ),
  );
}
