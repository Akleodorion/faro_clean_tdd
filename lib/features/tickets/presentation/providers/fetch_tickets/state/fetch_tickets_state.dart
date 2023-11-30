import 'package:equatable/equatable.dart';
import 'package:faro_clean_tdd/features/tickets/domain/entities/ticket.dart';

abstract class FetchTicketsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends FetchTicketsState {}

class Loading extends FetchTicketsState {}

class Loaded extends FetchTicketsState {
  final List<Ticket> tickets;

  Loaded({required this.tickets});
}

class Error extends FetchTicketsState {
  final String message;

  Error({required this.message});
}