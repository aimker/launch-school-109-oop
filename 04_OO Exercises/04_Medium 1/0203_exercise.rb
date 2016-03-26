class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

newInvoice = InvoiceEntry.new("CRM", 50)
newInvoice.update_quantity(100)
puts newInvoice.quantity

## QUESTION 2
# The code above will return an error, because the @quantity only has a getter method,
# because of the attr_reader. In update_quantity, we want to change its value,
# so we either i) have to call attr_accessor, instead of attr_reader, and put the
# following line in the update_quantity method:
# self.quantity = updated_count if updated_count >= 0
# or access it directly as @quantity.

## QUESTION 3

# There is nothing wrong with this way, in terms of syntax, but by changing
# attr_reader to attr_accessor, the variable becomes "public", in the way that
# somebody is now able to change it by calling object.quantity.
