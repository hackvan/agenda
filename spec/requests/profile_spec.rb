require 'rails_helper'

RSpec::describe "Profiles", type: :request do
  describe "GET /profiles" do

    context "with valid credentials" do
      
      let!(:user) do 
        user = User.create(user_attributes(email: "another@gmail.com"))
        user.generate_api_key
        user.save
        user
      end

      let!(:auth_headers) { { 'ApiKeyAuth' => user.api_key } }

      before { get "/api/v1/profile", headers: auth_headers }
      
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
      context "payload" do
        subject { response.body }
        it { is_expected.to include("name", "email", "address", "phone", "id", "photo_url") }
      end
    end
  end

end