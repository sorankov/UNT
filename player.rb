# coding: utf-8

class Player < Sprite
  def update
    
    self.x += Input.x * 5
    self.y += Input.y * 5
    
    if self.x < 200 
        self.x = 200
    elsif self.x > 568
        self.x = 568
    end
    
    if self.y < 100 
        self.y = 100
    elsif self.y > 468
        self.y = 468
    end
    
  end
end