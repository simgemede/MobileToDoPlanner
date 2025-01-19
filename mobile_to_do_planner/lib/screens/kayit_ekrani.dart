import 'package:flutter/material.dart';
import 'package:mobile_to_do_planner/db/db_helper.dart'; // Veritabanı yardımcısı
import 'package:mobile_to_do_planner/screens/giris_ekrani.dart'; // GirisEkrani sınıfını import edin

class KayitEkrani extends StatefulWidget {
  const KayitEkrani({Key? key}) : super(key: key);

  @override
  _KayitEkraniState createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  final _isimController = TextEditingController();
  final _emailController = TextEditingController();
  final _sifreController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _errorMessage = ''; // Hata mesajını göstermek için

  void _registerUser() async {
    String isim = _isimController.text;
    String email = _emailController.text;
    String sifre = _sifreController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Şifre doğrulama
    if (sifre != confirmPassword) {
      setState(() {
        _errorMessage = 'Şifreler eşleşmiyor';
      });
      return;
    } else {
      setState(() {
        _errorMessage = ''; // Hata mesajını temizle2
      });
    }

    if (isim.isNotEmpty && email.isNotEmpty && sifre.isNotEmpty) {
      // Veritabanına kullanıcıyı ekle
      await DBYardimci.insertUser(isim, email, sifre);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kullanıcı başarıyla kaydedildi!')),
      );
      // Giriş ekranına yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GirisEkrani()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFBEFEA), // Arka plan rengi (açık turuncu ton)
      body: SafeArea(
        child: Column(
          children: [
            // Üst Görsel veya İllüstrasyon
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
              ),
            ),
            // Ortadaki Beyaz Card (Container)
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Başlık
                    const Text(
                      'Bize Katıl',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // İsim Giriş Alanı
                    TextField(
                      controller: _isimController,
                      decoration: InputDecoration(
                        labelText: 'İsim',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // E-posta Giriş Alanı
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Şifre Giriş Alanı
                    TextField(
                      controller: _sifreController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Şifre Doğrulama Alanı
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Şifreyi Doğrula',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Şifreler eşleşmiyorsa hata mesajı
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    const SizedBox(height: 15), // Boşluk
                    // "Kayıt Ol" Butonu
                    ElevatedButton(
                      onPressed: _registerUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50), // Yeşil buton
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                  ],
                ),
              ),
            ),
            // Alt Kısım Metni
            /*Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    //MaterialPageRoute(
                     //builder: (context) => const GirisEkrani(),
                    ),
                  );
                },
                child: const Text(
                  'Zaten hesabın var mı? Giriş Yap',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
