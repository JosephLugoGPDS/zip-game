abstract class AppStrings {
  static const errorMessages = _ErrorMessages();
  static const menu = _Menu();
}

class _ErrorMessages {
  const _ErrorMessages();

  final commonError = "Ha ocurrido un error. Por favor volver a intentarlo.";
  final databaseError =
      "Ha ocurrido un problema al intentar realizar la petición.";
  final unexpectedError = "Ha ocurrido un error inesperado";
  final menuError = "Opción no encontrada";
}

class _Menu {
  const _Menu();

  final profile = "Mi perfil";
  final ranking = "Ranking";
  final online = "Top";
  final channels = "Medios";
  final groups = "Grupos";
  final challenges = "Retos";
}
