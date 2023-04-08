class Spotify {
  List<Musica> _musicas = [];
  List<Album> _albuns = [];
  List<String> _usuarios = [];

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
  List<String> get usuarios => _usuarios;

  // Setter para a lista de usuários
  set usuarios(List<String> usuarios) {
    _usuarios = usuarios;
  }

  //Método de adicionar álbuns
  void adicionarAlbum(Album album) {
    _albuns.add(album);
    print("Agora o álbum ${album.nomeAlbum} está no Spotify");
    notificarUsuarios(album);
  }

  //Método de remover álbuns
  void removerAlbum(Album album) {
    _albuns.remove(album);
    print("O álbum ${album.nomeAlbum} foi removido");
  }

  // Método para notificar os usuários dos novos lançamentos de álbuns
  void notificarUsuarios(Album album) {
    for (var usuario in _usuarios) {
      enviarNotificacao(usuario, album);
    }
  }

  // Método para enviar notificação para o usuário
  void enviarNotificacao(String usuario, Album album) {
    print('Notificação enviada para $usuario: Novo álbum adicionado - ${album.nomeAlbum}');
  }
}

// Classe Musica e seus atributos
class Musica {
  final String nomeArtista;
  final String nome;
  final String duracao;
  final String data;

  // Construtor da classe Musica
  Musica(this.nomeArtista, this.nome, this.duracao, this.data);

  // Método toString() para representar a classe como String da musica
  @override
  String toString() {
    return '$nomeArtista - $nome - $duracao - $data';
  }
}

// Classe Album e seus atributos
class Album {
  String _nomeAlbum;
  String _duracaoDoAlbum;
  String _dataDoAlbum;

  String get nomeAlbum => _nomeAlbum;
  set nomeAlbum(String value) => _nomeAlbum = value;

  String get duracaoDoAlbum => _duracaoDoAlbum;
  set duracaoDoAlbum(String value) => _duracaoDoAlbum = value;

  String get dataDoAlbum => _dataDoAlbum;
  set dataDoAlbum(String value) => _dataDoAlbum = value;

  Album(this._nomeAlbum, this._duracaoDoAlbum, this._dataDoAlbum);

  @override
  String toString() {
    return '$nomeAlbum - $duracaoDoAlbum - $dataDoAlbum';
  }
}

void main() {
  // Lista de músicas dos cantores
  List<Musica> musicas = [
    Musica("BTS", "Fake Love", "4:30", "2018-05-18"),
    Musica("BTS", "Dynamite", "3:19", "2020-08-21"),
    Musica("Taylor Swift", "Shake It Off", "3:39", "2014-08-18"),
  ];

  // Lista de álbuns do Spotify
  List<Album> albuns = [
    Album("Love Yourself: Tear", "51:28", "2018-05-18"),
    Album("Map of the Soul: 7", "72:08", "2020-02-21"),
  ];

  // Instanciando o objeto Spotify
  Spotify spotify = Spotify(musicas, albuns);

  // Adicionando novos álbuns e notificando os usuários
  Album album1 = Album("evermore", "59:17", "2020-12-11");
  spotify.adicionarAlbum(album1);

  Album album2 = Album("Positions", "41:16", "2020-10-30");
  spotify.adicionarAlbum(album2);

  // Removendo um álbum
  spotify.removerAlbum(album1);
}