import 'package:equatable/equatable.dart';

enum CriterionClass {
  resenha('Resenha'),
  presencavip('Presença VIP'),
  aura('Aura'),
  parceiro('Modo Parceiro'),
  carisma('Carisma Natural'),
  humor('Humor de Milhões'),
  energiagrupo('Energia de Grupo'),
  criatividade('Criatividade Caótica'),
  atleta('Modo Atleta'),
  talento('Talento de Palco'),
  drip('Drip Escolar'),
  dorama('Coração de Dorama'),
  queridinho('Queridinho dos Professores'),
  cerebro('Cérebro Turbo'),
  caos('Caos Controlado');

  final String displayName;
  const CriterionClass(this.displayName);
}

class Criterion extends Equatable {
  final CriterionClass criterion;
  final int stars;

  Criterion({required this.criterion, required this.stars}) {
    _validate();
  }

  void _validate() {
    if (stars < 1 || stars > 5) {
      throw ArgumentError('Estrelas devem estar entre 1 e 5');
    }
  }

  Criterion copyWith({CriterionClass? criterion, int? stars}) {
    return Criterion(
      criterion: criterion ?? this.criterion,
      stars: stars ?? this.stars,
    );
  }

  @override
  List<Object?> get props => [criterion, stars];

  @override
  String toString() {
    return 'Criterion(criterion: ${criterion.displayName}, stars: $stars)';
  }
}
