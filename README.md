# AI Food App (Frontend)

[![Flutter](https://img.shields.io/badge/Flutter-3.19.6-blue)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.8.0-blue)](https://dart.dev/)
[![Cross-platform](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-green)]()
[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📝 Sobre o Projeto

O **AI Food App** é um aplicativo Flutter multiplataforma que oferece recomendações de alimentos e receitas personalizadas com base em inteligência artificial. Ele se conecta a um backend Java (Spring Boot), que é totalmente conteinerizado com Docker e pode ser encontrado em: [AiFoodApp backend repository](https://github.com/OtavioXimarelli/AiFoodApp/).

O backend expõe uma API REST para cadastro, listagem, atualização e remoção de alimentos, além de geração e análise nutricional de receitas usando IA.

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma
- **Dart**: Linguagem de programação principal do Flutter
- **RESTful API**: Comunicação com o backend Java
- **Provider / Riverpod**: Gerenciamento de estado
- **table_calendar**: Exibição de calendários
- **font_awesome_flutter**: Ícones modernos e personalizáveis

## 🏗️ Arquitetura

O projeto segue uma arquitetura modular:

- **Screens/Pages**: Telas principais do app
- **Widgets**: Componentes reutilizáveis de UI
- **Services**: Comunicação com APIs externas (backend)
- **Models**: Estruturas de dados e entidades
- **Providers**: Gerenciamento de estado
- **Utils**: Funções utilitárias e helpers

### Estrutura de Pastas

- `lib/` - Código principal do aplicativo Flutter
- `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/` - Código específico de cada plataforma
- `test/` - Testes unitários e de widgets

## 🚀 Funcionalidades

- Interface intuitiva para recomendações de alimentos
- Integração com backend AI para sugestões personalizadas de receitas
- Listagem, cadastro, atualização e remoção de alimentos
- Exibição de receitas detalhadas e informações nutricionais
- Suporte multiplataforma (Android, iOS, Web, Desktop)

## 🔌 Integração com o Backend

O backend é uma aplicação Java Spring Boot conteinerizada via Docker, responsável por toda a lógica de dados e IA. Os principais endpoints disponíveis atualmente são:

### Food Items
- `POST /api/foods/create`: Cria um novo alimento
- `GET /api/foods/list`: Lista todos os alimentos
- `GET /api/foods/list/{id}`: Busca um alimento pelo ID
- `PUT /api/foods/update`: Atualiza um alimento existente
- `DELETE /api/foods/delete/{id}`: Remove um alimento

### Recipes
- `GET /api/recipes/gen`: Gera uma nova receita com base nos alimentos disponíveis
- `GET /api/recipes/analyze/{id}`: Analisa o perfil nutricional de uma receita

Consulte a [documentação do backend](https://github.com/OtavioXimarelli/AiFoodApp) para detalhes de configuração e execução.

## 💻 Como Executar o Projeto

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Backend rodando conforme instruções do [repositório backend](https://github.com/OtavioXimarelli/AiFoodApp) (Docker recomendado)

### Instalação

1. Clone este repositório:
    ```sh
    git clone https://github.com/OtavioXimarelli/ai_food_app.git
    cd ai_food_app
    ```
2. Instale as dependências:
    ```sh
    flutter pub get
    ```
3. Execute o app:
    ```sh
    flutter run
    ```

> Para rodar em plataformas específicas, utilize:
> - Android/iOS: Conecte um dispositivo ou use um emulador/simulador
> - Web: `flutter run -d chrome`
> - Desktop: `flutter run -d windows` (ou `macos`, `linux`)

### Configuração do Backend

Siga as instruções do [repositório backend](https://github.com/OtavioXimarelli/AiFoodApp) para subir o servidor Java com Docker.

## 🧪 Status Atual do Projeto

O projeto encontra-se em desenvolvimento ativo. Funcionalidades já implementadas:

✅ Interface básica de recomendações  
✅ Integração inicial com backend  
✅ Listagem, cadastro, atualização e remoção de alimentos  
✅ Exibição de receitas e informações nutricionais

**Em desenvolvimento:**  
🔄 Personalização avançada de recomendações  
🔄 Histórico e favoritos  
🔄 Melhorias na experiência do usuário  
🔄 Testes automatizados  
🔄 Filtros para restrições alimentares e preferências  
🔄 Autenticação e perfis de usuário  
🔄 Internacionalização (i18n)  
🔄 Otimização da interface para web e desktop  
🔄 Deploy automatizado (CI/CD)

## 📋 Próximos Passos

- Finalizar sistema de favoritos e histórico de receitas
- Implementar autenticação e perfis de usuário
- Adicionar filtros para restrições alimentares (vegetariano, sem glúten, etc.)
- Melhorar personalização das recomendações com base no histórico
- Expandir testes unitários e de integração
- Internacionalização da interface
- Automatizar deploy e integração contínua

## 👥 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests.

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
