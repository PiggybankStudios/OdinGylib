
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

ClearScreen :: proc(color: Color_t)
{
	gl.ClearColor(ColorChannelToF32(color.r), ColorChannelToF32(color.g), ColorChannelToF32(color.b), ColorChannelToF32(color.a));
	gl.Clear(gl.COLOR_BUFFER_BIT);
}

Update :: proc()
{
	@(static) colorIndex: int;
	
	glfw.PollEvents();
	programTime := cast(u64)(glfw.GetTime() * 1000);
	
	ClearScreen(GetPredefPalColorByIndex(programTime / 1000));
	glfw.SwapBuffers(window);
}

main :: proc()
{
	PrintLine_D("Hello from Odin! %v", 100);
	
	color: Color_t;
	color = NewColor(255, 255.0, 255, 255);
	PrintLine_D("color: %v", color);
	
	Initialize();
	defer glfw.Terminate();
	defer glfw.DestroyWindow(window);
	
	for (!ShouldClose()) { Update(); }
	
	// DebugWaitForInput();
	WriteLine_E("Exiting!");
}
