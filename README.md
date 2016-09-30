## Hashbuilder

Very simple tool which takes a plaintext input and a salt if you choose, and then shows you various hash types for that string. The use case is obscure to say the least, but on an pen test engagement a colleague captured a hash and knew what the password for that hash was. He then needed to figure out what sort of hash it was in order to crack others that he was seeing. Like I said, its an edge case. Knowing the password is a rarity. 
By comparing the output of this tool to the hash, you should be able to solve it. 
Currently supports MD5, SHA1 and various strengths of SHA2.

Installation:
1)Git Clone  
2)Bundle Install

Usage:
./hashbuilder --string password --salt 1234
