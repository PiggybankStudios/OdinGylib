
package main

import "core:os"
import "core:math"
import "core:math/rand"

import gl "vendor:OpenGL"
import "vendor:glfw"

@(private="file") window: glfw.WindowHandle;

Initialize :: proc()
{
	if (glfw.Init() != 1) { panic("Failed to init GLFW"); }
	
	glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 4);
	glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 4);
	glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);
	
	window = glfw.CreateWindow(1600, 900, "Test Window", nil, nil);
	
	glfw.MakeContextCurrent(window);
	glfw.SwapInterval(1);
	gl.load_up_to(4, 4, glfw.gl_set_proc_address);
}

ShouldClose :: proc() -> bool
{
	return bool(glfw.WindowShouldClose(window));
}

Update :: proc()
{
	glfw.PollEvents();
	programTime := cast(u64)(glfw.GetTime() * 1000);
	
	gl.ClearColor(1, OscillateBy32(programTime, 0, 1, 4000), 1, 1);
	gl.Clear(gl.COLOR_BUFFER_BIT);
	glfw.SwapBuffers(window);
}

main :: proc()
{
	PrintLine_D("Hello from Odin! %v", 100);
	
	testRec1 := NewReci(0, 0, 100, 100);
	testRec2 := NewReci(10, 20, 100, 100);
	// testVec := v2i{105, 50};
	// testRec = RecShift(testRec, v2i{10, 10});
	// isInside := IsInsideRec(testRec, testVec);
	// PrintLine_D("IsInside: %v", isInside);
	
	Initialize();
	defer glfw.Terminate();
	defer glfw.DestroyWindow(window);
	
	for (!ShouldClose()) { Update(); }
	
	// DebugWaitForInput();
	WriteLine_E("Exiting!");
}
