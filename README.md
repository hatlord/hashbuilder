## Hashbuilder

Very simple tool which takes a plaintext input and a salt if you choose, and then shows you various hash types for that string. The use case is obscure to say the least, but on an pen test engagement a colleague captured a hash and new what the password for that hash was. He then needed to figure out what sort of hash it was in order to crack others that he was seeing.  

Usage:
./hashbuilder --string password --salt 1234
