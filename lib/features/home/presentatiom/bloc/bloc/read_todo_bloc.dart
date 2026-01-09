import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/utils/shared_preference.dart';

part 'read_todo_event.dart';

class ReadTodoBloc extends Bloc<ReadTodoEvent, Set<int>> {
  ReadTodoBloc() : super({}) {

   
    final saved = LocalDb.getReadList();
    emit(saved.map((e) => int.parse(e)).toSet());

    on<ReadTodoEvent>((event, emit) async {
      final newSet = Set<int>.from(state);

      if (newSet.contains(event.index)) {
        newSet.remove(event.index);   
      } else {
        newSet.add(event.index);      
      }

      await LocalDb.saveReadList(
        newSet.map((e) => e.toString()).toList(),
      );

      emit(newSet);
    });
  }
}

