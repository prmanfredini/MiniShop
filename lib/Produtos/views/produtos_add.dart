import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_numberOnly.dart';
import 'package:flutter_pr/components/form_text.dart';

class AddProduto extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProdutosBloc pBloc = ProdutosBloc();
  final _controllerPreco = MoneyMaskedTextController(leftSymbol: 'R\$: ');
  final _controllerNome = TextEditingController();
  final _controllerPacote = TextEditingController();
  final _controllerFornecedor = TextEditingController();
  final _controllerImage = TextEditingController();

  var label = 'Cadastrar produto';
  bool read = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme
          .of(context)
          .secondaryHeaderColor,
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
                    childAspectRatio: 4 / 4.3,
                  ),
                  physics: const ScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Container(
                        color: Theme
                            .of(context)
                            .primaryColor,
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
                                    Padding(padding: EdgeInsets.all(4)),
                                    FormText(
                                        _controllerNome, 'Nome do Produto'),
                                    Padding(padding: EdgeInsets.all(4)),
                                    FormText(
                                        _controllerPacote, 'Nome do Pacote'),
                                    Padding(padding: EdgeInsets.all(4)),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: FormNumber(
                                              _controllerPreco, 'Preço:'),
                                        ),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Expanded(
                                          flex: 2,
                                          child: FormNumber(
                                              _controllerFornecedor,
                                              'Id do Fornecedor:'),
                                        ),
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
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  pBloc.salvarProduto(
                      _controllerPreco.text,
                      _controllerNome.text,
                      _controllerPacote.text,
                      _controllerFornecedor.text,
                      _controllerImage.text,
                      _key,
                      context);
                  //clienteService().cadastrarCliente(cliente);
                },
                child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
