enum IconName {
  // General
  home('home'),
  settings('settings'),
  search('search'),

  // Hobbies
  painting('painting'),
  gardening('gardening'),
  photography('photography'),

  // Food
  burger('burger'),
  coffee('coffee'),
  veggies('veggies'),

  // Sports
  soccer('football'),
  basketball('basketball'),
  tennis('tennis'),
  skiing('skiing'),
  iceSkating('iceSkating'),
  skating('skating'),
  running('running'),

  // Music
  notes('notes'),
  guitar('guitar'),
  piano('piano'),
  drums('drums'),

  // Media
  camera('camera'),
  videoCamera('videoCamera'),
  computer('computer'),
  telephone('telephone'),
  television('television'),
  book('book'),

  // Places
  beach('beach'),
  mountain('mountain'),
  city('city'),

  // Animals
  dog('dog'),
  cat('cat'),
  bird('bird'),

  // Emojis
  laugh('laugh'),
  smile('smile'),
  sad('sad'),
  cry('cry'),

  // Others
  star('star'),
  heart('heart'),
  check('check'),
  cross('cross');

  final String value;

  const IconName(this.value);

  @override
  String toString() {
    return value;
  }

  static IconName fromString(String value) {
    return IconName.values.firstWhere((e) => e.value == value);
  }
}
