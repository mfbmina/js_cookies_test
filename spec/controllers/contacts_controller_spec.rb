require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:contact) { create(:contact) }

  describe "GET #index" do
    it "assigns all contacts as @contacts" do
      get :index
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe "GET #show" do
    it "assigns the requested contact as @contact" do
      get :show, { id: contact.to_param }
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "GET #new" do
    it "assigns a new contact as @contact" do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contact as @contact" do
      get :edit, { id: contact.to_param }
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before :each do
        post :create, { contact: attributes_for(:contact) }
      end

      it "assigns a newly created contact as @contact" do
        expect(assigns(:contact)).to be_a(Contact)
        expect(assigns(:contact)).to be_persisted
      end

      it "redirects to the created contact" do
        expect(response).to redirect_to(Contact.last)
      end
    end

    context "with invalid params" do
      before :each do
        post :create, { contact: attributes_for(:contact, name: nil) }
      end

      it "assigns a newly created but unsaved contact as @contact" do
        expect(assigns(:contact)).to be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: 'example' } }

      before :each do
        put :update, { id: contact.to_param, contact: new_attributes }
        contact.reload
      end

      it "updates the requested contact" do
        expect(contact.name).to eq('example')
      end

      it "assigns the requested contact as @contact" do
        expect(assigns(:contact)).to eq(contact)
      end

      it "redirects to the contact" do
        expect(response).to redirect_to(contact)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { { name: nil } }

      before :each do
        put :update, { id: contact.to_param, contact: invalid_attributes }
        contact.reload
      end

      it "assigns the contact as @contact" do
        expect(assigns(:contact)).to eq(contact)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the contacts list" do
      delete :destroy, { id: contact.to_param }
      expect(response).to redirect_to(contacts_url)
    end
  end
end
