class User {
  final String name;
  final String image;
  final int followers;
  final bool isVerified;
  const User({
    required this.name,
    required this.image,
    this.followers = 0,
    this.isVerified = false,
  });
}

const ronal = User(
  name: 'Ronal Richard',
  image: 'https://i.pravatar.cc/150?img=1',
  followers: 1,
);

const albert = User(
  name: 'Albert Flores',
  image: 'https://i.pravatar.cc/150?img=2',
  followers: 2,
  isVerified: false,
);

const esther = User(
  name: 'Esther Howard',
  image: 'https://i.pravatar.cc/150?img=3',
  followers: 3,
  isVerified: false,
);

const annette = User(
  name: 'Annette Black',
  image: 'https://i.pravatar.cc/150?img=4',
  followers: 4,
  isVerified: false,
);

const marvin = User(
  name: 'Marvin McKinney',
  image: 'https://i.pravatar.cc/150?img=5',
  followers: 5,
);

const savanah = User(
  name: 'Savanah Baker',
  image: 'https://i.pravatar.cc/150?img=6',
  followers: 6,
  isVerified: false,
);
