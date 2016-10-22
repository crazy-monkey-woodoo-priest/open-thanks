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

RSpec.shared_examples 'param searchable resource' do
  describe '.find_param' do
    before do
      subject.save
    end

    it 'should be generated upon resource creation' do
      expect(described_class.find_param(subject.public_uid)).to eq subject
    end
  end

  describe '#to_param' do
    before do
      subject.public_uid = 'aaaaxxxx'
    end

    it 'should use public_uid to generate to_param' do
      expect(subject.to_param).to eq 'aaaaxxxx'
    end
  end
end
