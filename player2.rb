class Player < Sprite
  def update
    
    self.x += Input.x * 5
    self.y = 100
    
    if self.x < 200 
        self.x = 200
    elsif self.x > 568
        self.x = 568
    end
    
    if ???
        until self.y >= 300
            self.y += 1
        end
        until self.y <= 100
            self.y -= 1
        end
    end
    
  end
end