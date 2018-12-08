# coding: utf-8

class Enemy < Sprite
  def initialize(x,y,img,speed)
    super(x,y,img)
    @speed = speed
  end
  def update
    self.y += @speed
    self.x += rand(8)-rand(8)
    if self.y >= Window.height - self.image.height
      self.vanish
    end
  end
  
  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit
    self.vanish
  end
end