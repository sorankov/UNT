# coding: utf-8

class Laser < Sprite
  def initialize(x,y,img,angle)
    #y = rand(Window.width - image.width)  # y座標をランダムに決める
    super(x,y,img)
    @angle = angle
  end
  def update
    
  end

end
  
