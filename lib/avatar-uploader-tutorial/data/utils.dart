import 'dart:io';

double getMBFileSize(File file) {
  return file.lengthSync() / 125000;
}
