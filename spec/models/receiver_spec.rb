require 'rails_helper'

RSpec.describe Receiver, type: :model do
  subject { build :receiver }

  it_behaves_like 'should generate public_uid'
end
