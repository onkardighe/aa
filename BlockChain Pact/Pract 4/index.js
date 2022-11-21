var contract;

$(document).ready(function()
{
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

    var address = "0x3de7fbE36777223A53e9C3c591A4379B272072aD";
    var abi = [{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"string","name":"_name","type":"string"},{"internalType":"int256","name":"_id","type":"int256"},{"internalType":"int256","name":"_marks","type":"int256"}],"name":"addStudent","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"int256","name":"id","type":"int256"}],"name":"getStudentMarks","outputs":[{"internalType":"int256","name":"","type":"int256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"int256","name":"id","type":"int256"}],"name":"getStudentName","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getStudentNumber","outputs":[{"internalType":"int256","name":"","type":"int256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"numOfStudents","outputs":[{"internalType":"int256","name":"","type":"int256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"int256","name":"","type":"int256"}],"name":"students","outputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"int256","name":"id","type":"int256"},{"internalType":"int256","name":"marks","type":"int256"}],"stateMutability":"view","type":"function"}];

    contract = new web3.eth.Contract(abi, address);
    updateNumber();
    
});

$("#addStudentData").click(function(){

    _name  = $("#_n").val();
    _id = $("#_i").val();
    _marks = $("#_m").val();



    contract.methods.addStudent(_name, _id, _marks).call();
    updateNumber()
});



function updateNumber()
{
    contract.methods.getStudentNumber().call().then(function(result){
        $("#output-title").html("Number of Students: " + result)
        updateStudents(result);
    });

    
}

function updateStudents(num)
{
    for(i = 0; i <= num; i++)
    {

        contract.methods.getStudentName(i).call().then(function(result){
            $("#student-table").innerHtml += "<tr><td>" + result + "</td></tr>";
        });

        
    }
}

