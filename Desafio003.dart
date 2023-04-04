class Dorama {
  String _titulo;
  int _anoDeLancamento;
  String _paisDeOrigem;

  Dorama(this._titulo, this._anoDeLancamento, this._paisDeOrigem);

  //Getters e Settres para as propriedades privados

  String get titulo => _titulo;
  set titulo(String value) => _titulo = value;

  int get anoDeLancamento => _anoDeLancamento;
  set anoDeLancamento(int value) => _anoDeLancamento = value;

  String get paisDeOrigem => _paisDeOrigem;
  set paisDeOrigem(String value) => _paisDeOrigem = value;

  //Método de listar doramas

  void listarDoramas() {
    print("$_titulo, $_anoDeLancamento");
  }
}

void main() {
  //Lista dos Doramas

  List<Dorama> doramas = [
    Dorama("Uma Advogada Extraordinária", 2022, "Coreia do Sul"),
    Dorama("Sweet Home", 2020, "Coreia do Sul"),
    Dorama("Pretendente Surpresa", 2022, "Coreia do Sul"),
    Dorama("Apostando Alto", 2020, "Coreia do Sul"),
  ];

  for (Dorama dorama in doramas) {
    print('Titulo: ${dorama.titulo} | Ano de lançamento: ${dorama.anoDeLancamento}');
  }
}