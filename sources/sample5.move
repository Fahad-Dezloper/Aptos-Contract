module move_addr::Sample5 {
    const ADD: u64 = 0;   
    const SUB: u64 = 1;   
    const MUL: u64 = 2;   
    const DIV: u64 = 3;   
    const MOD: u64 = 4;

    fun arthmetic_operations(a: u64, b: u64, operator: u64): u64 {
        if (operator == ADD)
            return a + b
        else if (operator == SUB)
            return a - b
        else if (operator == MUL)
            return a * b
        else if (operator == DIV) {
            assert!(b != 0, 1); 
            return a / b
        }
        else if (operator == MOD) {
            assert!(b != 0, 2); 
            return a % b
        }
        else
            abort 3 
    }

    #[test_only]
    use std::debug::print;

    #[test]
    fun test_arithmetic() {
        let result = arthmetic_operations(10, 5, ADD);
        assert!(result == 15, 4);
        print(&result);

        result = arthmetic_operations(10, 5, SUB);
        assert!(result == 5, 5);
        print(&result);

        result = arthmetic_operations(10, 5, MUL);
        assert!(result == 50, 6);
        print(&result);

        result = arthmetic_operations(10, 5, DIV);
        assert!(result == 2, 7);
        print(&result);

        result = arthmetic_operations(10, 5, MOD);
        assert!(result == 0, 8);
        print(&result);
    }

    #[test]
    #[expected_failure(abort_code = 1)]
    fun test_division_by_zero() {
        arthmetic_operations(10, 0, DIV);
    }

    #[test]
    #[expected_failure(abort_code = 2)]
    fun test_modulo_by_zero() {
        arthmetic_operations(10, 0, MOD);
    }

    #[test]
    #[expected_failure(abort_code = 3)]
    fun test_invalid_operator() {
        arthmetic_operations(10, 5, 5);
    }
}