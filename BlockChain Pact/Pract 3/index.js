node
Web3=require('web3') 
web3=new Web3("http://localhost:8545")
web3.eth.getAccounts().then(console.log)
