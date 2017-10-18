# Configure Makefile and run Rinkeby

This small procedure will explain how to build a rinkeby (ethereum testnet) node
from just a genesis.json file using a configured Makefile.

All steps in this procedure asume that you are using either OSX or Linux. The
only real prerequisite is that you have a recent version of make installed. We
want to have GNU make version 4.1 or higher.

## Building go-ethereum

Our Rinkeby ethereum node will be initialized, run and inspected using a geth
(go-ethereum tool). I advice to build the geth tool from source and install the
binaries somewhere in your search-path ($PATH).

Get the go-ethereum repo from:

```
https://github.com/ethereum/go-ethereum
```

and in the go-ethereum folder simply build this project using the almighty:

```
make all
```

now you will find the binaries in "... /go-ethereum/build/bin" either include
this bin dir in your search path ($PATH) or copy the binaries found in this
folder to for instance ```"/usr/local/bin"```.

## Prepare dirs and change Makefile

First create a directory from where you would like to build your rinkeby network
node. I assume the location is ``` .../rinkeby ```. Where ``` ...  ``` means
somewhere in your file system. Make sure you will have enough rights in this
folder.

```
chmod 755 ... /rinkeby
```

Now in ``` .../rinkeby ``` create a new dir called ``` datadir ```.

To complete the configuration use your favorite editor (vi) and change the line;

```
ETH_DIR=/media/sdcard/workspace/ethereum/rinkeby
```

so that it points to the location of your ``` .../rinkeby ``` folder. And write
this updated Makefile to reflect this change.

Initialization will happen automatically when you started with a new datadir.

## Run the Rinkeby node

Now you are ready to run the Rinkeby node. You lauch your Rinkeby node with the
follwoing command:

```
make start
```

This will start a node which will automatically connect to a bootstrap node in the
network. Once this connection exists, the node will start downloading the Rinkeby
blockchain and start a so called geth-console.

*please note that downloading the Rinkeby blockchain will take a long while!*

To check whether you have completed the download you compare the blockheight (the
number that you get after reading the ```eth.blockNumber``` from your geth prompt,
with the blockheight that the network is on, which can be observed at the
[etherscan Rinkeby site](https://rinkeby.etherscan.io) .

If the two values match you have downloaded the full Rinkeby blockchain and are
ready for action!

## Creating a first account and get some ether

To interact with the Rinkeby blockchain you will need to spend some virtual Ether,
which is the crypto currency that get's generated in the Rinkeby network. But
you can get some of this Ether you must have an account to hold that Ether.

### Create a first account

The first account in an ethereum node is called the etherbase. This is the account
where you build a balance when you were to mine your Ether. In the Rinkeby network
mining is done by a few controled nodes (Proof of Athority) so you don't need an
account for mining. But as transaction in Ethereum also have to be paid with gas,
there is still a need to have an account with Ether.

Creating an account is simply done with the following command:

```
personal.newAccount()
```

and after entering your passphrase, you will see a big hex value which is your
rinkeby address.

You can check the balance of your account expressed in Ether using:

```
web3.fromWei(eth.getBalance(eth.accounts[0]),"Ether")
```

When you start you should see a balance of 0. Which is a bit depressing, so let's
beef that up a bit.

### Getting Ether from a faucet

Unlike the mainnet where Ether can be bought or mined (Proof of Work) the Rinkeby
uses a more controled way of distributing Ether. In the first generations of the
testnet Ethereum also used PoW, but as that testnet progressed people where using
system capacity to hi-jack the network which resulted in people begging for Ether
in the forum. So now this is improved, only a few controled nodes are allowed to
mine in the Rinkeby network and a faucet is used to distribute Ether.

The procedure to get Ether is:
1. create a public gist using your github account with your Rinkeby address in the
body of that gist. The subject you may leave empty.
2. got to [the rinkeby faucet](https://faucet.rinkeby.io) and paste the url of
your public gist. Then select 18.75 Ethers/3 days and the faucet will dispense.

*Note that you now need to wait for 3 days to get more Ether from the faucet, but
for most cases you should have enough Ether now to fund your experiments.*

# That's all folks

This completes the instruction for setting up a Rinkeby node and account with
enough Ether, such that you can play with Ethereum using the Rinkeby testnet. For
questions and improvement of this procedure, please contact the author:

Toon Leijtens
(toon.leijtens@yellowbrainz.com)




