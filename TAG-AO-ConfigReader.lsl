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
            llOwnerSay(line);
        }
    }
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
