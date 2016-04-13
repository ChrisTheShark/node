require 'spec_helper'

describe 'nodejs' do
  context 'with default params' do
    it { should compile }
    it { is_expected.to contain_class("nodejs::install") 
      .with_path('/usr/local/bin')
      .with_version('v4.4.2')
      .with_download_location('/tmp/')
      .with_executable('node-v4.4.2-linux-x64.tar.xz')
      .with_executable_url('https://nodejs.org/dist/v4.4.2/node-v4.4.2-linux-x64.tar.xz')
      .with_executable_dir('/usr/local')
    }
  end
  context 'with updated version' do
    let :params do 
    { 
      :version    => 'v4.4.6',
      :executable => 'node-v4.4.6-linux-x64.tar.xz',
      :executable_url => 'https://nodejs.org/dist/v4.4.6/node-v4.4.6-linux-x64.tar.xz' 
    }
    end

    it { should compile }
    it { is_expected.to contain_class("nodejs::install")
      .with_path('/usr/local/bin')
      .with_version('v4.4.6')
      .with_download_location('/tmp/')
      .with_executable('node-v4.4.6-linux-x64.tar.xz')
      .with_executable_url('https://nodejs.org/dist/v4.4.6/node-v4.4.6-linux-x64.tar.xz')
      .with_executable_dir('/usr/local')
    }
  end
end
