import 'package:flutter/material.dart';

class BaslangicEkrani extends StatelessWidget {
  const BaslangicEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Arka plan rengi
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Üst Görsel Bölümü
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/baslangic.jpg', // Görsel dosyası yolu
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Metin ve Açıklama Bölümü
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TO DO PLANNER',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E4E4E),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: Text(
                        'Planlarınızı düzenleyin ve hedeflerinize ulaşmak için şimdi başlayın!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7B7B7B),
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Butonlar Bölümü
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Giriş Yap Butonu
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Giriş yapma ekranına yönlendirme
                          Navigator.pushNamed(context, '/GirisEkrani');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50), // Yeşil ton
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          minimumSize: Size(150, 50),
                        ),
                        child: const Text(
                          'Giriş Yap',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Kayıt Ol Butonu
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Kayıt olma ekranına yönlendirme
                          Navigator.pushNamed(context, '/kayitEkrani');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 94, 240),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          minimumSize: Size(150, 50),
                        ),
                        child: const Text(
                          'Kayıt Ol',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
