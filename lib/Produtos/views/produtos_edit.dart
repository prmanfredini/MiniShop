import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Home/widgets/appbar.dart';
import 'package:flutter_pr/Home/widgets/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/components/form_text.dart';

class EditaProduto extends StatelessWidget {
  final Produto? produto;

  EditaProduto({this.produto});

  var _controllerImage = TextEditingController();
  var _controllerNome = TextEditingController();
  var _controllerPacote = TextEditingController();
  var _controllerPreco = TextEditingController();
  var _controllerFornecedor = TextEditingController();

  var label = 'Editar do produto';

  @override
  Widget build(BuildContext context) {
    if (produto != null) {
      _controllerNome.text = produto?.productName ?? '';
      _controllerPacote.text = produto?.packageName ?? '';
      _controllerPreco.text = produto?.unitPrice.toString() ?? '';
      _controllerFornecedor.text = produto?.supplieId.toString() ?? '';
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBody: true,
      appBar: AppBarBuilder(label),
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
                    childAspectRatio: 4 / 4.5,
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
                              FormText(_controllerNome, 'Nome do Produto'),
                              FormText(_controllerPacote, 'Nome do Pacote'),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child:
                                          FormText(_controllerPreco, 'Preço:')),
                                  Padding(padding: EdgeInsets.all(8)),
                                  Expanded(
                                      flex: 2,
                                      child: FormText(_controllerFornecedor,
                                          'ID fo Fornecedor:')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    tooltip: 'Salvar',
                    backgroundColor: Colors.purple,
                    onPressed: () {
                      Navigator.pop(context);
                      //savo com sucess
                    },
                    child: Icon(Icons.check)))
          ],
        ),
      ),
    );
  }
}
