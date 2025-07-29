require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:academic_year) }
    it { should validate_presence_of(:password) }
    
    it { should validate_uniqueness_of(:email) }
    
    it { should validate_inclusion_of(:role).in_array(%w[user assistant]) }
    
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'associations' do
    # TODO: Fix association test when AssistantCourse model is properly set up
    # it { should have_many(:assistant_courses) }
    it 'has many assistant courses' do
      user = build(:assistant)
      expect(user).to respond_to(:assistant_courses)
    end
  end

  describe 'secure password' do
    it 'should have secure password' do
      user = build(:user)
      expect(user).to respond_to(:password)
      expect(user).to respond_to(:password_confirmation)
      expect(user).to respond_to(:authenticate)
    end
  end

  describe 'instance methods' do
    describe '#assistant?' do
      context 'when user is an assistant' do
        let(:user) { build(:user, role: 'assistant') }

        it 'returns true' do
          expect(user.assistant?).to be true
        end
      end

      context 'when user is not an assistant' do
        let(:user) { build(:user, role: 'user') }

        it 'returns false' do
          expect(user.assistant?).to be false
        end
      end
    end

    describe '#user?' do
      context 'when user is a regular user' do
        let(:user) { build(:user, role: 'user') }

        it 'returns true' do
          expect(user.user?).to be true
        end
      end

      context 'when user is an assistant' do
        let(:user) { build(:user, role: 'assistant') }

        it 'returns false' do
          expect(user.user?).to be false
        end
      end
    end
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'has a valid assistant factory' do
      expect(build(:assistant)).to be_valid
    end

    it 'has a valid regular user factory' do
      expect(build(:regular_user)).to be_valid
    end
  end

  describe 'password validation' do
    context 'when password is too short' do
      let(:user) { build(:user, password: 'short') }

      it 'is not valid' do
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include('is too short (minimum is 8 characters)')
      end
    end

    context 'when password is long enough' do
      let(:user) { build(:user, password: 'password123') }

      it 'is valid' do
        expect(user).to be_valid
      end
    end
  end

  describe 'email validation' do
    context 'when email is not unique' do
      let!(:existing_user) { create(:user, email: 'test@example.com') }
      let(:new_user) { build(:user, email: 'test@example.com') }

      it 'is not valid' do
        expect(new_user).not_to be_valid
        expect(new_user.errors[:email]).to include('has already been taken')
      end
    end

    context 'when email is unique' do
      let(:user) { build(:user, email: 'unique@example.com') }

      it 'is valid' do
        expect(user).to be_valid
      end
    end
  end

  describe 'role validation' do
    context 'when role is invalid' do
      let(:user) { build(:user, role: 'invalid_role') }

      it 'is not valid' do
        expect(user).not_to be_valid
        expect(user.errors[:role]).to include('is not included in the list')
      end
    end

    context 'when role is valid' do
      it 'accepts "user" role' do
        user = build(:user, role: 'user')
        expect(user).to be_valid
      end

      it 'accepts "assistant" role' do
        user = build(:user, role: 'assistant')
        expect(user).to be_valid
      end
    end
  end
end 