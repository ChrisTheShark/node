# == Class: nodejs
#
# Module to globally install nodejs.
#
# === Parameters
# [*path*]
#       Path to symlink node, npm and pm2 executable.
# [*version*]
#	Node version to install.
# [*executable_dir*]
#       Installation directory for executable files.
# [*download_location*]
#	Temporary download location prior to being moved to
#	executable_dir.
class nodejs (
$path = $nodejs::params::path,
$version = $nodejs::params::version,
$executable_dir = $nodejs::params::executable_dir,
$download_location = $nodejs::params::download_location
) inherits nodejs::params {
  class { 'nodejs::install':
    path              => $path,
    version           => $version,
    executable_dir    => $executable_dir,
    download_location => $download_location,
  }
}
