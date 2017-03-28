class CandyFactory
  def initialize(red: 0, green: 0, yellow: 0, blue: 0)
    @red    = red.times.each_with_object([]) { |_, array| array << 'R' }
    @green  = green.times.each_with_object([]) { |_, array| array << 'G' }
    @blue   = blue.times.each_with_object([]) { |_, array| array << 'B' }
    @yellow = yellow.times.each_with_object([]) { |_, array| array << 'Y' }
  end

  def pack
    @blue_green = @blue + @green

    if @yellow.size > @blue_green.size
      (@yellow.zip(@blue_green).flatten.compact + @red).join
    else
      (@blue_green.zip(@yellow).flatten.compact + @red).join
    end
  end
end
