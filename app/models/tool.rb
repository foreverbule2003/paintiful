class Tool < ActiveRecord::Base
  belongs_to :post, dependent: :destroy, touch: true
end
