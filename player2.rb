class Player2 < Sprite

  attr_accessor :jump, :dir
  
  def initialize
    @jump = 0
    @dir = 0
    super
 
  end

  def update
    if Input.key_push?(K_UP)
        @jump = 1
        p "up"
    end
    
    self.x += Input.x * 5
    
    
    if self.x < 200 
        self.x = 200
    elsif self.x > 568
        self.x = 568
    end
    
    if @jump == 1
        p "up2"
        if @dir == 0 && self.y >= 250
            self.y -= 1 * 6
            if self.y < 250
                @dir = 1
            end
        elsif @dir ==1 && self.y <= 460
            self.y += 1 * 6
            if self.y > 460
                @dir = 0
                @jump = 0
            end
        end
        
    end
    
  end
end