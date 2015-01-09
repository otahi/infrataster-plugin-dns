require 'unit/spec_helper'

module Infrataster
  # Infrataster Helpers
  module Helpers
    # Infrataster Helpers Implementation
    class ResourceHelperImpl
      include ResourceHelper
    end

    describe ResourceHelper do
      context 'created resource by #dns' do
        subject { ResourceHelperImpl.new.dns('www.example.com') }

        it 'should be a Dnsruby::Name' do
          expect(subject.is_a?(Dnsruby::Name)).to be true
        end
        it 'should be a Resources::DnsResource' do
          expect(subject.is_a?(Resources::DnsResource)).to be true
        end
        it 'should be a Resources::BaseResource' do
          expect(subject.is_a?(Resources::BaseResource)).to be true
        end
        it 'should be a Resources::BaseResource' do
          expect(subject.is_a?(Resources::BaseResource)).to be true
        end
        it %q(should be "dns 'string'") do
          expect(subject.to_s).to eq("dns 'www.example.com'")
        end
        it 'should have Contexts::DnsContext' do
          expect(subject.context_class).to eq(Contexts::DnsContext)
        end
        context 'with host name' do
          subject { ResourceHelperImpl.new.dns('www.example.com') }

          it 'should be a host name' do
            expect(subject.to_s).to eq("dns 'www.example.com'")
          end
        end
        context 'with IP address' do
          subject { ResourceHelperImpl.new.dns('192.0.2.4') }

          it 'should be a host name' do
            expect(subject.to_s).to eq("dns '192.0.2.4'")
          end
        end
      end
    end
  end
end
