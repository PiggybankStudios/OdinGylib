
package main

import "core:intrinsics"
import "core:math"
import "core:math/linalg"

// NOTE: This is order in memory. When working with little endian u32's these will read backwards. For example, Rgba reads as 0xAARRGGBB in hex form
//       Bgra is the order used for win32 functions and the hex format matches web hex color format so it tends to act like our "default" ordering
ColorChannelOrder_t :: enum
{
	Bgra,
	Rgba,
	Argb,
}

Colorf_t :: v4;

Color_t :: struct
{
	r: u8,
	g: u8,
	b: u8,
	a: u8,
}

// +--------------------------------------------------------------+
// |               Simple Value Definitions and New               |
// +--------------------------------------------------------------+
Color_TransparentBlack :: Color_t{ 0, 0, 0, 0 };
Color_White            :: Color_t{ 255, 255, 255, 255 };

NewColor_u8 :: proc(r, g, b, a: u8) -> Color_t
{
	return Color_t{ r, g, b, a };
}
NewColor_float :: proc(r, g, b, a: f32) -> Color_t
{
	return Color_t{
		ColorChannelToU8(r),
		ColorChannelToU8(g),
		ColorChannelToU8(b),
		ColorChannelToU8(a),
	};
}
NewColor :: proc { NewColor_u8 };

// +--------------------------------------------------------------+
// |                   Derived Values Functions                   |
// +--------------------------------------------------------------+
GetColorValueU32 :: proc(color: Color_t, order: ColorChannelOrder_t = .Bgra) -> u32
{
	if (order == .Bgra)
	{
		return (u32(color.r) << 8) | (u32(color.g) << 16) | (u32(color.b) << 24) | (u32(color.a) << 0);
	}
	else if (order == .Bgra)
	{
		return (u32(color.r) << 8) | (u32(color.g) << 16) | (u32(color.b) << 24) | (u32(color.a) << 0);
	}
	else { panic("Invalid enum value"); }
}
