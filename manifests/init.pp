# == Class: nodejs
#
# Module to globally install nodejs.
#
# === Parameters
# [*path*]
#       Path to symlink node and npm executable.
# [*version*]
#	Node version to install.
# [*executable*]
#       Node executable name (e.g. node).
# [*executable_dir*]
#       Installation directory for executable files.
# [*executable_url*]
#       Node download location.
# [*download_location*]
#       Temporary download location prior to being moved to 
#       executable_dir.
class nodejs (
$path = $nodejs::params::path,
$version = $nodejs::params::version,
$executable = $nodejs::params::executable,
$executable_dir = $nodejs::params::executable_dir,
$executable_url = $nodejs::params::executable_url,
$download_location = $nodejs::params::download_location
) inherits nodejs::params {
  class { 'nodejs::install':
    path              => $path,
    version           => $version,
    executable        => $executable,
    executable_dir    => $executable_dir,
    executable_url    => $executable_url,
    download_location => $download_location
  }
}
