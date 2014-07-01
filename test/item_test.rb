require './test/test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test
  def setup
    @item = Item.new(id: '4', name: 'Item Nemo Facere')
  end

  def test_a_item_has_attributes
    assert_equal '4', @item.id
    assert_equal 'Item Nemo Facere', @item.name
  end
end
