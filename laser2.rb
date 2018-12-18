# coding: utf-8

class Laser2 < Sprite
  def initialize(x,y,img,angle)
    super(x,y,img)
    @angle = angle
  end
  def update
    if rand(120) == 1
        self.vanish
    end
  end
  def hit
    if $hp > 1
        $hp -= 1
        $hp_bar -= 1.5
    else
        $hp = 0
        $hp_bar = 101
    end
  end
end
  
