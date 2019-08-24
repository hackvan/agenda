require 'rails_helper'

RSpec::describe "Posts", type: :request do

  describe "POST /users" do
    context "with valid required params" do

      let!(:user_params) { { "user" => user_attributes } }

      before { post "/api/v1/users/sign_up", params: user_params }
      
      context "response" do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context "payload" do
        subject { response.body }
        it { is_expected.to include("name", "email", "address", "phone", "password_digest") }
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
end