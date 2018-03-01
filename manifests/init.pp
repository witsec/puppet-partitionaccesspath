# Defined type: PartitionAccessPath
define partitionaccesspath (
  String                     $driveletter,
  String                     $size,
  String                     $accesspath,
  Enum['present']            $ensure     = 'present',
  Enum['raw','ntfs','fat32'] $filesystem = 'raw',
) {

  exec { $title:
    command  => template('partitionaccesspath/create.ps1.erb'),
    unless   => template('partitionaccesspath/check.ps1.erb'),
    provider => powershell,
  }

}
