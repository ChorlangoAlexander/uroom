class User1 {
  int? id;
  String? name;
  String? imageUrl;
  bool? isOnline;

  User1({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User1 currentUser = User1(
  id: 0,
  name: 'Nick Fury',
  imageUrl: 'assets/2.jpeg',
  isOnline: true,
);

// USERS
final User1 alex = User1(
  id: 1,
  name: 'Alexander',
  imageUrl: 'assets/2.jpeg',
  isOnline: true,
);
final User1 captainAmerica = User1(
  id: 2,
  name: 'Captain America',
  imageUrl: 'assets/2.jpeg',
  isOnline: true,
);
final User1 hulk = User1(
  id: 3,
  name: 'Hulk',
  imageUrl: 'assets/2.jpeg',
  isOnline: false,
);
final User1 scarletWitch = User1(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: 'assets/2.jpeg',
  isOnline: false,
);
final User1 spiderMan = User1(
  id: 5,
  name: 'Spider Man',
  imageUrl: 'assets/2.jpeg',
  isOnline: true,
);
final User1 blackWindow = User1(
  id: 6,
  name: 'Black Widow',
  imageUrl: 'assets/2.jpeg',
  isOnline: false,
);
final User1 thor = User1(
  id: 7,
  name: 'Thor',
  imageUrl: 'assets/2.jpeg',
  isOnline: false,
);
final User1 captainMarvel = User1(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: 'assets/2.jpeg',
  isOnline: false,
);
