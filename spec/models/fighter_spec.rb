require 'rails_helper'

users = FactoryBot.create_list(:user, 10)

RSpec.describe Fighter, type: :model do
  subject { FactoryBot.create(:fighter, user: FactoryBot.create(:user)) }
  
  describe 'factory' do
    it 'has a valid factory' do
      expect(create(:fighter, :with_avatar, user: users[0])).to be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it do
      should validate_length_of(:name).
        is_at_least(2).
        is_at_most(12).
        on(:create)
    end

    it { should validate_presence_of(:attack) }
    it { should validate_inclusion_of(:attack).in_range(10..20) }

    it { should validate_presence_of(:health) }
    it { should validate_inclusion_of(:health).in_range(200..400) }

    it { should validate_presence_of(:user) }
    it { should have_db_index(:user_id).unique(true) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:fighter_equipments) }
    it { should have_many(:equipments).through(:fighter_equipments) }
  end
end

