import 'package:flutter/material.dart';
import 'package:flutter_pr/Produtos/bloc/editar_produtos_bloc.dart';
import 'package:flutter_pr/Produtos/models/conteudo_response.dart';
import 'package:flutter_pr/Produtos/views/produtos_add.dart';

class EditaProduto extends AddProduto {
  final Produto produto;

  const EditaProduto({Key? key, required this.produto}) : super(key: key);

  @override
  State<EditaProduto> createState() => EditaProdutoState();
}

class EditaProdutoState extends AddProdutoState<EditaProduto> {
  @override
  String get label => 'Editar do produto';

  @override
  String get saveLabel => 'Editar';

  @override
  bool get showStatus => true;

  EditarProdutosBloc editarProdutosBloc = EditarProdutosBloc();
  @override
  EditarProdutosBloc get pBloc => editarProdutosBloc;


  @override
  void initState() {
    pBloc.produto = widget.produto;
    active = widget.produto.isDiscontinued;
    activeLabel = active ? 'Ativado' : 'Desativado';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    controllerNome.text = widget.produto.name;
    controllerPacote.text = widget.produto.packageName;
    controllerPreco.text = widget.produto.unitPrice.toStringAsFixed(2);
    controllerFornecedor.text = widget.produto.supplier?.id.toString() ?? '0';
    return super.build(context);
  }
}
