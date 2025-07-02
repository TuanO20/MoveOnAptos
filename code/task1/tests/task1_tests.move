#[test_only]
module task1::task1_tests {
    use std::signer;
    use std::string::{utf8};
    use std::debug::print;
    use aptos_framework::timestamp;

    use task1::hello_world;

    const E_WRONG_TEXT: u64 = 0;

    #[test(aptos_framework = @aptos_framework, caller = @task1)]
    fun test_init_module(caller: &signer, aptos_framework: &signer) {
        timestamp::set_time_has_started_for_testing(aptos_framework);
        hello_world::init_for_test(caller);

        let (text, updated_at) = hello_world::get_info();

        assert!(text == utf8(b"Hello World, I'm a blockchain developer"), E_WRONG_TEXT);
        assert!(updated_at == 0, E_WRONG_TEXT);
    }


    #[test(aptos_framework = @aptos_framework, caller = @task1)]
    fun test_update_info(caller: &signer, aptos_framework: &signer) {
        timestamp::set_time_has_started_for_testing(aptos_framework);
        hello_world::init_for_test(caller);

        let new_text = utf8(b"Hi, I'm Tran Anh Tuan");
        hello_world::update_info(caller, new_text);

        let (text, updated_at) = hello_world::get_info();
        assert!(text == new_text, E_WRONG_TEXT);
        assert!(updated_at == 0, E_WRONG_TEXT);
    }
}