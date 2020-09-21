string NoteCard = "TAG-AO-Config";
list AnimationTypes = [
                        "Sitting on Ground", "Sitting", "Striding", "Crouching",
                        "CrouchWalking", "Soft Landing", "Standing Up", "Hovering Down",
                        "Hovering Up", "FlyingSlow", "Flying", "Hovering", "Jumping",
                        "PreJumping", "Running", "Turning Right", "Turning Left", "Walking",
                        "Landing", "Standing", "Falling Down"
                      ];

init() {
    readCard();
}

readCard() {
    integer lines = osGetNumberOfNotecardLines(NoteCard);
    integer i;
    string notecard = osGetNotecard(NoteCard);
    list notecardLines = llParseString2List(notecard, ["\n"], []);
    string line;
    for(i=0; i<lines; i++) {
        line = llList2String(notecardLines, i);
        if(osStringStartsWith(line, "[", 0)) {
            integer valid = llListFindList(AnimationTypes, [getLineP(line, 1)]);
            if(~valid) {
                llOwnerSay(getLineP(line, 0));
            }
        }
    }
}

string getLineP(string line, integer token) {
    //Fetch Line parts.
    string ret;
    integer b = llSubStringIndex(line, "]") - 2;;
    integer s = b + 3;
    integer e = -1;
    if(token) {
        s = 2;
        e = b;
    }
    ret = llGetSubString(line, s, e);
    return ret;
}

default {
    state_entry() {
        init();
    }
    changed(integer change) {
        if(change & CHANGED_INVENTORY) {
            readCard();
        }
    }
}
