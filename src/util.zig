const std = @import("std");
const print = std.debug.print;
const Allocator = std.mem.Allocator;

pub fn read_file_lines(file_path: []const u8, allocator: Allocator) !std.ArrayList([]const u8) {
    const file = try std.fs.cwd().openFile(file_path, .{});
    defer file.close();

    var file_buffer: [4096]u8 = undefined;
    var reader = file.reader(&file_buffer);

    var arr: std.ArrayList([]const u8) = .empty;
    // defer only on error, caller responsible for cleanup on success
    errdefer arr.deinit(allocator);

    while (try reader.interface.takeDelimiter('\n')) |line| {
        const str = try std.fmt.allocPrint(allocator, "{s}", .{line});
        try arr.append(allocator, str);
    }

    return arr;
}
