import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final double? width;
  final String urlLink;

  const BookCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.urlLink,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        openGutenbergPage(urlLink);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              width: width ?? 114,
              height: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(211, 209, 238, 0.5),
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                imageUrl,
                width: width ?? 114,
                height: 162,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.broken_image, color: Colors.grey),
                      const SizedBox(height: 10),
                      const Text('Due to CORS issue, we are not able to show the image', style: TextStyle(fontSize: 12, color: Colors.grey),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 8),
        
            // Book Title
            SizedBox(
              width: width ?? 114,
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
        
            const SizedBox(height: 4),
        
            // Author Name
             SizedBox(
              width: width ?? 114,
              child: Text(
                author,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




void openGutenbergPage(String urlLink) async {
  final url = Uri.parse(urlLink);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch $url';
  }
}




