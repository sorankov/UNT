# coding: utf-8

class Break < Sprite
  #number ==> imgのnumber
  def initialize(x,y,img,speed,number)
    super(x,y,img)
    @speed = speed
    @number = number
  end
  def update
    if @number == 0
        self.x += @speed
    elsif @number == 1
        self.x -= @speed
    elsif @number == 2
        self.y += @speed
    elsif @number == 3
        self.y -= @speed
    elsif @number == 4
        self.x += @speed
        self.y -= @speed
    elsif @number == 5
        self.x -= @speed
        self.y -= @speed
    elsif @number == 6
        self.x += @speed
        self.y += @speed
    elsif @number == 7
        self.x -= @speed
        self.y += @speed
    end
    
    
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit
    if $hp > 6
        $hp -= 6
        $hp_bar -= 9
    else
        $hp = 0
        $hp_bar = 101
    end
    self.vanish
  end
end