
import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;

void main() {
  runApp(SeedHunterPro());
}

class SeedHunterPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeedHunter Pro',
      theme: ThemeData.dark(),
      home: SeedPhraseScreen(),
    );
  }
}

class SeedPhraseScreen extends StatefulWidget {
  @override
  _SeedPhraseScreenState createState() => _SeedPhraseScreenState();
}

class _SeedPhraseScreenState extends State<SeedPhraseScreen> {
  String seedPhrase = '';

  void generateSeed({int words = 12}) {
    setState(() {
      seedPhrase = bip39.generateMnemonic(strength: words == 12 ? 128 : 256);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SeedHunter Pro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Seed Phrase:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            SelectableText(seedPhrase, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => generateSeed(words: 12),
                    child: Text('12 Words')),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () => generateSeed(words: 24),
                    child: Text('24 Words')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
