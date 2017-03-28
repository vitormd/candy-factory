class CandyFactory
  def initialize(red: 0, green: 0, yellow: 0, blue: 0)
    @r = { total: red,    letter: 'R' }
    @g = { total: green,  letter: 'G' }
    @y = { total: yellow, letter: 'Y' }
    @b = { total: blue,   letter: 'B' }
    @package = ''
  end

  def pack
    yellows      = (@y[:letter] * @y[:total]).split('')
    blue_greens  = (@g[:letter] * @g[:total]).split('')
    blue_greens += (@b[:letter] * @b[:total]).split('')
    reds         = (@r[:letter] * @r[:total]).split('')

    if yellows.size > blue_greens.size
      (yellows.zip(blue_greens).flatten.compact + reds).join
    else
      (blue_greens.zip(yellows).flatten.compact + reds).join
    end
  end
end
