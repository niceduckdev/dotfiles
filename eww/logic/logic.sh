source ./battery.sh
source ./date.sh
source ./network.sh
source ./time.sh
source ./volume.sh
source ./workspaces.sh

if [[ $# -lt 1 ]]; then
    exit
fi

case "$1" in
	battery) battery_module ;;
	date) date_module ;;
	network) network_module ;;
	time) time_module ;;
	volume) volume_module ;;
	workspaces) workspaces_module ;;
esac
