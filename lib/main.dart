import 'package:api_practice/album_api_service.dart';
import 'package:api_practice/album_class.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NameBar());
}

class NameBar extends StatelessWidget {
  const NameBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Api',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AlbumApiService _albumApiService = AlbumApiService();
  late Future<List<AlbumClass>> _future;

  @override
  void initState() {
    super.initState();
    _future = _albumApiService.getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Albums List')),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No albums found',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            );
          }

          final albums = snapshot.data!;

          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${album.id}')),
                title: Text(album.title ?? 'No Title'),
                subtitle: Text('User id = ${album.userId}'),
              );
            },
          );
        },
      ),
    );
  }
}
