# coding: utf-8

class Bone < Sprite
  def initialize(x,y,img,angle)
    super(x,y,img)
    @angle = angle
  end
  def update
    self.x -= 1
    self.angle = @angle
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end
  
  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit
    self.vanish
  end
end