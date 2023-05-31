const std = @import("std");

const Node = struct {
    value: u32,
    next: ?*Node,
};

const List = struct {
    head: ?*Node = null,

    pub fn push(self: *List, node: *Node) void {
        if (self.head == null) {
            self.head = node;
            return;
        }

        var temp: ?*Node = self.head;
        while (temp != null) {
            if (temp.?.next == null) {
                temp.?.next = node;
                return;
            }

            temp = temp.?.next;
        }
    }

    pub fn printList(self: List) void {
        var temp: ?*Node = self.head;

        while (temp != null) {
            std.debug.print("Node Value: {any}\n", .{temp.?.value});
            temp = temp.?.next;
        }
    }
};

pub fn main() void {
    var linkedList = List{ .head = null };

    var n1 = Node{
        .value = 0,
        .next = null,
    };

    linkedList.push(&n1);

    linkedList.printList();

    std.debug.print("{s}", .{"Hello World"});
}
