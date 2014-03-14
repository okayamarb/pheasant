def create_user
  user = build_user
  user.save!
  user
end

def build_user
  role = FactoryGirl.create(:role)
  user = FactoryGirl.build(:user, role: role)
  user.ensure_authentication_token
  user
end