module move_addr::Sample2 {

    const MY_ADDR: address = @move_addr;

    fun confirm_value(number: u64): bool {
        if(number > 0)
            return true
        else
            return false
    }

    #[test_only]
    use std::debug::print;

    #[test]
    fun test_function(){
        let result = confirm_value(1);
        print(&result);
    }
}