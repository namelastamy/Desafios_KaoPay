class GrupoKpop {
   String _nome;
   List<String>_integrantes;
   String _agencia;
   int _debut;
  
   GrupoKpop(this._nome, this._integrantes, this._agencia, this._debut);

    //Getters e Setters para as propriedades privadas

       String get nome => _nome;
       set nome(String nome) =>_nome = nome;

       List<String> get integrantes =>_integrantes;
       set integrantes(List<String>integrantes) =>_integrantes = integrantes;

       String get agencia =>_agencia;
       set agencia(String agencia) =>_agencia = agencia;

       int get debut =>_debut;
       set debut(int debut) =>_debut = debut;

     //Método de adicionar integrantes

   void adicionarIntegrante(String integrante){
    _integrantes.add(integrante);
    print("$nome é um novo integrante");
   }

     //Método de remover integrantes

   void removerIntegrante(String integrante){
    _integrantes.remove(integrante);
    print("$integrante integrante será removido");
   }

     //Método de mudar nome da Agencia

  void alterarAgencia(String agencia){
    _agencia = agencia;
    print(" A Agência  do grupo $nome mudou para $agencia ");
  }

  void infoGrupoKpop(){
    print("$_nome, $_integrantes, $_agencia, $_debut");
  }
}

void Main(){

     //Lista dos grupos e seus respectivos componentes

List<GrupoKpop> grupos = [
  GrupoKpop("BTS", [
    "Kim Namjoon", 
    "Kim Seokjin", 
    "Min Yoongi",
    "Jung Hoseok",
    "Park Jimin",
    "Kim Taehyung",
    "Jeon Jungkook"
    ], "BigHit Entertainment / Hybe Labels", 2013),
  GrupoKpop("BLACKPINK", [
    "Jisoo", 
    "Jennie", 
    "Rosé", 
    "Lisa"
    ], "YG Entertainment", 2016),
  GrupoKpop("STRAY KIDS", [
    "Bang Chan", 
    "Lee Know", 
    "Chang Bin", 
    "Hyun Jin", 
    "Ji Sung", 
    "Lee Felix", 
    "Seung Min", 
    "Jeong In"
    ], "JYP Entertainment", 2018),
  ];

     //adicionar, remove e alterar agencia

 grupos[0].adicionarIntegrante("Naomy");

 grupos[1].removerIntegrante("Lisa");

 grupos[2].alterarAgencia("KAOPAY ENTERTAINMENT");

 for(var grupo in grupos){
  grupo.infoGrupoKpop();
 }
}