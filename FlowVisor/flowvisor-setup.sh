sudo apt-get update;
sudo apt-get install -y openjdk-6-jdk;
wget http://updates.onlab.us/GPG-KEY-ONLAB;
sudo apt-key add GPG-KEY-ONLAB;
sudo apt-get install -y ant;
sudo apt-get install -y maven unzip;
mkdir FlowVisor;
cd FlowVisor/;
git clone https://github.com/onstutorial/onstutorial.git;
git clone https://github.com/opennetworkinglab/flowvisor.git;
chmod -R 777 flowvisor;
cd flowvisor/;
make install;
sudo chmod 777 -R /usr/local/share/db;
sudo -u mininet fvconfig generate /etc/flowvisor/config.json;
sudo /etc/init.d/flowvisor start;
sleep 5;
fvctl -f /dev/null set-config --enable-topo-ctrl;
fvctl -f /dev/null get-config;


# Flowvisor Experiment Steps 
#fvctl -f /dev/null get-config
#fvctl -f /dev/null add-slice upper tcp:localhost:10001 admin@upperslice
#fvctl -f /dev/null add-slice lower tcp:localhost:10002 admin@lowerslice
#fvctl -f /dev/null list-slices
#fvctl -f /dev/null add-flowspace dpid1-port1 1 1 in_port=1 upper=7
#fvctl -f /dev/null add-flowspace dpid1-port3 1 1 in_port=3 upper=7
#fvctl -f /dev/null add-flowspace dpid2 2 1 any upper=7
#fvctl -f /dev/null add-flowspace dpid4-port1 4 1 in_port=1 upper=7
#fvctl -f /dev/null add-flowspace dpid4-port3 4 1 in_port=3 upper=7
#fvctl -f /dev/null list-flowspace
#fvctl -f /dev/null add-flowspace dpid1-port2 1 1 in_port=2 lower=7
#fvctl -f /dev/null add-flowspace dpid1-port4 1 1 in_port=4 lower=7
#fvctl -f /dev/null add-flowspace dpid3 3 1 any lower=7
#fvctl -f /dev/null add-flowspace dpid4-port2 4 1 in_port=2 lower=7
#fvctl -f /dev/null add-flowspace dpid4-port4 4 1 in_port=4 lower=7
#fvctl -f /dev/null list-flowspace
#fvctl -f /dev/null remove-slice upper
#fvctl -f /dev/null remove-slice lower
#fvctl -f /dev/null list-flowspace
#
#fvctl -f /dev/null add-slice video tcp:localhost:10001 admin@videoslice
#fvctl -f /dev/null add-slice non-video tcp:localhost:10002 admin@nonvideoslice
#fvctl -f /dev/null add-flowspace dpid1-port3-video-src 1 100 in_port=3,dl_type=0x0800,
#fvctl -f /dev/null add-flowspace dpid1-port3-video-src 1 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid1-port3-video-dst 1 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid1-port3-non-video 1 1 in_port=3 non-video=7
#fvctl -f /dev/null add-flowspace dpid1-port4-video-src 1 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid1-port4-video-dst 1 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid1-port4-non-video 1 1 in_port=4 non-video=7
#fvctl -f /dev/null add-flowspace dpid4-port3-video-src 4 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid4-port3-video-dst 4 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid4-port3-non-video 4 1 in_port=3 non-video=7
#fvctl -f /dev/null add-flowspace dpid4-port4-video-src 4 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid4-port4-video-dst 4 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
#fvctl -f /dev/null add-flowspace dpid4-port4-non-video 4 1 in_port=4 non-video=7
#fvctl -f /dev/null add-flowspace dpid1-port2-video 1 100 in_port=2 video=7
#fvctl -f /dev/null add-flowspace dpid3-video 3 100 any video=7
#fvctl -f /dev/null add-flowspace dpid4-port2-video 4 100 in_port=2 video=7
#fvctl -f /dev/null add-flowspace dpid1-port1-non-video 1 1 in_port=1 non-video=7
#fvctl -f /dev/null add-flowspace dpid2-non-video 2 1 any non-video=7
#fvctl -f /dev/null add-flowspace dpid4-port1-non-video 4 1 in_port=1 non-video=7

