import 'package:bitti/data/models/general/asset_icon_info_model.dart';
import 'package:bitti/domain/enums/icon_name.dart';

class IconInfoDataMapper {
  static final List<AssetIconInfoModel> iconsInfo =
      IconName.values.map((iconName) => getIconInfo(iconName)).toList();

  static AssetIconInfoModel getIconInfo(IconName iconName) {
    switch (iconName) {
      case IconName.home:
        return homeIcon;
      case IconName.settings:
        return settingsIcon;
      case IconName.search:
        return searchIcon;
      case IconName.painting:
        return paintingIcon;
      case IconName.gardening:
        return gardeningIcon;
      case IconName.photography:
        return photographyIcon;
      case IconName.burger:
        return burgerIcon;
      case IconName.coffee:
        return coffeeIcon;
      case IconName.veggies:
        return veggiesIcon;
      case IconName.soccer:
        return soccerIcon;
      case IconName.basketball:
        return basketballIcon;
      case IconName.tennis:
        return tennisIcon;
      case IconName.skiing:
        return skiingIcon;
      case IconName.iceSkating:
        return iceSkatingIcon;
      case IconName.skating:
        return skatingIcon;
      case IconName.running:
        return runningIcon;
      case IconName.notes:
        return notesIcon;
      case IconName.guitar:
        return guitarIcon;
      case IconName.piano:
        return pianoIcon;
      case IconName.drums:
        return drumsIcon;
      case IconName.camera:
        return cameraIcon;
      case IconName.videoCamera:
        return videoCameraIcon;
      case IconName.book:
        return bookIcon;
      case IconName.beach:
        return beachIcon;
      case IconName.mountain:
        return mountainIcon;
      case IconName.city:
        return cityIcon;
      case IconName.dog:
        return dogIcon;
      case IconName.cat:
        return catIcon;
      case IconName.bird:
        return birdIcon;
      case IconName.laugh:
        return laughIcon;
      case IconName.smile:
        return smileIcon;
      case IconName.sad:
        return sadIcon;
      case IconName.cry:
        return cryIcon;
      case IconName.star:
        return starIcon;
      case IconName.heart:
        return heartIcon;
      case IconName.check:
        return checkIcon;
      case IconName.cross:
        return crossIcon;
      case IconName.computer:
        return computerIcon;
      case IconName.telephone:
        return telephoneIcon;
      case IconName.television:
        return televisionIcon;
    }
  }

  static String getIconAssetPath(IconName iconName) {
    return 'assets/icons/icons_${iconName.value}.svg';
  }

  static final homeIcon = AssetIconInfoModel(
    name: IconName.home.value,
    assetPath: getIconAssetPath(IconName.home),
    tags: ['home', 'house', 'building'],
  );

  static final settingsIcon = AssetIconInfoModel(
    name: IconName.settings.value,
    assetPath: getIconAssetPath(IconName.settings),
    tags: ['settings', 'gear', 'preferences'],
  );

  static final searchIcon = AssetIconInfoModel(
    name: IconName.search.value,
    assetPath: getIconAssetPath(IconName.search),
    tags: ['search', 'magnifying glass', 'find'],
  );

  static final paintingIcon = AssetIconInfoModel(
    name: IconName.painting.value,
    assetPath: getIconAssetPath(IconName.painting),
    tags: ['painting', 'art', 'brush'],
  );

  static final gardeningIcon = AssetIconInfoModel(
    name: IconName.gardening.value,
    assetPath: getIconAssetPath(IconName.gardening),
    tags: ['gardening', 'plants', 'flowers'],
  );

  static final photographyIcon = AssetIconInfoModel(
    name: IconName.photography.value,
    assetPath: getIconAssetPath(IconName.photography),
    tags: ['photography', 'camera', 'photo'],
  );

  static final burgerIcon = AssetIconInfoModel(
    name: IconName.burger.value,
    assetPath: getIconAssetPath(IconName.burger),
    tags: ['burger', 'food', 'fast food'],
  );

  static final coffeeIcon = AssetIconInfoModel(
    name: IconName.coffee.value,
    assetPath: getIconAssetPath(IconName.coffee),
    tags: ['coffee', 'drink', 'beverage'],
  );

  static final veggiesIcon = AssetIconInfoModel(
    name: IconName.veggies.value,
    assetPath: getIconAssetPath(IconName.veggies),
    tags: ['veggies', 'vegetables', 'food'],
  );

  static final soccerIcon = AssetIconInfoModel(
    name: IconName.soccer.value,
    assetPath: getIconAssetPath(IconName.soccer),
    tags: ['soccer', 'football', 'sport'],
  );

  static final basketballIcon = AssetIconInfoModel(
    name: IconName.basketball.value,
    assetPath: getIconAssetPath(IconName.basketball),
    tags: ['basketball', 'sport', 'ball'],
  );

  static final tennisIcon = AssetIconInfoModel(
    name: IconName.tennis.value,
    assetPath: getIconAssetPath(IconName.tennis),
    tags: ['tennis', 'sport', 'racket'],
  );

  static final skiingIcon = AssetIconInfoModel(
    name: IconName.skiing.value,
    assetPath: getIconAssetPath(IconName.skiing),
    tags: ['skiing', 'sport', 'snow'],
  );

  static final iceSkatingIcon = AssetIconInfoModel(
    name: IconName.iceSkating.value,
    assetPath: getIconAssetPath(IconName.iceSkating),
    tags: ['ice skating', 'sport', 'ice'],
  );

  static final skatingIcon = AssetIconInfoModel(
    name: IconName.skating.value,
    assetPath: getIconAssetPath(IconName.skating),
    tags: ['skating', 'sport', 'roller'],
  );

  static final runningIcon = AssetIconInfoModel(
    name: IconName.running.value,
    assetPath: getIconAssetPath(IconName.running),
    tags: ['running', 'sport', 'exercise'],
  );

  static final notesIcon = AssetIconInfoModel(
    name: IconName.notes.value,
    assetPath: getIconAssetPath(IconName.notes),
    tags: ['notes', 'music', 'sound'],
  );

  static final guitarIcon = AssetIconInfoModel(
    name: IconName.guitar.value,
    assetPath: getIconAssetPath(IconName.guitar),
    tags: ['guitar', 'music', 'instrument'],
  );

  static final pianoIcon = AssetIconInfoModel(
    name: IconName.piano.value,
    assetPath: getIconAssetPath(IconName.piano),
    tags: ['piano', 'music', 'instrument'],
  );

  static final drumsIcon = AssetIconInfoModel(
    name: IconName.drums.value,
    assetPath: getIconAssetPath(IconName.drums),
    tags: ['drums', 'music', 'instrument'],
  );

  static final cameraIcon = AssetIconInfoModel(
    name: IconName.camera.value,
    assetPath: getIconAssetPath(IconName.camera),
    tags: ['camera', 'photo', 'device'],
  );

  static final videoCameraIcon = AssetIconInfoModel(
    name: IconName.videoCamera.value,
    assetPath: getIconAssetPath(IconName.videoCamera),
    tags: ['video camera', 'film', 'device'],
  );

  static final bookIcon = AssetIconInfoModel(
    name: IconName.book.value,
    assetPath: getIconAssetPath(IconName.book),
    tags: ['book', 'read', 'literature'],
  );

  static final beachIcon = AssetIconInfoModel(
    name: IconName.beach.value,
    assetPath: getIconAssetPath(IconName.beach),
    tags: ['beach', 'sea', 'sand'],
  );

  static final mountainIcon = AssetIconInfoModel(
    name: IconName.mountain.value,
    assetPath: getIconAssetPath(IconName.mountain),
    tags: ['mountain', 'hill', 'nature'],
  );

  static final cityIcon = AssetIconInfoModel(
    name: IconName.city.value,
    assetPath: getIconAssetPath(IconName.city),
    tags: ['city', 'urban', 'buildings'],
  );

  static final dogIcon = AssetIconInfoModel(
    name: IconName.dog.value,
    assetPath: getIconAssetPath(IconName.dog),
    tags: ['dog', 'animal', 'pet'],
  );

  static final catIcon = AssetIconInfoModel(
    name: IconName.cat.value,
    assetPath: getIconAssetPath(IconName.cat),
    tags: ['cat', 'animal', 'pet'],
  );

  static final birdIcon = AssetIconInfoModel(
    name: IconName.bird.value,
    assetPath: getIconAssetPath(IconName.bird),
    tags: ['bird', 'animal', 'flying'],
  );

  static final laughIcon = AssetIconInfoModel(
    name: IconName.laugh.value,
    assetPath: getIconAssetPath(IconName.laugh),
    tags: ['laugh', 'emoji', 'happy'],
  );

  static final smileIcon = AssetIconInfoModel(
    name: IconName.smile.value,
    assetPath: getIconAssetPath(IconName.smile),
    tags: ['smile', 'emoji', 'happy'],
  );

  static final sadIcon = AssetIconInfoModel(
    name: IconName.sad.value,
    assetPath: getIconAssetPath(IconName.sad),
    tags: ['sad', 'emoji', 'unhappy'],
  );

  static final cryIcon = AssetIconInfoModel(
    name: IconName.cry.value,
    assetPath: getIconAssetPath(IconName.cry),
    tags: ['cry', 'emoji', 'tears'],
  );

  static final starIcon = AssetIconInfoModel(
    name: IconName.star.value,
    assetPath: getIconAssetPath(IconName.star),
    tags: ['star', 'shape', 'favorite'],
  );

  static final heartIcon = AssetIconInfoModel(
    name: IconName.heart.value,
    assetPath: getIconAssetPath(IconName.heart),
    tags: ['heart', 'shape', 'love'],
  );

  static final checkIcon = AssetIconInfoModel(
    name: IconName.check.value,
    assetPath: getIconAssetPath(IconName.check),
    tags: ['check', 'mark', 'correct'],
  );

  static final crossIcon = AssetIconInfoModel(
    name: IconName.cross.value,
    assetPath: getIconAssetPath(IconName.cross),
    tags: ['cross', 'mark', 'wrong'],
  );

  static final computerIcon = AssetIconInfoModel(
    name: IconName.computer.value,
    assetPath: getIconAssetPath(IconName.computer),
    tags: ['computer', 'device', 'technology'],
  );

  static final telephoneIcon = AssetIconInfoModel(
    name: IconName.telephone.value,
    assetPath: getIconAssetPath(IconName.telephone),
    tags: ['telephone', 'device', 'communication'],
  );

  static final televisionIcon = AssetIconInfoModel(
    name: IconName.television.value,
    assetPath: getIconAssetPath(IconName.television),
    tags: ['television', 'device', 'entertainment'],
  );
}
