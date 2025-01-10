// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:portofolio/components/hard_skill.dart';
import 'package:portofolio/components/soft_skill.dart';
import 'package:portofolio/ui/list_exp.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text("Welcome to my Portfolio"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Image.asset(
                'lib/assets/images/zae_potrait.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text('Tentang Saya',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 10),
            Text(
              'Perkenalkan saya Zaehaykal, sebagai lulusan baru Teknik Informatika di Universitas Indrprasta PGRI, saya memiliki pengalaman dalam mengembangkan aplikasi mobile menggunakan Flutter Framework yang terintegrasi dengan Rest API Laravel 10 yang saya buat sendiri. Saya juga sering diminta bantuan oleh orang-orang terdekat untuk memperbaiki laptop atau PC mereka ketika mengalami masalah',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.justify,
            ),
            const Divider(
              height: 50,
              thickness: 2,
            ),
            Text('Kontak', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 20, 
                      runSpacing:
                          20, 
                      children: [
                        InkWell(
                          onTap: () async {
                            const String email = 'zaehaykal@gmail.com';
                            final Uri emailUrl = Uri(
                              scheme: 'mailto',
                              path: email,
                              query:
                                  'subject=Hello Zaehaykal&body=Saya telah melihat Portofoliomu!',
                            );
                            if (await canLaunchUrl(emailUrl)) {
                              await launchUrl(emailUrl);
                            } else {
                              _showSnackbar(context,
                                  'Tidak dapat membuka aplikasi email');
                            }
                          },
                          child: const SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: 100,
                                ),
                                SizedBox(height: 10),
                                Text('zaehaykal@gmail.com',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            const String myNumber = '+62895344898564';
                            final Uri waUrl = Uri.parse(
                                'https://wa.me/$myNumber?text=Hallo Zaehaykal, saya telah melihat Portofolio mu.');
                            if (await canLaunchUrl(waUrl)) {
                              await launchUrl(waUrl);
                            } else {
                              _showSnackbar(
                                  context, 'Tidak dapat membuka WhatsApp');
                            }
                          },
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 100,
                                  color: Colors.blue[900],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  '+62895344898564',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final Uri waUrl =
                                Uri.parse('https://linkedin.com/in/zaehaykal');
                            if (await canLaunchUrl(waUrl)) {
                              await launchUrl(waUrl);
                            } else {
                              _showSnackbar(
                                  context, 'Tidak dapat membuka Linkedin');
                            }
                          },
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Image.asset(
                                  'lib/assets/logo/logo_linkedin.png',
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'zaehaykal',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final Uri waUrl =
                                Uri.parse('https://github.com/zaehaykal');
                            if (await canLaunchUrl(waUrl)) {
                              await launchUrl(waUrl);
                            } else {
                              _showSnackbar(
                                  context, 'Tidak dapat membuka Github');
                            }
                          },
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              children: [
                                Image.asset(
                                  'lib/assets/logo/github-mark-white.png',
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'zaehaykal',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 50,
              thickness: 2,
            ),
            Text('Hard Skill',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children:
                      getHardSkillIcons(), // Panggil fungsi untuk menampilkan ikon
                ),
              ),
            ),
            const Divider(
              height: 50,
              thickness: 2,
            ),
            Text('Soft Skill',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 20),
            Center(
                child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: getSoftSkillIcons())),
            const Divider(
              height: 50,
              thickness: 2,
            ),
            Text('Sertifikat',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 20),
            ImageSlideshow(
              width: double.infinity,
              height: 500,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              autoPlayInterval: 3000,
              isLoop: true,
              children: [
                Image.asset('lib/assets/images/sertifikat/designgrafis.png'),
                Image.asset('lib/assets/images/sertifikat/funda_flutter.png'),
                Image.asset('lib/assets/images/sertifikat/gitandgoithub.png'),
                Image.asset('lib/assets/images/sertifikat/dasarjavascript.png'),
                Image.asset('lib/assets/images/sertifikat/back_end_javascript.png'),
                Image.asset('lib/assets/images/sertifikat/pkl.png'),
              ],
            ),
            Text('Projek', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(
              height: 400,
              child: ListExp(),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Volunteer', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Karang Taruna Tingkat RT',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '''Tahun 2022 s/d sekarang, 
              Membuat Dokumen serta laporan kegiatan yang dilaksanakan dan memantau kegiatan  agar sampai pada tujuan.''',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Staff RT',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '''Tahun 2024 s/d sekarang,
              Melakukan kegiatan sosial dan kegiatan lainnya untuk membantu masyarakat sekitar.
              serta membuat dokumen untuk laporan transparansi kepada warga.''',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
