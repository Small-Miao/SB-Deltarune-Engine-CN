/*
You can use this object when you want another object to collide with the player.
For example the object (oTouch) uses it to trigger a function when the player touches it.

Even though the op object handles the player colliding with a wall, it is technically not the player's hitbox.
The op objects x and y lock in place in the middle of the screen when you are at the edge of a room,
because the op object is also responsible for the camera.
*/