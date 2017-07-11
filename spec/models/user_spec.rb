require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Users' do
    it 'should successuflly create user user_1 with distinct email and password and password confirmation correct' do
      user_1=User.create!(email:'user_1@user_1', password:'user_1',password_confirmation:'user_1',first_name: 'a', last_name:'A')
      expect(User.where(email:'user_1@user_1').count).to eql(1)
    end
    it 'should not allow creation of 2 users with the same user email' do
      user_1=User.create(email:'user_1@user_1', password:'user_1_1',password_confirmation:'user_1_1',first_name:'A',last_name:'a')
      user_2=User.create(email:'user_1@user_1', password:'user_1_2',password_confirmation:'user_1_2',first_name:'B',last_name:'b')
      expect(User.all).to include(user_1)
      expect(User.where(email: 'user_1@user_1').count).to eql(1)
    end
    it 'should not allow creation of 2 users with the same user email with different capitalizations' do
      user_1=User.create!(email:'user_1@user_1', password:'user_1_1',password_confirmation:'user_1_1',first_name:'a',last_name:'B')
      user_2=User.create(email:'user_1@user_1', password:'user_1_1',password_confirmation:'user_1_1',first_name:'a',last_name:'A')
      expect(User.where(email: 'useR_1@User_1').count).to eql(0)
    end
    it 'should not allow creation of user if the password confirmation fails' do
      user_1=User.create(email:'user_1@user_1',password:'u1',password_confirmation:'u2',first_name:'u',last_name:'U')
      expect(User.where(email:'user_1@user_1').count).to eql(0)
    end
    it 'should not allow creation of user if the password shorter than 6 characters' do
      user_1=User.create(email:'user_1@user_1',password:'u1',password_confirmation:'u1',first_name:'c',last_name:'C')
      expect(User.where(email:'user_1@user_1').count).to eql(0)
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should authenticate with correct user email and password' do
      user_1=User.create(email:'user_1@user_1', password:'user_1_1',password_confirmation:'user_1_1',first_name:'A',last_name:'a')
      expect(User.authenticate_with_credentials('user_1@user_1','user_1_1').email).to eql('user_1@user_1')
    end
    it 'should authenticate with correct user email starting with some spaces' do
      user_1=User.create(email:'user_1@user_1', password:'user_1_1',password_confirmation:'user_1_1',first_name:'A',last_name:'a')
      expect(User.authenticate_with_credentials(' user_1@user_1','user_1_1').email).to eql('user_1@user_1')
    end
    it 'should authenticate with correct user email with random capitalization' do
      user_1=User.create(email:'user_1@user_1', password:'user_1_1',password_confirmation:'user_1_1',first_name:'A',last_name:'a')
      expect(User.authenticate_with_credentials('UseR_1@uSer_1','user_1_1').email).to eql('user_1@user_1')
    end
    it 'should not authenticate with wrong password' do
      user_1=User.create(email:'user_1@user_1', password:'user_1_1',password_confirmation:'user_1_1',first_name:'A',last_name:'a')
      expect(User.authenticate_with_credentials('user_1@user_1','user_1_2')).to be_nil
    end
  end
end