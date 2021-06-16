import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Produto {
  String url, nome, descricao;
  double preco;
  Produto({
    required this.url,
    required this.nome,
    required this.descricao,
    required this.preco,
  });
}

class ItemMenu {
  String url, nome;
  ItemMenu({
    required this.url,
    required this.nome,
  });
}

class Menu {
  static List<ItemMenu> getItens() {
    return [
      ItemMenu(
        url: 'https://picsum.photos/250?image=9',
        nome: 'Notebook',
      ),
      ItemMenu(
        url:
            'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        nome: 'Bolo',
      ),
      ItemMenu(
        url:
            'https://images.pexels.com/photos/213798/pexels-photo-213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        nome: 'Torreeaerogerador',
      ),
    ];
  }

  static List<DropdownMenuItem<ItemMenu>> getDropdownMenuItens(List itens) {
    List<DropdownMenuItem<ItemMenu>> listaItensMenu = [];
    for (ItemMenu item in itens) {
      listaItensMenu.add(
        DropdownMenuItem(
          value: item,
          child: Text(item.nome),
        ),
      );
    }
    return listaItensMenu;
  }

  static List<DropdownMenuItem<ItemMenu>> getListaItens() {
    return getDropdownMenuItens(getItens());
  }
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  final List<Produto> produtos = <Produto>[];
  void adicionarProdutoNaLista(Produto produto) {
    setState(
      () {
        produtos.insert(0, produto);
      },
    );
  }

  void removerProdutoNaLista(int indice) {
    setState(
      () {
        this.produtos.removeAt(indice);
      },
    );
  }

  confirmarExclusao(BuildContext context, int indice) {
    Widget cancelamento = TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget exclusao = TextButton(
      child: Text("Excluir"),
      onPressed: () {
        this.removerProdutoNaLista(indice);
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.add_alert),
          Text("Exclusão!"),
        ],
      ),
      content: Text("Deseja realmente excluir oproduto?"),
      elevation: 25,
      actions: [
        cancelamento,
        exclusao,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 25, top: 2.5, right: 25),
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int indice) {
          return Container(
            height: 80,
            margin: EdgeInsets.all(2),
            color: (indice % 2) == 0 ? Colors.blue[50] : Colors.grey[200],
            child: ListTile(
              leading: Image(
                image: NetworkImage(this.produtos[indice].url),
                height: 50,
                width: 70,
              ),
              title: Text('${this.produtos[indice].nome}'),
              subtitle: Text(
                'R\$${this.produtos[indice].preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.purple[900],
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TerceiraRota(this.produtos[indice]),
                  ),
                );
              },
              onLongPress: () {
                this.confirmarExclusao(context, indice);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SegundaRota()),
          ).then(
            (novoProduto) {
              this.adicionarProdutoNaLista(novoProduto);
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}

class Corpo extends StatelessWidget {
  final List<Produto> produtos;
  Corpo(this.produtos);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, //Ocuparapenasoespaçonecessário.
      padding: EdgeInsets.only(left: 25, top: 2.5, right: 25),
      itemCount: produtos.length,
      itemBuilder: (BuildContext context, int indice) {
        return Container(
          height: 80,
          margin: EdgeInsets.all(2),
          color: (indice % 2) == 0 ? Colors.blue[50] : Colors.grey[200],
          child: ListTile(
            leading: Image(
              image: NetworkImage(this.produtos[indice].url),
              height: 50,
              width: 70,
            ),
            title: Text('${this.produtos[indice].nome}'),
            subtitle: Text(
              'R\$${this.produtos[indice].preco.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.purple[900],
              ),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TerceiraRota(this.produtos[indice]))),
          ),
        );
      },
    );
  }
}

class SegundaRota extends StatefulWidget {
  @override
  SegundaRotaState createState() => SegundaRotaState();
}

class SegundaRotaState extends State<SegundaRota> {
  ItemMenu? itemSelecionado;
  List<DropdownMenuItem<ItemMenu>>? listaItensMenu;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  @override
  void initState() {
    listaItensMenu = Menu.getListaItens();
    itemSelecionado = listaItensMenu![0].value;
    super.initState();
  }

  aoSelecionarItem(ItemMenu? itemSelecionado) {
    setState(
      () {
        this.itemSelecionado = itemSelecionado;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: new EdgeInsets.only(left: 25, right: 25),
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              value: this.itemSelecionado,
              items: this.listaItensMenu,
              onChanged: this.aoSelecionarItem,
              icon: Icon(Icons.arrow_downward),
              isExpanded: true,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: this.nomeController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.nomeController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'nome',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: this.descricaoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.descricaoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'descrição',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: this.precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'preço',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
            child: ElevatedButton(
              child: Icon(Icons.add),
              onPressed: () {
                Produto produto = Produto(
                  url: this.itemSelecionado!.url,
                  nome: this.nomeController.text,
                  descricao: this.descricaoController.text,
                  preco: double.parse(this.precoController.text),
                );
                Navigator.pop(context, produto);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TerceiraRota extends StatelessWidget {
  final Produto produto;
  TerceiraRota(this.produto);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Produto'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '${this.produto.nome}',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple[900],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    image: NetworkImage(this.produto.url),
                    height: 250,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('${this.produto.descricao}'),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'R\$${this.produto.preco.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: Text(
                        'Voltar para a Primeira Rota',
                        style: TextStyle(color: Colors.purple[900]),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
