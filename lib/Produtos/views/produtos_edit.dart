import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/Produtos/models/produto.dart';
import 'package:flutter_pr/components/form_text.dart';

class EditaProduto extends StatefulWidget {
  final Produto? produto;

  EditaProduto({this.produto});

  bool active = false;
  @override
  State<EditaProduto> createState() => _EditaProdutoState();
}

class _EditaProdutoState extends State<EditaProduto> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var _controllerImage = TextEditingController();
  var _controllerNome = TextEditingController();
  var _controllerPacote = TextEditingController();
  var _controllerPreco = TextEditingController();
  var _controllerFornecedor = TextEditingController();

  var label = 'Editar do produto';

  final _key = GlobalKey<FormState>();



  String ativado = 'Desativado';

  @override
  Widget build(BuildContext context) {
    if (widget.produto != null) {
      if (widget.produto!.isDiscontinued){
        ativado = 'Ativado';
      }
      //widget.active = widget.produto?.isDiscontinued ?? false;
      _controllerNome.text = widget.produto?.name ?? '';
      _controllerPacote.text = widget.produto?.packageName ?? '';
      _controllerPreco.text = widget.produto?.unitPrice.toStringAsFixed(2) ?? '';
      _controllerFornecedor.text =
          widget.produto?.supplier.id.toString() ?? '';
    }
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
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
                          padding: const EdgeInsets.only(top:36.0,left: 36,right: 36),
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
                                    FormText(_controllerNome, 'Nome do Produto',
                                        read: true),
                                    Padding(padding: EdgeInsets.all(4)),
                                    FormText(_controllerPacote, 'Nome do Pacote',
                                        read: true),
                                    Padding(padding: EdgeInsets.all(4)),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: FormText(
                                                _controllerPreco, 'Preço:',
                                                read: true)),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Expanded(
                                            flex: 2,
                                            child: FormText(
                                                _controllerFornecedor,
                                                'Id do Fornecedor:',
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
                                  Padding(
                                    padding: const EdgeInsets.only(top:16.0),
                                    child: Text('$ativado', style: TextStyle(color: Colors.white),),
                                  ),
                                  Switch(value: widget.active, onChanged: (_) {setState(() {
                                    widget.active = !widget.active;
                                  });})
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
                  Navigator.pop(context);
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
