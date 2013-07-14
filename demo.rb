

class Demo
  def initialize(v)
    @value = v
  end
  
  def print()
    puts @value
  end
  
  def set(value)
    @value = value
  end
  
end

d = Demo.new(10)
d.print()
d.set(11)
d.print()


