# coding: utf-8

class Bone < Sprite
  def initialize(x,y,img,angle)
    super(x,y,img)
    @angle = angle
  end
  def update
    self.x -= 2
    self.angle = @angle
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end
  
  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit
    $hp -= 1
    $hp_bar -= 49
    self.vanish
  end
end