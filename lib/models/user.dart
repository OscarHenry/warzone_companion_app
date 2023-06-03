class User {
  final String name;
  final String nickName;
  final String image;
  final int followers;
  final bool isVerified;
  const User({
    required this.name,
    String? nickName,
    required this.image,
    this.followers = 0,
    this.isVerified = false,
  }) : nickName = nickName ?? name;
}

const ronal = User(
  name: 'Ronal Richard',
  nickName: 'purpleleopard757',
  image: 'https://i.pravatar.cc/150?img=1',
  followers: 1,
);

const albert = User(
  name: 'Albert Flores',
  nickName: 'sadwolf658',
  image: 'https://i.pravatar.cc/150?img=2',
  followers: 2,
  isVerified: false,
);

const esther = User(
  name: 'Esther Howard',
  nickName: 'greenrabbit223',
  image: 'https://i.pravatar.cc/150?img=3',
  followers: 3,
  isVerified: false,
);

const annette = User(
  name: 'Annette Black',
  nickName: 'buitifullion123',
  image: 'https://i.pravatar.cc/150?img=4',
  followers: 4,
  isVerified: false,
);

const marvin = User(
  name: 'Marvin McKinney',
  nickName: 'ratcat432',
  image: 'https://i.pravatar.cc/150?img=5',
  followers: 5,
);

const savanah = User(
  name: 'Savanah Baker',
  nickName: 'pinklioness123',
  image: 'https://i.pravatar.cc/150?img=6',
  followers: 6,
  isVerified: false,
);

final users = [ronal, albert, esther, annette, marvin, savanah];
