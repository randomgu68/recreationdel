depth=-4400;
surf=-1;

targets = [];

__new_target = function(_target, _radius = 50) constructor {
    target = _target;
    radius = _radius;
};
__add_target = function(_target, _radius = 50) {
    // check for duplicates and delete them
    for (var i = 0; i < array_length(targets); i ++) {
        if targets[i].target == _target {
            array_delete(targets, i, 1);
            break;
        };
    };
    
    // add to the target list
    array_push(targets, new __new_target(_target, _radius));
};

// add all party members to taret list (optional)
for (var i = 0; i < party_length(true); i ++) {
    __add_target(party_get_obj(global.party_names[i]));
};

with (o_lb_light_default)
    o_lb_light_following.__add_target(id,radius)