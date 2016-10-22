require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  it_behaves_like 'should generate public_uid'
end