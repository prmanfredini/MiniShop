import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/widgets/card_clientes.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/widgets/card_fornecedores.dart';

class CardFornecedores extends StatelessWidget {
  List<dynamic> fornecedores = [];

  @override
  Widget build(BuildContext context) {
    fornecedores.add(FornecedorModel(id: 1, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 2, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 3, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 4, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 5, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 6, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 7, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 8, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 9, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));
    fornecedores.add(FornecedorModel(id: 10, companyName: 'Exotic Liquids', contactName: 'Charlotte Cooper', contactTitle: 'Product Owner', city: 'London', country: 'UK', phone: '(171) 555-2222', fax: '--'));


    return GridView.builder(
        padding: EdgeInsets.all(64.0),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.3,
        ),
        physics: ScrollPhysics(),
        itemCount: fornecedores.length,
        itemBuilder: (context, index) {

          // Detalhes do Card de Fornecedores

          var _companyName = fornecedores[index].companyName;
          var _contactName = fornecedores[index].contactName;
          var _contactTitle = fornecedores[index].contactTitle;
          var _place = fornecedores[index].city + ' - ' + fornecedores[index].country;
          var _phone = fornecedores[index].phone;
          var _fax = fornecedores[index].fax;

          return Card_Fornecedores(companyName: _companyName, contactName: _contactName, contactTitle: _contactTitle, place: _place, fax: _fax, phone: _phone);
        });
  }
}

