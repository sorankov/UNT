# coding: utf-8

class Laser < Sprite
  def initialize(x,y,img,angle)
    super(x,y,img)
    @angle = angle
  end
  def update
    self.angle = @angle
  end
end
  
