# coding: utf-8

class Ball < Sprite
  def initialize(x,y,img,speed)
    super(x,y,img)
    @speed = speed
  end
  def update
    self.y += @speed
    if self.y >= 250
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