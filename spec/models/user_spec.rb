require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  it_behaves_like 'should generate public_uid'
  it_behaves_like 'param searchable resource'

  describe '.from_omniauth' do
    subject { User.last }

    let(:github_response) do
      OmniAuth::AuthHash.new({
        "provider"=>"github",
        "uid"=>"721990",
        "info"=> {
          "nickname"=>"equivalent",
          "email"=>"equivalent@eq8.eu",
          "name"=>"Tomas Valent",
          "image"=>"https://avatars.githubusercontent.com/u/721990?v=3",
          "urls"=>{"GitHub"=>"https://github.com/equivalent", "Blog"=>"http://www.eq8.eu"}
        }
      })
    end

    def trigger
      User.from_omniauth(github_response)
    end

    context 'Given User no with the id existed before' do
      it do
        expect { trigger }
          .to change { User.count }
          .by 1
      end

      context 'after call' do
        before do
          trigger
        end

        it 'should save nickname info' do
          expect(subject.nickname).to eq 'equivalent'
        end

        it 'should save image_url info' do
          expect(subject.image_url).to eq 'https://avatars.githubusercontent.com/u/721990?v=3'
        end

        it 'should save url info' do
          expect(subject.url).to eq 'https://github.com/equivalent'
        end
      end
    end

    context 'Given user with id existed before' do
      before do
        create :user, uid: 721990, provider: 'github', image_url: 'this-should-change'
      end

      it do
        expect { trigger }
          .to change { User.count }
          .by 0
      end

      context "Given info has changed" do
        it do
          expect { trigger }
            .to change { subject.reload.image_url }
            .from('this-should-change')
            .to('https://avatars.githubusercontent.com/u/721990?v=3')
        end

        it do
          expect { trigger }
            .to change { subject.reload.nickname }
            .from(nil)
            .to('equivalent')
        end
      end
    end
  end
end
