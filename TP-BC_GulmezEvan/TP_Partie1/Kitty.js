const ethers = require ('ethers');
const provider = ethers.getDefaultProvider(); //homstead (mainnet)

let abi = [
  "event Birth(address owner, uint256 kittyId, uint256 matronId, uint256 sireId, uint genes)"  
];
let contractAddress = "0x06012c8cf97BEaD5deAe237070F9587f8E7A266d";
let contract = new ethers.Contract(contractAddress, abi, provider);

contract.on("Birth", (owner, kittyId, matronId, sireId, genes, event)=> {
    console.log("# block # : " + event.blockNumber);
    console.log("# Owner # : " + owner);
    console.log("# kittyId # : " + kittyId);
});