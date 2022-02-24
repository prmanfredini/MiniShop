import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_numberOnly.dart';
import 'package:flutter_pr/components/form_text.dart';
import 'package:flutter_pr/fornecedores/bloc/fornecedor_bloc.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';

class DetalhesFornecedor extends StatefulWidget {
  String? dropdownValue;
  FornecedorModel? fornecedor;

  DetalhesFornecedor({Key? key, this.fornecedor}) : super(key: key);

  @override
  State<DetalhesFornecedor> createState() => _HomeState();
}

class _HomeState extends State<DetalhesFornecedor>
    with SingleTickerProviderStateMixin {

  final FornecedorBloc _fornecedorBloc = FornecedorBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var label = 'Cadastrar Fornecedores';
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController faxController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

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

    // Detalhes dos Fornecedores para Edição

    companyNameController.text = widget.fornecedor?.companyName ?? '';
    contactNameController.text = widget.fornecedor?.contactName ?? '';
    phoneController.text = widget.fornecedor?.phone ?? '';
    cityController.text = widget.fornecedor?.city ?? '';
    countryController.text = widget.fornecedor?.country ?? '';
    faxController.text = widget.fornecedor?.fax ?? '';

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
                            width: 140,
                            child: FormText(phoneController, _phone),
                          ),
                          SizedBox(
                            width: 130,
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
                            width: 140,
                            child: FormText(cityController, _city),
                          ),
                          SizedBox(
                            width: 130,
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
                      _fornecedorBloc.editarFornecedor(
                        widget.fornecedor?.id as int,
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


