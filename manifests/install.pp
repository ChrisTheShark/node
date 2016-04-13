# == Class: install
#
# Class ensures package is installed from source. 
#
class nodejs::install (
$path = $::nodejs::params::path,
$version = $::nodejs::params::version,
$executable = $::nodejs::params::executable,
$executable_dir = $::nodejs::params::executable_dir,
$executable_url = $::nodejs::params::executable_url,
$download_location = $::nodejs::params::download_location
) {
  exec { 'nodejs_install':
    command => "wget -O ${download_location}${executable} ${executable_url}",
    path    => '/bin:/usr/bin:/usr/local/bin',
    unless  => 'which node',
  } ->
  exec { 'unzip_exec':
    command => "tar -Jxf ${download_location}${executable} -C ${executable_dir}",
    path    => '/bin:/usr/bin:/usr/local/bin',
  } ->
  file { 'node_executable_link':
    ensure => 'link',
    path   => "${path}/node",
    target => "${executable_dir}/node-${version}-linux-x64/bin/node",
  } ->
  file { 'npm_executable_link':
    ensure => 'link',
    path   => "${path}/npm",
    target => "${executable_dir}/node-${version}-linux-x64/bin/npm",
  } ->
  exec { 'remove_temp_files':
    command => "rm ${download_location}${executable}",
    path    => '/bin:/usr/bin:/usr/local/bin'
  }
}
