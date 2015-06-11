# encoding: UTF-8
require 'spec_helper'

class TestUser < TestModel
  validates :isaf_id, isaf_id: true
end

class TestUserAllowsNil < TestModel
  validates :isaf_id, isaf_id: { allow_nil: true }
end

class TestUserAllowsNilFalse < TestModel
  validates :isaf_id, isaf_id: { allow_nil: false}
end

class TestUserWithMessage < TestModel
  validates :isaf_id, isaf_id: { message: 'this is not ok'}
end

describe IsafIdValidator do

  describe 'validation' do
    context 'given the valid IDs' do
      [
        'BULAL1',
        'AUSMB11',
        'bulal1',
        'BulAl2'
      ].each do |isaf_id|

        it "#{isaf_id.inspect} should be valid" do
          expect(TestUser.new(isaf_id: isaf_id)).to be_valid
        end

        it "#{isaf_id.inspect} should pass the class tester" do
          expect(IsafIdValidator.valid?(isaf_id)).to eq(true)
        end
      end
    end

    context "given the invalid IDs" do
      [
        'asdffg',
        'BULAL0',
        'BULAL01',
        'BUAL01',
        'BUlAL1A',
        'АСДФГ1'
      ].each do |isaf_id|

        it "#{isaf_id.inspect} should not be valid" do
          expect(TestUser.new(:isaf_id => isaf_id)).not_to be_valid
        end

        it "#{isaf_id.inspect} should fail the class tester" do
          expect(IsafIdValidator.valid?(isaf_id)).to be_falsy
        end

      end
    end

    context 'ID nil' do
      [nil].each do |isaf_id|
        it "#{isaf_id.inspect} should not be valid" do
          expect(TestUser.new(:isaf_id => isaf_id)).not_to be_valid
        end

        it "#{isaf_id.inspect} should fail the class tester" do
          expect(IsafIdValidator.valid?(isaf_id)).to be_falsy
        end

        it "#{isaf_id.inspect} should not be valid" do
          expect(TestUserAllowsNil.new(:isaf_id => isaf_id)).to be_valid
        end
      end
    end
  end

  describe "error messages" do
    context "when the message is not defined" do
      subject { TestUser.new isaf_id: 'invalid id' }
      before { subject.valid? }

      it "should add the default message" do
        expect(subject.errors[:isaf_id]).to include "is invalid"
      end
    end

    context "when the message is defined" do
      subject { TestUserWithMessage.new isaf_id: 'invalid id' }
      before { subject.valid? }

      it "should add the customized message" do
        expect(subject.errors[:isaf_id]).to include 'this is not ok'
      end
    end
  end
end
