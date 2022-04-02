import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/produtos_bloc.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/models/objeto_response_id.dart';
import 'package:flutter_pr/Produtos/widgets/card_detalhes.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/mensagem_centro.dart';
import 'package:flutter_pr/components/progress_bar.dart';

class DetalheProduto extends StatefulWidget {
  final int produtoId;

  const DetalheProduto(this.produtoId, {Key? key}) : super(key: key);

  @override
  State<DetalheProduto> createState() => _DetalheProdutoState();
}

class _DetalheProdutoState extends State<DetalheProduto> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final prodBloc = ProdutosBloc();
  final label = 'Detalhes do produto';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: appBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FutureBuilder(
          future: prodBloc.getProdutosById(widget.produtoId),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            ObjetoRetornoById? objetoRetorno = snapshot.data;
            Produto? produto = objetoRetorno?.objetoRetorno;
            if (snapshot.hasData) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.waiting:
                  return const ProgressBar();
                case ConnectionState.done:
                  return DetalhesCard(produto);
              }
            }
            return const CenteredMessage('não há produtos');
          },
        ),
      ),
    );
  }
}
