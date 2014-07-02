require './test/test_helper'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  def setup
    @repo = ItemRepository.new("./test/fixtures/items_sample.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_merchants
    assert @repo.count >= 10
  end

  def test_find_single_item_by_name
    result = @repo.find_by_name('Item Expedita Aliquam')
    assert_equal 'Item Expedita Aliquam', result.name
    assert_equal '5', result.id
  end

  def test_find_all_by_name
    results = @repo.find_all_by_name('Item Autem Minima')
    assert_equal 2, results.count
  end

  # def test_find_by_unit_price
  #   result = @repo.find_by_unit_price('')
  # end
end
