require 'rails_helper'

RSpec.describe Cookie, type: :model do
  it { should validate_presence_of(:contact) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:access_time) }
  it { should belong_to(:contact) }
end
