import 'livro.dart';

class Biblioteca {
  final List<Livro> _livros = [];

  // create
  bool cadastrarLivro(Livro livro) {
    if (buscarPorIsbn(livro.isbn) != null) {
      return false;
    }
    _livros.add(livro);
    return true;
  }

  // read
  void listarLivros() {
    if (_livros.isEmpty) {
      print('\nNenhum livro cadastrado.\n');
      return;
    }

    print('\n─── Lista de Livros (${_livros.length}) ───');
    for (int i = 0; i < _livros.length; i++) {
      print('\n[${i + 1}]');
      _livros[i].exibir();
    }
    print('');
  }

  // update
  bool atualizarLivro({
    required String isbn,
    String? novoTitulo,
    String? novoAutor,
    int? novoAno,
  }) {
    final livro = buscarPorIsbn(isbn);
    if (livro == null) return false;

    if (novoTitulo != null) livro.titulo = novoTitulo;
    if (novoAutor != null) livro.autor = novoAutor;
    if (novoAno != null) livro.ano = novoAno;

    return true;
  }

  // delete
  bool removerLivro(String isbn) {
    final livro = buscarPorIsbn(isbn);
    if (livro == null) return false;
    _livros.remove(livro);
    return true;
  }

  // helper
  Livro? buscarPorIsbn(String isbn) {
    try {
      return _livros.firstWhere((l) => l.isbn == isbn);
    } catch (_) {
      return null;
    }
  }

  // getter
  int get totalLivros => _livros.length;
}
