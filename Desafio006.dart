/*A fintech chinesa Alipay está buscando criar uma solução em Dart para permitir pagamentos e recebimentos através de uma carteira digital. 
Para isso, é necessário desenvolver uma classe em Dart que permita realizar transações de pagamento e recebimento em diversas formas, incluindo débito, crédito parcelado e PIX. 
Além disso, é importante que a classe seja capaz de armazenar informações adicionais, como a bandeira do cartão de crédito, o nome do estabelecimento onde a compra foi realizada e o nome da pessoa que depositou na carteira, para as transações de crédito parcelado e recebimento, respectivamente.

A carteira digital deve ter um identificador único (id) e um saldo atual (saldo), assim como uma classe User que terá os atributos name, phone e cpf.

Para realizar pagamentos, a carteira digital deve ter métodos específicos para cada forma de pagamento: pagarDebito(valor), pagarCredito(valor) e pagarCreditoParcelado(valor, numParcelas, taxa). O método pagarDebito deve realizar um pagamento de débito no valor especificado e atualizar o saldo da carteira digital. 
O método pagarCredito deve realizar um pagamento de crédito no valor especificado e atualizar o saldo da carteira digital, armazenando as informações adicionais da transação. O método pagarCreditoParcelado deve realizar um pagamento de crédito parcelado no valor especificado, dividindo-o em um número de parcelas e armazenando as informações adicionais da transação, incluindo o valor da taxa de cada parcela.

Para receber pagamentos, a carteira digital deve ter o método receber(valor), que recebe um pagamento no valor especificado e atualiza o saldo da carteira digital. Este método também deve armazenar as informações adicionais da transação, incluindo o nome da pessoa que depositou na carteira.

Além disso, a classe deve ter um método listarTransacoes() que lista todas as transações realizadas na carteira digital, mostrando a data, hora, valor e informações adicionais para as transações de crédito parcelado.

O objetivo deste desafio é testar suas habilidades em programação orientada a objetos, manipulação de listas e implementação de lógica de negócios. 
Para testar a classe, você deve criar uma instância da carteira digital com um ID único, criar uma instância da classe User com name, phone e cpf, realizar algumas transações de pagamento e recebimento em diferentes formas de pagamento, e listar todas as transações realizadas. O prazo para a entrega do desafio é de 5 dias a partir da data atual.*/

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

