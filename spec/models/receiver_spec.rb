require 'rails_helper'

RSpec.describe Receiver, type: :model do
  subject { build :receiver }

  it_behaves_like 'should generate public_uid'
  it_behaves_like 'param searchable resource'

  describe '#appriciated?' do
    subject { create :receiver }
    let(:result) { subject.appriciated?(by: user) }
    let(:user) { create :user }

    context 'when appriciated by the user' do
      before do
        create :appreciation, receiver: subject, user: user
      end

      it do
        expect(result).to be true
      end
    end

    context 'when appriciated by other user' do
      before do
        create :appreciation, receiver: subject
      end

      it do
        expect(result).to be false
      end
    end
  end
end
