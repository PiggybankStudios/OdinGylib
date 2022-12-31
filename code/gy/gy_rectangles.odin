
package main

import "core:intrinsics"
import "core:math"
import "core:math/linalg"

// +--------------------------------------------------------------+
// |                            Types                             |
// +--------------------------------------------------------------+
Rectangle_Vec_t :: struct
{
    topLeft: v2,
    size: v2,
}
Rectangle_Float_t :: struct
{
    x, y, width, height: f32,
}
Rectangle_t :: struct #raw_union
{
    using vectors : Rectangle_Vec_t,
    using floats : Rectangle_Float_t,
}
rec :: Rectangle_t;

Rectanglei_Vec_t :: struct
{
    topLeft: v2i,
    size: v2i,
}
Rectanglei_Int_t :: struct
{
    x, y, width, height: i32,
}
Rectanglei_t :: struct #raw_union
{
    using vectors : Rectanglei_Vec_t,
    using ints : Rectanglei_Int_t,
}
reci :: Rectanglei_t;

// +--------------------------------------------------------------+
// |               Simple Value Definitions and New               |
// +--------------------------------------------------------------+
Rec_Zero :: rec{};
Rec_Default := rec{ floats={0, 0, 1, 1} };

Reci_Zero :: reci{};
Reci_Default := reci{ ints={0, 0, 1, 1} };

NewRec_floats :: #force_inline proc(x, y, width, height: f32) -> rec
{
	return rec{floats={ x, y, width, height }};
}
NewRec_vecfloat :: #force_inline proc(topLeft: v2, width, height: f32) -> rec
{
	return rec{floats={ topLeft.x, topLeft.y, width, height }};
}
NewRec_floatvec :: #force_inline proc(x, y: f32, size: v2) -> rec
{
	return rec{floats={ x, y, size.x, size.y }};
}
NewRec_vecs :: #force_inline proc(topLeft, size: v2) -> rec
{
	return rec{vectors={ topLeft, size }};
}
NewRec :: proc { NewRec_floats, NewRec_vecfloat, NewRec_floatvec, NewRec_vecs };

NewReci_ints :: #force_inline proc(x, y, width, height: i32) -> reci
{
	return reci{ints={ x, y, width, height }};
}
NewReci_vecint :: #force_inline proc(topLeft: v2i, width, height: i32) -> reci
{
	return reci{ints={ topLeft.x, topLeft.y, width, height }};
}
NewReci_intvec :: #force_inline proc(x, y: i32, size: v2i) -> reci
{
	return reci{ints={ x, y, size.x, size.y }};
}
NewReci_vecs :: #force_inline proc(topLeft, size: v2i) -> reci
{
	return reci{vectors={ topLeft, size }};
}
NewReci :: proc { NewReci_ints, NewReci_vecint, NewReci_intvec, NewReci_vecs };

// +--------------------------------------------------------------+
// |                   Derived Values Functions                   |
// +--------------------------------------------------------------+
RecfWidth       :: proc(rectangle: rec) -> f32 { return rectangle.size.x; }
RecfHeight      :: proc(rectangle: rec) -> f32 { return rectangle.size.y; }
RecfBottomRight :: proc(rectangle: rec) -> v2  { return rectangle.topLeft + rectangle.size; }
RecfTopRight    :: proc(rectangle: rec) -> v2  { return rectangle.topLeft + {rectangle.size.x, 0}; }
RecfBottomLeft  :: proc(rectangle: rec) -> v2  { return rectangle.topLeft + {0, rectangle.size.y}; }

ReciWidth       :: proc(rectangle: reci) -> i32 { return rectangle.size.y; }
ReciHeight      :: proc(rectangle: reci) -> i32 { return rectangle.size.y; }
ReciBottomRight :: proc(rectangle: reci) -> v2i { return rectangle.topLeft + rectangle.size; }
ReciTopRight    :: proc(rectangle: reci) -> v2i { return rectangle.topLeft + {rectangle.size.x, 0}; }
ReciBottomLeft  :: proc(rectangle: reci) -> v2i { return rectangle.topLeft + {0, rectangle.size.y}; }

RecWidth       :: proc { RecfWidth,       ReciWidth       };
RecHeight      :: proc { RecfHeight,      ReciHeight      };
RecBottomRight :: proc { RecfBottomRight, ReciBottomRight };
RecTopRight    :: proc { RecfTopRight,    ReciTopRight    };
RecBottomLeft  :: proc { RecfBottomLeft,  ReciBottomLeft  };

// +--------------------------------------------------------------+
// |                Operator Overload Equivalents                 |
// +--------------------------------------------------------------+
RecfShift :: proc(rectangle: rec, offset: $T) -> rec
	where intrinsics.type_is_array(T), len(T) == 2, intrinsics.type_is_numeric(intrinsics.type_elem_type(T))
{
	return NewRec(rectangle.topLeft + ToVec2(offset), rectangle.size);
}
ReciShift :: proc(rectangle: reci, offset: v2i) -> reci
{
	return NewReci(rectangle.topLeft + offset, rectangle.size);
}
RecShift :: proc { RecfShift, ReciShift };

RecScale :: proc(rectangle: rec, scalar: f32) -> rec
{
	return NewRec(rectangle.topLeft * scalar, rectangle.size * scalar);
}
RecScale2 :: proc(rectangle: rec, vector: v2) -> rec
{
	return NewRec(rectangle.topLeft * vector, rectangle.size * vector);
}
RecBasicallyEqual :: proc(left, right: rec) -> bool
{
	return (
		BasicallyEqual(left.x, right.x) &&
		BasicallyEqual(left.y, right.y) &&
		BasicallyEqual(left.size.x, right.size.x) &&
		BasicallyEqual(left.size.y, right.size.y)
	);
}

// +--------------------------------------------------------------+
// |                       Math Operations                        |
// +--------------------------------------------------------------+
// +==============================+
// |            Invert            |
// +==============================+
RecfInvert :: proc(rectangle: rec) -> rec
{
	return NewRec(rectangle.topLeft, -rectangle.size);
}
ReciInvert :: proc(rectangle: reci) -> reci
{
	return NewReci(rectangle.topLeft, -rectangle.size);
}
RecInvert :: proc { RecfInvert, ReciInvert };

// +==============================+
// |           InvertX            |
// +==============================+
RecfInvertX :: proc(rectangle: rec) -> rec
{
	return NewRec(rectangle.topLeft, -rectangle.size.x, rectangle.size.y);
}
ReciInvertX :: proc(rectangle: reci) -> reci
{
	return NewReci(rectangle.topLeft, -rectangle.size.x, rectangle.size.y);
}
RecInvertX :: proc { RecfInvertX, ReciInvertX };

// +==============================+
// |           InvertY            |
// +==============================+
RecfInvertY :: proc(rectangle: rec) -> rec
{
	return NewRec(rectangle.topLeft, rectangle.size.x, -rectangle.size.y);
}
ReciInvertY :: proc(rectangle: reci) -> reci
{
	return NewReci(rectangle.topLeft, rectangle.size.x, -rectangle.size.y);
}
RecInvertY :: proc { RecfInvertY, ReciInvertY };

// +==============================+
// |           Uninvert           |
// +==============================+
RecfUninvert :: proc(rectangle: rec) -> rec
{
	return NewRec(
		Vec2Min(rectangle.topLeft, rectangle.topLeft + rectangle.size),
		Vec2Abs(rectangle.size),
	);
}
ReciUninvert :: proc(rectangle: reci) -> reci
{
	return NewReci(
		Vec2iMin(rectangle.topLeft, rectangle.topLeft + rectangle.size),
		Vec2iAbs(rectangle.size),
	);
}
RecUninvert :: proc { RecfUninvert, ReciUninvert };

// +==============================+
// |           Squarify           |
// +==============================+
RecfSquarify :: proc(rectangle: rec, makeLarger: bool = true, center: bool = true) -> (result: rec)
{
	newSize := (makeLarger ? max(rectangle.size.x, rectangle.size.y) : min(rectangle.size.x, rectangle.size.y));
	result.x = rectangle.x - (center ? (newSize - rectangle.size.x)/2 : 0);
	result.y = rectangle.y - (center ? (newSize - rectangle.size.y)/2 : 0);
	result.size.x = newSize;
	result.size.y = newSize;
	return result;
}
ReciSquarify :: proc(rectangle: reci, makeLarger: bool = true, center: bool = true) -> (result: reci)
{
	newSize := (makeLarger ? max(rectangle.size.x, rectangle.size.y) : min(rectangle.size.x, rectangle.size.y));
	result.x = rectangle.x - (center ? (newSize - rectangle.size.x)/2 : 0);
	result.y = rectangle.y - (center ? (newSize - rectangle.size.y)/2 : 0);
	result.size.x = newSize;
	result.size.y = newSize;
	return result;
}
RecSquarify :: proc { RecfSquarify, ReciSquarify };

// +--------------------------------------------------------------+
// |                         Intersection                         |
// +--------------------------------------------------------------+
// +==============================+
// |        RecsIntersect         |
// +==============================+
RecsfIntersect :: proc(left, right: rec, inclusive: bool = false) -> bool
{
	if (inclusive)
	{
		if (left.x >= right.x + right.size.x) { return false; }
		if (left.y >= right.y + right.size.y) { return false; }
		if (left.x + left.size.x <= right.x) { return false; }
		if (left.y + left.size.y <= right.y) { return false; }
	}
	else
	{
		if (left.x > right.x + right.size.x) { return false; }
		if (left.y > right.y + right.size.y) { return false; }
		if (left.x + left.size.x < right.x) { return false; }
		if (left.y + left.size.y < right.y) { return false; }
	}
	return true;
}
RecsiIntersect :: proc(left, right: reci, inclusive: bool = false) -> bool
{
	if (inclusive)
	{
		if (left.x >= right.x + right.size.x) { return false; }
		if (left.y >= right.y + right.size.y) { return false; }
		if (left.x + left.size.x <= right.x) { return false; }
		if (left.y + left.size.y <= right.y) { return false; }
	}
	else
	{
		if (left.x > right.x + right.size.x) { return false; }
		if (left.y > right.y + right.size.y) { return false; }
		if (left.x + left.size.x < right.x) { return false; }
		if (left.y + left.size.y < right.y) { return false; }
	}
	return true;
}
RecsIntersect :: proc { RecsfIntersect, RecsiIntersect };

// +==============================+
// |             Both             |
// +==============================+
RecfBoth :: proc(left, right: rec) -> rec
{
	return NewRec(
		min(left.x, right.x),
		min(left.y, right.y),
		min(left.x + left.size.x, right.x + right.size.x),
		min(left.y + left.size.y, right.y + right.size.y),
	);
}
ReciBoth :: proc(left, right: reci) -> reci
{
	return NewReci(
		min(left.x, right.x),
		min(left.y, right.y),
		min(left.x + left.size.x, right.x + right.size.x),
		min(left.y + left.size.y, right.y + right.size.y),
	);
}
RecBoth :: proc { RecfBoth, ReciBoth };

// +==============================+
// |           Overlap            |
// +==============================+
RecfOverlap :: proc(left, right: rec) -> rec
{
	topLeft := Vec2Max(left.topLeft, right.topLeft);
	bottomRight := Vec2Min(left.topLeft + left.size, right.topLeft + right.size);
	return NewRec(
		topLeft,
		bottomRight - topLeft,
	);
}
ReciOverlap :: proc(left, right: reci) -> reci
{
	topLeft := Vec2iMax(left.topLeft, right.topLeft);
	bottomRight := Vec2iMin(left.topLeft + left.size, right.topLeft + right.size);
	return NewReci(
		topLeft,
		bottomRight - topLeft,
	);
}
RecOverlap :: proc { RecfOverlap, ReciOverlap };

// +==============================+
// |         ExpandToVec2         |
// +==============================+
RecfExpandToVec2 :: proc(rectangle: rec, vector: v2) -> rec
{
	return NewRec(
		Vec2Min(rectangle.topLeft, vector),
		Vec2Max(rectangle.topLeft + rectangle.size, vector),
	);
}
ReciExpandToVec2i :: proc(rectangle: reci, vector: v2i) -> reci
{
	return NewReci(
		Vec2iMin(rectangle.topLeft, vector),
		Vec2iMax(rectangle.topLeft + rectangle.size, vector),
	);
}
RecExpandToVec2 :: proc { RecfExpandToVec2, ReciExpandToVec2i };

// +==============================+
// |           IsInside           |
// +==============================+
IsInsideRecf :: proc(rectangle: rec, point: $T) -> bool
	where intrinsics.type_is_array(T), len(T) == 2, intrinsics.type_is_numeric(intrinsics.type_elem_type(T))
{
	if (f32(point.x) < rectangle.x) { return false; }
	if (f32(point.y) < rectangle.y) { return false; }
	if (f32(point.x) >= rectangle.x + rectangle.size.x) { return false; }
	if (f32(point.y) >= rectangle.y + rectangle.size.y) { return false; }
	return true;
}
IsInsideReci :: proc(rectangle: reci, point: $T) -> bool
	where intrinsics.type_is_array(T), len(T) == 2, intrinsics.type_is_numeric(intrinsics.type_elem_type(T))
{
	when (intrinsics.type_is_float(intrinsics.type_elem_type(T)))
	{
		if (point.x < f32(rectangle.x)) { return false; }
		if (point.y < f32(rectangle.y)) { return false; }
		if (point.x >= f32(rectangle.x + rectangle.size.x)) { return false; }
		if (point.y >= f32(rectangle.y + rectangle.size.y)) { return false; }
	}
	else
	{
		if (point.x < i32(rectangle.x)) { return false; }
		if (point.y < i32(rectangle.y)) { return false; }
		if (point.x >= i32(rectangle.x + rectangle.size.x)) { return false; }
		if (point.y >= i32(rectangle.y + rectangle.size.y)) { return false; }
	}
	return true;
}
IsInsideRec :: proc { IsInsideRecf, IsInsideReci };
