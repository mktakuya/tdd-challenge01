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
      is_expected.to  be_kind_of Integer
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

  describe '#empty?' do
    let(:stack) { Stack.new }
    subject { stack.empty? }

    context '#sizeが0のとき' do
      it 'trueを返すこと' do
        is_expected.to be_truthy
      end
    end

    context '#sizeが1以上のとき' do
      it 'falseを返すこと' do
        stack.send(:instance_variable_get, :@list).send(:push, 'dummy')
        is_expected.to be_falsy
      end
    end
  end
end
