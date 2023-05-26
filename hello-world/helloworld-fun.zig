const std = @import("std");

pub fn helloworld() void {
    std.debug.print("{s} World!", .{"Hello"});
}

pub fn main() void {
    helloworld();
}
