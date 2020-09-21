integer typing;
list Animations;
list Overrides;



init() {
    // This function sets up all global variables.  Can be used to reset the script in place of llResetScript()
    Animations = [];
    Overrides = [];
    typing = 0;
}

override() {
    if(!typing) {
        
    }
}

default {
    state_entry() {
        init();
    }
    changed(integer change) {
        //Detect changes in animations.
        if(change & CHANGED_ANIMATION) {
            override();
        }
    }
}
