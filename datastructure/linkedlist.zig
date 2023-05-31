const std = @import("std");

const Node = struct {
    value: u32 = 0,
    next: ?*Node = null,
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
    var linkedList = List{};

    var n1 = Node{};
    var n2 = Node{ .value = 1 };

    linkedList.push(&n1);
    linkedList.push(&n2);

    linkedList.printList();
}
