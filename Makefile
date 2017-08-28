# Change these settings
HOME_DIR=/home/smart-t
ETH_DIR=/media/sdcard/workspace/ethereum/rinkeby
DATA_DIR=$(ETH_DIR)/datadir
GENESIS_JSON=$(ETH_DIR)/rinkeby.json
LOGS=$(ETH_DIR)/ethereum.log
NETWORK_ID=4

# 0=silent, 1=error, 2=warn, 3=info, 4=core, 5=debug, 6=debug detail
VERBOSITY=3

# Do not change these settings
help:
	@echo "init - Initialize the blockchain from the genesis json file"
	@echo "start - Start the node. In Rinkeby there will be no actual mining done!"

init:
	geth --datadir $(DATA_DIR) init $(GENESIS_JSON)

start:
	rm -f $(HOME_DIR)/Library/Ethereum/geth.ipc
	mkdir -p $(HOME_DIR)/Library/Ethereum
	ln -s $(DATA_DIR)/geth.ipc $(HOME_DIR)/Library/Ethereum
	geth --datadir=$(DATA_DIR)  --networkid=$(NETWORK_ID)  --cache=512 --verbosity $(VERBOSITY) --ethstats='yournode:Respect my authoritah!@stats.rinkeby.io' --bootnodes=enode://a24ac7c5484ef4ed0c5eb2d36620ba4e4aa13b8c84684e1b4aab0cebea2ae45cb4d375b77eab56516d34bfbd3c1a833fc51296ff084b770b94fb9028c4d25ccf@52.169.42.101:30303 --rpccorsdomain=* --rpc --rpcapi="personal,eth,debug,network" console 2>>$(LOGS)
