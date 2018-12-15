# coding: utf-8
require 'dxopal'
include DXOpal

require_remote 'player.rb'
require_remote 'player2.rb'
require_remote 'enemy.rb'
require_remote 'bone.rb'
require_remote 'ball.rb'
require_remote 'ball_break.rb'
require_remote 'laser.rb'
require_remote 'laser2.rb'

Image.register(:player, 'images/player.png') 
Image.register(:enemy, 'images/enemy1.png')
Image.register(:bone, 'images/bone.png')
Image.register(:bone2, 'images/bone2.png')
Image.register(:ball, 'images/ball.png')
Image.register(:player_dead, 'images/player_dead.png')
Image.register(:player_dead2, 'images/player_dead2.png')

Image.register(:laser, 'images/laser.png')
Image.register(:laser2, 'images/laser2.png')

Image.register(:flawey, 'images/flawey.png')
Image.register(:flawey2, 'images/flawey2.png')

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
  
  laser_img = Image[:laser]
  laser_img.set_color_key([0, 0, 0])
  
  laser_img = Image[:laser2]
  laser_img.set_color_key([0, 0, 0])
  
  flawey_img = Image[:flawey]
  flawey_img.set_color_key([0, 0, 0])
  
  flawey2_img = Image[:flawey2]
  flawey2_img.set_color_key([0, 0, 0])
 
  player = Player.new(384, 368, player_img)
  player2 = Player2.new(384, 468, player_img)
  
  
 
  #エネミーメソッド
  def create_enemies
    enemies = []
   
    enemy_img = Image[:enemy]
    enemy_img.set_color_key([0, 0, 0])
  
    bone_img = Image[:bone]
    bone_img.set_color_key([0, 0, 0])
  
    bone2_img = Image[:bone2]
    bone2_img.set_color_key([0, 0, 0])
    
    laser_img = Image[:laser]
    laser_img.set_color_key([0, 0, 0])
    
    laser2_img = Image[:laser2]
    laser2_img.set_color_key([0, 0, 0])
    
    
    
    
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
    
    return enemies
  end
  
  #エネミーメソッド2
  def create_enemies2
    enemies2 = []
   
    enemy_img = Image[:enemy]
    enemy_img.set_color_key([0, 0, 0])
  
    bone_img = Image[:bone]
    bone_img.set_color_key([0, 0, 0])
  
    bone2_img = Image[:bone2]
    bone2_img.set_color_key([0, 0, 0])
    
    laser_img = Image[:laser]
    laser_img.set_color_key([0, 0, 0])
    
    laser2_img = Image[:laser2]
    laser2_img.set_color_key([0, 0, 0])
    
    bn_x = 0
    bn2_x = 0
    
    5.times do
      enemies2 << Bone.new(bn_x + 2400, 432, bone_img, 0)
      bn_x -= 400
    end
    5.times do
      enemies2 << Bone.new(bn2_x + 2600, 355, bone2_img, 0)
      bn2_x -= 400
    end
    5.times do
      enemies2 << Bone.new(bn_x + 3000, 100, bone_img, 180)
      bn_x += 400
    end
    5.times do
      enemies2 << Bone.new(bn2_x + 2800, 100, bone2_img, 180)
      bn2_x += 400
    end

    
    return enemies2
  end
  
  #エネミーメソッド3
  def create_enemies3
    enemies3 = []
    ball_img = Image[:ball]
    ball_img.set_color_key([0, 0, 0])
    
    10.times do
        enemies3 << Ball.new(rand(800), rand(600)-600, ball_img, 2)
    end
    10.times do
        enemies3 << Ball.new(rand(800), rand(600)-1200, ball_img, 2)
    end
    10.times do
        enemies3 << Ball.new(rand(800), rand(600)-1800, ball_img, 2)
    end
    
    return enemies3
  end
  
  #エネミーメソッド4
  def create_enemies4
    enemies4 = []
   
    enemy_img = Image[:enemy]
    enemy_img.set_color_key([0, 0, 0])
  
    bone_img = Image[:bone]
    bone_img.set_color_key([0, 0, 0])
  
    bone2_img = Image[:bone2]
    bone2_img.set_color_key([0, 0, 0])
    
    laser_img = Image[:laser]
    laser_img.set_color_key([0, 0, 0])
    
    laser2_img = Image[:laser2]
    laser2_img.set_color_key([0, 0, 0])
    
    3.times do
      enemies4 << Laser.new(160 , rand(600)-100, laser_img, 0)
    end  
    
    return enemies4
  end
  
  
  enemies = create_enemies
  enemies2 = create_enemies2
  enemies3 = create_enemies3
  enemies4 = create_enemies4


  $hp = 100
  $hp_bar = 248
  
  Window.loop do
    
    Window.draw_box(200, 100, 600, 500, [255, 255, 255, 255], 0)
    Window.draw_box(198, 98, 598, 498, [255, 255, 255, 255], 0)
    Window.draw_font(100, 520, "HP", Font.new( 30, fontname="Arial",0 ))
    Window.draw_font(150, 520, "#{$hp} / 100", Font.new( 30, fontname="Arial",0 ))
    Window.draw_box(100, 550, 250, 580, [255, 255, 255, 255], 0)
    Window.draw_box_fill(102, 552, $hp_bar, 578, [255, 255, 255, 255], 0)
#    Window.draw(100, 100, Image[:flawey])
    Window.draw( 5, 100, Image[:flawey])
    Window.draw( 605, 100, Image[:flawey2])
    

    
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
                p Player
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :title
            end
            if Input.key_push?(K_RETURN)
                p Player
                player = Player.new(384, 468, player_img)
                enemies = create_enemies
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :playing2
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                GAME_INFO[:scene] = :gameover
            end
            
        #ゲーム画面2
        when :playing2
            
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            Sprite.update(enemies2)
            Sprite.draw(enemies2)

            player2.update
            player2.draw

            # 当たり判定
            Sprite.check(player2, enemies2)
            
            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                p Player2
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies2 = create_enemies2
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :title
            end
            
            if Input.key_push?(K_RETURN)
                p Player
                player = Player.new(384, 368, player_img)
                enemies = create_enemies
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :playing3
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                GAME_INFO[:scene] = :gameover
            end
            
        #ゲーム画面3
        when :playing3
            player.update
            player.draw
            
            ball_break_img = Image[:ball].slice_tiles(2, 2)
            (0..3).each do |num|
                 ball_break_img[num].set_color_key([0, 0, 0])
            end
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            
            enemies3.each do |enemy|
                if enemy.class == Ball && !enemy.vanished?
                    p enemy.y
                    if enemy.y > 245
                        enemies3 << Break.new(enemy.x-5, 250-5, ball_break_img[0], 5, 0)
                        enemies3 << Break.new(enemy.x+5, 250-5, ball_break_img[1], 5, 1)
                        enemies3 << Break.new(enemy.x-5, 250+5, ball_break_img[2], 5, 2)
                        enemies3 << Break.new(enemy.x+5, 250+5, ball_break_img[3], 5, 3)
                    end
                end
            end
            Sprite.update(enemies3)
            Sprite.draw(enemies3)
      
            Sprite.check(player, enemies3)
      
            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                p Player2
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies3 = create_enemies3
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :title
            end
      
            if Input.key_push?(K_RETURN)
                p Player2
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies2 = create_enemies2
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :playing4
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                GAME_INFO[:scene] = :gameover
            end
            
         when :playing4
            
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            Sprite.update(enemies4)
            Sprite.draw(enemies4)

            player.update
            player.draw

            # 当たり判定
            Sprite.check(player, enemies4)
            
            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                p Player
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies2 = create_enemies2
                enemies4 = create_enemies4
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :title
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                GAME_INFO[:scene] = :gameover
            end
            
        #ゲームオーバー画面    
        when :gameover
            Window.draw_font(280, 280, "GAME OVER", Font.new( 40, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(340, 320, "Press Esc", Font.new( 25, fontname="源ノ角ゴシック JP",0 ))
            if Input.key_push?(K_ESCAPE)
                player = Player.new(384, 468, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                enemies2 = create_enemies2
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :playing
            end
      end
  end
end