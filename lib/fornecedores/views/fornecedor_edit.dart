import 'package:flutter/material.dart';
import 'package:flutter_pr/fornecedores/bloc/edit_fornecedor_bloc.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/views/fornecedores_cadastro.dart';

class EditarFornecedor extends FornecedoresCadastro {
  final Fornecedor fornecedor;

  const EditarFornecedor ({Key? key, required this.fornecedor}) : super(key: key);

  @override
  State<EditarFornecedor> createState() => EditarFornecedorState();
}

class EditarFornecedorState extends FornecedoresCadastroState<EditarFornecedor> {

  @override
  String get label => 'Editar Fornecedores';

  EditarFornecedorBloc editarFornecedorBloc = EditarFornecedorBloc();
  @override
  EditarFornecedorBloc get fornecedorBloc => editarFornecedorBloc;

  @override
  void initState() {
    fornecedorBloc.fornecedor = widget.fornecedor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    companyNameController.text = widget.fornecedor.companyName;
    contactNameController.text = widget.fornecedor.contactName;
    phoneController.text = widget.fornecedor.phone;
    cityController.text = widget.fornecedor.city;
    countryController.text = widget.fornecedor.country;
    faxController.text = widget.fornecedor.fax ?? '';
    return super.build(context);
  }
}

