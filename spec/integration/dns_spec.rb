require 'spec_helper'

describe server(:dns) do
  describe dns('www.example.com') do
    it { is_expected.to have_entry.with_type('A').and_address('192.0.2.4') }
  end
  describe dns('192.0.2.4') do
    it do
      is_expected.to have_entry.with_type('PTR')
        .and_domainname('www.example.com')
    end
  end
end
