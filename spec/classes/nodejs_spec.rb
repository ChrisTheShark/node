require 'spec_helper'

describe 'nodejs' do
  it { should compile }
  it { is_expected.to contain_class("nodejs::install") }
end
