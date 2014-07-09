class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repo_ref

  def initialize(row, repo_ref)
    @id           = row[:id].to_i
    @name         = row[:name]
    @created_at   = row[:created_at]
    @updated_at   = row[:updated_at]
    @repo_ref     = repo_ref
  end

  def items
    repo_ref.engine.item_repository.find_all_by_merchant_id(@id)
  end

  def invoices
    repo_ref.engine.invoice_repository.find_all_by_merchant_id(@id)
  end

  def revenue(date=nil)
    scoped_invoices = invoices.select(&:successful?)
    date && scoped_invoices.select! { |invoice| invoice.created_at == date }
    zero = BigDecimal.new('0') # FIXME: <-- no tests on this one (i.e. a merchant with no invoices returns zero)
    scoped_invoices.map(&:total).reduce(zero, :+)
  end

  # returns the Customer who has conducted the most successful transactions
  def favorite_customer
    # gather invoices for merchant
    # filter those for success
    # filter for customer with largest number if invoices (Enumerable#group_by)
    # return customer object (find by id)
  end

  # self.invoices
  def customers_with_pending_invoices
    require "pry"
    binding.pry
    invoices.first.successful_transactions
  end
end
