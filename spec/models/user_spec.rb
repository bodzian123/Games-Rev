require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:games) }
    it { should have_many(:musics) }
    it { should have_many(:movies) }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
