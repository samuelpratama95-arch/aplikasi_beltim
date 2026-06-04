import 'dart:io';

void main() async {
  final images = {
    'uluwatu.jpg': 'https://picsum.photos/id/1018/400/600',
    'labuan_bajo.jpg': 'https://picsum.photos/id/1015/400/600',
    'borobudur.jpg': 'https://picsum.photos/id/1040/200/200',
    'bromo.jpg': 'https://picsum.photos/id/1036/200/200',
    'raja_ampat.jpg': 'https://picsum.photos/id/1038/200/200',
    'wakatobi.jpg': 'https://picsum.photos/id/1039/200/200',
    'article_borobudur.jpg': 'https://picsum.photos/id/1040/600/300',
    'article_labuan_bajo.jpg': 'https://picsum.photos/id/1015/600/300',
    'article_kecak.jpg': 'https://picsum.photos/id/1016/600/300',
  };

  final dir = Directory('assets/images');
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }

  final client = HttpClient();
  
  for (final entry in images.entries) {
    try {
      final req = await client.getUrl(Uri.parse(entry.value));
      final res = await req.close();
      final file = File('assets/images/${entry.key}');
      await res.pipe(file.openWrite());
      print('Downloaded ${entry.key}');
    } catch (e) {
      print('Error downloading ${entry.key}: $e');
    }
  }
  
  client.close();
}
