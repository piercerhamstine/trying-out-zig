const std = @import("std");

const Node = struct {
    value: u32 = 0,
    next: ?*Node = null,
};

const List = struct {
    head: ?*Node = null,
    len: usize = 0,

    pub fn push(self: *List, node: *Node) void {
        if (self.head == null) {
            self.head = node;
            self.incrementLen();
            return;
        }

        var temp: ?*Node = self.head;
        while (temp != null) {
            if (temp.?.next == null) {
                temp.?.next = node;
                self.incrementLen();
                return;
            }

            temp = temp.?.next;
        }
    }

    pub fn push_front(self: *List, node: *Node) void {
        var temp: ?*Node = self.head;

        self.head = node;
        self.head.?.next = temp;
    }

    pub fn pop_front(self: *List) ?*Node {
        var temp: ?*Node = self.head;

        self.head = temp.?.next;

        temp.?.next = null;

        return temp;
    }

    pub fn pop_back(self: *List) ?*Node {
        if (self.head == null) {
            return self.head;
        }

        var temp: ?*Node = self.head;

        while (temp.?.next != null) {
            temp = temp.?.next;
        }

        return temp;
    }

    pub fn peek(self: *List) ?*Node {
        return self.head;
    }

    pub fn printList(self: *List) void {
        var temp: ?*Node = self.head;

        while (temp != null) {
            std.debug.print("Node Value: {any}\n", .{temp.?.value});
            temp = temp.?.next;
        }
    }

    pub fn incrementLen(self: *List) void {
        self.len += 1;
    }

    pub fn decrementLen(self: *List) void {
        self.len -= 1;
    }
};

pub fn main() void {
    var linkedList = List{};

    var n1 = Node{};
    var n2 = Node{ .value = 1 };

    linkedList.push(&n1);
    linkedList.push_front(&n2);
    // linkedList.push(&n2);

    // var n3: ?*Node = linkedList.pop_back();
    linkedList.printList();

    // std.debug.print("Back: {any}\n", .{n3.?.value});
}
