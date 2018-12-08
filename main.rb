# coding: utf-8
require 'dxopal'
include DXOpal

require_remote 'player.rb'
require_remote 'player2.rb'
require_remote 'enemy.rb'
require_remote 'bone.rb'

Image.register(:player, 'images/player.png') 
Image.register(:enemy, 'images/enemy1.png')
Image.register(:bone, 'images/bone.png')
Image.register(:bone2, 'images/bone2.png')

bn_x = 0
bn2_x = 0

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
  
  bone_img = Image[:bone]
  bone_img.set_color_key([0, 0, 0])
  
  bone2_img = Image[:bone2]
  bone2_img.set_color_key([0, 0, 0])


  player = Player2.new(384, 468, player_img)
  #player2の時、y初期値468に変更
  
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
  5.times do
    enemies << Bone.new(bn_x + 700, 432, bone_img, 0)
    bn_x -= 100
  end
  5.times do
    enemies << Bone.new(bn2_x + 700, 432, bone2_img, 0)
    bn2_x -= 100
  end
  5.times do
    enemies << Bone.new(bn_x + 700, 100, bone_img, 180)
    bn_x -= 100
  end
  5.times do
    enemies << Bone.new(bn2_x + 700, 100, bone2_img, 180)
    bn2_x -= 100
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