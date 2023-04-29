import 'package:flutter/material.dart';

const users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

const userGordon = UserDemo(
  id: 'gordon',
  name: 'Gordon Hayes',
  image:
  'https://pbs.twimg.com/profile_images/1262058845192335360/Ys_-zu6W_400x400.jpg',
);

const userSalvatore = UserDemo(
  id: 'salvatore',
  name: 'Salvatore Giordano',
  image:
  'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSacha = UserDemo(
  id: 'sacha',
  name: 'Sacha Arbonel',
  image:
  'https://pbs.twimg.com/profile_images/1199684106193375232/IxA9XLuN_400x400.jpg',
);

const userDeven = UserDemo(
  id: 'deven',
  name: 'Deven Joshi',
  image:
  'https://pbs.twimg.com/profile_images/1371411357459832832/vIy8TO9F_400x400.jpg',
);

const userSahil = UserDemo(
  id: 'sahil',
  name: 'Sahil Kumar',
  image:
  'https://pbs.twimg.com/profile_images/1324766105127153664/q96TpY8I_400x400.jpg',
);

const userReuben = UserDemo(
  id: 'reuben',
  name: 'Reuben Turner',
  image:
  'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);

const userNash = UserDemo(
  id: 'nash',
  name: 'Nash Ramdial',
  image:
  'https://pbs.twimg.com/profile_images/1436372495381172225/4wDDMuD8_400x400.jpg',
);
//
// @immutable
class UserDemo {
  final String id;
  final String name;
  final String image;

  const UserDemo({
    required this.id,
    required this.name,
    required this.image,
  });
}