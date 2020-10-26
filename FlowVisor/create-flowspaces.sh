# Remove slices just in case
fvctl -f /dev/null remove-slice video
fvctl -f /dev/null remove-slice non-video
fvctl -f /dev/null remove-slice text

# Add Video Slice
fvctl -f /dev/null add-slice video tcp:localhost:10001 admin@videoslice

# Add Non-Video Slice
fvctl -f /dev/null add-slice non-video tcp:localhost:10002 admin@nonvideoslice

# Add Text Slice
fvctl -f /dev/null add-slice text tcp:localhost:10003 admin@textslice

sleep 2;

###############################################  EXTERNAL PORTS  #################################################
# S1,P3
fvctl -f /dev/null add-flowspace dpid1-port3-video-src 1 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
fvctl -f /dev/null add-flowspace dpid1-port3-video-dst 1 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_dst=9999 video=7
fvctl -f /dev/null add-flowspace dpid1-port3-non-video 1 1 in_port=3,dl_type=0x0800,nw_proto=1 non-video=7
#Text Service
fvctl -f /dev/null add-flowspace dpid1-port3-text-dst 1 50 in_port=3,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
fvctl -f /dev/null add-flowspace dpid1-port3-text-src 1 50 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7

# S1,P4
fvctl -f /dev/null add-flowspace dpid1-port4-video-src 1 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
fvctl -f /dev/null add-flowspace dpid1-port4-video-dst 1 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_dst=9999 video=7
fvctl -f /dev/null add-flowspace dpid1-port4-non-video 1 1 in_port=4,dl_type=0x0800,nw_proto=1 non-video=7
# Text Service
fvctl -f /dev/null add-flowspace dpid1-port4-text-dst 1 50 in_port=4,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
fvctl -f /dev/null add-flowspace dpid1-port4-text-src 1 50 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7

# S4,P3
fvctl -f /dev/null add-flowspace dpid4-port3-video-src 4 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
fvctl -f /dev/null add-flowspace dpid4-port3-video-dst 4 100 in_port=3,dl_type=0x0800,nw_proto=6,tp_dst=9999 video=7
fvctl -f /dev/null add-flowspace dpid4-port3-non-video 4 1 in_port=3,dl_type=0x0800,nw_proto=1 non-video=7
# Text Service
fvctl -f /dev/null add-flowspace dpid4-port3-text-dst 4 50 in_port=3,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
fvctl -f /dev/null add-flowspace dpid4-port3-text-src 4 50 in_port=3,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7

# S4,P4
fvctl -f /dev/null add-flowspace dpid4-port4-video-src 4 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=9999 video=7
fvctl -f /dev/null add-flowspace dpid4-port4-video-dst 4 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_dst=9999 video=7
fvctl -f /dev/null add-flowspace dpid4-port4-non-video 4 1 in_port=4,dl_type=0x0800,nw_proto=1 non-video=7
# Text Service
#fvctl -f /dev/null add-flowspace dpid4-port4-text-dst 4 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
#fvctl -f /dev/null add-flowspace dpid4-port4-text-src 4 100 in_port=4,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7

###############################################  INTERNAL PORTS  #################################################
# S1,P2
fvctl -f /dev/null add-flowspace dpid1-port2-video 1 100 in_port=2 video=7
# S1,P1
fvctl -f /dev/null add-flowspace dpid1-port1-non-video 1 1 in_port=1,dl_type=0x0800,nw_proto=1 non-video=7
fvctl -f /dev/null add-flowspace dpid1-port1-text-dst 1 50 in_port=1,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
fvctl -f /dev/null add-flowspace dpid1-port1-text-src 1 50 in_port=1,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7

# S4,P2
fvctl -f /dev/null add-flowspace dpid4-port2-video 4 100 in_port=2 video=7

## S4,P1
fvctl -f /dev/null add-flowspace dpid4-port1-non-video 4 1 in_port=1,dl_type=0x0800,nw_proto=1 non-video=7
fvctl -f /dev/null add-flowspace dpid4-port1-text-dst 4 50 in_port=1,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
fvctl -f /dev/null add-flowspace dpid4-port1-text-src 4 50 in_port=1,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7

# S2
fvctl -f /dev/null add-flowspace dpid2-non-video 2 1 any non-video=7
fvctl -f /dev/null add-flowspace dpid2-text-port1-dst 2 50 in_port=1,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
fvctl -f /dev/null add-flowspace dpid2-text-port1-src 2 50 in_port=1,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7
fvctl -f /dev/null add-flowspace dpid2-text-port2-dst 2 50 in_port=2,dl_type=0x0800,nw_proto=6,tp_dst=8888 text=7
fvctl -f /dev/null add-flowspace dpid2-text-port2-src 2 50 in_port=2,dl_type=0x0800,nw_proto=6,tp_src=8888 text=7
# S3, Any Port
fvctl -f /dev/null add-flowspace dpid3-video 3 100 any video=7
