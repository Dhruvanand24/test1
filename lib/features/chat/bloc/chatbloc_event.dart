part of 'chatbloc_bloc.dart';

@immutable
sealed class ChatblocEvent {}

class ChatNewPromptEvent extends ChatblocEvent {
  final String prompt;
  ChatNewPromptEvent({
    required this.prompt,
  });
}
