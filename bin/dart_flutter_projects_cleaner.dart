import 'dart:io';

void main(List<String> arguments) async {
  final dir = Directory('F:/FlutterProjects');
  final List<FileSystemEntity> projectEntities = await dir.list().toList();
  final Iterable<Directory> projectFolders =
      projectEntities.whereType<Directory>();

  for (var projectFolder in projectFolders) {
    List<FileSystemEntity> innerEntities = await projectFolder.list().toList();
    Iterable<Directory> innerFolders = innerEntities.whereType<Directory>();
    for (var folder in innerFolders) {
      if (folder.path.contains('\\build')) {
        print(folder.path);
        folder.deleteSync(recursive: true);
      }
    }
  }
}
