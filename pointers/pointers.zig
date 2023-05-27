const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var x: u8 = 5;
    var px: *u8 = &x;

    print("{d}\n", .{px.*});
}
