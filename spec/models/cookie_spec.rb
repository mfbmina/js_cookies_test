require 'rails_helper'

RSpec.describe Cookie, type: :model do
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:access_time) }
end
