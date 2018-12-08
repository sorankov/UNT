# coding: utf-8
require 'dxopal'
include DXOpal

require_remote 'player.rb'
require_remote 'enemy.rb'

Image.register(:player, 'images/player.png') 
Image.register(:enemy, 'images/enemy1.png') 

GAME_INFO = {
  scene: :title,  # 現在のシーン(起動直後は:title)
}

Window.load_resources do
  Window.width  = 800
  Window.height = 600
  
  player_img = Image[:player]
  player_img.set_color_key([0, 0, 0])

  enemy_img = Image[:enemy]
  enemy_img.set_color_key([0, 0, 0])

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
  
  
  
  Window.loop do
  
    Window.draw_box(200, 100, 600, 500, [255, 255, 255, 255], 0)
    Window.draw_box(198, 98, 598, 498, [255, 255, 255, 255], 0)
    
    case GAME_INFO[:scene]
    
        when :title
            Window.draw_font(270, 300, "GAME START", Font.new( 40, fontname="源ノ角ゴシック JP",0 ))
        
            if Input.key_push?(K_SPACE)
                GAME_INFO[:scene] = :playing
            end
    
        when :playing
            Sprite.update(enemies)
            Sprite.draw(enemies)

            player.update
            player.draw

            # 当たり判定
            Sprite.check(player, enemies)
        
            if Input.key_push?(K_ESCAPE)
                GAME_INFO[:scene] = :title
            end       
      end
  end
end