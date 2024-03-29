require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    before(:each) do
      @user = User.new(
        fname: 'Bob',
        lname: 'jones',
        email: 'bobjones@gmail.com',
        password: '123456789',
        password_confirmation: '123456789'
      )
      @user.save
    end
  

    
    it 'saves successfully when all fields are set' do
      expect(@user.save).to be true
    end

    
    it 'validates presence of fname' do
      @user.fname = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Fname can't be blank")
    end

    it 'validates presence of lname' do
      @user.lname = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Lname can't be blank")
    end

    it 'validates presence of email' do
      @user.email = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'validates sync of password fields' do
      @user.password = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'blank password validation' do
      @user.password = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'minimum chars password validation' do
      @user.password = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
    

   
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(
        fname: 'Bob',
        lname: 'jones',
        email: 'bobjones@gmail.com',
        password: '123456789',
        password_confirmation: '123456789')
        @user.save
    end
    
  

    
    it 'returns the user if authentication succeeds' do
      authenticated_user = User.authenticate_with_credentials('bobjones@gmail.com', '123456789')
      puts authenticated_user
      expect(authenticated_user).to eq(@user)
    end

    it 'returns the user if authentication succeeds' do
      authenticated_user = User.authenticate_with_credentials('bobjones@gmail.com', '123456789')
      puts authenticated_user
      expect(authenticated_user).to eq(@user)
    end
    
    it 'returns nil if authentication fails' do
      authenticated_user = User.authenticate_with_credentials('bobjones@gmail.com', 'wrongpassword')
      expect(authenticated_user).to be_nil
    end

    it 'ignores leading/trailing whitespace in email' do
      authenticated_user = User.authenticate_with_credentials('  bobjones@gmail.com  ', '123456789')
      expect(authenticated_user).to eq(@user)
    end

    it 'is case-insensitive for email' do
      authenticated_user = User.authenticate_with_credentials('BOBjones@gmail.com', '123456789')
      expect(authenticated_user).to eq(@user)
    end
    
  end
end
