RSpec.shared_examples 'should generate public_uid' do
  describe '#public_uid' do
    it 'should be generated upon resource creation' do
      expect { subject.save and subject.reload }
        .to change { subject.public_uid }
        .from(nil)
        .to be_kind_of(String)
    end
  end
end
