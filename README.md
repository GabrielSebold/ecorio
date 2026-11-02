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

Navegação, busca e detalhe de materiais; filtro de pontos e mapa real de Rio do Sul com OpenStreetMap, zoom, movimentação e recentralização; campanhas e interesse mantido somente na sessão.

O mapa é real; os dois marcadores e as campanhas são fictícios. Não há serviço de coleta confirmado nas posições demonstrativas. O interesse não envia notificações. Não há persistência de interesse nem servidor próprio. Não houve validação externa. Execução em Android ainda não verificada.

O mapa depende de internet e carrega imagens de `tile.openstreetmap.org`, com créditos visíveis aos colaboradores do OpenStreetMap. O provedor recebe as requisições de rede necessárias à exibição; o aplicativo não solicita localização do dispositivo. No Android, há permissão de internet no manifesto principal. Os tiles usam o cache padrão do flutter_map 8.3.2. Política: https://operations.osmfoundation.org/policies/tiles/ .

Centro geográfico de referência: perfil municipal do CISAMAVI — https://cisamavi.sc.gov.br/municipios-consorciados/municipios/rio-do-sul .

Repositório: https://github.com/GabrielSebold/ecorio . Os PDFs de origem e a pasta de referências auxiliares não são publicados.

## Próxima etapa

Escuta comunitária, pontos de coleta confirmados, lembretes persistentes, testes em Android e avaliação com usuários.

A documentação, o relatório e os prints estão em `docs/`. A divisão de tarefas e o cronograma são propostas a revisar pela dupla.

Fonte pública consultada: https://pld.ima.sc.gov.br/ (IMA/SC), sem integração ou parceria.
