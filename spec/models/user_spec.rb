require 'rails_helper'
RSpec.describe User, Type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
end