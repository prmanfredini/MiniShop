import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/views/produtos_edit.dart';

class DetalhesCard extends StatelessWidget {
  final Produto? produto;

  DetalhesCard(this.produto, {Key? key}) : super(key: key);

  final url = 'https://cf.shopee.com.br/file/0b1107667b804bb7fc30002b9e994169';
  final valor = MoneyMaskedTextController(leftSymbol: 'R\$ ');
  final prodBloc = ProdutosBloc();
  late String activeLabel;
  late MaterialColor colorLabel;

  @override
  Widget build(BuildContext context) {
    valor.text = produto?.unitPrice.toStringAsFixed(2) ?? '0';
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4 / 6.5,
        ),
        physics: const ScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          produto?.name ?? '',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 180,
                          child: Image.network(
                              produto?.imagens?.isEmpty == false
                                  ? produto?.imagens?.first.path ?? ''
                                  : url),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const ScrollPhysics(),
                                  itemCount: (produto?.imagens?.length ?? 1),
                                  itemBuilder: (context, index) {
                                    return Image.network(
                                        produto?.imagens?[index].path ?? url);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Text(valor.text, style: const TextStyle(fontSize: 32.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fornecedor: ${produto?.supplier?.companyName ?? 'nome'}',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Pacote: ${produto?.packageName ?? 'nome'}',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '•',
                                  style: TextStyle(
                                      color: colorLabel =
                                          (produto?.isDiscontinued ?? false)
                                              ? Colors.green
                                              : Colors.grey,
                                      fontSize: 80),
                                ),
                                Text(
                                  activeLabel =
                                      (produto?.isDiscontinued ?? false)
                                          ? 'Ativado'
                                          : 'Desativado',
                                  style: const TextStyle(fontSize: 24.0),
                                ),
                              ],
                            ),
                            Container(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  EditaProduto(
                                                    produto: produto!,
                                                  )));
                                    },
                                    iconSize: 32,
                                    icon: const Icon(Icons.edit)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
