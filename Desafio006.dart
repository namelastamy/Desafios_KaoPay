 class Transacao {
    double _debito;
    double _creditoParcelado;
    double _pix;
    String _bandeiraDoCartao;
    String _nomeDoEstabelecimento;
    String _nomeDoUsuario;
    double _dataHora;

    Transacao(this._debito,this._creditoParcelado,this._pix,this._bandeiraDoCartao,this._nomeDoEstabelecimento,this._nomeDoUsuario, this._dataHora);

//Setters e Getters para os atributos privados
void set debito(double value){ _debito = value;}

double get debito => _debito;

void set creditoParcelado(double value){ _creditoParcelado = value;}

double get creditoParcelado => _creditoParcelado;

void set pix(double value){ _pix = value;}

double get pix => _pix;

void set bandeiraDoCartao(String value){ _bandeiraDoCartao = value;}

String get bandeiraDoCartao => _bandeiraDoCartao;

void set nomeDoEstabelecimento(String value){ _nomeDoEstabelecimento = value;}

String get nomeDoEstabelecimento => _nomeDoEstabelecimento;

void set nomeDoUsuario(String value){ _nomeDoUsuario = value;}

String get nomeDoUsuario => _nomeDoUsuario;

void set dataHora(double value){ _dataHora = value;}

double get dataHora => _dataHora;

}

class TransacaoRecebimento extends Transacao{
    bool _debitoRecebido;
    bool _creditoRecebido;
    bool _pixRecebido;

     TransacaoRecebimento(
        double debito, 
        double creditoParcelado, 
        double pix, 
        String bandeiraDoCartao, 
        String nomeDoEstabelecimento, 
        String nomeDoUsuario, 
        this._debitoRecebido, 
        this._creditoRecebido, 
        this._pixRecebido)
     :super(debito, creditoParcelado, pix, bandeiraDoCartao, nomeDoEstabelecimento, nomeDoUsuario, dataHora);

//Setters e Getters para os atributos privados
void set debitoRecebido(bool value){ _debitoRecebido = value;}

bool get debitoRecebido => _debitoRecebido;

void set creditoRecebido(bool value){ _creditoRecebido = value;}

bool get creditoRecebido => _creditoRecebido;

void set pixRecebido(bool value){ _pixRecebido = value;}

bool get pixRecebido => _pixRecebido;
}

class Wallet {
  String _id;
  double _saldo;
  List<Transacao> _transacoes; //lista para armazenar as transações realizadas
  
  Wallet(this._id, this._saldo) : _transacoes = []; //inicializa a lista de transacoes vazia
    
//Setters e Getters para os atributos privados
double get saldo => _saldo;

void pagarDebito(double value, String bandeiraDoCartao, String nomeDoEstabelecimento, String nomeDoUsuario){
    if(value > _saldo) {
        print("Saldo Insuficiente para Realizar a Transação");
        return;
    }
    _saldo -= value;
    _transacoes.add(Transacao(value,0,0,'Visa','Supermercado DB','Maria Silva'));
}

void pagarCredito(double value, String bandeiraDoCartao, String nomeDoEstabelecimento, String nomeDoUsuario){
    if(value > _saldo){
        print("Saldo Insuficiente para Realizar a Transação");
        return;
    }
    _saldo -= value;
    _transacoes.add(Transacao(value,0,0,'Elo','Amanda Beauty','Jeon Sulmi'));
//armazena as informaçoes adicionais da transação 
}

void pagarPix(double value, String nomeDoEstabelecimento, String nomeDoUsuario){
    _saldo -= value;
    _transacoes.add(Transacao(value,28,value,'MasterCard','Uber','KaoPay'));
    //armazena as informações adicionais da transação
}

void pagarCreditoParcelado(double value, int numParcelas, double taxa){
    if(value > _saldo){
        print("Saldo Insuficiente para Realizar a Transação.");
        return;
    }
    _saldo -= value;
//divide o valor em um número de parcelas e armazena as informaçoes adicionais da transação 
   final valorParcela = value / numParcelas;
    for (var i = 1; i <= numParcelas; i++) {
      final data = DateTime.now().add(Duration(days: 30 * i));
      _transacoes.add(Transacao(valorParcela, valorParcela * (1 + taxa),0,'','','','','',' b  '));
    }
 }

void adicionarTransacao(Transacao transacao) {
    _transacoes.add(transacao);
  }

void listarTransacoes() {
     void listarTransacoes() {
    for (var i = 0; i < _transacoes.length; i++) {
      print('Data e hora da transação: ${_transacoes[i].dataHora}');
      print('Bandeira do cartão: ${_transacoes[i].bandeiraDoCartao}');
      print('Nome do estabelecimento: ${_transacoes[i].nomeDoEstabelecimento}');
      print('Nome do usuário: ${_transacoes[i].nomeDoUsuario}');
      print('Valor da transação: ${_transacoes[i].valor}');

      if (_transacoes[i] is credito) {  
        print('Tipo de transação: Crédito');
      } else if (_transacoes[i] is debito) {
        print('Tipo de transação: Débito');
      } else if (_transacoes[i] is creditoParcelado) {
        print('Tipo de transação: Crédito Parcelado');
      } else if (_transacoes[i] is pix) {
        print('Tipo de transação: PIX');
      }

      print('');
    
    }
   }
 }
}

class User {
  final String _name;
  final String _phone;
  final String _cpf;
  final Wallet _carteira;
  
  User(this._name, this._phone, this._cpf,this._carteira);

//Setters e Getters para os atributos privados
void set _name(String value){
    _name = value;
}

String get name => _name;

void set _phone(String value){
    _phone = value;
}

String get phone => _phone;

void set _cpf(String value){
    _cpf = value;
}

String get cpf => cpf;

Wallet get carteira => _carteira;
}

void main(){

//instancia da carteira com ID unico
var carteira = Wallet(id: '123456789676898');

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