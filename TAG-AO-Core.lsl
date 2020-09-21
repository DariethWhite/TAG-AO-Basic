list Animations;
list Overrides;

init() {
    // This function sets up all global variables.  Can be used to reset the script in place of llResetScript()
    Animations = [];
    Overrides = [];
}

default {
    state_entry() {
        init();
    }
}
