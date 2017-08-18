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
      is_expected.to be_kind_of Integer
    end

    context "要素がないとき" do
      it "0を返すこと" do
        is_expected.to eq 0
      end
    end

    context "要素が1つあるとき" do
      before do
        stack.instance_variable_get(:@list).push('dummy')
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
        stack.instance_variable_get(:@list).push('dummy')
        is_expected.to be_falsy
      end
    end
  end

  describe '#push' do
    let(:stack) { Stack.new }

    it "戻り値として@listを返すこと" do
      expect(stack.push('dummy')).to eq stack.instance_variable_get(:@list)
    end

    context "引数が1つのとき" do
      it "@listの要素数が1増えること" do
        expect {
          stack.push('dummy')
        }.to change { stack.instance_variable_get(:@list).size }.by(1)
      end
    end

    context "引数が2つのとき" do
      it "@listの要素数が2増えること" do
        expect {
          stack.push('dummy', 'dummmy')
        }.to change { stack.instance_variable_get(:@list).size }.by(2)
      end
    end
  end

  describe '#pop' do
    let(:stack) { Stack.new }
    before { stack.push('dummy', 'dummmy', 'dummmmy') }

    it '@listの最後の要素を返すこと' do
      expect(stack.pop).to eq 'dummmmy'
    end

    it '@listの最後の要素が無くなること' do
      stack.pop
      expect(stack.instance_variable_get(:@list)).to eq ['dummy', 'dummmy']
    end
  end
end
