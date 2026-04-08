import 'dart:io';
import 'biblioteca_service.dart';
import 'livro.dart';
import 'validacoes.dart';

void main() {
  var service = BibliotecaService();

  while (true) {
    print("\n=== MENU ===");
    print("1 - Cadastrar livro");
    print("2 - Listar livros");
    print("3 - Atualizar livro");
    print("4 - Remover livro");
    print("5 - Sair");

    stdout.write("Escolha: ");
    String opcao = stdin.readLineSync()!;

    switch (opcao) {
      case '1':
        cadastrar(service);
        break;
      case '2':
        listar(service);
        break;
      case '3':
        atualizar(service);
        break;
      case '4':
        remover(service);
        break;
      case '5':
        return;
      default:
        print("Opção inválida");
    }
  }
}

void cadastrar(BibliotecaService service) {
  stdout.write("Título: ");
  String titulo = stdin.readLineSync()!;

  stdout.write("Autor: ");
  String autor = stdin.readLineSync()!;

  int ano = lerInteiro("Ano: ");

  stdout.write("ID: ");
  String id = stdin.readLineSync()!;

  service.adicionar(Livro(titulo, autor, ano, id));
  print("Livro cadastrado!");
}

void listar(BibliotecaService service) {
  var lista = service.listar();

  if (lista.isEmpty) {
    print("Nenhum livro.");
    return;
  }

  for (var livro in lista) {
    livro.exibir();
  }
}

void atualizar(BibliotecaService service) {
  stdout.write("ID do livro: ");
  String id = stdin.readLineSync()!;

  var livro = service.buscarPorId(id);

  if (livro == null) {
    print("Livro não encontrado.");
    return;
  }

  stdout.write("Novo título: ");
  livro.titulo = stdin.readLineSync()!;

  stdout.write("Novo autor: ");
  livro.autor = stdin.readLineSync()!;

  livro.ano = lerInteiro("Novo ano: ");

  print("Atualizado!");
}

void remover(BibliotecaService service) {
  stdout.write("ID: ");
  String id = stdin.readLineSync()!;

  if (service.remover(id)) {
    print("Removido!");
  } else {
    print("Livro não encontrado.");
  }
}
