require 'rails_helper'


RSpec.describe ServicesController, :type => :controller do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show certification" do
    it "returns http success" do
      get :show, params: {services: 'certification'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show accreditation" do
    it "returns http success" do
      get :show, params: {services: 'accreditation'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show accreditation expert" do
    it "returns http success" do
      get :show, params: {services: 'accreditation', item: 'expert'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show accreditation agency" do
    it "returns http success" do
      get :show, params: {services: 'accreditation', item: 'agency'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show accreditation laboratory" do
    it "returns http success" do
      get :show, params: {services: 'accreditation', item: 'laboratory'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show accreditation competence" do
    it "returns http success" do
      get :show, params: {services: 'accreditation', item: 'competence'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show development" do
    it "returns http success" do
      get :show, params: {services: 'development'}
      expect(response).to have_http_status(:success)
    end
  end
end
