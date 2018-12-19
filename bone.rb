# coding: utf-8

class Bone < Sprite
  def initialize(x,y,img,angle)
    super(x,y,img)
    @angle = angle
  end
  def update
    self.x -= 3
    self.angle = @angle
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end
  
  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit
    if $hp > 20
        $hp -= 20
        $hp_bar -= 30
    else
        $hp = 0
        $hp_bar = 101
    end
    self.vanish
  end
end