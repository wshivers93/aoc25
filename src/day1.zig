const std = @import("std");
const readFileLines = @import("util.zig").read_file_lines;
var alloc = std.heap.page_allocator;

pub fn day1() void {
    var result: std.ArrayList([]const u8) = .empty;
    defer result.deinit(alloc);

    result = readFileLines("src/input/day1.txt", alloc) catch |err| {
        std.debug.print("Error reading file {} \n", .{err});
        return;
    };

    std.debug.print("Result {d}\n", .{result.items.len});
    std.debug.print("First line: {s}\n", .{result.items[0]});
    std.debug.print("Last line: {s}\n", .{result.items[result.items.len - 1]});
}
