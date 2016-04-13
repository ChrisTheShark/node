# == Class: params
#
# Parameter class sets reasonable defaults. 
#
class nodejs::params {
  $version = 'v4.4.2'
  $path = '/usr/local/bin'
  $download_location = '/tmp/'
  $executable = "node-${version}-linux-x64.tar.xz"
  $executable_url = "https://nodejs.org/dist/${version}/node-${version}-linux-x64.tar.xz"
  $executable_dir = '/usr/local'
}
