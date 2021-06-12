import 'package:intellegere/games/Jogo_Memoria/cardModel.dart';

String selectedCard = "";
int selectedIndex;
bool selected = true;
int score = 0;

List<CardModel> myPairs = <CardModel>[];
List<bool> clicked = <bool>[];

List<bool> getClicked() {
  List<bool> yoClicked = <bool>[];
  List<CardModel> myairs = <CardModel>[];
  myairs = getPairs();
  for (int i = 0; i < myairs.length; i++) {
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<CardModel> getPairs() {
  List<CardModel> pairs = <CardModel>[];

  CardModel cardModel = CardModel();

  //1
  cardModel.setImageAssetPath("assets/memory_game/cachorro.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //2
  cardModel.setImageAssetPath("assets/memory_game/coelho.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //3
  cardModel.setImageAssetPath("assets/memory_game/coruja.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //4
  cardModel.setImageAssetPath("assets/memory_game/gato.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();
  //5
  cardModel.setImageAssetPath("assets/memory_game/leao.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //6
  cardModel.setImageAssetPath("assets/memory_game/macaco.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  return pairs;
}

List<CardModel> getQuestionPairs() {
  List<CardModel> pairs = <CardModel>[];

  CardModel cardModel = CardModel();

  //1
  cardModel.setImageAssetPath("assets/memory_game/verso.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //2
  cardModel.setImageAssetPath("assets/memory_game/verso.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //3
  cardModel.setImageAssetPath("assets/memory_game/verso.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //4
  cardModel.setImageAssetPath("assets/memory_game/verso.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();
  //5
  cardModel.setImageAssetPath("assets/memory_game/verso.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  //6
  cardModel.setImageAssetPath("assets/memory_game/verso.png");
  cardModel.setIsSelected(false);
  pairs.add(cardModel);
  pairs.add(cardModel);
  cardModel = CardModel();

  return pairs;
}
