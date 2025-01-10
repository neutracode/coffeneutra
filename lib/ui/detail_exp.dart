import 'package:flutter/material.dart';
import 'package:portofolio/data/model/experience.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailExp extends StatelessWidget {
  final Experience experience;
  const DetailExp({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(experience.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                experience.imagePaths.isNotEmpty
                    ? experience.imagePaths[0]
                    : 'lib/assets/images/default.png',
                width: double.infinity,
                height: 500,
              ),
            ),
            const SizedBox(height: 10.0),
            // Judul
            Text(
              experience.title,
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              experience.perusahaan,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text("          Periode ${experience.periode}"),

            const SizedBox(height: 20.0),
            SizedBox(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: experience.imagePaths.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _showImageDialog(context, experience.imagePaths[index]);
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        experience.imagePaths[index],
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Deskripsi
            Text(
              experience.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10.0),
            // Link demo
            experience.demo.isNotEmpty
                ? GestureDetector(
                    onTap: () => _launchURL(experience.demo),
                    child: const Text(
                      'Lihat Demo',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Tidak dapat membuka URL: $url';
    }
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Tutup'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
