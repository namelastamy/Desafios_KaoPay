class Pessoa {
  String nome;
  int idade;
  double altura;
  double peso;

  Pessoa(this.nome, this.idade, this.altura, this.peso);

  bool isMaiorDeIdade() {
    return idade >= 18;
  }
}
void main() {
  // Cria uma instância da classe Pessoa
 Pessoa pessoa1 = Pessoa("João", 20, 1.75, 70);

  // Calcula o IMC
  double imc = pessoa1.peso / (pessoa1.altura * pessoa1.altura);

  // Verifica a categoria de IMC baseada no valor calculado
  String result;
  if (imc < 18.5) {
    result = "Seu IMC é de ${imc.toStringAsPrecision(5)} (Abaixo do Peso).";
  } else if (imc <= 24.9) {
    result = "Seu IMC é de ${imc.toStringAsPrecision(5)} (Peso Normal).";
  } else if (imc <= 29.9) {
    result = "Seu IMC é de ${imc.toStringAsPrecision(5)} (Sobrepeso).";
  } else if (imc <= 34.9) {
    result = "Seu IMC é de ${imc.toStringAsPrecision(5)} (Obesidade Grau I).";
  } else if (imc <= 39.9) {
    result = "Seu IMC é de ${imc.toStringAsPrecision(5)} (Obesidade Grau II).";
  } else {
    result = "Seu IMC é de ${imc.toStringAsPrecision(5)} (Obesidade Grau III ou Mórbida).";
  }

  // Verifica se a pessoa é maior de idade
  if (pessoa1.isMaiorDeIdade()) {
    print("${pessoa1.nome} é maior de idade");
  } else {
    print("${pessoa1.nome} é menor de idade");
  }

  // Imprime o resultado do IMC
  print(result);
}