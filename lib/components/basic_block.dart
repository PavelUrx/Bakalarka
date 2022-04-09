import 'package:flame/components.dart';

class BasicBlock extends SpriteComponent with HasGameRef {
  late String spritePath; //path to image of the block
  late double blockSpeed = 1.0; //speed of block moving down
  late Vector2 blockSize = Vector2.all(100); //size of gameBlock
  late String correctGesture; //gesture required for correct play
  late int fromWhereReact = 0;
  late Vector2 screenSize;
  BasicBlock(this.spritePath, this.blockSpeed, this.blockSize,
      this.correctGesture, this.fromWhereReact);

  @override //run while initializing
  Future<void>? onLoad() async {
    super.onLoad();
    size = blockSize;
    poseBlock(size);
    sprite = await gameRef.loadSprite(spritePath);
  }

  @override //run on every frame
  void update(double dt) {
    blockMover(blockSpeed, dt);
    super.update(dt);
  }

  @override //run on start and after resize
  void onGameResize(Vector2 size) {
    screenSize = size;
    resizeBlock(size);
    super.onGameResize(size);
  }

  //set up gameBlock size to % of device screen
  void resizeBlock(Vector2 size) {
    blockSize.x = size.x / 100 * blockSize.x;
    blockSize.y = size.x / 100 * blockSize.y;
  }

  //moves block
  void blockMover(double speed, double dt) {
    position.add(Vector2(0, speed * dt));
  }

  //sets block on correct sport
  void poseBlock(Vector2 size) {
    position.x = (screenSize.x - blockSize.x) / 2;
    position.y = -blockSize.y;
  }

  //reacts on gesture from display, reacts at specified % of display
  bool onGesture(String gesture) {
    if (gesture == correctGesture &&
        (position.y / screenSize.y) * 100 >
            (fromWhereReact / screenSize.y) * 100) {
      return true;
    }
    return false;
  }

  //deletes sprite after object is removed
  @override
  void onRemove() {
    sprite!.image.dispose();
    super.onRemove();
  }
}
