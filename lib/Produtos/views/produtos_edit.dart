import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_text.dart';

class EditaProduto extends StatefulWidget {
  final Produto produto;

  EditaProduto({required this.produto});

  bool active = false;

  @override
  State<EditaProduto> createState() => _EditaProdutoState();
}

class _EditaProdutoState extends State<EditaProduto> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProdutosBloc pBloc = ProdutosBloc();
  final _controllerImage = TextEditingController();
  final _controllerNome = TextEditingController();
  final _controllerPacote = TextEditingController();
  final _controllerPreco = MoneyMaskedTextController(leftSymbol: 'R\$: ');
  final _controllerFornecedor = TextEditingController();

  var label = 'Editar do produto';
  String ativado = 'Desativado';

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    ativado = pBloc.getAtivo(widget.produto);
    widget.active = widget.produto.isDiscontinued;
  }

  @override
  Widget build(BuildContext context) {
    _controllerNome.text = widget.produto.name;
    _controllerPacote.text = widget.produto.packageName;
    _controllerPreco.text = widget.produto.unitPrice.toStringAsFixed(2);
    _controllerFornecedor.text = widget.produto.supplier?.id.toString() ?? '0';

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: AppBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 4 / 4.6,
                    ),
                    physics: const ScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 36.0, left: 36, right: 36),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _controllerImage,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: 'Imagem do Produto',
                                      fillColor: Colors.white,
                                      filled: true,
                                      suffix: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.grey),
                                        //style: ButtonStyle(backgroundColor: ),
                                        onPressed: () {},
                                        child: const Text('Escolher'),
                                      )),
                                ),
                                Form(
                                  key: _key,
                                  child: Column(
                                    children: [
                                      const Padding(padding: EdgeInsets.all(4)),
                                      FormText(
                                          _controllerNome, 'Nome do Produto',
                                          read: true),
                                      const Padding(padding: EdgeInsets.all(4)),
                                      FormText(
                                          _controllerPacote, 'Nome do Pacote',
                                          read: true),
                                      const Padding(padding: EdgeInsets.all(4)),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: FormText(
                                                  _controllerPreco, 'Preço:',
                                                  read: true)),
                                          const Padding(padding: EdgeInsets.all(8)),
                                          Expanded(
                                              flex: 2,
                                              child: FormText(
                                                  _controllerFornecedor,
                                                  'ID Fornecedor:',
                                                  read: true)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        'Ativado',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Switch(
                                        activeColor: Colors.grey,
                                        inactiveTrackColor: Colors.green,
                                        value: widget.active,
                                        onChanged: (_) {
                                          setState(() {
                                            widget.active = !widget.active;
                                          });
                                        }),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        'Desativado',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
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
                    setState(() {});
                    pBloc.EditProduto(
                        widget.produto.id,
                        widget.active,
                        _controllerNome.text,
                        _controllerPacote.text,
                        _controllerFornecedor.text,
                        _controllerPreco.text,
                        _key,
                        context);
                    //clienteService().cadastrarCliente(cliente);
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
