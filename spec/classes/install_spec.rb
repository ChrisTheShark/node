require 'spec_helper'

describe 'nodejs::install' do

  context 'with default params' do
    let :params do
    { 
      :path              => '/usr/local/bin',
      :version           => 'v4.4.2',
      :executable        => 'node-v4.4.2-linux-x64.tar.xz',
      :executable_dir    => '/usr/local',
      :executable_url    => 'https://nodejs.org/dist/v4.4.2/node-v4.4.2-linux-x64.tar.xz',
      :download_location => '/tmp/'
    }
    end

    it { should compile }
    it { should contain_exec('nodejs_install') 
      .with_command('wget -O /tmp/node-v4.4.2-linux-x64.tar.xz https://nodejs.org/dist/v4.4.2/node-v4.4.2-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_unless('which node')
    }
    it { should contain_exec('unzip_exec')
      .with_command('tar -Jxf /tmp/node-v4.4.2-linux-x64.tar.xz -C /usr/local')
      .with_path('/bin:/usr/bin:/usr/local/bin')
    }
    it { should contain_file('node_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/node')
      .with_target('/usr/local/node-v4.4.2-linux-x64/bin/node')
    }
    it { should contain_file('npm_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/npm')
      .with_target('/usr/local/node-v4.4.2-linux-x64/bin/npm')
    }
    it { should contain_exec('remove_temp_files')
      .with_command('rm /tmp/node-v4.4.2-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
    }
  end

  context 'with updated version' do
    let :params do
    {
      :path              => '/usr/local/bin',
      :version           => 'v4.4.6',
      :executable        => 'node-v4.4.6-linux-x64.tar.xz',
      :executable_dir    => '/usr/local',
      :executable_url    => 'https://nodejs.org/dist/v4.4.6/node-v4.4.6-linux-x64.tar.xz',
      :download_location => '/tmp/'
    }
    end

    it { should compile }
    it { should contain_exec('nodejs_install')
      .with_command('wget -O /tmp/node-v4.4.6-linux-x64.tar.xz https://nodejs.org/dist/v4.4.6/node-v4.4.6-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_unless('which node')
    }
    it { should contain_exec('unzip_exec')
      .with_command('tar -Jxf /tmp/node-v4.4.6-linux-x64.tar.xz -C /usr/local')
      .with_path('/bin:/usr/bin:/usr/local/bin')
    }
    it { should contain_file('node_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/node')
      .with_target('/usr/local/node-v4.4.6-linux-x64/bin/node')
    }
    it { should contain_file('npm_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/npm')
      .with_target('/usr/local/node-v4.4.6-linux-x64/bin/npm')
    }
    it { should contain_exec('remove_temp_files')
      .with_command('rm /tmp/node-v4.4.6-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
    }
  end

end
