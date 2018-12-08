# coding: utf-8

class Player < Sprite
  def update
    self.x += Input.x * 5
    self.y += Input.y * 5
  end
end