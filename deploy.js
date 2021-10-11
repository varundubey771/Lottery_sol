const HDWalletProvider = require("truffle-hdwallet-provider");
const Web3 = require("web3");
const { interface, bytecode } = require("./compilee");

const provider = new HDWalletProvider(
  "timber require slim aim cigar volcano neck acquire oven about boring mix",
  "https://rinkeby.infura.io/v3/7f3600b2025647d3a82a99930126bf60",
  0
);

const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();
  console.log(accounts);
  const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({ data: bytecode })
    .send({ gas: "1000000", gasPrice: "5000000000", from: accounts[0] });

  console.log(result.options.address);
};

deploy();
