## Task 1

### Description

Task 1 guides you through building a minimal Move smart-contract called `task1::hello_world` 🚀.  Your mission is to:
1. 🗄️ publish a resource that stores a greeting string together with a timestamp,
2. ✍️ provide public entry functions to initialise that resource, update the greeting, and read it back, and
3. 🧪 write unit-tests that prove the module behaves correctly by using the Aptos framework’s `timestamp` module.

By the end of this task you will have written, tested, and understood a complete, state-ful Move module 🔗 — a solid first step toward developing more advanced on-chain applications.

### 🚀 How to Deploy Your Contract

```bash
aptos move publish \
  --named-addresses task1=<your_account_address> \
  --profile default \
  --included-artifacts none
```

🔑 **`<your_account_address>`** is the address generated for you when you ran `aptos init` (it is stored under the **default** profile).

🛡️ **`--included-artifacts none`** keeps your source code private on-chain; only the compiled bytecode is published.

That’s it—your `hello_world` module will be live on Aptos Testnet! 🌐


### 🚀 Deployed Address on testnet
0x3ca00e8cd78276b2624f4e2dae6b7e92485e3a45574eb153fffde93d5f1b8158
