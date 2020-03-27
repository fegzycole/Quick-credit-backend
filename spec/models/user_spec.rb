
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    it { should validate_presence_of(:firstName) }
    it { should validate_presence_of(:lastName) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:isAdmin) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should allow_value('Ferguson').for(:firstName) }
    it { should_not allow_value('F').for(:firstName) }
    it { should allow_value('Iyara').for(:lastName) }
    it { should_not allow_value('I').for(:lastName) }
    it { should_not allow_value('').for(:address) }
    address = (0..250).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(address).for(:address) }
    it { should_not allow_value('fergusonmail.com').for(:email) }
  end
end