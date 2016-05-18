# == Class: install
#
# Class ensures package is installed from source. 
#
# === Parameters
# [*path*]
#       Path to symlink node and npm executable.
# [*version*]
#	Node version to install.
# [*executable_dir*]
#       Installation directory for executable files.
# [*download_location*]
#       Temporary download location prior to being moved to 
#       executable_dir.
class nodejs::install (
$path = $nodejs::params::path,
$version = $nodejs::params::version,
$executable_dir = $nodejs::params::executable_dir,
$download_location = $nodejs::params::download_location
) inherits nodejs::params {

  $executable = "node-${version}-linux-x64.tar.xz"
  $executable_url = "https://nodejs.org/dist/${version}/node-${version}-linux-x64.tar.xz"

  exec { 'nodejs_install':
    command => "wget -O ${download_location}${executable} ${executable_url}",
    path    => '/bin:/usr/bin:/usr/local/bin',
    unless  => "which node && node -v | grep ${version}",
  } ->
  exec { 'unzip_exec':
    command => "tar -Jxf ${download_location}${executable} -C ${executable_dir}",
    path    => '/bin:/usr/bin:/usr/local/bin',
    onlyif  => "test -f ${download_location}${executable}",
  } ->
  file { 'node_executable_link':
    ensure => 'link',
    path   => "${path}/node",
    target => "${executable_dir}/node-${version}-linux-x64/bin/node",
    require => Exec['unzip_exec'],
  } ->
  file { 'npm_executable_link':
    ensure => 'link',
    path   => "${path}/npm",
    target => "${executable_dir}/node-${version}-linux-x64/bin/npm",
    require => Exec['unzip_exec'],
  } ->
  exec { 'install_pm2':
    command => 'npm install -g pm2',
    path    => '/bin:/usr/bin:/usr/local/bin',
    require => File['npm_executable_link'],
  } ->
  file { 'pm2_executable_link':
    ensure => 'link',
    path   => "${path}/pm2",
    target => "${executable_dir}/node-${version}-linux-x64/lib/node_modules/pm2/bin/pm2",
    require => Exec['install_pm2'],
  } ->
  exec { 'remove_temp_files':
    command => "rm ${download_location}${executable}",
    path    => '/bin:/usr/bin:/usr/local/bin',
    onlyif  => "test -f ${download_location}${executable}",
  }
}
