require 'csv'
require_relative 'customer'
require_relative 'parser'

class CustomerRepository
  attr_reader   :customers,
                :engine

  def initialize(engine, data_path)
    @customers = Parser.new.parse(data_path + '/customers.csv', Customer, self)
    @engine    = engine
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  def random
    customers.sample
  end

  def all
    customers
  end

  def find_by_last_name(last_name)
    customers.find { |c| c.last_name.downcase == last_name.downcase }
  end

  def find_all_by_first_name(first_name)
    customers.find_all { |c| c.first_name.downcase == first_name.downcase }
  end

  def find_by_id(id)
    customers.find { |c| c.id.to_s == id.to_s }
  end

  def count
    customers.count
  end
end
