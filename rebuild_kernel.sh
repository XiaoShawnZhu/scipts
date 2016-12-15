#modifying and re-compiling kernel
#run in root mode
cp tcp.h ~/Linux4.0+/include/net/
cp *.c ~/Linux4.0+/net/ipv4/
cd ~/Linux4.0+
sudo make -j4
sudo make install -j4
echo "machine ${whoami} re-compiled."
sudo reboot
