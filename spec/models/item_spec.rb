require 'rails_helper'

RSpec.describe Item, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:item_status) }

    it { should belong_to(:owner) }

    it { should belong_to(:item_category) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
