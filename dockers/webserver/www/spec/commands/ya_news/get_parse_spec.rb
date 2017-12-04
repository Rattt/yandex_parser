require 'rails_helper'

describe YaNews::GetParse do

  before(:all) do
    obj = RedisConnect.get
    obj.flushall
  end
  
  describe "before parsing and creating a custom articles" do

    it "first object to will be pulised" do
      YaNews::GetParse.any_instance.stubs(:get_content).returns(nil)
      object = Articles::GetFirst.new.execute
      expect(object.new_record?).to be_truthy
    end
    
    it "first yandex news to be nil" do
      YaNews::GetParse.any_instance.stubs(:get_content).returns(nil)
      object = YaNews::Get.new.execute  
      expect(object).to equal(nil)
    end
  end

  describe "aftter parsing" do

    before(:each) do
      str = %q{
      <div class="content-tabs__items">
        <a class="list__item-content" href="fake_link">Some</a>
      </div>
      <h1 class="story__head">Title</h1>
      <div class="doc__text">Anotation</div>
      }
      YaNews::GetParse.any_instance.stubs(:get_content).returns(str)
      YaNews::GetParse.new.execute
    end

    it "first object to will be pulised" do
      object = Articles::GetFirst.new.execute
      expect(object.class.name).to eql('OpenStruct')
    end
    
    it "first yandex news to be nil" do
      object = YaNews::Get.new.execute  
      expect(object.class.name).to eql('OpenStruct')
    end

    describe 'after create a custom article' do

      before(:each) do
        FactoryGirl.create(:article)
      end

      it "first object to will be pulised" do
        object = Articles::GetFirst.new.execute
        expect(object.class.name).to eql('Article')
      end
    end
  end
end
