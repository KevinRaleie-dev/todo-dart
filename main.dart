import 'dart:io';

import 'todo.dart';

List<Todo> todos = [];
void main(List<String> args) {
  int input = 1;

  while (input != 5) {
    input = menu();

    switch (input) {
      case 1:
        addTodo();
        break;
      case 2:
        replaceTodo();
        break;
      case 3:
        listTodos();
        break;
      case 4:
        deleteTodo();
        break;
      default:
    }
  }
  print('See you soon :)');
}

String userInput() {
  print('Add a new todo: (Enter 999 to quit)');
  String input = stdin.readLineSync()!;

  return input;
}

void addTodo() {
  /**
   * this func should add a new todo to the todos list
   * ask the user for input until they enter a certain string then they are 
   * done adding items to the todos
   */
  var input = userInput();

  if (input == '999') {
    print('Exiting...');
  } else {
    var t = new Todo(name: input.trim());
    todos.add(t);
    print('🤗 Added!');

    // recursively call the function
    addTodo();
  }
}

void replaceTodo() {
  /**
   * this func should edit a todo in the list of todos
   */
  var choice =
      displayTodos(); // i get the number at which im going replace the item at

  try {
    var index = choice - 1;

    print('Enter the new todo: ');
    var newTodo = stdin.readLineSync();

    var todo = new Todo(name: newTodo!);

    todos[index] = todo;
    print('Done 👍🏽');
  } catch (e) {
    print(e.toString());
  }
}

void listTodos() {
  /**
   * this func should list all todos in the todos list
   */

  int count = 1;
  if (todos.length >= 1) {
    print('⬇️  Your list of todos ⬇️\n');
    for (var todo in todos) {
      print('${count}. ${todo.name}');
      count++;
    }
  } else {
    print('There arent any todos to display');
  }
}

void deleteTodo() {
  /**
   * this func should remove a todo from a list and rearrange the list accordingly - marking it as done
   */

  int input = displayTodos();
  try {
int choice = input - 1;

  todos.removeAt(choice);
  int deletedTodo = choice + 1;
  print("todo number $deletedTodo deleted");


  }
  catch(e) {
	print(e.toString());
  }
  }

int displayTodos() {
  listTodos();

  print('Pick a todo:');
  var choice = int.tryParse(stdin.readLineSync()!);
  return choice!;
}

int menu() {
  print('\n✨Terminal To-do✨\n');
  print('1. Add a new todo');
  print('2. Edit a todo');
  print('3. List all todos');
  print('4. Delete a todo');
  print('5. Exit program');
  var input = int.tryParse(stdin.readLineSync()!);

  return input!;
}
