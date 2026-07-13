function cut_enc_set_rudinn() : enc_set() constructor {
    debug_name = "test"
    numdialogue = 0
    
    enemies = [
        new cut_enemy_rudinn(),
    ]
    
    flavor = function () {
        switch (numdialogue) {
        	case 0 : {
                numdialogue ++
                return "* Rudinn is glimmering plainly."
            }
            
            case 1 : {
                numdialogue ++
                return "* Rudinn has no strong opinions one way or the other."
            }
            
            case 2 : {
                numdialogue ++
                return "* Rudinn thinks about elaborate stones."
            }
            
            case 3 : {
                numdialogue = 0
                return "* Smells like jewelry."
            }
        }
    }
}