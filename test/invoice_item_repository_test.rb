require './test/test_helper'
require_relative '../lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test
  def setup
    @repo = InvoiceItemRepository.new("./test/fixtures/invoice_items_sample.csv")
  end

  def test_it_exists
    assert @repo
  end

  def test_a_repository_loads_invoice_items
    assert @repo.count >= 10
  end

  def test_can_lookup_invoice_item_by_id
    result = @repo.find_by_item_id(534)
    assert_equal '6', result.quantity
    assert_equal '76941', result.unit_price
  end

  def test_can_lookup_item_by_quanity
    skip
    assert_equal 2, @repo.find_all_by_quanity(6).count
  end

  def test_can_lookup_item_by_invoice_id
    skip
    assert @repo.invoice_items[3], @repo.find_by_id(3)
  end
end
