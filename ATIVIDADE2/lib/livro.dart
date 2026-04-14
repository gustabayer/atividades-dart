class Livro {
  String titulo;
  String autor;
  int ano;
  final String isbn;

  Livro({
    required this.titulo,
    required this.autor,
    required this.ano,
    required this.isbn,
  });

  void exibir() {
    print('  ISBN   : $isbn');
    print('  Título : $titulo');
    print('  Autor  : $autor');
    print('  Ano    : $ano');
  }

  @override
  String toString() {
    return 'Livro(isbn: $isbn, titulo: $titulo, autor: $autor, ano: $ano)';
  }
}