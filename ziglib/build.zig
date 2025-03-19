const std = @import("std");

const SRC_DIR = "srcs/";

const ENTRY_FILE = SRC_DIR ++ "main.zig";

const target: std.Target.Query = .{ .cpu_arch = .x86_64, .os_tag = .linux, .abi = .none };

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "lib",
        .root_source_file = b.path(ENTRY_FILE),
        .target = b.resolveTargetQuery(target),
    });
    b.installArtifact(exe); 
    const run_step = b.step("run", "Run the application");
    run_step.dependOn(&exe.run_step);
}
