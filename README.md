# Inner ear simulator buildroot system

# Initial setup

Clone buildroot. For example :

```
cd yourPath
git clone git://git.busybox.net/buildroot
#git clone git@github.com:rockchip-linux/buildroot.git buildroot.rockchip
#git checkout rockchip/stable-rk3399-v2.09-20181102
```

Make sure you have requirements :
```
sudo apt-get install -y build-essential gcc g++ autoconf automake libtool bison flex gettext
sudo apt-get install -y patch texinfo wget git gawk curl lzma bc quilt
```

Make sure you are setup with bash :


# To make the system

```
. NanoPi.Neo4/setup.sh yourPath/buildroot.neo4
```

# ensure you have your buildroot net downloads directory setup

```
mkdir yourPath/buildroot.dl
```

# build the system

```
make
```

# installing

Insert your sdcard into your drive and make sure it isn't mounted. Write the image to the disk.

NOTE: The following command will overwrite any disk attached to /dev/sdg
NOTE: Be super careful here!

```
sudo dd if=output/images/sdcard.img of=/dev/sdg

```

# using

After adding your RSA key to overlays/root/.ssh/authorized_keys, you will be able to ssh to the device.