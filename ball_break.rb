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
        self.y -= @speed
    elsif @number == 1
        self.x -= @speed
        self.y -= @speed
    elsif @number == 2
        self.x += @speed
        self.y += @speed
    elsif @number == 3
        self.x -= @speed
        self.y += @speed
    end
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit
    if $hp > 10
        $hp -= 10
        $hp_bar -= 15
    else
        $hp = 0
        $hp_bar = 101
    end
    self.vanish
  end
end