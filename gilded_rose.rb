def update_quality(items)
  items.each do |item|
    create_updater(item).update
  end
end

def create_updater(item)
  updaters = {
    'Aged Brie' => AgedBrieUpdater,
    'Backstage passes to a TAFKAL80ETC concert' => BackstageUpdater,
    'Sulfuras, Hand of Ragnaros' => SulfurusUpdater,
    'NORMAL ITEM' => NormalItemUpdater
  }

  updaters[item.name].new(item)
end

class NormalItemUpdater
  def initialize(item)
    @item = item
  end

  def update
    update_item_quality
    update_sell_in
    update_expired_sell_in if @item.sell_in < 0
  end

  def update_item_quality
    decrease_quality
  end

  def update_sell_in
    decrease_sell_in
  end

  def update_expired_sell_in
    decrease_quality
  end

  protected

  def increase_quality
    @item.quality += 1 if @item.quality < 50
  end

  def decrease_quality
    @item.quality -= 1 if @item.quality > 0
  end

  def decrease_sell_in
    @item.sell_in -= 1
  end
end

class AgedBrieUpdater < NormalItemUpdater
  def update_item_quality
    increase_quality
  end

  def update_expired_sell_in
    increase_quality
  end
end

class BackstageUpdater < NormalItemUpdater
  def update_item_quality
    increase_quality
    increase_quality if @item.sell_in < 11
    increase_quality if @item.sell_in < 6
  end

  def update_expired_sell_in
    @item.quality = 0
  end
end

class SulfurusUpdater < NormalItemUpdater
  def update_item_quality
    nil
  end

  def update_sell_in
    nil
  end

  def update_expired_sell_in
    nil
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

