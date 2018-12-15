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
  
 
  #エネミーメソッド
  def create_enemies
    enemies = []
   
    enemy_img = Image[:enemy]
    enemy_img.set_color_key([0, 0, 0])
  
    bone_img = Image[:bone]
    bone_img.set_color_key([0, 0, 0])
  
    bone2_img = Image[:bone2]
    bone2_img.set_color_key([0, 0, 0])
    
    bn_x = 0
    bn2_x = 0
    
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
    5.times do
      enemies << Bone.new(bn_x + 2400, 432, bone_img, 0)
      bn_x -= 400
    end
    5.times do
      enemies << Bone.new(bn2_x + 2600, 355, bone2_img, 0)
      bn2_x -= 400
    end
    5.times do
      enemies << Bone.new(bn_x + 3000, 100, bone_img, 180)
      bn_x += 400
    end
    5.times do
      enemies << Bone.new(bn2_x + 2800, 100, bone2_img, 180)
      bn2_x += 400
    end
    
    return enemies
  end
  
  enemies = create_enemies

  
  Window.loop do
  
    Window.draw_box(200, 100, 600, 500, [255, 255, 255, 255], 0)
    Window.draw_box(198, 98, 598, 498, [255, 255, 255, 255], 0)
    Window.draw_font(100, 520, "HP", Font.new( 30, fontname="Arial",0 ))
    Window.draw_font(150, 520, "3 / 3", Font.new( 30, fontname="Arial",0 ))
    Window.draw_box(100, 550, 250, 580, [255, 255, 255, 255], 0)
    Window.draw_box_fill(102, 552, 248, 578, [255, 255, 255, 255], 0)
    
    case GAME_INFO[:scene]
        
        #タイトル画面
        when :title
            Window.draw_font(270, 280, "GAME START", Font.new( 40, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(320, 320, "Press ENTER", Font.new( 25, fontname="源ノ角ゴシック JP",0 ))
            
            if Input.key_push?(K_RETURN)
                GAME_INFO[:scene] = :playing
            end
        
        #ゲーム画面
        when :playing
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            Sprite.update(enemies)
            Sprite.draw(enemies)

            player.update
            player.draw

            # 当たり判定
            Sprite.check(player, enemies)
            
            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                p Player2
                player = Player2.new(384, 468, player_img)
                enemies = create_enemies
                GAME_INFO[:scene] = :title
            end       
      end
  end
end