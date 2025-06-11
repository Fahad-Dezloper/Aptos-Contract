address move_addr {
    module one {
        friend move_addr::two;

        public(friend) fun get_value(): u64 {
            return 100
        }
    }

    module two {

        #[test_only]
        use std::debug::print;

        #[test]
        fun test_function(){
            let result = move_addr::one::get_value();
            print(&result);
        }
    }

    // module three {
    //     #[test_only]
    //     use std::debug::print;

    //     #[test]
    //     fun test_function(){
    //         let result = move_addr::one::get_value();
    //         print(&result);
    //     }
    // }
}