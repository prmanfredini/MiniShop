// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pr/Home/widgets/appbar.dart';
// import 'package:flutter_pr/Home/widgets/drawer_builder.dart';
// import 'package:flutter_pr/components/form_text.dart';
//
// class AddProduto extends StatelessWidget {
//
//   final _controllerImage = TextEditingController();
//   final _controllerNome = TextEditingController();
//   final _controllerPacote = TextEditingController();
//   final _controllerPreco = TextEditingController();
//   final _controllerFornecedor = TextEditingController();
//
//   var label = 'Editar do produto';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       extendBody: true,
//       appBar: AppBarBuilder(label),
//       drawer: DrawerBuilder(context),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: GridView.builder(
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 1,
//               childAspectRatio: 4 / 6.5,
//             ),
//             physics: const ScrollPhysics(),
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return Card(
//                 color: Colors.white,
//                 child: Container(
//                   color: Colors.purple[300],
//                   child: Padding(
//                     padding: const EdgeInsets.all(24.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         TextFormField(
//                           controller: _controllerImage,
//                           decoration: InputDecoration(
//                               labelText: 'Imagem do Produto',
//                               fillColor: Colors.white,
//                               filled: true,
//                               suffix: ElevatedButton(
//                                 //style: ButtonStyle(backgroundColor: ),
//                                 onPressed: () {},
//                                 child: Text('Escolher'),
//                               )),
//                         ),
//                         FormText(_controllerNome, 'Nome do Produto', false),
//                         FormText(_controllerPacote, 'Nome do Pacote', false),
//                         Row(
//                           children: [
//                             Expanded(
//                                 flex: 2,
//                                 child: FormText(_controllerPreco, 'Preço:', false)),
//                             Padding(padding: EdgeInsets.all(8)),
//                             Expanded(
//                                 flex: 2,
//                                 child: FormText(_controllerFornecedor,
//                                     'ID fo Fornecedor:', false)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//               ;
//             }),
//       ),
//     );
//   }
// }
