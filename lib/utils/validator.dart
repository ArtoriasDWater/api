class AppValidator {
  static String? validateEmail(String? value){
    if(value == null || value.isEmpty) return 'El correo electrónico es requerido';
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)) return 'Ingrese un correo electrónico válido';
    return null;
  }

  static String sanitizeInput(String input){
    return input.trim().replaceAll(RegExp(r'<[^>]*>'), '');
  }
}