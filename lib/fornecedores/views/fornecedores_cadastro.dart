import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/widgets/appbar.dart';
import 'package:flutter_pr/Home/widgets/drawer_builder.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/service/cliente_service.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';

class FornecedoresCadastro extends StatefulWidget {
  String? dropdownValue;

  @override
  State<FornecedoresCadastro> createState() => _HomeState();
}

class _HomeState extends State<FornecedoresCadastro>
    with SingleTickerProviderStateMixin {
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



    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      extendBody: true,
      appBar: AppBarBuilder(label),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 32.0, left: 32.0, top: 64.0),
              child: Container(
                color: Colors.purple[400],
                width: 500,
                height: 340,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 32.0),
                      child: TextField(
                        controller: companyNameController,
                        decoration: InputDecoration(
                            filled: true,
                            border: const OutlineInputBorder(),
                            hintText: _companyName,
                            labelText: _companyName,
                            fillColor: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 16.0),
                      child: TextField(
                        controller: contactNameController,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: _contactName,
                            labelText: _contactName,
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 32.0, left: 32.0, top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: _phone,
                                  labelText: _phone,
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: TextField(
                              controller: faxController,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: _fax,
                                  labelText: _fax,
                                  fillColor: Colors.white),
                            ),
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
                            width: 120,
                            child: TextField(
                              controller: cityController,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: _city,
                                  labelText: _city,
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextField(
                              controller: countryController,
                              decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  hintText: _country,
                                  labelText: _country,
                                  fillColor: Colors.white),
                            ),
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
                  width: 340,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      FornecedorModel fornecedor = FornecedorModel(
                        id: 1,
                        companyName: companyNameController.text,
                        contactName: contactNameController.text,
                        contactTitle: '',
                        city: cityController.text,
                        country: countryController.text,
                        phone: phoneController.text,
                        fax: faxController.text,
                      );
                      print(fornecedor.toJson());
                      //clienteService().cadastrarCliente(cliente);
                    },
                    label: Text('Cadastrar'),
                    icon: Icon(Icons.add),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
