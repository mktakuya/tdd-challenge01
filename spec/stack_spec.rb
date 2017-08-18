require 'spec_helper'
require 'stack'

describe Stack do
  describe '#initialize' do
    let(:stack) { Stack.new }
    subject { stack }

    it { is_expected.to be_kind_of Stack }
  end
end
