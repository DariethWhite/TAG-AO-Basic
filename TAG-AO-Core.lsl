integer Typing;
integer Test;
list Animations;
list Overrides;
key Owner;


init() {
    // This function sets up all global variables.  Can be used to reset the script in place of llResetScript()
    Animations = [ 
                    "Sitting on Ground", "Standing"
                 ];
    Overrides = [ 
                    "TestAnim" 
                ];
    Owner = llGetOwner();
    Typing = 0;
    llRequestPermissions(Owner, PERMISSION_TRIGGER_ANIMATION);
}

override() {
    string anim = llGetAnimation(Owner);
    Typing = llGetAgentInfo(Owner) & 0x200; //Check if typing
    if(Typing) overrideTyping();
    llOwnerSay(anim);
    integer animIndex = llListFindList(Animations, [anim]);
    if(~animIndex) {
        string newAnim = llList2String(Overrides, animIndex);
        llOwnerSay("Overriding with " + newAnim);
        llStopAnimation(anim);
        llStartAnimation(newAnim);
    }
}

overrideTyping() {
    //TODO Implement.
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
    touch_start(integer touched) {
        Test = ~Test;
        if(Test) llStopAnimation("TestAnim");
        else llStartAnimation("TestAmim");
    }
}
