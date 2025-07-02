module task1::hello_world {
  use std::signer;
  use std::string::{String, utf8};
  use aptos_framework::timestamp;


  const E_NOT_OWNER: u64 = 0;

  struct HelloWorldObject has key, store {
    creator: address,
    text: String,
    updated_at: u64
  }


  fun init_module(caller: &signer) {
    let hello_world_object = HelloWorldObject {
      creator: signer::address_of(caller),
      text: utf8(b"Hello World, I'm a blockchain developer"),
      updated_at: timestamp::now_seconds()
    };

    move_to(caller, hello_world_object);
  }


  #[view]
  public fun get_info(): (String, u64) acquires HelloWorldObject {
    let hello_world_obj = borrow_global<HelloWorldObject>(@task1);
    (hello_world_obj.text, hello_world_obj.updated_at)
  }

  public entry fun update_info(caller: &signer, text: String) acquires HelloWorldObject {
    assert!(signer::address_of(caller) == @task1, E_NOT_OWNER);
    let hello_world_obj = borrow_global_mut<HelloWorldObject>(@task1);
    hello_world_obj.text = text;
    hello_world_obj.updated_at = timestamp::now_seconds();
  }


  #[test_only]
  public fun init_for_test(caller: &signer) {
    init_module(caller);
  }


}
    