server=https://github.com/omkarprabhu-98/fl-server
client=https://github.com/pvgupta24/fl-client
proto=https://github.com/pvgupta24/fl-proto

cd ..

git clone $server
git clone $client
git clone $proto

cd fl-proto
bash fl-setup.sh