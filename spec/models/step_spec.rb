require 'rails_helper'

RSpec.describe Step, type: :model do
  it { should belong_to :post}
end
