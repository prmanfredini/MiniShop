import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/bloc/clientes_bloc.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_text.dart';
import 'package:flutter_pr/components/phone_form_field.dart';

class DetalhesCliente extends StatelessWidget {
  final ClienteModel? cliente;

  DetalhesCliente({Key? key, this.cliente}) : super(key: key);

  final label = 'Editar Cliente';
  final _clienteBloc = ClienteBloc();
  final _key = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Detalhes dos Clientes para Edição

    firstNameController.text = cliente?.firstName ?? '';
    lastNameController.text = cliente?.lastName ?? '';
    cityController.text = cliente?.city ?? '';
    countryController.text = cliente?.country ?? '';
    phoneController.text = cliente?.phone ?? '';

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      extendBody: true,
      appBar: appBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 32.0, left: 32.0, top: 64.0),
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 32.0, left: 32.0, top: 32.0),
                        child: FormText(firstNameController, 'Nome'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 32.0, left: 32.0, top: 16.0),
                        child: FormText(lastNameController, 'Sobrenome'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 32.0, left: 32.0, top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120,
                              child: FormText(cityController, 'Cidade'),
                            ),
                            SizedBox(
                              width: 120,
                              child: FormText(countryController, 'País'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 64.0, left: 64.0, top: 16.0, bottom: 32),
                        child: PhoneFormField(
                          controller: phoneController,
                          label: 'Telefone',
                          formatter: TelefoneInputFormatter(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, right: 32.0, left: 32.0),
              child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _clienteBloc.editarCliente(
                        context,
                        cliente?.id as int,
                        firstNameController.text,
                        lastNameController.text,
                        cityController.text,
                        countryController.text,
                        phoneController.text,
                        _key,
                      );
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
