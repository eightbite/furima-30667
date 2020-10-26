require 'rails_helper'
RSpec.describe Item, Type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it "カラムが全て存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "紐づくユーザーが存在しないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it "nameが空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it "expositionが空では出品できない" do
        @item.exposition = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Exposition can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it "category_idの値が1では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it "status_idが空では出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status can't be blank")
      end
      it "status_idの値が1では出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status must be other than 1")
      end
      it "burden_idが空では出品できない" do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Burden can't be blank")
      end
      it "burden_idの値が1では出品できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Burden must be other than 1")
      end
      it "area_idが空では出品できない" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Area can't be blank")
      end
      it "area_idの値が1では出品できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Area must be other than 1")
      end
      it "day_idが空では出品できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day can't be blank")
      end
      it "day_idの値が1では出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day must be other than 1")
      end
      it "priceが空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it "priceは全角では出品できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceは半角でも数字でなければ出品できない" do
        @item.price = "price"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceは300円未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceは10000000円以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
