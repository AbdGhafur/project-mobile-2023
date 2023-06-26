import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'travel.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE destinations(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT)',
      );
    },
    version: 1,
  );

  runApp(TravelCrudApp(database));
}

class TravelCrudApp extends StatelessWidget {
  final Future<Database>? database;

  const TravelCrudApp(this.database, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TravelHomeScreen(database!),
    );
  }
}

class TravelHomeScreen extends StatefulWidget {
  final Future<Database> database;

  const TravelHomeScreen(this.database, {Key? key}) : super(key: key);

  @override
  _TravelHomeScreenState createState() => _TravelHomeScreenState();
}

// ... Rest of the code

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  List<Map<String, dynamic>> destinations = [];

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    final Database db = await widget.database;
    final List<Map<String, dynamic>> maps = await db.query('destinations');

    setState(() {
      destinations = maps;
    });
  }

  Future<void> insertDestination(String name, String description) async {
    final Database db = await widget.database;
    await db.insert(
      'destinations',
      {
        'name': name,
        'description': description,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateDestination(
      int id, String name, String description) async {
    final Database db = await widget.database;
    await db.update(
      'destinations',
      {
        'name': name,
        'description': description,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDestination(int id) async {
    final Database db = await widget.database;
    await db.delete(
      'destinations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel CRUD Example'),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (BuildContext context, int index) {
          final destination = destinations[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              title: Text(
                destination['name'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              contentPadding: const EdgeInsets.all(10),
              subtitle: Text(
                destination['description'],
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateDestinationScreen(
                            widget.database,
                            destination['id'],
                            destination['name'],
                            destination['description'],
                          ),
                        ),
                      ).then((value) {
                        fetchDestinations();
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteDestination(destination['id']);
                      fetchDestinations();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddDestinationScreen(widget.database)),
          ).then((value) {
            fetchDestinations();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddDestinationScreen extends StatefulWidget {
  final Future<Database> database;

  const AddDestinationScreen(this.database, {super.key});

  @override
  _AddDestinationScreenState createState() => _AddDestinationScreenState();
}

class _AddDestinationScreenState extends State<AddDestinationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Destination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final description = _descriptionController.text;

                    widget.database.then((db) {
                      insertDestination(name, description);
                      Navigator.pop(context);
                    });
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> insertDestination(String name, String description) async {
    final Database db = await widget.database;
    await db.insert(
      'destinations',
      {
        'name': name,
        'description': description,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

class UpdateDestinationScreen extends StatefulWidget {
  final Future<Database> database;
  final int id;
  final String initialName;
  final String initialDescription;

  const UpdateDestinationScreen(
      this.database, this.id, this.initialName, this.initialDescription,
      {super.key});

  @override
  _UpdateDestinationScreenState createState() =>
      _UpdateDestinationScreenState();
}

class _UpdateDestinationScreenState extends State<UpdateDestinationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.initialName;
    _descriptionController.text = widget.initialDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Destination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final description = _descriptionController.text;

                    widget.database.then((db) {
                      updateDestination(widget.id, name, description);
                      Navigator.pop(context);
                    });
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateDestination(
      int id, String name, String description) async {
    final Database db = await widget.database;
    await db.update(
      'destinations',
      {
        'name': name,
        'description': description,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
