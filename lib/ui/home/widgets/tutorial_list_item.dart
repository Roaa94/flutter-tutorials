import 'package:flutter/material.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/file_upload_service_home_page.dart';

class TutorialListItem extends StatelessWidget {
  final String title;
  final String description;

  const TutorialListItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FileUploadServiceHomePage.routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.black.withOpacity(0.2)),
            bottom: BorderSide(width: 1, color: Colors.black.withOpacity(0.2)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 10),
                  Text(description),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
