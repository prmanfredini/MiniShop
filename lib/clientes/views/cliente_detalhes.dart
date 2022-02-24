import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/bloc/clientes_bloc.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_numberOnly.dart';
import 'package:flutter_pr/components/form_text.dart';
import 'package:flutter_pr/components/phone_form_field.dart';

class DetalhesCliente extends StatefulWidget {
  String? dropdownValue;
  ClienteModel? cliente;

  DetalhesCliente({Key? key, this.cliente}) : super(key: key);

  @override
  State<DetalhesCliente> createState() => _HomeState();
}

class _HomeState extends State<DetalhesCliente>
    with SingleTickerProviderStateMixin {

  final ClienteBloc _clienteBloc = ClienteBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final label = 'Editar Cliente';
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Detalhes dos Clientes para Edição

    print('id:  ${widget.cliente?.id}');
    firstNameController.text = widget.cliente?.firstName ?? '';
    lastNameController.text = widget.cliente?.lastName ?? '';
    cityController.text = widget.cliente?.city ?? '';
    countryController.text = widget.cliente?.country ?? '';
    phoneController.text = widget.cliente?.phone ?? '';

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      extendBody: true,
      appBar: AppBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 32.0, left: 32.0, top: 64.0),
              child: Container(
                color: Theme.of(context).primaryColor,
                width: 500,
                height: 340,
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
                          right: 64.0, left: 64.0, top: 16.0),
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
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, right: 32.0, left: 32.0),
              child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _clienteBloc.EditarCliente(
                        context,
                        widget.cliente?.id as int,
                        firstNameController.text,
                        lastNameController.text,
                        cityController.text,
                        countryController.text,
                        phoneController.text,
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
