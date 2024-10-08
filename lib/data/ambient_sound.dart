// ignore_for_file: public_member_api_docs, sort_constructors_first
class AmbientSound {
  String title;
  String asset;
  AmbientSound({
    required this.title,
    required this.asset,
  });
}

final listAmbientSound = [
  AmbientSound(
    title: 'Beach',
    asset: 'sound/beach.mp3',
  ),
  AmbientSound(
    title: 'Bonfire',
    asset: 'sound/bonfire.mp3',
  ),
  AmbientSound(
    title: 'Coffee Shop',
    asset: 'sound/coffeeshop.mp3',
  ),
  AmbientSound(
    title: 'Forest',
    asset: 'sound/forest.mp3',
  ),
  AmbientSound(
    title: 'Ocean',
    asset: 'sound/ocean.mp3',
  ),
  AmbientSound(
    title: 'Raining',
    asset: 'sound/raining.mp3',
  ),
  AmbientSound(
    title: 'Train',
    asset: 'sound/train.mp3',
  ),
];
