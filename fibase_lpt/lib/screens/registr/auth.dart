import 'package:flutter/material.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;
   bool showLogin = true;


  @override
  Widget build(BuildContext context) {

    Widget _logo(){
      return Padding(
        padding: const EdgeInsets.only(top: 100),        
        child: Container(
          child: const Align(
            child: Text('Abigor Fit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscureText){
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child:  TextField(
          controller: controller,
          obscureText: obscureText,
        ),
      );
    };

    Widget _button(String text, void func()){
    return OutlinedButton(            
      onPressed: (){func();},
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ));
  }

    Widget _form(String label, void funcrionLogo()){
      // ignore: avoid_unnecessary_containers
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top:10),
              child: _input(const Icon(Icons.email), "EMAIL", _emailController, false),
          ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top:10),
              child: _input(const Icon(Icons.lock), "PASSWORD", _passwordController, true)),          
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: _button(label, funcrionLogo),
            ),
          )
          ]
          
        ),
      );
    }
  
  void _buttonAction(){
    _email = _emailController.text;
    _password = _passwordController.text;
    _emailController.clear();
    _passwordController.clear();
  }  
  

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Column(
          children: <Widget>[
            _logo(),
            (
              showLogin ? 
              Column(
                children: <Widget>[
                  _form('LOGIN', _buttonAction),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      child: const Text('Not registered yet? Register',),
                      onTap:() {
                        setState(() {
                          showLogin = false;
                        });
                      }
                      ),                   
                    
                  )
                ], 
              ) : 
              Column(
                children: <Widget>[
                  _form('REGISTER', _buttonAction),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      child: const Text('Already registered yet? Register',),
                      onTap:() {
                        setState(() {
                          showLogin = true;
                        });
                      }
                    ),                   
                    
                  )
                ], 
              )
            ),                                
            
          ],
        ),
      ),
    );
  }
}