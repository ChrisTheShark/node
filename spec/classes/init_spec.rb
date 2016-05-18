require 'spec_helper'

describe 'nodejs' do
  context 'with default params' do
    it { should compile }
    it { is_expected.to contain_class("nodejs::install") 
      .with_path('/usr/local/bin')
      .with_version('v4.4.2')
      .with_download_location('/tmp/')
      .with_executable_dir('/usr/local')
    }
  end
  context 'with updated version' do
    let :params do {
      :version => 'v4.6.2'
    }
    end
    it { should compile }
    it { is_expected.to contain_class("nodejs::install")
      .with_path('/usr/local/bin')
      .with_version('v4.6.2')
      .with_download_location('/tmp/')
      .with_executable_dir('/usr/local')
    }
  end
  context 'with updated path' do
    let :params do {
      :path => '/usr/bin'
    }
    end
    it { should compile }
    it { is_expected.to contain_class("nodejs::install") 
      .with_path('/usr/bin')
      .with_version('v4.4.2')
      .with_download_location('/tmp/')
      .with_executable_dir('/usr/local')
    }
  end
  context 'with updated version and path' do
    let :params do {
      :version => 'v4.6.2',
      :path    => '/usr/bin'
    }
    end
    it { should compile }
    it { is_expected.to contain_class("nodejs::install")
      .with_path('/usr/bin')
      .with_version('v4.6.2')
      .with_download_location('/tmp/')
      .with_executable_dir('/usr/local')
    }
  end
end
