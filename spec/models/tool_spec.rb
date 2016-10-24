require 'rails_helper'

RSpec.describe Tool, type: :model do
  it { should belong_to :post}
end
