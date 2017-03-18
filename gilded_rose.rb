def update_quality(items)
  items.each do |item|
    function_1(item)
    function_2(item)
    function_3(item)
  end
end

def function_1_true(item)
  (item.quality > 0 && item.name != 'Sulfuras, Hand of Ragnaros') && function_1_true_true(item)
end

def function_1_false_true(item)
  item.quality += 1
  (item.name == 'Backstage passes to a TAFKAL80ETC concert') && function_1_false_true_true(item)
end

def function_1_false(item)
  item.quality < 50 && function_1_false_true(item)
end

def function_1_true_true(item)
  item.quality -= 1
end

def function_1_false_true_true(item)
  item.quality < 50 && function_1_false_true_true_true(item)
end

def function_1_false_true_true_true(item)
  item.sell_in < 11 && item.quality += 1
  item.sell_in < 6 && item.quality += 1
end

def function_1(item)
  (item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert') ? function_1_true(item) : function_1_false(item)
end

def function_2(item)
  item.name != 'Sulfuras, Hand of Ragnaros' && item.sell_in -= 1
end

def function_3_true(item)
  item.name != "Aged Brie" ? function_3_true_true(item) : function_3_true_false(item)
end

def function_3_true_true(item)
  item.name != 'Backstage passes to a TAFKAL80ETC concert' ? function_3_true_true_true(item) : function_3_true_true_false(item)
end

def function_3_true_true_true(item)
  (item.quality > 0 && item.name != 'Sulfuras, Hand of Ragnaros') && item.quality -= 1
end

def function_3_true_true_false(item)
  item.quality = 0
end

def function_3_true_false(item)
  item.quality < 50 && item.quality += 1
end

def function_3(item)
  item.sell_in < 0 && function_3_true(item)
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

