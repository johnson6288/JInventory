class Product < ApplicationRecord
    self.per_page = 12
    belongs_to :platform
    belongs_to :status
    belongs_to :type
    belongs_to :occasion
end
