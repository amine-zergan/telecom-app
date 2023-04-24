// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

abstract class Failure {}

class ErrorValidator extends Failure {
  final String message;
  ErrorValidator({
    required this.message,
  });
}
