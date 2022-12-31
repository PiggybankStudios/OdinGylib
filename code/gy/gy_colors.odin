
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
TransparentBlack :: Color_t{ 0,   0,   0,   0   };
Transparent      :: Color_t{ 255, 255, 255, 0   };
TransparentWhite :: Color_t{ 255, 255, 255, 0   };

NewColor_rgb_u8 :: #force_inline proc(r, g, b: u8) -> Color_t
{
	return Color_t{ r, g, b, 255 };
}
NewColor_rgba_u8 :: #force_inline proc(r, g, b, a: u8) -> Color_t
{
	return Color_t{ r, g, b, a };
}
NewColor_rgb_float :: #force_inline proc(r, g, b: f32) -> Color_t
{
	return Color_t{
		ColorChannelToU8(r),
		ColorChannelToU8(g),
		ColorChannelToU8(b),
		255,
	};
}
NewColor_rgba_float :: #force_inline proc(r, g, b, a: f32) -> Color_t
{
	return Color_t{
		ColorChannelToU8(r),
		ColorChannelToU8(g),
		ColorChannelToU8(b),
		ColorChannelToU8(a),
	};
}
NewColor_u32 :: #force_inline proc(value: u32, order: ColorChannelOrder_t = .Bgra) -> Color_t
{
	if (order == .Bgra)
	{
		return Color_t{
			u8((value & 0x00FF0000) >> 16), //r
			u8((value & 0x0000FF00) >>  8), //g
			u8((value & 0x000000FF) >>  0), //b
			u8((value & 0xFF000000) >> 24), //a
		};
	}
	else if (order == .Rgba)
	{
		return Color_t{
			u8((value & 0x000000FF) >>  0), //r
			u8((value & 0x0000FF00) >>  8), //g
			u8((value & 0x00FF0000) >> 16), //b
			u8((value & 0xFF000000) >> 24), //a
		};
	}
	else if (order == .Argb)
	{
		return Color_t{
			u8((value & 0x0000FF00) >>  8), //r
			u8((value & 0x00FF0000) >> 16), //g
			u8((value & 0xFF000000) >> 24), //b
			u8((value & 0x000000FF) >>  0), //a
		};
	}
	else { panic("Invalid enum value for order in NewColor_u32"); }
}
NewColor :: proc { NewColor_rgb_u8, NewColor_rgba_u8, NewColor_rgb_float, NewColor_rgba_float, NewColor_u32 };

ColorTransparent_White :: proc(alpha: f32) -> Color_t
{
	return NewColor(1.0, 1.0, 1.0, alpha);
}
ColorTransparent_FromColor :: proc(color: Color_t, alpha: f32) -> Color_t
{
	return NewColor(color.r, color.g, color.b, ColorChannelToU8(alpha));
}
ColorTransparent :: proc { ColorTransparent_White, ColorTransparent_FromColor };

// +--------------------------------------------------------------+
// |                   Derived Values Functions                   |
// +--------------------------------------------------------------+
GetColorValueU32 :: proc(color: Color_t, order: ColorChannelOrder_t = .Bgra) -> u32
{
	if (order == .Bgra)
	{
		return (u32(color.r) << 16) | (u32(color.g) << 8) | (u32(color.b) << 0) | (u32(color.a) << 24);
	}
	else if (order == .Rgba)
	{
		return (u32(color.r) << 0) | (u32(color.g) << 8) | (u32(color.b) << 16) | (u32(color.a) << 24);
	}
	else if (order == .Argb)
	{
		return (u32(color.r) << 8) | (u32(color.g) << 16) | (u32(color.b) << 24) | (u32(color.a) << 0);
	}
	else { panic("Invalid enum value for order in GetColorValueU32"); }
}
