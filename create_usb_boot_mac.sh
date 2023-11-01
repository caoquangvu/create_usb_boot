# First, we need to find our device. BEFORE inserting your USB drive, run the
# following:
diskutil list

# This will output a bunch of info about all of the disk drives connected to
# your Mac. Each entry will have a header in the form "/dev/diskX", where X is
# some number starting at 0. Now, insert your USB drive and run the command
# again. You should see a new entry. Make note of the name (ie, /dev/diskX).
diskutil list

# Now we need to format the drive for MS-DOS and include a Master Boot Record.
# In the command below, replace "diskX" with the identifier of your USB drive.
# WARNING: this will delete everything on the USB!!
diskutil eraseDisk MS-DOS WIN10 MBR diskX

# In the command above, MS-DOS is the format of the partition that will be
# created on the USB. WIN10 is the name of that partition (it'll appear in
# Finder as the name of your USB). MBR tells diskutil to create a Master Boot
# Record, which is necessary for the USB to be bootable.
#
# Now, "open" the Windows ISO:
open Win10xxxx.iso

# Your Mac will "mount" the ISO as if it was a drive. A Finder window will open
# to show the contents of the ISO. Close the Finder window; you don't need it.
# Back in the terminal, let's find the mounted ISO:
diskutil list

# You should see a new entry. This time, we're looking for what's in the NAME
# column. You should see something funny like CCCOMA_X64FRE_EN-US_DV9. The name
# will differ depending on which ISO you downloaded. Make note of the diskX
# identifier as well. Now, let's cd to the ISO:
cd /Volumes/CCCOMA_X64FRE_EN-US_DV9

# And copy all the files over to our USB:
sudo cp -r . /Volumes/WIN10/

# This will take a while; there's a lot of data (4+ GB). Grab a drink; relax.
#
# Once it's done, you can eject both the USB and the ISO. First, cd to another
# directory otherwise OSX will not allow you to unmount the ISO (since being in
# the directory means the ISO is "in use"):
cd ~

# Eject the USB using the diskX identifier from the second step above:
diskutil eject diskX

# Eject the ISO using the diskX identifier from the fifth step above:
diskutil eject diskX

# Now insert the USB into your computer, (re)boot, and select the USB from the
# boot device menu (you may need to press some key to show the boot device menu
# - on my machine it's F12).
#
#Depending on how new your computer is, you may see the USB twice: once with
# UEFI in front of the name, and the other without. If you see the UEFI option,
# select that.
