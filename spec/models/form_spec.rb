require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '寄付情報の保存' do
    before do
      @form = FactoryBot.build(:form)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@form).to be_valid
    end
    it 'buildingが空でも保存できること' do
      @form.building = nil
      expect(@form).to be_valid
    end
    it 'postal_codeが空だと保存できない' do
      @form.postal_code = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できない' do
      @form.postal_code = "3440000"
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'area_idが空だと保存できない' do
      @form.area_id = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Area can't be blank")
    end
    it 'area_idの値が1では保存できない' do
      @form.area_id = 1
      @form.valid?
      expect(@form.errors.full_messages).to include("Area must be other than 1")
    end
    it 'cityが空だと保存できない' do
      @form.city = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できない' do
      @form.address = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できない' do
      @form.phone_number = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12文字以上だと保存できない' do  
      @form.phone_number = "080000066660"
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが11文字以下でもハイフンがあると保存できない' do
      @form.phone_number = "080-0000-6666"
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'tokenが空だと保存できない' do
      @form.token = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Token can't be blank")
    end
  end
end