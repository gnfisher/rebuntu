# Install MakeMKV
cd /tmp

# Install dependencies
sudo apt-get install -y build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev qtbase5-dev zlib1g-dev

# Download MakeMKV 1.17.8
wget https://www.makemkv.com/download/makemkv-bin-1.17.8.tar.gz
wget https://www.makemkv.com/download/makemkv-oss-1.17.8.tar.gz

# Extract archives
tar xvf makemkv-bin-1.17.8.tar.gz
tar xvf makemkv-oss-1.17.8.tar.gz

# Build and install OSS component
cd makemkv-oss-1.17.8
./configure
make
sudo make install
cd ..

# Build and install BIN component
cd makemkv-bin-1.17.8
make
printf "yes\n" | sudo make install
cd ..

# Cleanup
rm -rf makemkv-*
cd -
