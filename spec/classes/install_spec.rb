require 'spec_helper'

describe 'nodejs::install' do
  context 'with default params' do
    it { should compile }
    it { should contain_exec('nodejs_install') 
      .with_command('wget -O /tmp/node-v4.4.2-linux-x64.tar.xz https://nodejs.org/dist/v4.4.2/node-v4.4.2-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_unless('which node && node -v | grep v4.4.2')
    }
    it { should contain_exec('unzip_exec')
      .with_command('tar -Jxf /tmp/node-v4.4.2-linux-x64.tar.xz -C /usr/local')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_onlyif('test -f /tmp/node-v4.4.2-linux-x64.tar.xz')
    }
    it { should contain_file('node_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/node')
      .with_target('/usr/local/node-v4.4.2-linux-x64/bin/node')
      .with_require('Exec[unzip_exec]')
    }
    it { should contain_file('npm_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/npm')
      .with_target('/usr/local/node-v4.4.2-linux-x64/bin/npm')
      .with_require('Exec[unzip_exec]')
    }
    it { should contain_exec('install_pm2')
      .with_command('npm install -g pm2')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_require('File[npm_executable_link]')
    }
    it { should contain_file('pm2_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/pm2')
      .with_target('/usr/local/node-v4.4.2-linux-x64/lib/node_modules/pm2/bin/pm2')
      .with_require('Exec[install_pm2]')
    }
    it { should contain_exec('remove_temp_files')
      .with_command('rm /tmp/node-v4.4.2-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_onlyif('test -f /tmp/node-v4.4.2-linux-x64.tar.xz')
    }
  end

  context 'with updated version' do
    let :params do
    {
      :version => 'v4.4.6'
    }
    end
    it { should compile }
    it { should contain_exec('nodejs_install')
      .with_command('wget -O /tmp/node-v4.4.6-linux-x64.tar.xz https://nodejs.org/dist/v4.4.6/node-v4.4.6-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_unless('which node && node -v | grep v4.4.6')
    }
    it { should contain_exec('unzip_exec')
      .with_command('tar -Jxf /tmp/node-v4.4.6-linux-x64.tar.xz -C /usr/local')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_onlyif('test -f /tmp/node-v4.4.6-linux-x64.tar.xz')
    }
    it { should contain_file('node_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/node')
      .with_target('/usr/local/node-v4.4.6-linux-x64/bin/node')
      .with_require('Exec[unzip_exec]')
    }
    it { should contain_file('npm_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/npm')
      .with_target('/usr/local/node-v4.4.6-linux-x64/bin/npm')
      .with_require('Exec[unzip_exec]')
    }
    it { should contain_exec('install_pm2')
      .with_command('npm install -g pm2')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_require('File[npm_executable_link]')
    }
    it { should contain_file('pm2_executable_link')
      .with_ensure('link')
      .with_path('/usr/local/bin/pm2')
      .with_target('/usr/local/node-v4.4.6-linux-x64/lib/node_modules/pm2/bin/pm2')
      .with_require('Exec[install_pm2]')
    }
    it { should contain_exec('remove_temp_files')
      .with_command('rm /tmp/node-v4.4.6-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_onlyif('test -f /tmp/node-v4.4.6-linux-x64.tar.xz')
    }
  end

  context 'with updated path' do
    let :params do
    {
      :path => '/usr/bin'
    }
    end
    it { should compile }
    it { should contain_exec('nodejs_install')
      .with_command('wget -O /tmp/node-v4.4.2-linux-x64.tar.xz https://nodejs.org/dist/v4.4.2/node-v4.4.2-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_unless('which node && node -v | grep v4.4.2')
    }
    it { should contain_exec('unzip_exec')
      .with_command('tar -Jxf /tmp/node-v4.4.2-linux-x64.tar.xz -C /usr/local')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_onlyif('test -f /tmp/node-v4.4.2-linux-x64.tar.xz')
    }
    it { should contain_file('node_executable_link')
      .with_ensure('link')
      .with_path('/usr/bin/node')
      .with_target('/usr/local/node-v4.4.2-linux-x64/bin/node')
      .with_require('Exec[unzip_exec]')
    }
    it { should contain_file('npm_executable_link')
      .with_ensure('link')
      .with_path('/usr/bin/npm')
      .with_target('/usr/local/node-v4.4.2-linux-x64/bin/npm')
      .with_require('Exec[unzip_exec]')
    }
    it { should contain_exec('install_pm2')
      .with_command('npm install -g pm2')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_require('File[npm_executable_link]')
    }
    it { should contain_file('pm2_executable_link')
      .with_ensure('link')
      .with_path('/usr/bin/pm2')
      .with_target('/usr/local/node-v4.4.2-linux-x64/lib/node_modules/pm2/bin/pm2')
      .with_require('Exec[install_pm2]')
    }
    it { should contain_exec('remove_temp_files')
      .with_command('rm /tmp/node-v4.4.2-linux-x64.tar.xz')
      .with_path('/bin:/usr/bin:/usr/local/bin')
      .with_onlyif('test -f /tmp/node-v4.4.2-linux-x64.tar.xz')
    }
  end
end

