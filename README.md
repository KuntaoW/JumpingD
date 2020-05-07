# JumpingD
Jumping game Delphi Version


Problem
Given an array of length n, indexed from 0 to n-1. Each element of the array has a value of 0 or 1. You start at the 0th position which always has an element value of 0. You can only move to an index which also contains an element with a value of 0. 
In each move you can do one of the following things:
>>Move one step forward or backward.
>>Make a jump of exactly length “m” forward.
That means you can move from position x to x+1, x-1 or x+m in one move, but at least one of the following conditions must be true:
** The new position contains an element with a value of 0.
** The new position is greater than n-1.
You can’t move backward from position 0. If you move to any position greater than n-1, you win the game.
Given the array values and the fixed jump length “m”, you need to determine if it’s possible to win the game.
Input Format
Constraints:
>> 2 <= n <= 100
>> 0 <= m <= 100
>> The first integer in each array is always 0.

Sample Input: m , array of elements (n=lenth of array)
3 , '0,0,0,0,0'
5 , '0,0,0,1,1,1'
3 , '0,0,1,1,1,0'
1 , '0,1,0'
Sample Output
True/Yes
True/Yes
False/NO
False/NO