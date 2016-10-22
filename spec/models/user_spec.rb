require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  describe '#public_uid' do
    it do
      subject.save
      expect(subject.reload.public_uid).to be_kind_of(String)
    end
  end
end
