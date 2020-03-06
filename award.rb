class Award
  attr_reader :name, :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def update
    case @name
    when 'Blue First'
      @quality = [quality + 1, 50].min
      @expires_in -= 1
      @quality = [quality + 1, 50].min if @expires_in < 0
    when 'Blue Compare'
      @quality = [quality + 1, 50].min
      @quality = [quality + 1, 50].min if @expires_in <= 10
      @quality = [quality + 1, 50].min if @expires_in <= 5
      @expires_in -= 1
      @quality = 0 if @expires_in < 0
    when 'Blue Distinction Plus'
      # Never expire, never decrease in quality
      nil
    when 'Blue Star'
      @quality = [@quality - 2, 0].max
      @expires_in -= 1
      @quality = [@quality - 2, 0].max if @expires_in < 0
    else
      @quality = [@quality - 1, 0].max
      @expires_in -= 1
      @quality = [@quality - 1, 0].max if @expires_in < 0
    end
  end
end
