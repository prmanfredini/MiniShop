import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_text.dart';
import 'package:flutter_pr/components/phone_form_field.dart';
import 'package:flutter_pr/fornecedores/bloc/fornecedor_bloc.dart';

class FornecedoresCadastro extends StatefulWidget {
  const FornecedoresCadastro({Key? key}) : super(key: key);

  @override
  State<FornecedoresCadastro> createState() => FornecedoresCadastroState();
}

class FornecedoresCadastroState<T extends FornecedoresCadastro> extends State<T> {
  final _key = GlobalKey<FormState>();
  final fornecedorBloc = FornecedorBloc();
  final companyNameController = TextEditingController();
  final contactNameController = TextEditingController();
  final phoneController = TextEditingController();
  final faxController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var label = 'Cadastrar Fornecedores';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _companyName = 'Nome da Empresa:';
    var _contactName = 'Nome do Contato:';
    var _phone = 'Telefone:';
    var _city = 'Cidade:';
    var _country = 'País:';

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
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
                        child: FormText(companyNameController, _companyName),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 32.0, left: 32.0, top: 16.0),
                        child: FormText(contactNameController, _contactName),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 32.0, left: 32.0, top: 16.0),
                        child: PhoneFormField(
                            controller: phoneController,
                            label: _phone,
                            formatter: TelefoneInputFormatter()),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 32.0, left: 32.0, top: 16.0, bottom: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.32,
                              child: FormText(cityController, _city),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.32,
                              child: FormText(countryController, _country),
                            ),
                          ],
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
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      fornecedorBloc.cadastrarFornecedor(
                          context,
                          companyNameController.text,
                          contactNameController.text,
                          null,
                          cityController.text,
                          countryController.text,
                          phoneController.text,
                          faxController.text,
                          _key);
                    },
                    child: const Text('Salvar',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w400)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
