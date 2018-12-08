# coding: utf-8
require 'dxopal'
include DXOpal

require_remote 'player.rb'
require_remote 'enemy.rb'
require_remote 'bone.rb'

Image.register(:player, 'images/player.png') 
Image.register(:enemy, 'images/enemy1.png')
Image.register(:bone, 'images/bone.png')

bn_x = 0

Window.load_resources do
  Window.width  = 800
  Window.height = 600
  
  
  #p Window.methods
  player_img = Image[:player]
  player_img.set_color_key([0, 0, 0])

  enemy_img = Image[:enemy]
  enemy_img.set_color_key([0, 0, 0])
  
  bone_img = Image[:bone]
  bone_img.set_color_key([0, 0, 0])

  player = Player.new(384, 300, player_img)

  enemies = []
  30.times do
    enemies << Enemy.new(rand(800), rand(600)-600, enemy_img, 1)
  end
  30.times do
    enemies << Enemy.new(rand(800), rand(600)-600, enemy_img, 3)
  end
  30.times do
    enemies << Enemy.new(rand(800), rand(600)-600, enemy_img, 5)
  end
  30.times do
    enemies << Enemy.new(rand(800), rand(600)-1800, enemy_img, 5)
  end
  30.times do
    enemies << Enemy.new(rand(800), rand(600)-3000, enemy_img, 5)
  end
  30.times do
    enemies << Enemy.new(rand(800), rand(600)-4200, enemy_img, 5)
  end
  50.times do
    enemies << Bone.new(bn_x + 1400, 432, bone_img, 0)
    bn_x -= 25
  end
  50.times do
    enemies << Bone.new(bn_x + 2400, 100, bone_img, 180)
    bn_x -= 25
  end
  
  Window.loop do
    Window.draw_box(200, 100, 600, 500, [255, 255, 255, 255], 0)
    Window.draw_box(198, 98, 598, 498, [255, 255, 255, 255], 0)
    
    Sprite.update(enemies)
    Sprite.draw(enemies)

    player.update
    player.draw

    # 当たり判定
    Sprite.check(player, enemies)
  end
end