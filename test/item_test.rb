require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/item_repository'
require_relative '../lib/sales_engine'

class ItemTest < Minitest::Test
  def setup
    @item = Item.new(data, @repo_ref)
  end

  def data
    { :id=>          '1',
      :name=>        'Item Qui Esse',
      :description=> 'Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.',
      :unit_price=>  '75107',
      :merchant_id=> '1',
      :created_at=>  '2012-03-27 14:53:59 UTC',
      :updated_at=>  '2012-03-27 14:53:59 UTC'
    }
  end

  def test_an_item_has_attributes
    @item.id
    @item.name
    @item.description
    @item.unit_price
    @item.merchant_id
    @item.created_at
    @item.updated_at
  end

  def test_an_item_knows_its_attributes
    assert_equal 1, @item.id
    assert_equal 'Item Qui Esse', @item.name
    assert_equal '75107', @item.unit_price
    assert_equal 1, @item.merchant_id
    assert_equal '2012-03-27 14:53:59 UTC', @item.created_at
    assert_equal '2012-03-27 14:53:59 UTC', @item.updated_at
  end

  def test_returns_correct_number_of_invoice_items_for_item
    sales_engine = SalesEngine.new('test/fixtures')
    sales_engine.startup
    @item_test = sales_engine.item_repository.find_by_id(4)

    results = @item_test.invoice_items
    assert_equal 3, results.count
  end

  def test_returns_a_merchant_for_item
    sales_engine = SalesEngine.new('test/fixtures')
    sales_engine.startup
    @item_test = sales_engine.item_repository.find_by_id(1)

    result = @item_test.merchant
    assert_equal 'Schroeder-Jerde', result.name
  end
end
