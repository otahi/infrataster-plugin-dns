require 'unit/spec_helper'

module Infrataster
  # Infrataster contexts
  module Contexts
    describe DnsContext do
      let(:server) { Server.new('ns.example.com', '192.168.33.10', :dns) }
      subject { described_class.new(server, nil) }
      it 'should have `have_entry` method' do
        matcher = double('matcher')
        allow(matcher).to receive(:config)
        allow(subject).to receive(:have_dns).and_return(matcher)
        subject.have_entry
      end
    end
  end
end
