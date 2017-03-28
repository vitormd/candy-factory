class CandyFactory
  def initialize(red: 0, green: 0, yellow: 0, blue: 0)
    @r = { total: red,    letter: 'R' }
    @g = { total: green,  letter: 'G' }
    @y = { total: yellow, letter: 'Y' }
    @b = { total: blue,   letter: 'B' }
    @total = @r[:total] + @g[:total] + @y[:total] + @b[:total]
    @package = ''
  end

  def pack
    (0..@total).each do |_|
      next if pack_g
      next if pack_y
      next if pack_b
      next if pack_r
    end
    @package
  end

  private

  def pack_g
    return false if
      @g[:total] < 1 ||
      (
        (@package.end_with? '') &&
        (@g[:total] + @b[:total] < @y[:total])
      ) ||
      @package.end_with?(@r[:letter])

    pack_color(@g)
  end

  def pack_y
    return false if
      @y[:total] < 1 ||
      (
        (@package.end_with? '') &&
        @g[:total] + @b[:total] > @y[:total]
      ) ||
      (
        @package.end_with?(@y[:letter]) &&
        (@g[:total] > 0 || @b[:total] > 0)
      )

    pack_color(@y)
  end

  def pack_b
    return false if
      @b[:total] < 1 ||
      (
        (@package.end_with? '') &&
        (@g[:total] + @b[:total] < @y[:total])
      )

    pack_color(@b)
  end

  def pack_r
    return false if @r[:total] < 1

    pack_color(@r)
  end

  def pack_color(color)
    color[:total] -= 1
    @package << color[:letter]
    true
  end
end
