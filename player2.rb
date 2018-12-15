class Player2 < Sprite

  attr_accessor :jump, :dir
  
  #関数定義
  def initialize
    @jump = 0
    @dir = 0
    @count = 0
    @is_jump = false
    @high_jump = false
    super
 end
  
  #スペース押下中でカウント
  def update
    if Input.key_down?(K_SPACE)
        @count += 1
        @is_jump = true
    else
        if @is_jump == true
            @jump = 1
            if @count >= 10
                @high_jump = true
            end
            @is_jump = false
        end
    end
    
    
    #横制限と移動速度
    self.x += Input.x * 3
  
    if self.x < 200 
        self.x = 200
    elsif self.x > 568
        self.x = 568
    end
       
    if @jump == 1
        
        #デフォルトジャンプ
        jump_height = 330
        
        #ハイジャンプ
        if @high_jump == true
          jump_height = 250
        end

        #dir:上に上がるときは0下がるときは1
        #high_jump:飛ぶとfalse
        #count:飛ぶとリセット
        if @dir == 0 && self.y >= jump_height
            self.y -= 1 * 6
            if self.y < jump_height
              @dir = 1
              @high_jump = false
              @count = 0
            end
        elsif @dir ==1 && self.y <= 460
            self.y += 1 * 6
            if self.y > 460
                @dir = 0
                @jump = 0
            end
        end
    end
  end
end