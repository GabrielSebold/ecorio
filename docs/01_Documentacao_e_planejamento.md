# EcoRio — Documentação e planejamento


## 1. Identificação e proposta

EcoRio — Guia de Descarte Consciente em Rio do Sul

Centro Universitário para o Desenvolvimento do Alto Vale do Itajaí — UNIDAVI. Bacharelado em Sistemas de Informação. Disciplina: Desenvolvimento para Plataformas Móveis. Professor: Sandro Alencar Fernandes.

Equipe: Gabriel Sebold dos Santos e Leonardo Casa Nova. Entrega 1: 03/11/2026. Documento preparado em 02/11/2026.

Vínculo extensionista: Sustentabilidade e Responsabilidade Ambiental. A solução propõe reunir orientação sobre separação de materiais, consulta a pontos de coleta e divulgação de campanhas para moradores de Rio do Sul.

Problema proposto: a equipe trabalhará a hipótese de que a dispersão de informações sobre materiais, destinos e campanhas dificulta a consulta pela população. Essa hipótese ainda precisa ser verificada com moradores e responsáveis pela coleta; não houve entrevistas nem pesquisa de campo nesta etapa.

Objetivo geral: desenvolver um aplicativo em Flutter que facilite o acesso a informações de descarte consciente em Rio do Sul.

Objetivos específicos: organizar um guia por material; permitir busca e filtros; integrar pontos confirmados a um mapa geográfico; divulgar campanhas e implementar lembretes mediante autorização do usuário; validar linguagem e utilidade com a comunidade.

Público previsto: moradores do município, incluindo pessoas com pouca familiaridade com aplicativos. Possíveis interlocutores: responsáveis pela coleta, setor municipal de meio ambiente e organizações locais. Nenhuma parceria está confirmada.


## 2. Escopo e levantamento inicial de requisitos

Origem dos requisitos: enunciado da disciplina, slide 8 de Social_Innovation_Apps_2026.pdf e análise inicial da proposta. Todos os requisitos são preliminares e devem ser revisados após a escuta comunitária.

RF01 — Navegação entre início, guia, pontos e campanhas. Prioridade alta. Implementado no protótipo.

RF02 — Listar e buscar materiais por nome ou exemplos. Prioridade alta. Implementado com seis categorias e estado sem resultados.

RF03 — Exibir orientação inicial ao selecionar um material. Prioridade alta. Implementado; conteúdo ainda sujeito à validação local.

RF04 — Filtrar pontos por material e consultar seu detalhe. Prioridade alta. Implementado com dois pontos fictícios, sem endereço ou horário e com seleção por marcadores esquemáticos.

RF05 — Exibir pontos confirmados em mapa geográfico interativo, com coordenadas e informações verificadas. Prioridade alta. Planejado; o mapa esquemático atual não atende integralmente este requisito.

RF06 — Consultar campanhas com data, local, descrição e organizador. Prioridade alta. Estrutura visual implementada; campanhas atuais são fictícias e sem data ou local.

RF07 — Agendar e cancelar lembretes de campanhas, com permissão e persistência. Prioridade média. Planejado. O botão de interesse atual altera somente a memória da sessão e não agenda notificações.

RF08 — Informar fonte, data de verificação e responsável por cada dado publicado. Prioridade alta. Planejado para a base real.

RNF01 — Aplicação Flutter, com Android como plataforma inicial. Interface responsiva também executável no navegador para inspeção. Build Android ainda não verificado.

RNF02 — Consulta básica sem login. Não coletar localização ou dados pessoais nesta etapa. RNF03 — Identificar dados de demonstração. RNF04 — Usar rótulos textuais e contraste legível; acessibilidade com leitor de tela e ampliação de texto precisa ser avaliada.

Fora do escopo inicial: pagamentos, chat, marketplace, gestão de frota, rotas de coleta em tempo real e cadastro público sem moderação.


## 3. Desenho lógico e critérios de aceitação

Fluxo principal: Início → Guia → Busca → Detalhe do material → Pontos filtrados. Fluxo complementar: Início → Campanhas → Marcar ou desmarcar interesse na sessão.

Estrutura atual: lib/main.dart inicia o aplicativo; lib/ecorio_app.dart contém a interface, dados locais de demonstração e estados de navegação, busca, filtro, marcador e interesse. Não há servidor, autenticação, banco de dados ou consumo de API nesta versão.

Modelo lógico proposto para evolução: Material(id, nome, exemplos, orientação); PontoColeta(id, nome, endereço, latitude, longitude, horário, fonte, verificadoEm); PontoMaterial(pontoId, materialId); Campanha(id, título, descrição, data, local, organizador, fonte, verificadoEm); Lembrete(id, campanhaId, dataHora, ativo). Relação N:N entre material e ponto; cada campanha pode possuir lembretes locais.

Organização futura: separar telas, modelos e repositórios; carregar uma base local revisada; escolher biblioteca de mapa e provedor compatíveis com as plataformas; implementar notificações locais e persistência. A escolha de serviços depende de viabilidade, limites de uso e revisão da equipe.

CA01 — Uma busca por “pilhas” deve exibir somente a categoria correspondente. CA02 — Uma busca inexistente deve exibir mensagem de ausência de resultado. CA03 — Abrir o detalhe e consultar pontos deve aplicar o material selecionado.

CA04 — Um filtro sem ponto correspondente deve mostrar mensagem explícita. CA05 — Selecionar um dos marcadores demonstrativos deve alterar o detalhe exibido. CA06 — Marcar e desmarcar interesse deve atualizar o botão, sem prometer notificação.

Critérios para a etapa final: mapa com posições verificadas; fontes e datas de atualização; campanhas reais aprovadas; lembrete persistente testado; validação da navegação com usuários externos; execução em dispositivo Android.

Limitações conhecidas: base fictícia, ausência de coordenadas e integração cartográfica, interesse volátil, nenhuma notificação, conteúdo preliminar e ausência de validação comunitária. Os prints registram a versão inicial real executada no navegador, sem representar um aplicativo Android já instalado.


## 4. Planejamento e divisão proposta de tarefas

A divisão abaixo é uma proposta para revisão pelos dois integrantes. Não representa atividades individuais já realizadas.

Gabriel Sebold dos Santos: guia de materiais, busca, organização inicial da documentação e contato com moradores. Leonardo Casa Nova: consulta de pontos, avaliação do mapa, campanhas e avaliação de notificações. Ambos: requisitos, pesquisa de fontes, revisão de código, testes e apresentação.

02–03/11 — Entrega 1: revisar documentação e protótipo; executar a versão inicial; conferir prints; criar e publicar repositório GitHub; inserir URL real nos documentos; enviar os arquivos solicitados.

04–10/11 — Escuta da comunidade: entrevistar moradores e ao menos um interlocutor da coleta/meio ambiente, conforme disponibilidade; registrar necessidades e revisar requisitos. Estimativa: 2 h de planejamento/análise e 4 h de desenvolvimento.

11–17/11 — Confirmar dados e fontes; integrar mapa geográfico e detalhe dos pontos. Estimativa: 1 h de análise e 10 h de desenvolvimento.

18–24/11 — Implementar campanhas e lembretes persistentes; testar estados de erro, permissão negada e ausência de dados. Estimativa: 1 h de análise e 10 h de desenvolvimento.

25–30/11 — Validar com moradores, corrigir problemas, testar Android e concluir documentação, apresentação e vídeo. Estimativa: 3 h de análise/apresentação e 6 h de desenvolvimento.

01/12/2026 — Entrega final e apresentação, conforme enunciado. Reserva proposta para a Entrega 1: 3 h de planejamento/análise. Total estimado do projeto: 10 h de planejamento, análise e apresentações; 30 h de desenvolvimento. São estimativas de esforço, não horas realizadas.

Riscos e resposta: indisponibilidade de interlocutores → buscar outro contato e registrar pendência; dados desatualizados → exigir fonte e data; dificuldade com mapas/notificações → antecipar prova técnica e priorizar o fluxo essencial; tempo limitado → manter consulta sem login e evitar funcionalidades extras.


## 5. Interação extensionista e validação planejada

Situação atual: nenhuma entrevista, visita, parceria ou validação externa foi realizada. A entrega registra planejamento e protótipo inicial. O diálogo com a sociedade ainda precisa acontecer.

Plano de escuta: convidar, de forma voluntária, de três a cinco moradores e ao menos um responsável ou agente ligado à coleta. A quantidade é uma meta inicial de viabilidade, não uma amostra estatística.

Roteiro para moradores: (1) Como você descobre onde descartar um material? (2) Que materiais geram dúvidas? (3) Já encontrou informação desatualizada? (4) O que precisa saber antes de ir a um ponto? (5) Como prefere consultar campanhas? (6) Usando o protótipo, encontre um material e seu destino; diga o que ficou confuso.

Roteiro para responsáveis pela coleta: quais materiais são aceitos, condições e restrições; endereço, coordenadas e horário; fonte oficial para atualização; quem pode confirmar as informações; como campanhas são aprovadas e divulgadas.

Registro proposto: data, perfil geral do participante, pergunta, resposta resumida, necessidade identificada, requisito relacionado e alteração decidida. Solicitar concordância para o registro; evitar nome, telefone, endereço pessoal e gravação desnecessários. Não publicar dados pessoais no GitHub.

Ficha de campo para preencher após contato: Data: ______ | Perfil do participante: ______ | Consentimento para notas: ______ | Necessidade: ______ | Evidência/resumo: ______ | Decisão e requisito: ______. Campos em branco não constituem evidência.

Avaliação de usabilidade: solicitar localizar um material, encontrar um ponto e consultar uma campanha. Registrar conclusão da tarefa, dificuldades e sugestões. Comparar resultados antes e depois das melhorias, sem inventar avaliações ou resultados.

Impacto esperado: facilitar acesso à informação e apoiar participação em ações locais. Indicadores propostos: tarefas concluídas, dúvidas relatadas, sugestões incorporadas e registros de coleta confirmados. Não há impacto social medido nesta etapa.


## 6. Referências, rastreabilidade e pendências

Projeto Extensão do Curso de Sistemas de Informação — Desenvolvimento para Plataformas Móveis — 2026.pdf, p. 1–3: contexto, equipes, tecnologia, etapas, datas e itens da Entrega 1.

Social_Innovation_Apps_2026.pdf, slide 8: EcoRio, integrantes, guia de separação, mapa interativo e campanhas/notificações. Os arquivos fornecidos pelo aluno são a referência dos requisitos acadêmicos.

Referência pública consultada em 02/11/2026: Instituto do Meio Ambiente de Santa Catarina — Penso, Logo Destino. A plataforma informa que permite consulta por município e tipo de resíduo. https://pld.ima.sc.gov.br/ . A menção não representa parceria ou integração técnica.

Fonte local para pesquisa e validação futura: Prefeitura de Rio do Sul — portal institucional, seção de notícias e serviços de coleta. https://www.riodosul.sc.gov.br/ . Nenhum endereço, horário ou campanha municipal foi importado para o protótipo.

Repositório GitHub: PENDENTE — criar/publicar o repositório e substituir este campo pela URL real antes da entrega. Não foi gerado link fictício.

Checklist: [ ] equipe revisar e aprovar o conteúdo; [ ] conferir o aplicativo e os prints; [ ] criar repositório GitHub e enviar o código; [ ] atualizar URL nesta documentação e no relatório; [ ] conferir instruções da atividade no Classroom; [ ] anexar documentação, relatório de uma página, prints e link; [ ] conferir o envio por todos os integrantes conforme orientação do professor.

Arquivos de evidência: prints/01_inicio.png, 02_guia.png, 03_pontos.png e 04_campanhas.png. As capturas devem acompanhar esta entrega e representam somente o estágio atual.
