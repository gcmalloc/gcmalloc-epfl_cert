require 'spec_helper'
describe 'epfl_cert' do

  context 'with defaults for all parameters' do
    it { should contain_class('epfl_cert') }
  end
end
