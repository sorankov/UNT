# coding: utf-8
require 'dxopal'
include DXOpal

require_remote 'player.rb'
require_remote 'enemy.rb'

Image.register(:player, 'images/player.png') 
Image.register(:enemy, 'images/enemy1.png') 

Window.load_resources do
  Window.width  = 800
  Window.height = 600
  
  player_img = Image[:player]
  player_img.set_color_key([0, 0, 0])

  enemy_img = Image[:enemy]
  enemy_img.set_color_key([0, 0, 0])

<<<<<<< HEAD
  player = Player.new(384, 300, player_img)

=======
  player = Player.new(400, 500, player_img)
  
>>>>>>> refs/heads/master
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