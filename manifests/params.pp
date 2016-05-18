# == Class: params
#
# Parameter class sets reasonable defaults. 
#
class nodejs::params {
  $version = 'v4.4.2'
  $path = '/usr/local/bin'
  $download_location = '/tmp/'
  $executable_dir = '/usr/local'
}

