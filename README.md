# EcoRio

Guia de Descarte Consciente em Rio do Sul. Projeto acadêmico em Flutter.

**Equipe:** Gabriel Sebold dos Santos e Leonardo Casa Nova.
**Disciplina:** Desenvolvimento para Plataformas Móveis — UNIDAVI.
**Professor:** Sandro Alencar Fernandes.

## Executar

```sh
flutter pub get
flutter run -d chrome
```

Android: conectar dispositivo ou emulador e executar `flutter run` selecionando o dispositivo.

## Validar

```sh
flutter analyze
flutter test
flutter build web --no-wasm-dry-run
```

O SDK instalado apresentou falha de análise com caminhos que contêm acentos. As verificações passaram em cópia com caminho sem acentos. Use uma pasta como `C:/dev/ecorio` se necessário.

## Entrega 1

Navegação, busca e detalhe de materiais; filtro de pontos e marcadores esquemáticos; campanhas e interesse mantido somente na sessão.

Os pontos e campanhas são fictícios. O mapa não usa coordenadas reais. O interesse não envia notificações. Não há persistência, servidor ou coleta de dados pessoais. Não houve validação externa. Execução em Android ainda não verificada.

## Próxima etapa

Escuta comunitária, dados confirmados, mapa geográfico, lembretes persistentes, testes em Android e avaliação com usuários.

A documentação, o relatório e os prints estão em `docs/`. A divisão de tarefas e o cronograma são propostas a revisar pela dupla.

Fonte pública consultada: https://pld.ima.sc.gov.br/ (IMA/SC), sem integração ou parceria.
