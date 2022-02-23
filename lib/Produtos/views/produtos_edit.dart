import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/components/form_text.dart';

class EditaProduto extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Produto? produto;

  EditaProduto({this.produto});

  var _controllerImage = TextEditingController();
  var _controllerNome = TextEditingController();
  var _controllerPreco = TextEditingController();
  var _controllerFornecedor = TextEditingController();

  var label = 'Editar do produto';
  bool read = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (produto != null) {
      read = true;
      _controllerNome.text = produto?.name ?? '';
      _controllerPreco.text = produto?.unitPrice.toStringAsFixed(2) ?? '';
      _controllerFornecedor.text =
          produto?.supplier.companyName.toString() ?? '';
    }
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      extendBody: true,
      appBar: AppBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 4 / 3.5,
                  ),
                  physics: const ScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Container(
                        color: Colors.purple[300],
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _controllerImage,
                                decoration: InputDecoration(
                                    labelText: 'Imagem do Produto',
                                    fillColor: Colors.white,
                                    filled: true,
                                    suffix: ElevatedButton(
                                      //style: ButtonStyle(backgroundColor: ),
                                      onPressed: () {},
                                      child: Text('Escolher'),
                                    )),
                              ),
                              Form(
                                key: _key,
                                child: Column(
                                  children: [
                                    FormText(_controllerNome, 'Nome do Produto',
                                        read: read),
                                    Divider(),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: FormText(
                                                _controllerPreco, 'Preço:',
                                                read: read)),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Expanded(
                                            flex: 2,
                                            child: FormText(
                                                _controllerFornecedor,
                                                'Fornecedor:',
                                                read: read)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: 340,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  //clienteService().cadastrarCliente(cliente);
                },
                label: Text('Salvar'),
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
