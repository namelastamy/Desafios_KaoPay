class GerenciadorDeShows {
  final List<Show> _shows;
  List<Show> _proximosShows;

  GerenciadorDeShows(this._shows, this._proximosShows);

  // Getter para a lista de shows
  List<Show> get shows => _shows;

  // Getter e Setter para a lista de próximos shows
  List<Show> get proximosShows => _proximosShows;
  set proximosShows(List<Show> value) {
    _proximosShows = value;
  }

  // Método para adicionar um novo show à lista
  void adicionarShow(Show show) {
    _shows.add(show);
  }

  // Método para remover um show da lista
  void removerShow(Show show) {
    _shows.remove(show);
  }
}

class Show {
  final String local;
  final String data;
  final String hora;
  final double cache;

  Show(this.local, this.data, this.hora, this.cache);

  @override
  String toString() {
    return '$local - $data às $hora - Cachê: R\$ $cache';
  }
}

void main() {
  // Lista de Shows
  List<Show> shows = [
    Show("Estádio do Morumbi", "04/04/2023", "17:00", 10000000.00),
    Show("Allianz Parque", "05/04/2023", "18:00", 120000.00),
    Show("Maracanã", "06/04/2023", "19:00", 150000.00),
    Show("Mineirão", "07/04/2023", "18:00", 900000.00),
    Show("Arena Corinthians", "08/04/2023", "17:00", 8000000.00),
  ];

  // Instanciando o gerenciador de shows
  GerenciadorDeShows gerenciador = GerenciadorDeShows(shows, []);

  // Adicionando um novo Show à lista
  gerenciador.adicionarShow(Show("Arena da Amazonia", "11/04/2023", "18:00", 520000.00));

  // Removendo um Show da lista
  gerenciador.removerShow(shows[0]);

  // Definindo os próximos shows
  gerenciador.proximosShows = shows.sublist(0, 5);

  // Mostrando os próximos shows
  print("Próximos shows:");
  for (Show show in gerenciador.proximosShows) {
    print(show);
  }
}