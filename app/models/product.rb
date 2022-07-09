class Product < ApplicationRecord
    validates :name, :price, presence: true
    validates :price, numericality: {greater_than: 0, less_than: 10000000}

    def to_s
        name
    end
end
