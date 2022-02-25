import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_text.dart';
import 'package:flutter_pr/fornecedores/bloc/fornecedor_bloc.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/service/fornecedores_service.dart';

class FornecedoresCadastro extends StatefulWidget {
  String? dropdownValue;

  @override
  State<FornecedoresCadastro> createState() => _HomeState();
}

class _HomeState extends State<FornecedoresCadastro>
    with SingleTickerProviderStateMixin {
  var label = 'Cadastrar Fornecedores';
  final FornecedorBloc _fornecedorBloc = FornecedorBloc();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController faxController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Labels do Formulário

    var _companyName = 'Nome da Empresa:';
    var _contactName = 'Nome do Contato:';
    var _phone = 'Telefone:';
    var _fax = 'Fax:';
    var _city = 'Cidade:';
    var _country = 'País:';



    return Scaffold(
      key: _key,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: AppBarBuilder(label, _key),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.32,
                            child: FormText(phoneController, _phone),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.32,
                            child: FormText(faxController, _fax),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 16.0),
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
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, right: 32.0, left: 32.0),
              child: SizedBox(
                  width: 140,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _fornecedorBloc.cadastrarFornecedor(
                        0,
                        companyNameController.text,
                        contactNameController.text,
                        null,
                        cityController.text,
                        countryController.text,
                        phoneController.text,
                        faxController.text,
                      );
                    },
                    child: const Text('Salvar', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400)),
                  )),
            ),
          ],
        ),
      ),
    );
  }


}
