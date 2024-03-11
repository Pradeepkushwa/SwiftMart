class CsvHelper
  class << self
    def convert_to_products(csv_data)
      products = []
      csv_file = csv_data.read
      CSV.parse(csv_file) do |row|
        title, description, price, mrp = row
        products << Product.new(title: title, description: description, price: price, mrp: mrp)
      end
      products
    end
  end
end


# app/helpers/csv_helper.rb
# class CsvHelper
#   class << self
#     def convert_to_products(csv_data)
#       products = []
#       csv_file = csv_data.read
#       CSV.parse(csv_file, headers: true) do |row|
#         products << Product.new(
#           title: row['title'],
#           description: row['description'],
#           price: row['price'],
#           mrp: row['mrp']
#         )
#       end
#       products
#     end
#   end
# end
