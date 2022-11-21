pragma solidity ^0.8.1;

contract studentData
{
    int public numOfStudents ;
    struct student
    {
        string name;
        int id;
        int marks;
    }
    mapping(int => student) public students;

    // Constructor
    constructor()
    {
        numOfStudents = 0;
    }

    function addStudent(string memory _name, int _id, int _marks) public 
    {
        student memory sobj;
        sobj.name = _name;
        sobj.id = _id;
        sobj.marks = _marks;
        numOfStudents += numOfStudents + 1;
    }

    function getStudentName(int id) public view returns(string memory)
    {
        return students[id].name;
    }

    function getStudentMarks(int id) public view returns(int)
    {
        return students[id].marks;
    }

    function getStudentNumber() public view returns(int) {
        return numOfStudents;
    }
}
