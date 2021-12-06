import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapp/controllers/login_controller.dart';
import 'package:proyectoapp/ui/widgets/widgets.dart';


/*
class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox( height: 250 ),

              CardContainer(
                child: Column(
                  children: [

                    SizedBox( height: 10 ),
                    Text('Login', style: Theme.of(context).textTheme.headline4 ),
                    SizedBox( height: 10 ),

                    Login()
                    
                  ],
                )
              ),

              SizedBox( height: 50),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/registration'),
                child: Text('Crear una nueva cuenta', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
              )

            ],
          ),
        )
      )
    );
  }
}
*/
class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_){
          return Container(
            child: Form(
              key: controller.formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Card(
                child: Padding(padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 30, ),
                      child: Image.asset(
                        'lib/ui/images/ciclo4.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Container(
                      child: const Text(
                        'Login Page',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 24),
                      ),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple
                          ),
                        ),
                        hintText: 'Ingresa tu email',
                        labelText: 'Correo electronico',
                        labelStyle: TextStyle(
                          color: Colors.grey
                        ),
                        prefixIcon: Icon(Icons.alternate_email_sharp, color: Colors.deepPurple)
                      ),
                      validator: (value) {

                        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp  = new RegExp(pattern);

                        return regExp.hasMatch(value ?? '')
                          ? null
                          : 'El valor ingresado no es un correo';

                      },
                    ),

                    SizedBox(height: 30),

                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple
                          ),
                        ),
                        hintText: 'Ingrese su contraseña',
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                          color: Colors.grey
                        ),
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.deepPurple)
                      ),

                      validator: (value) {

                        if ( value != null && value.length >= 6 ) return null;
                        return 'La contraseña debe ser minimo de 6 caracteres';

                      },
                      obscureText: true,
                    ),

                    SizedBox(height: 50),
                    

                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      elevation: 10,
                      color: Colors.deepPurple,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        child: Text(
                          'Ingresar',
                          style: TextStyle(color: Colors.white),
                        )
                      ),
                      onPressed: () async {
                        _.signInWithEmailAndPassword();
                      },
                    ),

                    SizedBox( height: 50),
                    
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/registration'),
                      child: Text('Crear una nueva cuenta')
                    ),
                  ],
                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  
}