#!/bin/bash
#
# requires:
#  bash
#

chroot $1 $SHELL <<'EOS'
  kernel_ver=$(rpm --qf '%{Version}-%{Release}\n' -qa kernel)

  cd /boot
  md5sum initrd*
  mkinitrd --with=virtio_pci --with=virtio_blk --with=virtio_net -v -f initrd-${kernel_ver}.img ${kernel_ver}
  md5sum initrd*
EOS
