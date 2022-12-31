
package main

import "core:math"
import "core:intrinsics"

// +--------------------------------------------------------------+
// |                      Intrinsic Aliases                       |
// +--------------------------------------------------------------+
// +==============================+
// |             Abs              |
// +==============================+
AbsF16  :: #force_inline proc(value: f16) -> f16 { return abs(value); }
AbsF32  :: #force_inline proc(value: f32) -> f32 { return abs(value); }
AbsF64  :: #force_inline proc(value: f64) -> f64 { return abs(value); }
AbsI8   :: #force_inline proc(value: i8)  -> i8  { return abs(value); }
AbsI16  :: #force_inline proc(value: i16) -> i16 { return abs(value); }
AbsI32  :: #force_inline proc(value: i32) -> i32 { return abs(value); }
AbsI64  :: #force_inline proc(value: i64) -> i64 { return abs(value); }

// +==============================+
// |            Round             |
// +==============================+
RoundF16  :: #force_inline proc(value: f16) -> f16 { return math.round(value); }
RoundF32  :: #force_inline proc(value: f32) -> f32 { return math.round(value); }
RoundF64  :: #force_inline proc(value: f64) -> f64 { return math.round(value); }
RoundF32i :: #force_inline proc(value: f32) -> i32 { return i32(math.round(value)); }
RoundF64i :: #force_inline proc(value: f64) -> i64 { return i64(math.round(value)); }

// +==============================+
// |            Floor             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Ceil             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |            CeilTo            |
// +==============================+
//TODO: Implement me!

// +==============================+
// |           CeilDiv            |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Sin              |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Cos              |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Tan              |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Asin             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Acos             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Atan             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Saw              |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Pow              |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Log              |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Sqrt             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Cbrt             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Sign             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Rand             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |            Clamp             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Lerp             |
// +==============================+
//TODO: Implement me!

// +==============================+
// |         DecimalPart          |
// +==============================+
//TODO: Implement me!

// +==============================+
// |             Mod              |
// +==============================+
//TODO: Implement me!

// +--------------------------------------------------------------+
// |                       My Own Functions                       |
// +--------------------------------------------------------------+
// +================================+
// | Primitive Conversion Functions |
// +================================+
ClampI32toU8 :: #force_inline proc(value: i32) -> u8
{
	return ((value >= 255) ? 255 : ((value < 0) ? 0 : u8(value)));
}

// +==============================+
// |         ColorChannel         |
// +==============================+
ColorChannelToU8 :: #force_inline proc(valueF32: f32) -> u8
{
	return ClampI32toU8(RoundF32i(valueF32 * 255.0));
}
ColorChannelToF32 :: #force_inline proc(valueU8: u8) -> f32
{
	return f32(valueU8) / 255.0;
}
MultiplyColorChannelU8 :: #force_inline proc(left, right: u8) -> u8
{
	return ColorChannelToU8(ColorChannelToF32(left) * ColorChannelToF32(right));
}
MultiplyColorChannelF32 :: #force_inline proc(left: u8, rightF32: f32) -> u8
{
	return ColorChannelToU8(ColorChannelToF32(left) * rightF32);
}

// +==============================+
// |      ConvertSampleXToY       |
// +==============================+
//TODO: Implement me!

// +==============================+
// |        BasicallyEqual        |
// +==============================+
BasicallyEqual :: proc(left, right: $FloatType) -> bool where intrinsics.type_is_float(FloatType)
{
	when (FloatType == f16)
	{
		return (AbsF16(left - right) <= math.F16_EPSILON);
	}
	else when (FloatType == f32)
	{
		return (AbsF32(left - right) <= math.F32_EPSILON);
	}
	else when (FloatType == f64)
	{
		return (AbsF64(left - right) <= math.F64_EPSILON);
	}
	else { #panic("unsupported float type"); }
}

// +==============================+
// |        SubAnimAmount         |
// +==============================+
SubAnimAmount :: proc(animAmount, start, end: $FloatType) -> FloatType where intrinsics.type_is_float(FloatType)
{
	return math.clamp((animAmount - start) / (end - start), 0.0, 1.0);
}

// +==============================+
// |    AngleFix and AngleDiff    |
// +==============================+
// also AngleOpposite, AngleFlipVertical, AngleFlipHorizontal, and AngleLerp
//TODO: Implement me!

// +==============================+
// |          Oscillate           |
// +==============================+
OscillateBy64 :: proc(timeSource: u64, min: f64, max: f64, periodMs: u64, offset: u64 = 0) -> f64
{
	lerpValue := (math.sin_f64((cast(f64)((timeSource + offset) % periodMs) / cast(f64)periodMs) * TwoPi64) + 1.0) / 2.0;
	return min + (max - min) * lerpValue;
}
OscillateBy32 :: proc(timeSource: u64, min: f32, max: f32, periodMs: u64, offset: u64 = 0) -> f32
{
	lerpValue := (math.sin_f32((cast(f32)((timeSource + offset) % periodMs) / cast(f32)periodMs) * TwoPi32) + 1.0) / 2.0;
	return min + (max - min) * lerpValue;
}

// +==============================+
// |          FlagsDiff           |
// +==============================+
//TODO: Implement me!

// +==============================+
// |           AbsDiff            |
// +==============================+
//TODO: Implement me!

// +==============================+
// |          IsInfinite          |
// +==============================+
//TODO: Implement me!

// +==============================+
// |          RoundUpTo           |
// +==============================+
//TODO: Implement me!

// +==============================+
// |          IsInfinite          |
// +==============================+
//TODO: Implement me!

//TODO: Are there any threading intrinsic functions we want to alias here?
