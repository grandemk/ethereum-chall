# Blockchain Challenges

## Bounty

The goal is to get the Win event.

First, you need to create your own blockchain

### Create your own blockchain:

Understanding the basis of the ethereum blockchain:
https:/medium.facilelogin.com/build-your-own-blockchain-b8eaeea2f891
https://github.com/regispietra/CreatePrivateEthereum


### Write up

looking at the win function, we get the Win event when the balance of the
Bounty smart contract is 0.

The Bounty smart contract offers the add_bounty function.
This function permits to store a sha256 and offer a reward to whoever
is able to find a corresponding string.

the function bounty_solve permits to try to resolve the challenge someone
posted and get half the reward (the emitter gets half the reward back too
for some reason ?)

The logical hole in this smart contract is that when you add a bounty, you specify the reward as a parameter and not with the money you sent with the transaction while calling the function.

There are some require (assert) that try to limit the reward value but they are false.

what should be done:
```javascript
require(msg.value >= reward)
```

what is done:
```javascript
require(msg.value > 0)
require(msg.value <= reward)
```

which means you can send a transaction where you pay 1 Wei and the reward can be what you want.

You can then solve your own bounty and get all the money of the contract !

See [testBounty.js](testBounty.js) to see how this can be used to get all the money of the smart contract.

One small gotcha is that the bounty sovle function get a bytes32 (which means a string of 32 bytes padded with 0 if needed)
So calling sha256sum on a string like 'A' won't give you the same answer than what the bounty_solve except. To fix that, I created the sha.sol contract which
act as an oracle of what the bounty_solve function expect to get the sha256 byte32 hash of "A".

The big difficulty of this challenge was to learn the api and how to create smart contract and to check if their creation didn't fail (fucking gaslimit failed my contract creation without me knowing !).

