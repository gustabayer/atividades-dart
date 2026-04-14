import 'dart:io';
import '../lib/biblioteca.dart';
import '../lib/livro.dart';

void main() {
  final biblioteca = Biblioteca();
  bool executando = true;

  print('\n╔══════════════════════════════════╗');
  print('║      SISTEMA DE BIBLIOTECA       ║');
  print('╚══════════════════════════════════╝\n');

  while (executando) {
    exibirMenu();
    final opcao = stdin.readLineSync()?.trim() ?? '';

    switch (opcao) {
      case '1':
        cadastrarLivro(biblioteca);
        break;
      case '2':
        biblioteca.listarLivros();
        break;
      case '3':
        atualizarLivro(biblioteca);
        break;
      case '4':
        removerLivro(biblioteca);
        break;
      case '5':
        executando = false;
        print('\nSistema encerrado. Até logo!\n');
        break;
      default:
        print('\nOpção inválida. Tente novamente.\n');
    }
  }
}

void exibirMenu() {
  print('┌──────────────────────────────────┐');
  print('│             MENU                 │');
  print('├──────────────────────────────────┤');
  print('│  1 - Cadastrar livro             │');
  print('│  2 - Listar livros               │');
  print('│  3 - Atualizar livro             │');
  print('│  4 - Remover livro               │');
  print('│  5 - Sair                        │');
  print('└──────────────────────────────────┘');
  stdout.write('Escolha uma opção: ');
}

void cadastrarLivro(Biblioteca biblioteca) {
  print('\n─── Cadastrar Livro ───');

  stdout.write('Título: ');
  final titulo = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Autor: ');
  final autor = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Ano de publicação: ');
  final anoStr = stdin.readLineSync()?.trim() ?? '';
  final ano = int.tryParse(anoStr);

  if (ano == null) {
    print('\nAno inválido. Cadastro cancelado.\n');
    return;
  }

  stdout.write('ISBN: ');
  final isbn = stdin.readLineSync()?.trim() ?? '';

  if (titulo.isEmpty || autor.isEmpty || isbn.isEmpty) {
    print('\nTodos os campos são obrigatórios. Cadastro cancelado.\n');
    return;
  }

  final livro = Livro(titulo: titulo, autor: autor, ano: ano, isbn: isbn);
  final sucesso = biblioteca.cadastrarLivro(livro);

  if (sucesso) {
    print('\nLivro "$titulo" cadastrado com sucesso!\n');
  } else {
    print('\nJá existe um livro com o ISBN "$isbn".\n');
  }
}

void atualizarLivro(Biblioteca biblioteca) {
  print('\n─── Atualizar Livro ───');
  stdout.write('ISBN do livro a atualizar: ');
  final isbn = stdin.readLineSync()?.trim() ?? '';

  final livro = biblioteca.buscarPorIsbn(isbn);
  if (livro == null) {
    print('\nLivro com ISBN "$isbn" não encontrado.\n');
    return;
  }

  print('Livro encontrado: ${livro.titulo}');
  print('Deixe em branco para manter o valor atual.\n');

  stdout.write('Novo título [${livro.titulo}]: ');
  final titulo = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Novo autor [${livro.autor}]: ');
  final autor = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Novo ano [${livro.ano}]: ');
  final anoStr = stdin.readLineSync()?.trim() ?? '';
  final ano = anoStr.isEmpty ? null : int.tryParse(anoStr);

  if (anoStr.isNotEmpty && ano == null) {
    print('\nAno inválido. Atualização cancelada.\n');
    return;
  }

  biblioteca.atualizarLivro(
    isbn: isbn,
    novoTitulo: titulo.isEmpty ? null : titulo,
    novoAutor: autor.isEmpty ? null : autor,
    novoAno: ano,
  );

  print('\nLivro atualizado com sucesso!\n');
}

void removerLivro(Biblioteca biblioteca) {
  print('\n─── Remover Livro ───');
  stdout.write('ISBN do livro a remover: ');
  final isbn = stdin.readLineSync()?.trim() ?? '';

  final sucesso = biblioteca.removerLivro(isbn);
  if (sucesso) {
    print('\nLivro removido com sucesso!\n');
  } else {
    print('\nLivro com ISBN "$isbn" não encontrado.\n');
  }
}