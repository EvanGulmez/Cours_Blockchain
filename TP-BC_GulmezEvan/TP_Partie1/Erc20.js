const ethers = require ('ethers');
const provider = ethers.getDefaultProvider(); //homstead (mainnet)

let abi = [
  "event Transfer(address to,address owner, uint tokens)"  
]; 
let contractAddress = "0x86ca43d150c9b0062704ddb105d3dbbe031db37c";
let contract = new ethers.Contract(contractAddress, abi, provider);

contract.on("Birth", (owner, kittyId, matronId, sireId, genes, event)=> {
    console.log("# block # : " + event.blockNumber);
    console.log("# Token # : " + tokens);
    console.log("# Owner # : " + owner);
    console.log("# to # : " + to);
});