require 'rails_helper'

RSpec::describe "Users", type: :request do

  describe "POST /users/sign_up" do
    context "with valid required params" do

      let!(:user_params) { { "user" => user_attributes } }

      before { post "/api/v1/users/sign_up", params: user_params }
      
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context "payload" do
        subject { response.body }
        it { is_expected.to include("name", "email", "address", "phone", "id", "photo_url") }
      end
    end

    context "with missing required params" do

      let!(:user_params) { { "user" => user_attributes(name: '', email: 'example@gmail.com') } }
      
      before { post "/api/v1/users/sign_up", params: user_params }

      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe "POST /users/sign_in" do

    before { user = User.create(user_attributes) }

    context "with valid credentials" do

      let!(:login_params) { { "user" => login_attributes } }

      before { post "/api/v1/users/sign_in", params: login_params }
      
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context "payload" do
        subject { response.body }
        it { is_expected.to include("name", "email", "address", "phone", "id", "photo_url", "api_key") }
      end
    end

    context "with invalid credentials" do

      let!(:login_params) { { "user" => login_attributes(password: "another_secret") } }

      before { post "/api/v1/users/sign_in", params: login_params }
      
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
      context "payload" do
        subject { response.body }
        it { is_expected.to include("errors") }
      end
    end

    context "with missing required params" do

      let!(:login_params) { { "user" => login_attributes(email: "") } }

      before { post "/api/v1/users/sign_in", params: login_params }
      
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:unauthorized) }
      end
      context "payload" do
        subject { response.body }
        it { is_expected.to include("errors") }
      end
    end
  end
end