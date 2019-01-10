require 'rails_helper'

describe User, type: :model do
  describe 'validation tests' do
    let!(:user1) { create :user, email: 'dupa@dupa.pl' }
    it 'ensure user is valid' do
      expect(user1).to be_valid
    end
    context 'name errors' do
      it 'is too long' do
        user1.name = 'a' * 51
        expect(user1).to_not be_valid
        expect(user1.errors.count).to eq 1
        expect(user1.errors[:name]).to eq ['is too long (maximum is 50 characters)']
      end
      it 'is blank' do
        user1.name = nil
        expect(user1).to_not be_valid
        expect(user1.errors.count).to eq 1
        expect(user1.errors[:name]).to eq ["can't be blank"]
      end
    end
    context 'email errors' do
      let!(:user2) do
        described_class.new(name: 'Piecia', email: 'Dupa@dupa.pl', password: '123',
                            phone: '123456789')
      end
      let!(:user3) do
        described_class.new(name: 'Piecia', email: 'a' * 256 + '@darek.pl', password: '123',
                            phone: '123456789')
      end
      it 'it has already been taken' do
        expect(user2).to_not be_valid
        expect(user2.errors[:email]).to eq ['has already been taken']
        expect(user2.errors.count).to eq 1
      end
      it 'is too long' do
        expect(user3).to_not be_valid
        expect(user3.errors[:email]).to eq ['is too long (maximum is 255 characters)']
        expect(user3.errors.count).to eq 1
      end
    end
    context 'password errors' do
      it 'can`t be blank' do
        user1.password = nil
        expect(user1).to_not be_valid
        expect(user1.errors[:password]).to eq ["can't be blank"]
        expect(user1.errors.count).to eq 1
      end
    end
    context 'when phone is invalid' do
      it 'user is invalid' do
        user1.phone = 'asasasasas'
        expect(user1).to_not be_valid
        expect(user1.errors[:phone]).to eq ['is the wrong length (should be 9 characters)', 'is not a number']
        expect(user1.errors.count).to eq 2
      end
    end
  end
end
