// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Todo {

    struct Task {
        string name;
        bool isDone;
    }

    mapping (address => Task[]) private Users;

    function addTask(string calldata _task) external{
        Users[msg.sender].push(Task({name:_task, isDone: false}));
    }

    function getTask(uint _taskIndex) external view returns (Task memory){
        return Users[msg.sender][_taskIndex];
    }

    function updateStatus(uint256 _taskIndex, bool _status) external{
        Users[msg.sender][_taskIndex].isDone = _status;
    }

    function deleteTask(uint256 _taskIndex) external{
        delete Users[msg.sender][_taskIndex];
    }

    function getTaskCount() external view returns (uint256){
        return Users[msg.sender].length;
    }
}