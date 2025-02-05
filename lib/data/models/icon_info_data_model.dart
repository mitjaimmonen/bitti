import 'package:bitti/data/models/general/asset_icon_info_model.dart';
import 'package:bitti/domain/enums/icon_name.dart';

class IconInfoDataMapper {
  static List<AssetIconInfoModel> get iconsInfo {
    return IconName.values.map((iconName) => getIconInfo(iconName)).toList();
  }

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

  static final homeIcon = AssetIconInfoModel(
    name: IconName.home.value,
    assetPath: 'assets/icons/home.png',
    tags: ['home', 'house', 'building'],
  );

  static final settingsIcon = AssetIconInfoModel(
    name: IconName.settings.value,
    assetPath: 'assets/icons/settings.png',
    tags: ['settings', 'gear', 'preferences'],
  );

  static final searchIcon = AssetIconInfoModel(
    name: IconName.search.value,
    assetPath: 'assets/icons/search.png',
    tags: ['search', 'magnifying glass', 'find'],
  );

  static final paintingIcon = AssetIconInfoModel(
    name: IconName.painting.value,
    assetPath: 'assets/icons/painting.png',
    tags: ['painting', 'art', 'brush'],
  );

  static final gardeningIcon = AssetIconInfoModel(
    name: IconName.gardening.value,
    assetPath: 'assets/icons/gardening.png',
    tags: ['gardening', 'plants', 'flowers'],
  );

  static final photographyIcon = AssetIconInfoModel(
    name: IconName.photography.value,
    assetPath: 'assets/icons/photography.png',
    tags: ['photography', 'camera', 'photo'],
  );

  static final burgerIcon = AssetIconInfoModel(
    name: IconName.burger.value,
    assetPath: 'assets/icons/burger.png',
    tags: ['burger', 'food', 'fast food'],
  );

  static final coffeeIcon = AssetIconInfoModel(
    name: IconName.coffee.value,
    assetPath: 'assets/icons/coffee.png',
    tags: ['coffee', 'drink', 'beverage'],
  );

  static final veggiesIcon = AssetIconInfoModel(
    name: IconName.veggies.value,
    assetPath: 'assets/icons/veggies.png',
    tags: ['veggies', 'vegetables', 'food'],
  );

  static final soccerIcon = AssetIconInfoModel(
    name: IconName.soccer.value,
    assetPath: 'assets/icons/soccer.png',
    tags: ['soccer', 'football', 'sport'],
  );

  static final basketballIcon = AssetIconInfoModel(
    name: IconName.basketball.value,
    assetPath: 'assets/icons/basketball.png',
    tags: ['basketball', 'sport', 'ball'],
  );

  static final tennisIcon = AssetIconInfoModel(
    name: IconName.tennis.value,
    assetPath: 'assets/icons/tennis.png',
    tags: ['tennis', 'sport', 'racket'],
  );

  static final skiingIcon = AssetIconInfoModel(
    name: IconName.skiing.value,
    assetPath: 'assets/icons/skiing.png',
    tags: ['skiing', 'sport', 'snow'],
  );

  static final iceSkatingIcon = AssetIconInfoModel(
    name: IconName.iceSkating.value,
    assetPath: 'assets/icons/ice_skating.png',
    tags: ['ice skating', 'sport', 'ice'],
  );

  static final skatingIcon = AssetIconInfoModel(
    name: IconName.skating.value,
    assetPath: 'assets/icons/skating.png',
    tags: ['skating', 'sport', 'roller'],
  );

  static final runningIcon = AssetIconInfoModel(
    name: IconName.running.value,
    assetPath: 'assets/icons/running.png',
    tags: ['running', 'sport', 'exercise'],
  );

  static final notesIcon = AssetIconInfoModel(
    name: IconName.notes.value,
    assetPath: 'assets/icons/notes.png',
    tags: ['notes', 'music', 'sound'],
  );

  static final guitarIcon = AssetIconInfoModel(
    name: IconName.guitar.value,
    assetPath: 'assets/icons/guitar.png',
    tags: ['guitar', 'music', 'instrument'],
  );

  static final pianoIcon = AssetIconInfoModel(
    name: IconName.piano.value,
    assetPath: 'assets/icons/piano.png',
    tags: ['piano', 'music', 'instrument'],
  );

  static final drumsIcon = AssetIconInfoModel(
    name: IconName.drums.value,
    assetPath: 'assets/icons/drums.png',
    tags: ['drums', 'music', 'instrument'],
  );

  static final cameraIcon = AssetIconInfoModel(
    name: IconName.camera.value,
    assetPath: 'assets/icons/camera.png',
    tags: ['camera', 'photo', 'device'],
  );

  static final videoCameraIcon = AssetIconInfoModel(
    name: IconName.videoCamera.value,
    assetPath: 'assets/icons/video_camera.png',
    tags: ['video camera', 'film', 'device'],
  );

  static final bookIcon = AssetIconInfoModel(
    name: IconName.book.value,
    assetPath: 'assets/icons/book.png',
    tags: ['book', 'read', 'literature'],
  );

  static final beachIcon = AssetIconInfoModel(
    name: IconName.beach.value,
    assetPath: 'assets/icons/beach.png',
    tags: ['beach', 'sea', 'sand'],
  );

  static final mountainIcon = AssetIconInfoModel(
    name: IconName.mountain.value,
    assetPath: 'assets/icons/mountain.png',
    tags: ['mountain', 'hill', 'nature'],
  );

  static final cityIcon = AssetIconInfoModel(
    name: IconName.city.value,
    assetPath: 'assets/icons/city.png',
    tags: ['city', 'urban', 'buildings'],
  );

  static final dogIcon = AssetIconInfoModel(
    name: IconName.dog.value,
    assetPath: 'assets/icons/dog.png',
    tags: ['dog', 'animal', 'pet'],
  );

  static final catIcon = AssetIconInfoModel(
    name: IconName.cat.value,
    assetPath: 'assets/icons/cat.png',
    tags: ['cat', 'animal', 'pet'],
  );

  static final birdIcon = AssetIconInfoModel(
    name: IconName.bird.value,
    assetPath: 'assets/icons/bird.png',
    tags: ['bird', 'animal', 'flying'],
  );

  static final laughIcon = AssetIconInfoModel(
    name: IconName.laugh.value,
    assetPath: 'assets/icons/laugh.png',
    tags: ['laugh', 'emoji', 'happy'],
  );

  static final smileIcon = AssetIconInfoModel(
    name: IconName.smile.value,
    assetPath: 'assets/icons/smile.png',
    tags: ['smile', 'emoji', 'happy'],
  );

  static final sadIcon = AssetIconInfoModel(
    name: IconName.sad.value,
    assetPath: 'assets/icons/sad.png',
    tags: ['sad', 'emoji', 'unhappy'],
  );

  static final cryIcon = AssetIconInfoModel(
    name: IconName.cry.value,
    assetPath: 'assets/icons/cry.png',
    tags: ['cry', 'emoji', 'tears'],
  );

  static final starIcon = AssetIconInfoModel(
    name: IconName.star.value,
    assetPath: 'assets/icons/star.png',
    tags: ['star', 'shape', 'favorite'],
  );

  static final heartIcon = AssetIconInfoModel(
    name: IconName.heart.value,
    assetPath: 'assets/icons/heart.png',
    tags: ['heart', 'shape', 'love'],
  );

  static final checkIcon = AssetIconInfoModel(
    name: IconName.check.value,
    assetPath: 'assets/icons/check.png',
    tags: ['check', 'mark', 'correct'],
  );

  static final crossIcon = AssetIconInfoModel(
    name: IconName.cross.value,
    assetPath: 'assets/icons/cross.png',
    tags: ['cross', 'mark', 'wrong'],
  );

  static final computerIcon = AssetIconInfoModel(
    name: IconName.computer.value,
    assetPath: 'assets/icons/computer.png',
    tags: ['computer', 'device', 'technology'],
  );

  static final telephoneIcon = AssetIconInfoModel(
    name: IconName.telephone.value,
    assetPath: 'assets/icons/telephone.png',
    tags: ['telephone', 'device', 'communication'],
  );

  static final televisionIcon = AssetIconInfoModel(
    name: IconName.television.value,
    assetPath: 'assets/icons/television.png',
    tags: ['television', 'device', 'entertainment'],
  );
}
