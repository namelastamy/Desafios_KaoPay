class Spotify {
  List<Musica> _musicas = [];
  List<Album> _albuns = [];
  List<String> _usuarios =[];

  Spotify(this._musicas, this._albuns);

  // Getter para a lista de músicas
  List<Musica> get musicas => _musicas;
  
  // Setter para a lista de músicas
  set musicas(List<Musica> musicas) {
    _musicas = musicas;
  }

  // Getter para a lista de álbuns
  List<Album> get albuns => _albuns;
  
  // Setter para a lista de álbuns
  set albuns(List<Album> albuns) {
    _albuns = albuns;
  }

  // Getter para a lista de usuários
  List<String>  get usuarios => _usuarios;

  // Setter para a lista de usuários
  set usuarios(List<String> usuarios) {
   _usuarios = usuarios;
  }

  //Método de adicionar albuns
  void adicionarAlbuns(Album album){
    _albuns.add(album);
    print(" Now $album on Spotify");
    notificarUsuarios(album);
  }

  //Método de remover albuns
  void removerAlbuns(Album album){
    _albuns.remove(album);
    print("Album $album foi removido");
  }


  // Método para notificar os usuários dos novos lançamentos de álbuns
  void notificarUsuarios(Album album) {
    for(var usuario in_usuarios){
        enviarNotificacao(usuario,album);
    }
  }

  // Método para enviar notificação para o usuario
  void enviarNotificação(String usuario,Album album){
    print('Notiificação enviada para $usuario: Novo álbum adicionado - ${album.nome}');
  }
}

//classe musica e seus atributos
class Musica{
    final String _nome;
    final String _duracao;
    final String _data;

    Musica(this._nome, this._duracao, this._data);

    @override
    String toString(){
        return '$nome - $duracao as $data';
    }

//classe album e seus atibutos
class Album{
    final String _nomeAlbum;
    final String _duracaoDoAlbum;
    final String _dataDoAlbum;

    Album(this._nomeAlbum, this._duracaoDoAlbum, this._dataDoAlbum);

    @override
    String toString(){
        return '$nomeAlbum - $duracaoDoAlbum';
    }
   }
}

void main(){
    //Lista de musicas dos cantores
}