class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(row, repo_ref)
    @id          = row[:id]
    @customer_id = row[:cusomter_id]
    @merchant_id = row[:merchant_id]
    @status      = row[:status]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo_ref    = repo_ref
  end

end
