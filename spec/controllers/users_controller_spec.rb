require 'spec_helper'

describe UsersController do
  # let(:user) { create_user }
  # describe "トークンがない場合" do
  #   before do
  #     get :index
  #   end
  #   it "アクセスできないこと" do
  #     response.response_code.should == 403
  #   end
  # end
  #
  # describe "トークンがある場合" do
  #   before do
  #     5.times { FactoryGirl.create(:user_seq, role_id: user.role_id) }
  #     @users = User.search.result
  #     get :index, token: user.authentication_token
  #   end
  #   it "アクセスできること" do
  #     response.response_code.should == 200
  #     # JSONのレスポンスのrootが自動でtopicsにならないので指定している。いい方法が知りたい
  #     response.body.should == ActiveModel::ArraySerializer.new(@users, root: :users).to_json
  #   end
  # end
end
