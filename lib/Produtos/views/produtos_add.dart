import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_number.dart';
import 'package:flutter_pr/components/form_text.dart';

class AddProduto extends StatefulWidget {
  const AddProduto({Key? key}) : super(key: key);

  @override
  State<AddProduto> createState() => AddProdutoState();
}

class AddProdutoState<T extends AddProduto> extends State<T> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final pBloc = ProdutosBloc();

  final controllerPreco = MoneyMaskedTextController(leftSymbol: 'R\$ ');
  final controllerNome = TextEditingController();
  final controllerPacote = TextEditingController();
  final controllerFornecedor = TextEditingController();
  final controllerImage = TextEditingController();

  var label = 'Cadastrar produto';
  var saveLabel = 'Salvar';

  bool showStatus = false;
  bool active = false;
  String activeLabel = 'Desativado';

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: appBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Form(
                            key: _key,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controllerImage,
                                  decoration: InputDecoration(
                                      labelText: 'Imagem do Produto',
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffix: ElevatedButton(
                                        //style: ButtonStyle(backgroundColor: ),
                                        onPressed: () {},
                                        child: const Text('Escolher'),
                                      )),
                                ),
                                const Padding(padding: EdgeInsets.all(4)),
                                FormText(controllerNome, 'Nome do Produto'),
                                const Padding(padding: EdgeInsets.all(4)),
                                FormText(controllerPacote, 'Nome do Pacote'),
                                const Padding(padding: EdgeInsets.all(4)),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: FormNumber(
                                          controllerPreco, 'Preço:',
                                          length: 5),
                                    ),
                                    const Padding(padding: EdgeInsets.all(8)),
                                    Expanded(
                                      flex: 2,
                                      child: FormNumber(controllerFornecedor,
                                          'Id do Fornecedor:'),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: showStatus,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          activeLabel,
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Switch(
                                          activeColor: Colors.white,
                                          activeTrackColor: Colors.green,
                                          value: active,
                                          onChanged: (_) {
                                            setState(() {
                                              active = !active;
                                              activeLabel = active
                                                  ? 'Ativado'
                                                  : 'Desativado';
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    pBloc.salvarProduto(
                        controllerPreco.text,
                        active,
                        controllerNome.text,
                        controllerPacote.text,
                        controllerFornecedor.text,
                        controllerImage.text,
                        _key,
                        context);
                  },
                  child: Text(saveLabel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
