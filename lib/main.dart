import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";

  void _login() {
    String kullaniciAdi = _usernameController.text;
    String sifre = _passwordController.text;

    if (kullaniciAdi == "admin" && sifre == "1234") {
      setState(() {
        _errorMessage = "Giriş başarılı!";
      });
    } else {
      setState(() {
        _errorMessage = "Hatalı kullanıcı adı veya şifre!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: ekranYuksekligi / 30),
              child: SizedBox(
                  width: ekranGenisligi / 4,
                  height: ekranYuksekligi / 6,
                  child: Image.asset("resimler/logo.png")
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi / 40),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi / 40),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Şifre",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red, fontSize: ekranGenisligi / 30),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi / 30),
              child: SizedBox(
                width: ekranGenisligi / 1.4,
                height: ekranYuksekligi / 15,
                child: ElevatedButton(
                  child: Text("Giriş Yap", style: TextStyle(fontSize: ekranGenisligi / 25)),
                  onPressed: _login,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Yardım seçildi");
              },
              child: Text(
                "Yardım ?",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: ekranGenisligi / 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


