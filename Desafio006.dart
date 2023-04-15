Class Transacoes {
     double _debito;
     double _creditoParcelado;
     double _pix;
     String _bandeiraDoCartao;
     String _nomeDoEstabelecimento;
     String _nomeDoUsuario;

    Transacoes(
        this._debito,
        this._creditoParcelado,
        this._pix,
        this._bandeiraDoCartao,
        this._nomeDoEstabelecimento,
        this._nomeDoUsuario);

//Setters e Getters para os atributos privados
void set debito(double value){
    _debito = value;
}

double get debito => _debito;

void set creditoParcelado(double value){
    _creditoParcelado = value;
}

double get creditoParcelado => _creditoParcelado;

void set pix(double value){
    _pix = value;
}

double get pix => _pix;

void set bandeiraDoCartao(String value){
    _bandeiraDoCartao = value;
}

String get bandeiraDoCartao => _bandeiraDoCartao;

void set nomeDoEstabelecimento(String value){
    _nomeDoEstabelecimento = value;
}

String get nomeDoEstabelecimento => _nomeDoEstabelecimento;

void set nomeDoUsuario(String value){
    _nomeDoUsuario = value;
}

String get nomeDoUsuario => _nomeDoUsuario;

}

Class Recebimento extends Transacoes{
     bool _debitoRecebido;
     bool _creditoRecebido;
     bool _pixRecebido;

     Recebimento(
        double debito, 
        double creditoParceldo, 
        double pix, 
        String bandeiraDoCartao, 
        String nomeDoEstabelecimento, 
        String nomeDoUsuario, 
        this._debitoRecebido, 
        this._creditoRecebido, 
        this._pixRecebido)
     :super(debito, creditoParcelado, pix, bandeiraDoCartao, nomeDoEstabelecimento, nomeDoUsuario);

//Setters e Getters para os atributos privados
void set debitoRecebido(bool value){
    _debitoRecebido = value;
}

bool get debitoRecebido => _debitoRecebido;

void set creditoRecebido(bool value){
    _creditoRecebido = value;
}

bool get creditoRecebido => _creditoRecebido;

void set pixRecebido(bool value){
    _pixRecebido = value;
}

bool get pixRecebido => _pixRecebido;
}

class Wallet {
  String _id;
  double _saldo;
  List<Transacao> transacoes; //lista para armazenar as transações realizadas
  
  Wallet(
    this._id, 
    this._saldo){this.transacoes = []; //inicializa a lista de transacoes vazia
    }

//Setters e Getters para os atributos privados
void set id(String value){
    _id = value;
}

String get id => _id;

void set saldo(double value){
    _saldo = value;
}

double get saldo => _saldo;

void pagarDebito(double value){
    if(value > _saldo){
        print("Saldo Insuficiente para Realizar a Transação");
        Return;
    }

    _saldo -= value;
}

void pagarCredito(double value){
    if(value > _saldo){
        print("Saldo Insuficiente para Realizar a Transação");
        return;
    }

    _saldo -= value;
//armazena as informaçoes adicionais da transação 
}

void pagarPix(double value){
    _saldo -= value;
    //armazena as informações adicionais da transação
    var transacao = Transacao(DateTime.now(),value);
    transacoes.add(transacao);
}

void pagarCreditoParcelado(double value, int numParcelas, double taxa){
    if(value > _saldo){
        print("Saldo Insuficiente para Realizar a Transação.");
        Return;
    }

    _saldo -= value;
//divide o valor em um número de parcelas e armazena as informaçoes adicionais da transação 
   var valorParcela = value / numParcelas;
    for (var i = 1; i <= numParcelas; i++) {
      var data = DateTime.now().add(Duration(days: 30 * i));
      var transacao = TransacaoCreditoParcelado(data, valorParcela, numParcelas, taxa);
      transacoes.add(transacao);
    }
 }

 void listarTransacoes() {
    for (var transacao in transacoes) {
      print('Data: ${transacao.data}');
      print('Hora: ${transacao.hora}');
      print('Valor: ${transacao.valor}');

      if (transacao is TransacaoCreditoParcelado) {
        print(
            'Informações adicionais: ${transacao.numParcelas} parcelas com taxa de ${transacao.taxa}');
      }
    }
  }
}

//classe transação para representar uma transação
class Transacao{
    DateTime data;
    double value;
    String hora;

    Transacao(this.data,this.value){
        this.hora ='${data.hour}:${data.minute}';
    }
}

class User {
  String _name;
  String _phone;
  String _cpf;
  Wallet _carteira;
  
  User(
    this._name, 
    this._phone, 
    this._cpf,
    this._carteira);

//Setters e Getters para os atributos privados
void set name(String value){
    _name = value;
}

String get name => _name;

void set phone(String value){
    _phone = value;
}

String get phone => _phone;

void set cpf(String value){
    _cpf = value;
}

String get cpf => cpf;

Wallet get carteira => _carteira
}

void main(){

//instancia da carteira com ID unico
var carteira = Wallet(id: '123456789');

//instancia da class User
var user = User(name: 'Naomy', phone: '123456789', cpf: '12345678901');

// Adiciona saldo à carteira digital
carteira.adicionarSaldo(1854);

// Realiza uma transação de pagamento com cartão de crédito
carteira.pagarCredito(user, 500, 'Visa', 'supermercado yroyak', 50.09);

// Realiza uma transação de pagamento com cartão de débito
carteira.pagarDebito(user, 200, 'Mastercard', 'Pandora',581.40);

// Realiza uma transação de pagamento com PIX
carteira.pagarPix(user, 100, 25.47);

// Realiza uma transação de pagamento com cartão de credito parcelado
carteira.pagarCreditoParcelado(user, 300, 'Elo', 'KaoPay', 897.45);

//listar as transações
print(carteira.listarTransacoes());
}