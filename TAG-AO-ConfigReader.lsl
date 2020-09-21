list AnimationTypes = [ 
                        "Sitting on Ground", "Sitting", "Standing", "Turning Left", "Turning Right", "Walking",
                        "Running", "PreJumping", "Jumping"
                      ];
readCard() {
    
}
default {
    state_entry() {
    }
    changed(integer change) {
        if(change & CHANGED_INVENTORY) {
            readCard();
        }
    }
}
