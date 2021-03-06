## Disk partition
```
cfdisk
mkfs.ext4 /dev/sdX1
mount /dev/sdX1 /mnt
```
## Install essential packages ##
```
pacstrap /mnt base base-devel linux linux-firmware vim git ansible
```

## Configure the system
```
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Vancouver /etc/localtime
hwclock --systohc
```

## Set locale
```
/etc/locale.gen
locale-gen
```

## Set hostname
```
/etc/hostname

myhostname

/etc/hosts

127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

## Set sudo password
```
passwd
```

## Create a non-root user ##
```
visudo
useradd -m -g users -G wheel -s /bin/bash prem
passwd prem
```

## Install Boot loaders
```
pacman -S grub

MBR
grub-install --target=i386-pc /dev/sdX

UEFI
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg
```

## Network
```
systemctl enable dhcpcd@___.service
```

## Install AUR
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Change ownership of .config
chown -R prem:users ~/.config

reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

## Fix Natual scroll
```
vim /usr/share/X11/xorg.conf.d/40-libinput.conf
options NaturalScrolling "true"
```
