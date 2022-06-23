const ethers = require('ethers');
const provider = ethers.getDefaultProvider('homstead','390474c8b3a04f71bc6e052996bfd104');

provider.getBlockNumber()
        .then(blockNumber => {
            console.log("Block number : " +blockNumber)
        })