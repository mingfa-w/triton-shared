#loc = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":64:0)
module {
  tt.func public @test(%arg0: !tt.ptr<f32> loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":64:0), %arg1: !tt.ptr<i32> loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":64:0), %arg2: !tt.ptr<f32> loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":64:0), %arg3: i32 loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":64:0), %arg4: i32 loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":64:0)) attributes {noinline = false} {
    %0 = tt.make_range {end = 2 : i32, start = 0 : i32} : tensor<2xi32> loc(#loc1)
    %1 = tt.make_range {end = 4 : i32, start = 0 : i32} : tensor<4xi32> loc(#loc2)
    %2 = tt.expand_dims %0 {axis = 1 : i32} : tensor<2xi32> -> tensor<2x1xi32> loc(#loc3)
    %3 = tt.splat %arg0 : !tt.ptr<f32> -> tensor<2x1x!tt.ptr<f32>> loc(#loc4)
    %4 = tt.addptr %3, %2 : tensor<2x1x!tt.ptr<f32>>, tensor<2x1xi32> loc(#loc4)
    %5 = tt.expand_dims %1 {axis = 0 : i32} : tensor<4xi32> -> tensor<1x4xi32> loc(#loc5)
    %6 = tt.splat %arg4 : i32 -> tensor<1x4xi32> loc(#loc6)
    %7 = arith.muli %5, %6 : tensor<1x4xi32> loc(#loc6)
    %8 = tt.broadcast %4 : tensor<2x1x!tt.ptr<f32>> -> tensor<2x4x!tt.ptr<f32>> loc(#loc7)
    %9 = tt.broadcast %7 : tensor<1x4xi32> -> tensor<2x4xi32> loc(#loc7)
    %10 = tt.addptr %8, %9 : tensor<2x4x!tt.ptr<f32>>, tensor<2x4xi32> loc(#loc7)
    %11 = tt.splat %arg3 : i32 -> tensor<2x1xi32> loc(#loc8)
    %12 = arith.muli %2, %11 : tensor<2x1xi32> loc(#loc8)
    %13 = tt.splat %arg2 : !tt.ptr<f32> -> tensor<2x1x!tt.ptr<f32>> loc(#loc9)
    %14 = tt.addptr %13, %12 : tensor<2x1x!tt.ptr<f32>>, tensor<2x1xi32> loc(#loc9)
    %15 = tt.broadcast %14 : tensor<2x1x!tt.ptr<f32>> -> tensor<2x4x!tt.ptr<f32>> loc(#loc10)
    %16 = tt.addptr %15, %9 : tensor<2x4x!tt.ptr<f32>>, tensor<2x4xi32> loc(#loc10)
    %17 = tt.load %10 : tensor<2x4x!tt.ptr<f32>> loc(#loc11)
    tt.store %16, %17 : tensor<2x4x!tt.ptr<f32>> loc(#loc12)
    tt.return loc(#loc13)
  } loc(#loc)
} loc(#loc)
#loc1 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":68:28)
#loc2 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":69:28)
#loc3 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":71:27)
#loc4 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":71:18)
#loc5 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":71:47)
#loc6 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":71:58)
#loc7 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":71:38)
#loc8 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":73:53)
#loc9 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":73:20)
#loc10 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":73:66)
#loc11 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":75:16)
#loc12 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":76:22)
#loc13 = loc("/home/nhat/github/triton_shared/one-to-n-loads/input.py":76:4)