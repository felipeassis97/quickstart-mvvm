# quickstart_mvvm

O projeto Flutter _quickstart_mvvm_ é uma base sólida para iniciar projetos Flutter, fornecendo uma estrutura organizada, configurações pré-definidas e recursos comuns, como gerenciamento de estado, navegação, autenticação e integração com APIs.

## Objetivo
Esse documento tem por objetivo principal organizar o processo de desenvolvimento do software.

## Arquitetura
-  __data__: A pasta "data" é responsável por lidar com a camada de dados do aplicativo. Ela contém duas subpastas principais:
    - __models__:
            Nesta pasta, você deve definir as classes de modelo que representam os dados utilizados em seu aplicativo. Essas classes geralmente refletem a estrutura dos dados que você recebe de uma API, banco de dados ou qualquer outra fonte de dados externa.
    - __repositories__:
            Os repositórios atuam como uma camada intermediária entre a camada de dados e a camada de UI do aplicativo. Eles são responsáveis por obter e armazenar os dados do aplicativo. Essa pasta pode conter classes que implementam métodos para recuperar dados de uma API, atualizar o banco de dados local ou realizar operações relacionadas aos dados.

    
-  __ui__: A pasta "UI" lida com a camada de interface do usuário do aplicativo. Ela também contém duas subpastas principais:
    - __pages__:
            Nesta pasta, você pode definir as diferentes telas (páginas) do seu aplicativo. Cada página é implementada como um widget Flutter separado e contém a estrutura visual e a lógica específica para essa tela. As páginas geralmente são compostas por widgets de IU como botões, campos de texto, listas e outros elementos visuais.
    - __viewmodels__:
            Os view models são responsáveis por fornecer os dados e a lógica de negócios necessários para as páginas do aplicativo. Eles atuam como intermediários entre as páginas e os repositórios de dados. Essa pasta pode conter classes que recuperam dados dos repositórios, processam esses dados e fornecem métodos e propriedades para serem usados pelas páginas.

-  __shared__: A pasta "shared" contém código compartilhado que pode ser usado em várias partes do aplicativo. Ela contém subpastas como:
    - __routes__:
            Aqui, você pode definir as rotas de navegação do aplicativo. As rotas definem as transições entre as diferentes telas do aplicativo.
    - __theme__:
            Nesta subpasta, você pode definir os estilos, cores, fontes e outros aspectos visuais do aplicativo. O tema pode ser aplicado globalmente em todo o aplicativo ou ser específico para certas partes dele.
    - __utils__:
            A subpasta "utils" geralmente contém funções, classes ou helpers que oferecem funcionalidades auxiliares para diferentes partes do aplicativo. Isso pode incluir funções de formatação, validação de dados, manipulação de strings, conversão de tipos e muito mais.

-  __services__: A pasta "services" é usada para armazenar classes que fornecem serviços específicos para o aplicativo. Esses serviços podem incluir recursos como autenticação, gerenciamento de notificações, chamadas de API, armazenamento em cache e muito mais. Essa pasta geralmente contém classes que encapsulam a lógica necessária para essas funcionalidades e podem ser acessadas de diferentes partes do aplicativo.


## Regras iniciais, limite e Análise
Pontos a serem levados em consideração antes de introduzir uma nova feature:
- Todo projeto precisará respeitar as regras de Lint escritas no arquivo _analysis_options.yaml_.
- Camadas globais devem ter um lugar específico na aplicação, por tanto, devem estar na pasta Shared.
- Cada feature deverá ter sua própria pasta onde conterá todas as camadas necessárias para a execução dos casos de uso da feature.
- Não é permitido ter uma classe concreta como dependência de uma camada. Só será aceita coesão com classes abstratas ou interfaces. Com exceção da Store.
- Cada camada deve ter apenas uma responsabilidade.
- Toda a estilização dos componentes devem ser aplicadas na área destinada para configuração do tema da aplicação _(lib/app/shared/theme)_.
- Todas as cores, fontes, orientação e dimensões de tela devem ser obtidas através do MediaQuery _(MediaQuery.OrientationOf)_.

## Principais packages
- [dio](https://pub.dev/packages/dio): Cliente HTTP.
- [result_dart](https://pub.dev/packages/result_dart): Retorno múltiplo no formato Failure e Success.
- [mocktail](https://pub.dev/packages/mocktail): Para testes de unidade.
- [get_it](https://pub.dev/packages/get_it): Injeção de dependências
- [go_router](https://pub.dev/packages/go_router): Gerenciamento de rotas
- [mobx](https://pub.dev/packages/mobx): Gerenciamento de estados
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage): Armazenamento interno
