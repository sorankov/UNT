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

Image.register(:laser_base, 'images/laser_base.png')
Image.register(:laser, 'images/laser.png')
Image.register(:laser_base2, 'images/laser_base2.png')
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
   
    bone_img = Image[:bone]
    bone_img.set_color_key([0, 0, 0])
  
    bone2_img = Image[:bone2]
    bone2_img.set_color_key([0, 0, 0])
    
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
    12.times do
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
    
    laser_base_img = Image[:laser_base]
    laser_base_img.set_color_key([0, 0, 0])
    
    3.times do
      enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
    end  
    
    return enemies4
  end
  
  
  enemies = create_enemies
  enemies2 = create_enemies2
  enemies3 = create_enemies3
  enemies4 = create_enemies4

  
  $image_counter = 0
  $loop_counter = 0

  $hp = 100
  $hp_bar = 248
  
  $laser_loop = 0
  $laser_shot = 0
  $laser_f = 0
  $laser_base_shot = 1
  $count = 0
  
  $time_count = 0
  
  Window.loop do
    $image_counter += 1
    
    Window.draw_box(200, 100, 600, 500, [255, 255, 255, 255], 0)
    Window.draw_box(198, 98, 598, 498, [255, 255, 255, 255], 0)
    Window.draw_font(100, 520, "HP", Font.new( 30, fontname="Arial",0 ))
    Window.draw_font(150, 520, "#{$hp} / 100", Font.new( 30, fontname="Arial",0 ))
    Window.draw_box(100, 550, 250, 580, [255, 255, 255, 255], 0)
    Window.draw_box_fill(102, 552, $hp_bar, 578, [255, 255, 255, 255], 0)
    
    if $image_counter % 2 == 0
        Window.draw( 5, 100, Image[:flawey])
    elsif
        Window.draw( 5, 100, Image[:flawey2])
    end

    
    case GAME_INFO[:scene]
        
        #タイトル画面
        when :title
            Window.draw_font(270, 280, "GAME START", Font.new( 40, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(320, 320, "Press ENTER", Font.new( 25, fontname="源ノ角ゴシック JP",0 ))
            
            if Input.key_push?(K_RETURN)
                GAME_INFO[:scene] = :playing
            end
            
            if Input.key_push?(K_2)
                player = Player.new(384, 468, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                enemies2 = create_enemies2
                enemies3 = create_enemies3
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :playing2
            end
            
            if Input.key_push?(K_3)
                player = Player.new(384, 468, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                enemies2 = create_enemies2
                enemies3 = create_enemies3
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :playing3
            end
            
            if Input.key_push?(K_4)
                player = Player.new(384, 468, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                enemies2 = create_enemies2
                enemies3 = create_enemies3
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :playing4
            end
            
            if Input.key_push?(K_5)
                $loop_counter = 0
                GAME_INFO[:scene] = :gameclear
            end
        
        
        #ゲーム画面
        when :playing
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            Sprite.update(enemies)
            Sprite.draw(enemies)

            player.update
            player.draw
            
            $loop_counter += 1

            # 当たり判定
            Sprite.check(player, enemies)
            

            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                $loop_counter = 0
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :title
            end
           
           if $loop_counter == 750
                player = Player.new(384, 468, player_img)
                enemies = create_enemies
                $loop_counter = 0
                GAME_INFO[:scene] = :playing2
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                $loop_counter = 0
                GAME_INFO[:scene] = :gameover
            end
            
            
        #ゲーム画面2
        when :playing2
            
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            Sprite.update(enemies2)
            Sprite.draw(enemies2)

            player2.update
            player2.draw

            $loop_counter += 1
            
            # 当たり判定
            Sprite.check(player2, enemies2)
            
            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                $loop_counter = 0
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies2 = create_enemies2
                $loop_counter = 0
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :title
            end
            
            if $loop_counter == 850
                $loop_counter = 0
                player = Player.new(384, 368, player_img)
                enemies = create_enemies
                GAME_INFO[:scene] = :playing3
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                $loop_counter = 0
                GAME_INFO[:scene] = :gameover
            end
            
        #ゲーム画面3
        when :playing3
        
            $loop_counter += 1
            
            ball_break_img = Image[:ball].slice_tiles(2, 2)
            (0..3).each do |num|
                 ball_break_img[num].set_color_key([0, 0, 0])
            end
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            
            enemies3.each do |enemy|
                if enemy.class == Ball && !enemy.vanished?
                    if enemy.y > 245 #ある高さでボールがはじける
                        enemies3 << Break.new(enemy.x-5, 250-5, ball_break_img[0], 5, 0)
                        enemies3 << Break.new(enemy.x+5, 250-5, ball_break_img[1], 5, 1)
                        enemies3 << Break.new(enemy.x-5, 250+5, ball_break_img[2], 5, 2)
                        enemies3 << Break.new(enemy.x+5, 250+5, ball_break_img[3], 5, 3)
                    end
                end
            end
            Sprite.update(enemies3)
            Sprite.draw(enemies3)
            
            player.update
            player.draw
      
            Sprite.check(player, enemies3)
      
            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                $loop_counter = 0
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies3 = create_enemies3
                $hp = 100
                $hp_bar = 248
                GAME_INFO[:scene] = :title
            end
      
            if $loop_counter == 1000
                $loop_counter = 0
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies4 = create_enemies4
                GAME_INFO[:scene] = :playing4
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                $loop_counter = 0
                GAME_INFO[:scene] = :gameover
            end
            
         when :playing4
         
            $loop_counter += 1
            
            laser_base_img = Image[:laser_base]
            laser_base_img.set_color_key([0, 0, 0])
            laser_img = Image[:laser]
            laser_img.set_color_key([0, 0, 0])
            laser_base2_img = Image[:laser_base2]
            laser_base2_img.set_color_key([0, 0, 0])
            laser2_img = Image[:laser2]
            laser2_img.set_color_key([0, 0, 0])
            
            Window.draw_font(580, 580, "Press ESC to Continue", Font.new( 20, fontname="源ノ角ゴシック JP",0 ))
            Sprite.update(enemies4)
            Sprite.draw(enemies4)

            player.update
            player.draw
            
            if $count < 10            
                $time_count += 1
            end

            # 当たり判定
            Sprite.check(player, enemies4)
            if $laser_base_shot == 0 && $count == 1 #2番目のレーザーの土台
                if $time_count == 30
                    3.times do
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            if $laser_base_shot == 0 && $count == 2 #3番目のレーザーの土台
                if $time_count == 30
                    3.times do
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            
            if $laser_base_shot == 0 && $count == 3 #4番目のレーザーの土台
                if $time_count == 30
                    1.times do
                        enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            
           if $laser_base_shot == 0 && $count == 4 #5番目のレーザーの土台
                if $time_count == 30
                    1.times do
                        enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            
            if $laser_base_shot == 0 && $count == 5 #6番目のレーザーの土台
                if $time_count == 30
                    1.times do
                        enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            
            if $laser_base_shot == 0 && $count == 6 #7番目のレーザーの土台
                if $time_count == 30
                    1.times do
                        enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            if $laser_base_shot == 0 && $count == 7 #8番目のレーザーの土台
                if $time_count == 30
                    1.times do
                        enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            if $laser_base_shot == 0 && $count == 8 #9番目のレーザーの土台
                if $time_count == 30
                    1.times do
                        enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end
            if $laser_base_shot == 0 && $count == 9 #10番目のレーザーの土台
                if $time_count == 30
                    1.times do
                        enemies4 << Laser.new(160, rand(400)+100, laser_base_img, 0)
                        enemies4 << Laser.new(rand(400)+200, 60, laser_base2_img, 0)
                        enemies4 << Laser.new(600, rand(400)+100, laser_base_img, 0)
                    end
                $laser_base_shot = 1
                $time_count = 0
                end
            end

            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 0 #最初のレーザー
                if $time_count == 40
                    enemies4.each do |enemy2|
                        enemies4 << Laser2.new(200, enemy2.y, laser_img, 0)
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 1 #2番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy5|
                        if enemy5.class == Laser && !enemy5.vanished?
                            enemies4 << Laser2.new(enemy5.x, 100, laser2_img, 0)
                        end
                    $laser_shot = 1
                    $time_count = 0
                    end
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 2 #3番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy7|
                        if enemy7.class == Laser && !enemy7.vanished?
                            enemies4 << Laser2.new(-160, enemy7.y, laser_img, 0)
                        end
                    $laser_shot = 1
                    $time_count = 0
                    end
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 3 #4番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy9|
                        if enemy9.class == Laser && !enemy9.vanished?
                            if enemy9.x == 160
                                enemies4 << Laser2.new(200, enemy9.y, laser_img, 0)
                            elsif enemy9.y == 60
                                enemies4 << Laser2.new(enemy9.x, 100, laser2_img, 0)
                            elsif enemy9.x == 600
                                enemies4 << Laser2.new(-160, enemy9.y, laser_img, 0)
                            end
                        end 
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 4 #5番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy9|
                        if enemy9.class == Laser && !enemy9.vanished?
                            if enemy9.x == 160
                                enemies4 << Laser2.new(200, enemy9.y, laser_img, 0)
                            elsif enemy9.y == 60
                                enemies4 << Laser2.new(enemy9.x, 100, laser2_img, 0)
                            elsif enemy9.x == 600
                                enemies4 << Laser2.new(-160, enemy9.y, laser_img, 0)
                            end
                        end 
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 5 #6番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy9|
                        if enemy9.class == Laser && !enemy9.vanished?
                            if enemy9.x == 160
                                enemies4 << Laser2.new(200, enemy9.y, laser_img, 0)
                            elsif enemy9.y == 60
                                enemies4 << Laser2.new(enemy9.x, 100, laser2_img, 0)
                            elsif enemy9.x == 600
                                enemies4 << Laser2.new(-160, enemy9.y, laser_img, 0)
                            end
                        end 
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 6 #7番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy9|
                        if enemy9.class == Laser && !enemy9.vanished?
                            if enemy9.x == 160
                                enemies4 << Laser2.new(200, enemy9.y, laser_img, 0)
                            elsif enemy9.y == 60
                                enemies4 << Laser2.new(enemy9.x, 100, laser2_img, 0)
                            elsif enemy9.x == 600
                                enemies4 << Laser2.new(-160, enemy9.y, laser_img, 0)
                            end
                        end 
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 7 #8番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy9|
                        if enemy9.class == Laser && !enemy9.vanished?
                            if enemy9.x == 160
                                enemies4 << Laser2.new(200, enemy9.y, laser_img, 0)
                            elsif enemy9.y == 60
                                enemies4 << Laser2.new(enemy9.x, 100, laser2_img, 0)
                            elsif enemy9.x == 600
                                enemies4 << Laser2.new(-160, enemy9.y, laser_img, 0)
                            end
                        end 
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 8 #9番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy9|
                        if enemy9.class == Laser && !enemy9.vanished?
                            if enemy9.x == 160
                                enemies4 << Laser2.new(200, enemy9.y, laser_img, 0)
                            elsif enemy9.y == 60
                                enemies4 << Laser2.new(enemy9.x, 100, laser2_img, 0)
                            elsif enemy9.x == 600
                                enemies4 << Laser2.new(-160, enemy9.y, laser_img, 0)
                            end
                        end 
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 0 && $count == 9 #10番目のレーザー
                if $time_count == 40
                    enemies4.each do |enemy9|
                        if enemy9.class == Laser && !enemy9.vanished?
                            if enemy9.x == 160
                                enemies4 << Laser2.new(200, enemy9.y, laser_img, 0)
                            elsif enemy9.y == 60
                                enemies4 << Laser2.new(enemy9.x, 100, laser2_img, 0)
                            elsif enemy9.x == 600
                                enemies4 << Laser2.new(-160, enemy9.y, laser_img, 0)
                            end
                        end 
                    end
                    $laser_shot = 1
                    $time_count = 0
                end
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 0 #最初のレーザーを消す
                enemies4.each do |enemy3|
                    if enemy3.class == Laser && !enemy3.vanished? #レーザーの土台を消す
                        enemy3.vanish
                    end
                    if enemy3.class == Laser2 && !enemy3.vanished? #レーザーを消す
                        enemy3.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 1 #2番目のレーザーを消す
                enemies4.each do |enemy6|
                    if enemy6.class == Laser && !enemy6.vanished? #レーザーの土台を消す
                        enemy6.vanish
                    end
                    if enemy6.class == Laser2 && !enemy6.vanished? #レーザーを消す
                        enemy6.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 2 #3番目のレーザーを消す
                enemies4.each do |enemy8|
                    if enemy8.class == Laser && !enemy8.vanished? #レーザーの土台を消す
                        enemy8.vanish
                    end
                    if enemy8.class == Laser2 && !enemy8.vanished? #レーザーを消す
                        enemy8.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 3 #4番目のレーザーを消す
                enemies4.each do |enemy10|
                    if enemy10.class == Laser && !enemy10.vanished? #レーザーの土台を消す
                        enemy10.vanish
                    end
                    if enemy10.class == Laser2 && !enemy10.vanished? #レーザーを消す
                        enemy10.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 4 #5番目のレーザーを消す
                enemies4.each do |enemy10|
                    if enemy10.class == Laser && !enemy10.vanished? #レーザーの土台を消す
                        enemy10.vanish
                    end
                    if enemy10.class == Laser2 && !enemy10.vanished? #レーザーを消す
                        enemy10.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 5 #6番目のレーザーを消す
                enemies4.each do |enemy10|
                    if enemy10.class == Laser && !enemy10.vanished? #レーザーの土台を消す
                        enemy10.vanish
                    end
                    if enemy10.class == Laser2 && !enemy10.vanished? #レーザーを消す
                        enemy10.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 6 #7番目のレーザーを消す
                enemies4.each do |enemy10|
                    if enemy10.class == Laser && !enemy10.vanished? #レーザーの土台を消す
                        enemy10.vanish
                    end
                    if enemy10.class == Laser2 && !enemy10.vanished? #レーザーを消す
                        enemy10.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 7 #8番目のレーザーを消す
                enemies4.each do |enemy10|
                    if enemy10.class == Laser && !enemy10.vanished? #レーザーの土台を消す
                        enemy10.vanish
                    end
                    if enemy10.class == Laser2 && !enemy10.vanished? #レーザーを消す
                        enemy10.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 8 #9番目のレーザーを消す
                enemies4.each do |enemy10|
                    if enemy10.class == Laser && !enemy10.vanished? #レーザーの土台を消す
                        enemy10.vanish
                    end
                    if enemy10.class == Laser2 && !enemy10.vanished? #レーザーを消す
                        enemy10.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            if $laser_base_shot == 1 && $laser_shot == 1 && $laser_f == 1 && $count == 9 #10番目のレーザーを消す
                enemies4.each do |enemy10|
                    if enemy10.class == Laser && !enemy10.vanished? #レーザーの土台を消す
                        enemy10.vanish
                    end
                    if enemy10.class == Laser2 && !enemy10.vanished? #レーザーを消す
                        enemy10.vanish
                    end
                end
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 0
                $count += 1
                $time_count = 0
                enemies4.clear
            end
            #ESCキーでリセット
            if Input.key_push?(K_ESCAPE)
                $loop_counter = 0
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies2 = create_enemies2
                enemies4 = create_enemies4
                $hp = 100
                $hp_bar = 248
                $laser_f = 0
                $laser_shot = 0
                $laser_base_shot = 1
                $count = 0
                $time_count = 0
                GAME_INFO[:scene] = :title
            end
            
            if $loop_counter == 1600
                $loop_counter = 0
                player = Player.new(384, 468, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                enemies2 = create_enemies2
                enemies3 = create_enemies3
                enemies4 = create_enemies4
                $laser_loop = 0
                $laser_shot = 0
                $laser_f = 0
                $laser_base_shot = 1
                $count = 0  
                $time_count = 0
                GAME_INFO[:scene] = :gameclear
            end
            
            #HP0でゲームオーバー
            if $hp == 0
                $loop_counter = 0
                GAME_INFO[:scene] = :gameover
            end
            
        #ゲームオーバー画面    
        when :gameover
            Window.draw_font(280, 280, "GAME OVER", Font.new( 40, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(340, 320, "Press Esc", Font.new( 25, fontname="源ノ角ゴシック JP",0 ))
            if Input.key_push?(K_ESCAPE)
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                enemies2 = create_enemies2
                enemies3 = create_enemies3
                enemies4 = create_enemies4
                $hp = 100
                $hp_bar = 248
                $laser_loop = 0
                $laser_shot = 0
                $laser_f = 0
                $laser_base_shot = 1
                $count = 0  
                $time_count = 0
                GAME_INFO[:scene] = :title
            end
        #ゲームクリア画面    
        when :gameclear
            Window.draw_font(280, 150, "GAME CLEAR", Font.new( 40, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(340, 380, "Press Esc", Font.new( 25, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(220, 220, "SCORE :", Font.new( 30, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(343, 222, "残りHP #{$hp} × 100 P", Font.new( 25, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(220, 260, "TOTAL", Font.new( 30, fontname="源ノ角ゴシック JP",0 ))
            Window.draw_font(280, 290, "#{$hp*100}", Font.new( 80, fontname="Arial",0 ))
            Window.draw_font(510, 330, "P", Font.new( 40, fontname="源ノ角ゴシック JP",0 ))
            if Input.key_push?(K_ESCAPE)
                player = Player.new(384, 368, player_img)
                player2 = Player2.new(384, 468, player_img)
                enemies = create_enemies
                enemies2 = create_enemies2
                enemies3 = create_enemies3
                enemies4 = create_enemies4
                $hp = 100
                $hp_bar = 248
                $laser_loop = 0
                $laser_shot = 0
                $laser_f = 0
                $laser_base_shot = 1
                $count = 0  
                $time_count = 0
                GAME_INFO[:scene] = :title
            end
      end
  end
end