import 'dart:io';

class Task {
  String title;
  String description;
  bool isCompleted;

  Task(this.title, this.description, {this.isCompleted = false});

  @override
  String toString() {
    return 'Title: $title, Description: $description, Completed: ${isCompleted ? 'Yes' : 'No'}';
  }

  String toFileFormat() {
    return '$title|$description|${isCompleted ? '1' : '0'}';
  }

  factory Task.fromFileFormat(String line) {
    var parts = line.split('|');
    return Task(
      parts[0],
      parts[1],
      isCompleted: parts[2] == '1',
    );
  }
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    print('Task added successfully.');
  }

  void updateTask(int index, Task task) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = task;
      print('Task updated successfully.');
    } else {
      print('Invalid task index.');
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      print('Task deleted successfully.');
    } else {
      print('Invalid task index.');
    }
  }

  List<Task> getTasks() {
    return tasks;
  }

  List<Task> getCompletedTasks() {
    return tasks.where((task) => task.isCompleted).toList();
  }

  List<Task> getIncompleteTasks() {
    return tasks.where((task) => !task.isCompleted).toList();
  }

  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].isCompleted = !tasks[index].isCompleted;
      print('Task completion status toggled.');
    } else {
      print('Invalid task index.');
    }
  }

  void saveTasksToFile(String filename) {
    final file = File(filename);
    final lines = tasks.map((task) => task.toFileFormat()).toList();
    file.writeAsStringSync(lines.join('\n'));
    print('Tasks saved to file.');
  }

  void loadTasksFromFile(String filename) {
    final file = File(filename);
    if (file.existsSync()) {
      final lines = file.readAsLinesSync();
      tasks = lines.map((line) => Task.fromFileFormat(line)).toList();
      print('Tasks loaded from file.');
    } else {
      print('No saved tasks found.');
    }
  }

  List<Task> searchTasks(String keyword) {
    return tasks
        .where(
            (task) => task.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}

void main() {
  final taskManager = TaskManager();
  const filename = 'tasks.txt';
  taskManager.loadTasksFromFile(filename);

  while (true) {
    print('\nTask Manager Menu:');
    print('1. Add a new task');
    print('2. Update a task');
    print('3. Delete a task');
    print('4. List all tasks');
    print('5. List completed tasks');
    print('6. List incomplete tasks');
    print('7. Toggle task completion status');
    print('8. Search tasks');
    print('9. Save and Exit');

    stdout.write('Select an option: ');
    int? choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        stdout.write('Enter title: ');
        String title = stdin.readLineSync() ?? '';
        stdout.write('Enter description: ');
        String description = stdin.readLineSync() ?? '';
        taskManager.addTask(Task(title, description));
        break;

      case 2:
        stdout.write('Enter task index to update: ');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null) {
          stdout.write('Enter new title: ');
          String title = stdin.readLineSync() ?? '';
          stdout.write('Enter new description: ');
          String description = stdin.readLineSync() ?? '';
          taskManager.updateTask(index, Task(title, description));
        } else {
          print('Invalid input.');
        }
        break;

      case 3:
        stdout.write('Enter task index to delete: ');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null) {
          taskManager.deleteTask(index);
        } else {
          print('Invalid input.');
        }
        break;

      case 4:
        print('All Tasks:');
        taskManager.getTasks().forEach((task) => print(task));
        break;

      case 5:
        print('Completed Tasks:');
        taskManager.getCompletedTasks().forEach((task) => print(task));
        break;

      case 6:
        print('Incomplete Tasks:');
        taskManager.getIncompleteTasks().forEach((task) => print(task));
        break;

      case 7:
        stdout.write('Enter task index to toggle completion status: ');
        int? index = int.tryParse(stdin.readLineSync() ?? '');
        if (index != null) {
          taskManager.toggleTaskCompletion(index);
        } else {
          print('Invalid input.');
        }
        break;

      case 8:
        stdout.write('Enter keyword to search: ');
        String keyword = stdin.readLineSync() ?? '';
        List<Task> results = taskManager.searchTasks(keyword);
        if (results.isNotEmpty) {
          print('Search Results:');
          results.forEach((task) => print(task));
        } else {
          print('No tasks found.');
        }
        break;

      case 9:
        taskManager.saveTasksToFile(filename);
        print('Exiting...');
        return;

      default:
        print('Invalid option, please try again.');
        break;
    }
  }
}
