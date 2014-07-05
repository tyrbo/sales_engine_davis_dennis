require 'csv'
require_relative '../lib/customer'
require_relative '../lib/parser'
require 'pry'

class CustomerRepository
  attr_reader   :customers, :engine

  def initialize(engine, data_path='./data/')
    @customers = Parser.new.parse(data_path + 'customers.csv', Customer, self)
    @engine = engine
  end

  def random
    @customers.shuffle.first
  end

  def all
    @customers
  end

  def find_by_last_name(last_name)
    @customers.find {
      |customer| customer.last_name.downcase == last_name.downcase
    }
  end

  def find_all_by_first_name(first_name)
    @customers.find_all {
      |customer| customer.first_name.downcase == first_name.downcase
    }
  end

  def find_by_id(id)
    @customers.find {
      |customer| customer.id.to_s == id.to_s
    }
  end

  def invoices(id)
    engine.invoice_repository.find_all_by_customer_id(id)
  end

  def count
    @customers.count
  end
end
