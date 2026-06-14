import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
final TextEditingController _loginController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _checkLogin();
    }
  }
 void _checkLogin() {
   if (_loginController.text == 'ArtemD' && _passwordController.text == '6767') {
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text('Успешный вход!'),
         backgroundColor: Colors.green,
       ),
     );
   } else {
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text('Неверный логин или пароль'),
         backgroundColor: Colors.red,
       ),
     );
   }
 }
 @override
  void initState() {
    super.initState();
    _loginController.text = 'ArtemD';
    _passwordController.text = '6767';
  }
  @override
 void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'WK',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 40),
                Form(
                    key: _formKey,child: Column(
                  children: [
                    TextFormField(
                      controller: _loginController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Введите логин';
                        }
                        if(value.trim().length < 4){
                          return 'Логин должен содержать не менее 4 символов';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Логин',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Введите пароль';
                        }
                        if(value.trim().length < 8){
                          return 'Пароль должен содержать не менее 8 символов';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Пароль',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                )),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Войти'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}