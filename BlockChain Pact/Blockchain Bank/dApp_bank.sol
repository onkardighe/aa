
pragma solidity ^0.6.4;

contract Bank {
    
    uint256 public balance;
    
    constructor () public {
        balance = 0;
    }
    
    function getBalance() public view returns (uint256) {
        return balance;
    }
    
    function withdrawal( uint256 amount ) public  {
        require ( balance >= amount, "Insufficient Balance");
        balance = balance - amount;
    }
    
    function deposit (uint256 amount) public {
        balance = balance + amount;
    }
}

---------------------------------------------------------------------------------------------------

<html>
    <style>
        .button{
            background-color: #f74c08;
            border: none;
            color: white;
            padding: 15px 25px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
        }
        .button:hover{
            background-color: #f74c08;
        }
        input{
            border: rgb(207, 207, 207);
            border-radius: 5px;
            background-color: rgb(207, 207, 207);
            height: 40px;
            width: 300px;
            cursor: pointer;
        }
    </style>
    <body>
        <center>
            <h2>Blockchain Bank Application</h2>
            <input type = 'text' id = 'amount'>
            <p id = "balance"></p>
            <button id = "deposit" class = "button">Deposit</button>
            <button id = "withdraw" class = "button">Withdraw</button>
        </center>

        <script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        
               <script>
            var contract;

            $(document).ready(function()
            {
                // web3 provider from ganache-cli
                web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
                // smart contract address
                var address = "0x09D650cd1b1aA2FF227365C92c9a66FB76c2e0d1";
                var abi = [{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[],"name":"balance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"deposit","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getBalance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"withdrawal","outputs":[],"stateMutability":"nonpayable","type":"function"}]

                contract = new web3.eth.Contract(abi, address);
                contract.methods.getBalance().call().then(function(balance)
                {
                    $('#balance').html(balance);
                })
            })

            $('#deposit').click(function()
                {
                    var amt = 0;
                    amt = parseInt($('#amount').val());
                    // Fetching the various address of web3
                    web3.eth.getAccounts().then(function(accounts)
                    {
                        var acc = accounts[0]
                        console.log("acc: " + accounts[0]);
                        return contract.methods.deposit(amt).send({ from : acc });
                    }).then(function(tx)
                    {
                        console.log(tx);
                    }).catch(function(tx)
                    {
                        console.log(tx);
                    })

            })

            $('#withdraw').click(function()
                {
                    var amt = 0;
                    amt = parseInt($('#amount').val());
                    // Fetching the various address of web3
                    web3.eth.getAccounts().then(function(accounts)
                    {
                        var acc = accounts[0]
                        console.log("acc: " + accounts[0]);
                        return contract.methods.withdrawal(amt).send({ from : acc });
                    }).then(function(tx)
                    {
                        console.log(tx);
                    }).catch(function(tx)
                    {
                        console.log(tx);
                    })
            })

        </script>
    </body>
</html>