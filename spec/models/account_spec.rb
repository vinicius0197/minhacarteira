require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should have_many(:transactions).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:balance) }
end