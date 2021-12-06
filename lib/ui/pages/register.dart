import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapp/controllers/register_login_controller.dart';
import 'package:proyectoapp/ui/widgets/widgets.dart';


class RegisterPage extends StatelessWidget {
  final controller = Get.put(LoginRegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LoginRegisterController>(
        init: LoginRegisterController(),
        builder: (_){
          return Container(
            child: Form(
              key: controller.formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Card(
                child: Padding(padding: const EdgeInsets.all(16.0),
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
                        'Registro',
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
                      //controller: controller.emailController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple
                          ),
                        ),
                        hintText: 'Ingresa tu nombre',
                        labelText: 'Nombre',
                        labelStyle: TextStyle(
                          color: Colors.grey
                        ),
                        prefixIcon: Icon(Icons.account_box, color: Colors.deepPurple)
                      ),
                      validator: (value) {

                        if ( value != null && value.length >= 3 ) return null;
                        return 'Ingrese un nombre';

                      },
                    ),

                    SizedBox(height: 30),
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
                      elevation: 0,
                      color: Colors.deepPurple,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        child: Text(
                          'Registrarme',
                          style: TextStyle(color: Colors.white),
                        )
                      ),
                      onPressed: () async {
                        _.register();
                      },
                    ),

                    SizedBox( height: 50),
                    
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                      child: Text('Iniciar sesion')
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