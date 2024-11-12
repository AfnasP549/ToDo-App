import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/screen/add_screen.dart';
import 'package:todo_bloc/widgets/custom_appbar.dart';
import 'package:todo_bloc/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodoBloc>(context).add(FetchTodo());
    return Scaffold(
      appBar: customAppBar('ToDo List'),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todo.length,
              itemBuilder: (context, index) {
                final todo = state.todo[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomCard(todo: todo),
                );
              });
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 247, 220, 111),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
