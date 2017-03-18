def update_quality(items)
  items.each do |item|
    update_item_quality(item)
    update_sell_in(item)
    update_expired_sell_in(item)
  end
end

def update_item_quality(item)
  update_quality_actions = {
    'Aged Brie' => lambda {|item| increase_quality(item) },
    'Backstage passes to a TAFKAL80ETC concert' => lambda {|item| increase_quality_backstage(item) },
    'Sulfuras, Hand of Ragnaros' => lambda {|item| nil },
    'NORMAL ITEM' => lambda {|item| decrease_quality(item) }
  }

  update_quality_actions[item.name].call(item)
end

def update_sell_in(item)
  update_sell_in_actions = {
    'Aged Brie' => lambda {|item|  decrease_sell_in(item) },
    'Backstage passes to a TAFKAL80ETC concert' => lambda {|item| decrease_sell_in(item) },
    'Sulfuras, Hand of Ragnaros' => lambda {|item| nil },
    'NORMAL ITEM' => lambda {|item| decrease_sell_in(item) }
  }

  update_sell_in_actions[item.name].call(item)
end

def update_expired_sell_in(item)
  update_expired_actions = {
    'Aged Brie' => lambda {|item|  increase_quality(item) },
    'Backstage passes to a TAFKAL80ETC concert' => lambda {|item| item.quality = 0 },
    'Sulfuras, Hand of Ragnaros' => lambda {|item| nil },
    'NORMAL ITEM' => lambda {|item| decrease_quality(item) }
  }

  update_expired_actions[item.name].call(item) if item.sell_in < 0
end

def increase_quality(item)
  item.quality += 1 if item.quality < 50
end

def increase_quality_backstage(item)
  increase_quality(item)
  increase_quality(item) if item.sell_in < 11
  increase_quality(item) if item.sell_in < 6
end

def decrease_quality(item)
  item.quality -= 1 if item.quality > 0
end

def decrease_sell_in(item)
  item.sell_in -= 1
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

