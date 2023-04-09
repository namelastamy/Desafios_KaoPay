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
    Album("2 Cool 4 Skool", "20:49", "2013-07-12"),
    Album("O!RUL8,2?", "30:35", "2013-09-11"),
    Album("Skool Luv Affair", "35:29", "2014-02-12"),
    Album("Skool Luv Affair: Special Addition", "43:23", "2014-05-14"),
    Album("Dark & Wild", "51:31", "2014-08-20"),
    Album("Wake Up: Standart Edition", "49:39", "2014-12-24"),
    Album("The Most Beautiful Moment in Life: Pt.1", "31:27", "2015-04-29"),
    Album("The Most Beautiful Moment in Life: Pt.2", "34:12", "2015-11-30"),
    Album("The Most Beautiful Moment in Life: Young", "01:28", "2016-05-02"),
    Album("Youth", "49:16", "2016-09-07"),
    Album("Wings", "53:41", "2016-10-10"),
    Album("You Never Walk Alone", "01:06", "2017-02-13"),
    Album("Love Yourself: 承 Her", "30:42", "2017-09-18"),
    Album("Face Yourself", "44:25", "2018-04-04"),
    Album("Love Yourself: 轉 Tear", "43:58", "2018-05-18"),
    Album("Love Yourself: 結 Answer", "01:44", "2018-08-24"),
    Album("Map of the soul: Persona", "26:20", "2019-04-12"),
    Album("Map of the Soul: 7", "01:14", "2020-02-21"),
    Album("Map of the soul: 7 The Journey", "46:20", "2020-06-14"),
    Album("Be", "28:30", "2020-11-20"),
    Album("Proof", "02:80", "2022-06-10"),
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