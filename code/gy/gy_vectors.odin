
package main

import "core:intrinsics"
import "core:math"
import "core:math/linalg"

// +--------------------------------------------------------------+
// |                            Types                             |
// +--------------------------------------------------------------+
// +==============================+
// |             Vec2             |
// +==============================+
Vec2 :: [2]f32;
v2 :: Vec2;

Vec2d :: [2]f64;
v2d :: Vec2d;

Vec2i :: [2]i32;
v2i :: Vec2i;

Vec2l :: [2]i64;
v2l :: Vec2l;

// +==============================+
// |             Vec3             |
// +==============================+
Vec3 :: [3]f32;
v3 :: Vec3;

Vec3d :: [3]f64;
v3d :: Vec3d;

Vec3i :: [3]i32;
v3i :: Vec3i;

Vec3l :: [3]i64;
v3l :: Vec3l;

// +==============================+
// |             Vec4             |
// +==============================+
Vec4 :: [4]f32;
v4 :: Vec4;

Vec4d :: [4]f64;
v4d :: Vec4d;

Vec4i :: [4]i32;
v4i :: Vec4i;

Vec4l :: [4]i64;
v4l :: Vec4l;

// +--------------------------------------------------------------+
// |                   Simple Value Definitions                   |
// +--------------------------------------------------------------+
Vec2_Zero  :: v2{ 0.0, 0.0 };
Vec2_One   :: v2{ 1.0, 1.0 };
Vec2_Half  :: v2{ 0.5, 0.5 };
Vec2_Left  :: v2{-1.0, 0.0 };
Vec2_Right :: v2{ 1.0, 0.0 };
Vec2_Up    :: v2{ 0.0,-1.0 };
Vec2_Down  :: v2{ 0.0, 1.0 };

Vec2d_Zero  :: v2d{ 0.0, 0.0 };
Vec2d_One   :: v2d{ 1.0, 1.0 };
Vec2d_Half  :: v2d{ 0.5, 0.5 };
Vec2d_Left  :: v2d{-1.0, 0.0 };
Vec2d_Right :: v2d{ 1.0, 0.0 };
Vec2d_Up    :: v2d{ 0.0,-1.0 };
Vec2d_Down  :: v2d{ 0.0, 1.0 };

Vec2i_Zero  :: v2i{ 0, 0 };
Vec2i_One   :: v2i{ 1, 1 };
Vec2i_Left  :: v2i{-1, 0 };
Vec2i_Right :: v2i{ 1, 0 };
Vec2i_Up    :: v2i{ 0,-1 };
Vec2i_Down  :: v2i{ 0, 1 };

Vec2l_Zero  :: v2l{ 0, 0 };
Vec2l_One   :: v2l{ 1, 1 };
Vec2l_Left  :: v2l{-1, 0 };
Vec2l_Right :: v2l{ 1, 0 };
Vec2l_Up    :: v2l{ 0,-1 };
Vec2l_Down  :: v2l{ 0, 1 };

Vec3_Zero     :: v3{ 0.0, 0.0, 0.0 };
Vec3_One      :: v3{ 1.0, 1.0, 1.0 };
Vec3_Half     :: v3{ 0.5, 0.5, 0.5 };
Vec3_Left     :: v3{-1.0, 0.0, 0.0 };
Vec3_Right    :: v3{ 1.0, 0.0, 0.0 };
Vec3_Up       :: v3{ 0.0, 1.0, 0.0 };
Vec3_Down     :: v3{ 0.0,-1.0, 0.0 };
Vec3_Forward  :: v3{ 0.0, 0.0, 1.0 };
Vec3_Backward :: v3{ 0.0, 0.0,-1.0 };
Vec3_Top      :: v3{ 0.0, 1.0, 0.0 };
Vec3_Bottom   :: v3{ 0.0,-1.0, 0.0 };
Vec3_Front    :: v3{ 0.0, 0.0, 1.0 };
Vec3_Back     :: v3{ 0.0, 0.0,-1.0 };

Vec3d_Zero     :: v3d{ 0.0, 0.0, 0.0 };
Vec3d_One      :: v3d{ 1.0, 1.0, 1.0 };
Vec3d_Half     :: v3d{ 0.5, 0.5, 0.5 };
Vec3d_Left     :: v3d{-1.0, 0.0, 0.0 };
Vec3d_Right    :: v3d{ 1.0, 0.0, 0.0 };
Vec3d_Up       :: v3d{ 0.0, 1.0, 0.0 };
Vec3d_Down     :: v3d{ 0.0,-1.0, 0.0 };
Vec3d_Forward  :: v3d{ 0.0, 0.0, 1.0 };
Vec3d_Backward :: v3d{ 0.0, 0.0,-1.0 };
Vec3d_Top      :: v3d{ 0.0, 1.0, 0.0 };
Vec3d_Bottom   :: v3d{ 0.0,-1.0, 0.0 };
Vec3d_Front    :: v3d{ 0.0, 0.0, 1.0 };
Vec3d_Back     :: v3d{ 0.0, 0.0,-1.0 };

Vec3i_Zero     :: v3i{ 0, 0, 0 };
Vec3i_One      :: v3i{ 1, 1, 1 };
Vec3i_Left     :: v3i{-1, 0, 0 };
Vec3i_Right    :: v3i{ 1, 0, 0 };
Vec3i_Up       :: v3i{ 0, 1, 0 };
Vec3i_Down     :: v3i{ 0,-1, 0 };
Vec3i_Forward  :: v3i{ 0, 0, 1 };
Vec3i_Backward :: v3i{ 0, 0,-1 };
Vec3i_Top      :: v3i{ 0, 1, 0 };
Vec3i_Bottom   :: v3i{ 0,-1, 0 };
Vec3i_Front    :: v3i{ 0, 0, 1 };
Vec3i_Back     :: v3i{ 0, 0,-1 };

Vec3l_Zero     :: v3l{ 0, 0, 0 };
Vec3l_One      :: v3l{ 1, 1, 1 };
Vec3l_Left     :: v3l{-1, 0, 0 };
Vec3l_Right    :: v3l{ 1, 0, 0 };
Vec3l_Up       :: v3l{ 0, 1, 0 };
Vec3l_Down     :: v3l{ 0,-1, 0 };
Vec3l_Forward  :: v3l{ 0, 0, 1 };
Vec3l_Backward :: v3l{ 0, 0,-1 };
Vec3l_Top      :: v3l{ 0, 1, 0 };
Vec3l_Bottom   :: v3l{ 0,-1, 0 };
Vec3l_Front    :: v3l{ 0, 0, 1 };
Vec3l_Back     :: v3l{ 0, 0,-1 };

Vec4_Zero     :: v4{ 0.0, 0.0, 0.0, 0.0 };
Vec4_One      :: v4{ 1.0, 1.0, 1.0, 1.0 };
Vec4_Half     :: v4{ 0.5, 0.5, 0.5, 0.5 };
Vec4_Left     :: v4{-1.0, 0.0, 0.0, 0.0 };
Vec4_Right    :: v4{ 1.0, 0.0, 0.0, 0.0 };
Vec4_Up       :: v4{ 0.0, 1.0, 0.0, 0.0 };
Vec4_Down     :: v4{ 0.0,-1.0, 0.0, 0.0 };
Vec4_Forward  :: v4{ 0.0, 0.0, 1.0, 0.0 };
Vec4_Backward :: v4{ 0.0, 0.0,-1.0, 0.0 };
Vec4_Top      :: v4{ 0.0, 1.0, 0.0, 0.0 };
Vec4_Bottom   :: v4{ 0.0,-1.0, 0.0, 0.0 };
Vec4_Front    :: v4{ 0.0, 0.0, 1.0, 0.0 };
Vec4_Back     :: v4{ 0.0, 0.0,-1.0, 0.0 };
Vec4_Next     :: v4{ 0.0, 0.0, 0.0, 1.0 };
Vec4_Previous :: v4{ 0.0, 0.0, 0.0,-1.0 };

Vec4d_Zero     :: v4d{ 0.0, 0.0, 0.0, 0.0 };
Vec4d_One      :: v4d{ 1.0, 1.0, 1.0, 1.0 };
Vec4d_Half     :: v4d{ 0.5, 0.5, 0.5, 0.5 };
Vec4d_Left     :: v4d{-1.0, 0.0, 0.0, 0.0 };
Vec4d_Right    :: v4d{ 1.0, 0.0, 0.0, 0.0 };
Vec4d_Up       :: v4d{ 0.0, 1.0, 0.0, 0.0 };
Vec4d_Down     :: v4d{ 0.0,-1.0, 0.0, 0.0 };
Vec4d_Forward  :: v4d{ 0.0, 0.0, 1.0, 0.0 };
Vec4d_Backward :: v4d{ 0.0, 0.0,-1.0, 0.0 };
Vec4d_Top      :: v4d{ 0.0, 1.0, 0.0, 0.0 };
Vec4d_Bottom   :: v4d{ 0.0,-1.0, 0.0, 0.0 };
Vec4d_Front    :: v4d{ 0.0, 0.0, 1.0, 0.0 };
Vec4d_Back     :: v4d{ 0.0, 0.0,-1.0, 0.0 };
Vec4d_Next     :: v4d{ 0.0, 0.0, 0.0, 1.0 };
Vec4d_Previous :: v4d{ 0.0, 0.0, 0.0,-1.0 };

Vec4i_Zero     :: v4i{ 0, 0, 0, 0 };
Vec4i_One      :: v4i{ 1, 1, 1, 1 };
Vec4i_Left     :: v4i{-1, 0, 0, 0 };
Vec4i_Right    :: v4i{ 1, 0, 0, 0 };
Vec4i_Up       :: v4i{ 0, 1, 0, 0 };
Vec4i_Down     :: v4i{ 0,-1, 0, 0 };
Vec4i_Forward  :: v4i{ 0, 0, 1, 0 };
Vec4i_Backward :: v4i{ 0, 0,-1, 0 };
Vec4i_Top      :: v4i{ 0, 1, 0, 0 };
Vec4i_Bottom   :: v4i{ 0,-1, 0, 0 };
Vec4i_Front    :: v4i{ 0, 0, 1, 0 };
Vec4i_Back     :: v4i{ 0, 0,-1, 0 };
Vec4i_Next     :: v4i{ 0, 0, 0, 1 };
Vec4i_Previous :: v4i{ 0, 0, 0,-1 };

Vec4l_Zero     :: v4l{ 0, 0, 0, 0 };
Vec4l_One      :: v4l{ 1, 1, 1, 1 };
Vec4l_Left     :: v4l{-1, 0, 0, 0 };
Vec4l_Right    :: v4l{ 1, 0, 0, 0 };
Vec4l_Up       :: v4l{ 0, 1, 0, 0 };
Vec4l_Down     :: v4l{ 0,-1, 0, 0 };
Vec4l_Forward  :: v4l{ 0, 0, 1, 0 };
Vec4l_Backward :: v4l{ 0, 0,-1, 0 };
Vec4l_Top      :: v4l{ 0, 1, 0, 0 };
Vec4l_Bottom   :: v4l{ 0,-1, 0, 0 };
Vec4l_Front    :: v4l{ 0, 0, 1, 0 };
Vec4l_Back     :: v4l{ 0, 0,-1, 0 };
Vec4l_Next     :: v4l{ 0, 0, 0, 1 };
Vec4l_Previous :: v4l{ 0, 0, 0,-1 };

NewVec2  :: #force_inline proc(x, y: f32) -> v2  { return {x, y}; }
NewVec2d :: #force_inline proc(x, y: f64) -> v2d { return {x, y}; }
NewVec2i :: #force_inline proc(x, y: i32) -> v2i { return {x, y}; }
NewVec2l :: #force_inline proc(x, y: i64) -> v2l { return {x, y}; }

NewVec3  :: #force_inline proc(x, y, z: f32) -> v3  { return {x, y, z}; }
NewVec3d :: #force_inline proc(x, y, z: f64) -> v3d { return {x, y, z}; }
NewVec3i :: #force_inline proc(x, y, z: i32) -> v3i { return {x, y, z}; }
NewVec3l :: #force_inline proc(x, y, z: i64) -> v3l { return {x, y, z}; }

NewVec4  :: #force_inline proc(x, y, z, w: f32) -> v4  { return {x, y, z, w}; }
NewVec4d :: #force_inline proc(x, y, z, w: f64) -> v4d { return {x, y, z, w}; }
NewVec4i :: #force_inline proc(x, y, z, w: i32) -> v4i { return {x, y, z, w}; }
NewVec4l :: #force_inline proc(x, y, z, w: i64) -> v4l { return {x, y, z, w}; }

// +--------------------------------------------------------------+
// |                     Conversion Functions                     |
// +--------------------------------------------------------------+
ToVec2  :: #force_inline proc(vector: $VecType/[2]$ElemType) -> v2  { return linalg.to_f32(vector); }
ToVec2d :: #force_inline proc(vector: $VecType/[2]$ElemType) -> v2d { return linalg.to_f64(vector); }
ToVec2i :: #force_inline proc(vector: $VecType/[2]$ElemType) -> v2i { return linalg.to_i32(vector); }
ToVec2l :: #force_inline proc(vector: $VecType/[2]$ElemType) -> v2l { return linalg.to_i64(vector); }
ToVec3  :: #force_inline proc(vector: $VecType/[3]$ElemType) -> v3  { return linalg.to_f32(vector); }
ToVec3d :: #force_inline proc(vector: $VecType/[3]$ElemType) -> v3d { return linalg.to_f64(vector); }
ToVec3i :: #force_inline proc(vector: $VecType/[3]$ElemType) -> v3i { return linalg.to_i32(vector); }
ToVec3l :: #force_inline proc(vector: $VecType/[3]$ElemType) -> v3l { return linalg.to_i64(vector); }
ToVec4  :: #force_inline proc(vector: $VecType/[4]$ElemType) -> v4  { return linalg.to_f32(vector); }
ToVec4d :: #force_inline proc(vector: $VecType/[4]$ElemType) -> v4d { return linalg.to_f64(vector); }
ToVec4i :: #force_inline proc(vector: $VecType/[4]$ElemType) -> v4i { return linalg.to_i32(vector); }
ToVec4l :: #force_inline proc(vector: $VecType/[4]$ElemType) -> v4l { return linalg.to_i64(vector); }

// +==============================+
// |             Fill             |
// +==============================+
// In Odin fixed size array being assigned to a value is a shorthand for filling all elements with the value
Vec2Fill  :: #force_inline proc(value: f32) -> v2  { result: v2  = value; return result; }
Vec2dFill :: #force_inline proc(value: f64) -> v2d { result: v2d = value; return result; }
Vec2iFill :: #force_inline proc(value: i32) -> v2i { result: v2i = value; return result; }
Vec2lFill :: #force_inline proc(value: i64) -> v2l { result: v2l = value; return result; }
Vec3Fill  :: #force_inline proc(value: f32) -> v3  { result: v3  = value; return result; }
Vec3dFill :: #force_inline proc(value: f64) -> v3d { result: v3d = value; return result; }
Vec3iFill :: #force_inline proc(value: i32) -> v3i { result: v3i = value; return result; }
Vec3lFill :: #force_inline proc(value: i64) -> v3l { result: v3l = value; return result; }
Vec4Fill  :: #force_inline proc(value: f32) -> v4  { result: v4  = value; return result; }
Vec4dFill :: #force_inline proc(value: f64) -> v4d { result: v4d = value; return result; }
Vec4iFill :: #force_inline proc(value: i32) -> v4i { result: v4i = value; return result; }
Vec4lFill :: #force_inline proc(value: i64) -> v4l { result: v4l = value; return result; }

// +--------------------------------------------------------------+
// |                Operator Overload Equivalents                 |
// +--------------------------------------------------------------+
// +==============================+
// |             Add              |
// +==============================+
Vec2Add  :: #force_inline proc(left, right: v2)  -> v2  { return left + right; }
Vec2dAdd :: #force_inline proc(left, right: v2d) -> v2d { return left + right; }
Vec2iAdd :: #force_inline proc(left, right: v2i) -> v2i { return left + right; }
Vec2lAdd :: #force_inline proc(left, right: v2l) -> v2l { return left + right; }
Vec3Add  :: #force_inline proc(left, right: v3)  -> v3  { return left + right; }
Vec3dAdd :: #force_inline proc(left, right: v3d) -> v3d { return left + right; }
Vec3iAdd :: #force_inline proc(left, right: v3i) -> v3i { return left + right; }
Vec3lAdd :: #force_inline proc(left, right: v3l) -> v3l { return left + right; }
Vec4Add  :: #force_inline proc(left, right: v4)  -> v4  { return left + right; }
Vec4dAdd :: #force_inline proc(left, right: v4d) -> v4d { return left + right; }
Vec4iAdd :: #force_inline proc(left, right: v4i) -> v4i { return left + right; }
Vec4lAdd :: #force_inline proc(left, right: v4l) -> v4l { return left + right; }
VecAdd :: proc { Vec2Add, Vec2dAdd, Vec2iAdd, Vec2lAdd, Vec3Add, Vec3dAdd, Vec3iAdd, Vec3lAdd, Vec4Add, Vec4dAdd, Vec4iAdd, Vec4lAdd }

// +==============================+
// |           Subtract           |
// +==============================+
Vec2Subtract  :: #force_inline proc(left, right: v2)  -> v2  { return left - right; }
Vec2dSubtract :: #force_inline proc(left, right: v2d) -> v2d { return left - right; }
Vec2iSubtract :: #force_inline proc(left, right: v2i) -> v2i { return left - right; }
Vec2lSubtract :: #force_inline proc(left, right: v2l) -> v2l { return left - right; }
Vec3Subtract  :: #force_inline proc(left, right: v3)  -> v3  { return left - right; }
Vec3dSubtract :: #force_inline proc(left, right: v3d) -> v3d { return left - right; }
Vec3iSubtract :: #force_inline proc(left, right: v3i) -> v3i { return left - right; }
Vec3lSubtract :: #force_inline proc(left, right: v3l) -> v3l { return left - right; }
Vec4Subtract  :: #force_inline proc(left, right: v4)  -> v4  { return left - right; }
Vec4dSubtract :: #force_inline proc(left, right: v4d) -> v4d { return left - right; }
Vec4iSubtract :: #force_inline proc(left, right: v4i) -> v4i { return left - right; }
Vec4lSubtract :: #force_inline proc(left, right: v4l) -> v4l { return left - right; }
VecSubtract :: proc { Vec2Subtract, Vec2dSubtract, Vec2iSubtract, Vec2lSubtract, Vec3Subtract, Vec3dSubtract, Vec3iSubtract, Vec3lSubtract, Vec4Subtract, Vec4dSubtract, Vec4iSubtract, Vec4lSubtract }

// +==============================+
// |           Multiply           |
// +==============================+
Vec2Multiply  :: #force_inline proc(left, right: v2)  -> v2  { return left * right; }
Vec2dMultiply :: #force_inline proc(left, right: v2d) -> v2d { return left * right; }
Vec2iMultiply :: #force_inline proc(left, right: v2i) -> v2i { return left * right; }
Vec2lMultiply :: #force_inline proc(left, right: v2l) -> v2l { return left * right; }
Vec3Multiply  :: #force_inline proc(left, right: v3)  -> v3  { return left * right; }
Vec3dMultiply :: #force_inline proc(left, right: v3d) -> v3d { return left * right; }
Vec3iMultiply :: #force_inline proc(left, right: v3i) -> v3i { return left * right; }
Vec3lMultiply :: #force_inline proc(left, right: v3l) -> v3l { return left * right; }
Vec4Multiply  :: #force_inline proc(left, right: v4)  -> v4  { return left * right; }
Vec4dMultiply :: #force_inline proc(left, right: v4d) -> v4d { return left * right; }
Vec4iMultiply :: #force_inline proc(left, right: v4i) -> v4i { return left * right; }
Vec4lMultiply :: #force_inline proc(left, right: v4l) -> v4l { return left * right; }
VecMultiply :: proc { Vec2Multiply, Vec2dMultiply, Vec2iMultiply, Vec2lMultiply, Vec3Multiply, Vec3dMultiply, Vec3iMultiply, Vec3lMultiply, Vec4Multiply, Vec4dMultiply, Vec4iMultiply, Vec4lMultiply }

// +==============================+
// |            Divide            |
// +==============================+
Vec2Divide  :: #force_inline proc(left, right: v2)  -> v2  { return left / right; }
Vec2dDivide :: #force_inline proc(left, right: v2d) -> v2d { return left / right; }
Vec2iDivide :: #force_inline proc(left, right: v2i) -> v2i { return left / right; }
Vec2lDivide :: #force_inline proc(left, right: v2l) -> v2l { return left / right; }
Vec3Divide  :: #force_inline proc(left, right: v3)  -> v3  { return left / right; }
Vec3dDivide :: #force_inline proc(left, right: v3d) -> v3d { return left / right; }
Vec3iDivide :: #force_inline proc(left, right: v3i) -> v3i { return left / right; }
Vec3lDivide :: #force_inline proc(left, right: v3l) -> v3l { return left / right; }
Vec4Divide  :: #force_inline proc(left, right: v4)  -> v4  { return left / right; }
Vec4dDivide :: #force_inline proc(left, right: v4d) -> v4d { return left / right; }
Vec4iDivide :: #force_inline proc(left, right: v4i) -> v4i { return left / right; }
Vec4lDivide :: #force_inline proc(left, right: v4l) -> v4l { return left / right; }
VecDivide :: proc { Vec2Divide, Vec2dDivide, Vec2iDivide, Vec2lDivide, Vec3Divide, Vec3dDivide, Vec3iDivide, Vec3lDivide, Vec4Divide, Vec4dDivide, Vec4iDivide, Vec4lDivide }

// +==============================+
// |        BasicallyEqual        |
// +==============================+
Vec2BasicallyEqual  :: #force_inline proc(left, right: v2)  -> bool { return (BasicallyEqual(left.x, right.x) && BasicallyEqual(left.y, right.y)); }
Vec2dBasicallyEqual :: #force_inline proc(left, right: v2d) -> bool { return (BasicallyEqual(left.x, right.x) && BasicallyEqual(left.y, right.y)); }
Vec2iBasicallyEqual :: #force_inline proc(left, right: v2i) -> bool { return (left == right); }
Vec2lBasicallyEqual :: #force_inline proc(left, right: v2l) -> bool { return (left == right); }
Vec3BasicallyEqual  :: #force_inline proc(left, right: v3)  -> bool { return (BasicallyEqual(left.x, right.x) && BasicallyEqual(left.y, right.y) && BasicallyEqual(left.z, right.z)); }
Vec3dBasicallyEqual :: #force_inline proc(left, right: v3d) -> bool { return (BasicallyEqual(left.x, right.x) && BasicallyEqual(left.y, right.y) && BasicallyEqual(left.z, right.z)); }
Vec3iBasicallyEqual :: #force_inline proc(left, right: v3i) -> bool { return (left == right); }
Vec3lBasicallyEqual :: #force_inline proc(left, right: v3l) -> bool { return (left == right); }
Vec4BasicallyEqual  :: #force_inline proc(left, right: v4)  -> bool { return (BasicallyEqual(left.x, right.x) && BasicallyEqual(left.y, right.y) && BasicallyEqual(left.z, right.z) && BasicallyEqual(left.w, right.w)); }
Vec4dBasicallyEqual :: #force_inline proc(left, right: v4d) -> bool { return (BasicallyEqual(left.x, right.x) && BasicallyEqual(left.y, right.y) && BasicallyEqual(left.z, right.z) && BasicallyEqual(left.w, right.w)); }
Vec4iBasicallyEqual :: #force_inline proc(left, right: v4i) -> bool { return (left == right); }
Vec4lBasicallyEqual :: #force_inline proc(left, right: v4l) -> bool { return (left == right); }
VecBasicallyEqual :: proc { Vec2BasicallyEqual, Vec2dBasicallyEqual, Vec2iBasicallyEqual, Vec2lBasicallyEqual, Vec3BasicallyEqual, Vec3dBasicallyEqual, Vec3iBasicallyEqual, Vec3lBasicallyEqual, Vec4BasicallyEqual, Vec4dBasicallyEqual, Vec4iBasicallyEqual, Vec4lBasicallyEqual }

// +==============================+
// |            Scale             |
// +==============================+
Vec2Scale  :: #force_inline proc(vector: v2,  scalar: f32) -> v2  { return vector * scalar; }
Vec2dScale :: #force_inline proc(vector: v2d, scalar: f64) -> v2d { return vector * scalar; }
Vec2iScale :: #force_inline proc(vector: v2i, scalar: i32) -> v2i { return vector * scalar; }
Vec2lScale :: #force_inline proc(vector: v2l, scalar: i64) -> v2l { return vector * scalar; }
Vec3Scale  :: #force_inline proc(vector: v3,  scalar: f32) -> v3  { return vector * scalar; }
Vec3dScale :: #force_inline proc(vector: v3d, scalar: f64) -> v3d { return vector * scalar; }
Vec3iScale :: #force_inline proc(vector: v3i, scalar: i32) -> v3i { return vector * scalar; }
Vec3lScale :: #force_inline proc(vector: v3l, scalar: i64) -> v3l { return vector * scalar; }
Vec4Scale  :: #force_inline proc(vector: v4,  scalar: f32) -> v4  { return vector * scalar; }
Vec4dScale :: #force_inline proc(vector: v4d, scalar: f64) -> v4d { return vector * scalar; }
Vec4iScale :: #force_inline proc(vector: v4i, scalar: i32) -> v4i { return vector * scalar; }
Vec4lScale :: #force_inline proc(vector: v4l, scalar: i64) -> v4l { return vector * scalar; }
VecScale :: proc { Vec2Scale, Vec2dScale, Vec2iScale, Vec2lScale, Vec3Scale, Vec3dScale, Vec3iScale, Vec3lScale, Vec4Scale, Vec4dScale, Vec4iScale, Vec4lScale }

// +==============================+
// |            Shrink            |
// +==============================+
Vec2Shrink  :: #force_inline proc(vector: v2,  scalar: f32) -> v2  { return vector / scalar; }
Vec2dShrink :: #force_inline proc(vector: v2d, scalar: f64) -> v2d { return vector / scalar; }
Vec2iShrink :: #force_inline proc(vector: v2i, scalar: i32) -> v2i { return vector / scalar; }
Vec2lShrink :: #force_inline proc(vector: v2l, scalar: i64) -> v2l { return vector / scalar; }
Vec3Shrink  :: #force_inline proc(vector: v3,  scalar: f32) -> v3  { return vector / scalar; }
Vec3dShrink :: #force_inline proc(vector: v3d, scalar: f64) -> v3d { return vector / scalar; }
Vec3iShrink :: #force_inline proc(vector: v3i, scalar: i32) -> v3i { return vector / scalar; }
Vec3lShrink :: #force_inline proc(vector: v3l, scalar: i64) -> v3l { return vector / scalar; }
Vec4Shrink  :: #force_inline proc(vector: v4,  scalar: f32) -> v4  { return vector / scalar; }
Vec4dShrink :: #force_inline proc(vector: v4d, scalar: f64) -> v4d { return vector / scalar; }
Vec4iShrink :: #force_inline proc(vector: v4i, scalar: i32) -> v4i { return vector / scalar; }
Vec4lShrink :: #force_inline proc(vector: v4l, scalar: i64) -> v4l { return vector / scalar; }
VecShrink :: proc { Vec2Shrink, Vec2dShrink, Vec2iShrink, Vec2lShrink, Vec3Shrink, Vec3dShrink, Vec3iShrink, Vec3lShrink, Vec4Shrink, Vec4dShrink, Vec4iShrink, Vec4lShrink }

// +--------------------------------------------------------------+
// |                       Math Operations                        |
// +--------------------------------------------------------------+
// +==============================+
// |            Floor             |
// +==============================+
Vec2Floor  :: linalg.floor;
Vec2dFloor :: linalg.floor;
Vec2iFloor :: linalg.floor;
Vec2lFloor :: linalg.floor;

Vec3Floor  :: linalg.floor;
Vec3dFloor :: linalg.floor;
Vec3iFloor :: linalg.floor;
Vec3lFloor :: linalg.floor;

Vec4Floor  :: linalg.floor;
Vec4dFloor :: linalg.floor;
Vec4iFloor :: linalg.floor;
Vec4lFloor :: linalg.floor;

// +==============================+
// |             Ceil             |
// +==============================+
Vec2Ceil  :: linalg.ceil;
Vec2dCeil :: linalg.ceil;
Vec2iCeil :: linalg.ceil;
Vec2lCeil :: linalg.ceil;

Vec3Ceil  :: linalg.ceil;
Vec3dCeil :: linalg.ceil;
Vec3iCeil :: linalg.ceil;
Vec3lCeil :: linalg.ceil;

Vec4Ceil  :: linalg.ceil;
Vec4dCeil :: linalg.ceil;
Vec4iCeil :: linalg.ceil;
Vec4lCeil :: linalg.ceil;

// +==============================+
// |            Round             |
// +==============================+
Vec2Round  :: linalg.round;
Vec2dRound :: linalg.round;
Vec2iRound :: linalg.round;
Vec2lRound :: linalg.round;

Vec3Round  :: linalg.round;
Vec3dRound :: linalg.round;
Vec3iRound :: linalg.round;
Vec3lRound :: linalg.round;

Vec4Round  :: linalg.round;
Vec4dRound :: linalg.round;
Vec4iRound :: linalg.round;
Vec4lRound :: linalg.round;

// +==============================+
// |             Max              |
// +==============================+
// NOTE: Danger, passing a single vector does a slightly different operation where it returns an element rather than a vector
Vec2Max  :: linalg.max;
Vec2dMax :: linalg.max;
Vec2iMax :: linalg.max;
Vec2lMax :: linalg.max;

Vec3Max  :: linalg.max;
Vec3dMax :: linalg.max;
Vec3iMax :: linalg.max;
Vec3lMax :: linalg.max;

Vec4Max  :: linalg.max;
Vec4dMax :: linalg.max;
Vec4iMax :: linalg.max;
Vec4lMax :: linalg.max;

// +==============================+
// |             Min              |
// +==============================+
Vec2Min  :: linalg.min;
Vec2dMin :: linalg.min;
Vec2iMin :: linalg.min;
Vec2lMin :: linalg.min;

Vec3Min  :: linalg.min;
Vec3dMin :: linalg.min;
Vec3iMin :: linalg.min;
Vec3lMin :: linalg.min;

Vec4Min  :: linalg.min;
Vec4dMin :: linalg.min;
Vec4iMin :: linalg.min;
Vec4lMin :: linalg.min;

// +==============================+
// |             Abs              |
// +==============================+
Vec2Abs  :: linalg.abs;
Vec2dAbs :: linalg.abs;
Vec2iAbs :: linalg.abs;
Vec2lAbs :: linalg.abs;

Vec3Abs  :: linalg.abs;
Vec3dAbs :: linalg.abs;
Vec3iAbs :: linalg.abs;
Vec3lAbs :: linalg.abs;

Vec4Abs  :: linalg.abs;
Vec4dAbs :: linalg.abs;
Vec4iAbs :: linalg.abs;
Vec4lAbs :: linalg.abs;

// +==============================+
// |            Length            |
// +==============================+
Vec2Length :: proc(vector: v2) -> f32
{
	return math.sqrt_f32((vector.x * vector.x) + (vector.y * vector.y));
}
Vec2dLength :: proc(vector: v2d) -> f64
{
	return math.sqrt_f64((vector.x * vector.x) + (vector.y * vector.y));
}
Vec2iLength :: proc(vector: v2i) -> f32
{
	return math.sqrt_f32((f32(vector.x) * f32(vector.x)) + (f32(vector.y) * f32(vector.y)));
}
Vec3Length :: proc(vector: v3) -> f32
{
	return math.sqrt_f32((vector.x * vector.x) + (vector.y * vector.y) + (vector.z * vector.z));
}
Vec3dLength :: proc(vector: v3d) -> f64
{
	return math.sqrt_f64((vector.x * vector.x) + (vector.y * vector.y) + (vector.z * vector.z));
}
Vec3iLength :: proc(vector: v3i) -> f32
{
	return math.sqrt_f32((f32(vector.x) * f32(vector.x)) + (f32(vector.y) * f32(vector.y)) + (f32(vector.z) * f32(vector.z)));
}
Vec4Length :: proc(vector: v4) -> f32
{
	return math.sqrt_f32((vector.x * vector.x) + (vector.y * vector.y) + (vector.z * vector.z) + (vector.w * vector.w));
}
Vec4dLength :: proc(vector: v4d) -> f64
{
	return math.sqrt_f64((vector.x * vector.x) + (vector.y * vector.y) + (vector.z * vector.z) + (vector.w * vector.w));
}
Vec4iLength :: proc(vector: v4i) -> f32
{
	return math.sqrt_f32((f32(vector.x) * f32(vector.x)) + (f32(vector.y) * f32(vector.y)) + (f32(vector.z) * f32(vector.z)) + (f32(vector.w) * f32(vector.w)));
}
VecLength :: proc { Vec2Length, Vec2dLength, Vec2iLength, Vec3Length, Vec3dLength, Vec3iLength, Vec4Length, Vec4dLength, Vec4iLength }

// +==============================+
// |             Dot              |
// +==============================+
Vec2Dot :: proc(left, right: v2) -> f32
{
	return (left.x * right.x) + (left.y * right.y);
}
Vec2dDot :: proc(left, right: v2d) -> f64
{
	return (left.x * right.x) + (left.y * right.y);
}
Vec2iDot :: proc(left, right: v2i) -> i32
{
	return (left.x * right.x) + (left.y * right.y);
}
Vec3Dot :: proc(left, right: v3) -> f32
{
	return (left.x * right.x) + (left.y * right.y) + (left.z * right.z);
}
Vec3dDot :: proc(left, right: v3d) -> f64
{
	return (left.x * right.x) + (left.y * right.y) + (left.z * right.z);
}
Vec3iDot :: proc(left, right: v3i) -> i32
{
	return (left.x * right.x) + (left.y * right.y) + (left.z * right.z);
}
Vec4Dot :: proc(left, right: v4) -> f32
{
	return (left.x * right.x) + (left.y * right.y) + (left.z * right.z) + (left.w * right.w);
}
Vec4dDot :: proc(left, right: v4d) -> f64
{
	return (left.x * right.x) + (left.y * right.y) + (left.z * right.z) + (left.w * right.w);
}
Vec4iDot :: proc(left, right: v4i) -> i32
{
	return (left.x * right.x) + (left.y * right.y) + (left.z * right.z) + (left.w * right.w);
}
VecDot :: proc { Vec2Dot, Vec2dDot, Vec2iDot, Vec3Dot, Vec3dDot, Vec3iDot, Vec4Dot, Vec4dDot, Vec4iDot }
