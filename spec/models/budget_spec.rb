require 'rails_helper'

RSpec.describe Budget, type: :model do
  it { should have_many(:accounts) }
  it { should have_many(:categories) }
end
