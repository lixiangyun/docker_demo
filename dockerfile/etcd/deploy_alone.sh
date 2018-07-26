#! /bin/bash
export DEPLOY_PORT_IDX=1

export CSE_NODE=127.0.0.1

# port+x: 2370-2079 / 2380-2389
export DATA_PORT=2370
export PEER_PORT=2380

function show_help()
{
    echo "*************************************************************"
    echo "* [OPTION]                                                  *"
    echo "*   -p <0|1|...|9>  #alone deploy port index (default:0)    *"
    echo "*************************************************************"
	exit 1
}

function parse_input()
{
    while getopts p:h OPTION
    do
    case $OPTION in
        p) DEPLOY_PORT_IDX=$OPTARG
        ;;
        h)show_help
        ;;
        \?)show_help
        ;;
        esac
    done
}

parse_input $@

if [ $DEPLOY_PORT_IDX >= "10" ] ;then
	show_help
fi

export DATA_PORT=237$DEPLOY_PORT_IDX
export PEER_PORT=238$DEPLOY_PORT_IDX
export ETCD_NAME=cse-etcd-$DEPLOY_PORT_IDX
export ETCD_CLUSTER_IP="$ETCD_NAME=http://$CSE_NODE:$PEER_PORT"
export ETCD_CLUSTER_NAME=etcd-alone-$DEPLOY_PORT_IDX
export ETCD_DATA=/opt/etcd/$ETCD_NAME

echo "*******************DEPLOY INFO************************"
echo ""
echo " NODE          : $CSE_NODE"
echo ""
echo " ETCD NAME     : $ETCD_NAME"
echo " ETCD PORT     : http://$CSE_NODE:$DATA_PORT"
echo "                 http://$CSE_NODE:$PEER_PORT"
echo " DATA PATH     : $ETCD_DATA"
echo ""
echo " ETCD CLUSTER      : $ETCD_CLUSTER_NAME"
echo " ETCD CLUSTER LIST : $ETCD_CLUSTER_IP"
echo ""
echo "*******************************************************"

docker rm -f $ETCD_NAME

docker run --net=host -d --restart=always \
    -v $ETCD_DATA:/opt/etcd \
	--name $ETCD_NAME \
	quay.io/coreos/etcd \
	/usr/local/bin/etcd \
	-name $ETCD_NAME \
	-data-dir /opt/etcd \
	-advertise-client-urls http://$CSE_NODE:$DATA_PORT \
	-listen-client-urls http://$CSE_NODE:$DATA_PORT \
	-initial-advertise-peer-urls http://$CSE_NODE:$PEER_PORT \
	-listen-peer-urls http://$CSE_NODE:$PEER_PORT \
	-initial-cluster-token $ETCD_CLUSTER_NAME \
	-initial-cluster $ETCD_CLUSTER_IP \
	-initial-cluster-state new
