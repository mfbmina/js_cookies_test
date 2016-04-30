require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('test@test.com').for(:email) }
  it { should_not allow_value('@test.com', 'testtest.com', 'test@.com', 'test@test').for(:email) }
  it { should have_many(:cookies) }
end
