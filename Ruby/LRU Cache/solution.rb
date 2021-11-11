class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  # @param [Object] item
  def add(item)
    if @cache.include?(item)
      @cache.delete(item)
      @cache << item
    elsif count >= @size
      @cache.shift
      @cache << item
    else
      @cache << item
    end
  end

  def show
    p @cache
    nil
  end
end
