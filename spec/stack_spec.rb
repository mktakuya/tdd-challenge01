require 'spec_helper'
require 'stack'

describe Stack do 
  describe '#initialize' do
    let(:stack) { Stack.new }
    subject { stack }

    it { is_expected.to be_kind_of Stack }
  end

  describe "#size" do
    subject { stack.size }
    let(:stack) { Stack.new }

    it "戻り値として0以上の整数を返すこと" do
      expect(stack.size).to eq 0
    end
    
    context "要素がないとき" do
      it "0を返すこと" do
        is_expected.to eq 0
      end
    end

    context "要素が1つあるとき" do
      before do
        stack.send(:instance_variable_get, :@list).send(:push, 'dummy')
      end

      it "1を返すこと" do
        is_expected.to eq 1
      end
    end
  end
end
