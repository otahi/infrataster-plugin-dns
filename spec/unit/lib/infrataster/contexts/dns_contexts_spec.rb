require 'unit/spec_helper'

module Infrataster
  # Infrataster contexts
  module Contexts
    describe DnsContext do
      subject { described_class.new(nil, nil).public_methods }
      it 'should have `have_entry` method' do
        is_expected.to include(:have_entry)
      end
      it 'should have `have_dns` method from rspec-dns' do
        is_expected.to include(:have_dns)
      end
    end
  end
end
