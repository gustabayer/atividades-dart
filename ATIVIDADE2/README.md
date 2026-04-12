# Sistema de Biblioteca — CRUD em Dart

Sistema de gerenciamento de biblioteca desenvolvido em Dart utilizando POO. Permite realizar operações de criação, leitura, atualização e remoção de livros diretamente pelo terminal.

---

## Estrutura do Projeto

```
biblioteca/
├── bin/
│   └── main.dart          # Ponto de entrada e interface de menu
├── lib/
│   ├── livro.dart         # Classe Livro
│   └── biblioteca.dart    # Classe Biblioteca (lógica do CRUD)
├── pubspec.yaml
└── README.md
```
## Classes Utilizadas

### `Livro` — `lib/livro.dart`

Representa um livro da biblioteca.

| Membro | Tipo | Descrição |
|---|---|---|
| `titulo` | `String` | Título do livro |
| `autor` | `String` | Nome do autor |
| `ano` | `int` | Ano de publicação |
| `isbn` | `String` | Identificador único (final) |
| `Livro({...})` | Construtor | Construtor nomeado com parâmetros obrigatórios |
| `exibir()` | Método | Imprime os dados formatados no terminal |
| `toString()` | Método | Representação textual para depuração |

### `Biblioteca` — `lib/biblioteca.dart`

Gerencia a coleção de livros e expõe as operações do CRUD.

| Membro | Tipo | Descrição |
|---|---|---|
| `_livros` | `List<Livro>` | Lista privada que armazena os livros |
| `cadastrarLivro(Livro)` | Método | Adiciona um livro (retorna `false` se ISBN duplicado) |
| `listarLivros()` | Método | Exibe todos os livros cadastrados |
| `atualizarLivro({...})` | Método | Atualiza campos de um livro pelo ISBN |
| `removerLivro(String)` | Método | Remove um livro pelo ISBN |
| `buscarPorIsbn(String)` | Método | Retorna um livro ou `null` |
| `totalLivros` | Getter | Quantidade de livros na lista |

---

## Instruções para Execução

### Pré-requisito

Ter o [Dart SDK](https://dart.dev/get-dart) instalado (versão 3.0 ou superior).

Verifique com:
```bash
dart --version
```

### Executar o sistema

```bash
# Clone ou copie a pasta do projeto, então:
cd biblioteca

dart run bin/main.dart
```

---

## Exemplos de Uso

### Menu principal

```
╔══════════════════════════════════╗
║      SISTEMA DE BIBLIOTECA       ║
╚══════════════════════════════════╝

┌──────────────────────────────────┐
│             MENU                 │
├──────────────────────────────────┤
│  1 - Cadastrar livro             │
│  2 - Listar livros               │
│  3 - Atualizar livro             │
│  4 - Remover livro               │
│  5 - Sair                        │
└──────────────────────────────────┘
Escolha uma opção:
```

### Cadastrar um livro (opção 1)

```
─── Cadastrar Livro ───
Título: Clean Code
Autor: Robert C. Martin
Ano de publicação: 2008
ISBN: 978-0132350884

Livro "Clean Code" cadastrado com sucesso!
```

### Listar livros (opção 2)

```
─── Lista de Livros (2) ───

[1]
  ISBN   : 978-0132350884
  Título : Clean Code
  Autor  : Robert C. Martin
  Ano    : 2008

[2]
  ISBN   : 978-0201633610
  Título : Design Patterns
  Autor  : Gang of Four
  Ano    : 1994
```

### Atualizar livro (opção 3)

```
─── Atualizar Livro ───
ISBN do livro a atualizar: 978-0201633610
Livro encontrado: Design Patterns
Deixe em branco para manter o valor atual.

Novo título [Design Patterns]: Padrões de Projeto
Novo autor [Gang of Four]:
Novo ano [1994]:

Livro atualizado com sucesso!
```

### Remover livro (opção 4)

```
─── Remover Livro ───
ISBN do livro a remover: 978-0132350884

Livro removido com sucesso!
```

---

## Conceitos de POO Aplicados

- **Classes**: `Livro` e `Biblioteca` encapsulam dados e comportamentos relacionados
- **Atributos**: cada livro possui título, autor, ano e ISBN
- **Métodos**: operações do CRUD definidas como métodos das classes
- **Construtores**: `Livro` usa construtor nomeado com parâmetros obrigatórios (`required`)
- **Encapsulamento**: a lista `_livros` é privada e acessada apenas pelos métodos da classe
- **Listas**: `List<Livro>` armazena dinamicamente os objetos cadastrados
