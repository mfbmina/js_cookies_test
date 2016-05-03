require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  let(:cookie) { create(:cookie) }

  describe "GET #index" do
    it "assigns all cookies as @cookies" do
      get :index
      expect(assigns(:cookies)).to eq([cookie])
    end
  end
end
