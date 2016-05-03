require 'rails_helper'

RSpec.describe Api::CookiesController, type: :controller do
  let(:contact) { create(:contact) }
  let(:valid_request) { { url: 'http://localhost:3000/reports', accessTime: "Tue, 03 May 2016 00:59:28 GMT" } }
  let(:invalid_request) { { url: 'http://localhost:3000/reports' } }

  describe "POST #create" do
    context "with valid params" do
      before :each do
        post :create, uid: contact.email, cookie: valid_request, format: :json
      end

      it "assignees cookie.contact to contact" do
        expect(Cookie.last.contact).to eq(contact)
      end

      it "renders a success response" do
        expect(response.status).to eq(201)
      end
    end

    context "with invalid params" do
      it "renders a fail response" do
        post :create, uid: contact.email, cookie: invalid_request, format: :json
        expect(response.status).to eq(400)
      end
    end

    context "without json" do
      it "renders a fail response" do
        post :create, uid: contact.email, cookie: invalid_request
        expect(response.status).to eq(406)
      end
    end
  end
end
