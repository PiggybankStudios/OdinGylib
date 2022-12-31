
package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:sys/windows"

DbgLevel :: enum
{
	None,
	Debug,
	Info,
	Other,
	Notify,
	Warning,
	Error,
};

DebugOutput :: proc(dbgLevel: DbgLevel, line: string, newLine: bool)
{
	fmt.println(dbgLevel, ":", line);
	if (newLine) { fmt.println("\n"); }
	windows.OutputDebugStringA(strings.clone_to_cstring(line));
	if (newLine) { windows.OutputDebugStringA("\n"); }
}
DebugPrint :: proc(dbgLevel: DbgLevel, formatString: string, newLine: bool, args: ..any)
{
	line := fmt.tprintf(formatString, ..args);
	DebugOutput(dbgLevel, line, newLine);
}

WriteAt     :: proc(dbgLevel: DbgLevel, line: string)                      { DebugOutput(dbgLevel, line, false);                }
WriteLineAt :: proc(dbgLevel: DbgLevel, line: string)                      { DebugOutput(dbgLevel, line, true);                 }
PrintAt     :: proc(dbgLevel: DbgLevel, formatString: string, args: ..any) { DebugPrint(dbgLevel, formatString, false, ..args); }
PrintLineAt :: proc(dbgLevel: DbgLevel, formatString: string, args: ..any) { DebugPrint(dbgLevel, formatString, true, ..args);  }

Write_D     :: proc(line: string)                      { DebugOutput(.Debug, line, false);                }
WriteLine_D :: proc(line: string)                      { DebugOutput(.Debug, line, true);                 }
Print_D     :: proc(formatString: string, args: ..any) { DebugPrint(.Debug, formatString, false, ..args); }
PrintLine_D :: proc(formatString: string, args: ..any) { DebugPrint(.Debug, formatString, true, ..args);  }

Write_I     :: proc(line: string)                      { DebugOutput(.Info, line, false);                }
WriteLine_I :: proc(line: string)                      { DebugOutput(.Info, line, true);                 }
Print_I     :: proc(formatString: string, args: ..any) { DebugPrint(.Info, formatString, false, ..args); }
PrintLine_I :: proc(formatString: string, args: ..any) { DebugPrint(.Info, formatString, true, ..args);  }

Write_O     :: proc(line: string)                      { DebugOutput(.Other, line, false);                }
WriteLine_O :: proc(line: string)                      { DebugOutput(.Other, line, true);                 }
Print_O     :: proc(formatString: string, args: ..any) { DebugPrint(.Other, formatString, false, ..args); }
PrintLine_O :: proc(formatString: string, args: ..any) { DebugPrint(.Other, formatString, true, ..args);  }

Write_N     :: proc(line: string)                      { DebugOutput(.Notify, line, false);                }
WriteLine_N :: proc(line: string)                      { DebugOutput(.Notify, line, true);                 }
Print_N     :: proc(formatString: string, args: ..any) { DebugPrint(.Notify, formatString, false, ..args); }
PrintLine_N :: proc(formatString: string, args: ..any) { DebugPrint(.Notify, formatString, true, ..args);  }

Write_W     :: proc(line: string)                      { DebugOutput(.Warning, line, false);                }
WriteLine_W :: proc(line: string)                      { DebugOutput(.Warning, line, true);                 }
Print_W     :: proc(formatString: string, args: ..any) { DebugPrint(.Warning, formatString, false, ..args); }
PrintLine_W :: proc(formatString: string, args: ..any) { DebugPrint(.Warning, formatString, true, ..args);  }

Write_E     :: proc(line: string)                      { DebugOutput(.Error, line, false);                }
WriteLine_E :: proc(line: string)                      { DebugOutput(.Error, line, true);                 }
Print_E     :: proc(formatString: string, args: ..any) { DebugPrint(.Error, formatString, false, ..args); }
PrintLine_E :: proc(formatString: string, args: ..any) { DebugPrint(.Error, formatString, true, ..args);  }

DebugWaitForInput :: proc()
{
	buffer: [4]u8;
	os.read(os.stdin, buffer[:]);
}
