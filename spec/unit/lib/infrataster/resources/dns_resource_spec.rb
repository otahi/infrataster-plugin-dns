require 'unit/spec_helper'

module Infrataster
  # Infrataster resources
  module Resources
    describe DnsResource do
      subject { described_class.new }
      it 'should be a BaseResource' do
        is_expected.to be_a(BaseResource)
      end
    end
  end
end
