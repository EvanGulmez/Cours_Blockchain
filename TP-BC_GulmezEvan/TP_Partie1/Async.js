
const ethers = require('ethers');
const provider = ethers.getDefaultProvider(); //homstead (mainnet)

provider.getBlockNumber()
        .then(blockNumber => {
            console.log("Block number : " +blockNumber)
        })