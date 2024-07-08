tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>>
%34 = unrealized_conversion_cast %arg9 : tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> to tensor<2x2x!tt.ptr<f32>> {state_placeholder}
%33 = unrealized_conversion_cast %arg10 : tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> to tensor<2x2x!tt.ptr<f32>> {state_placeholder}
module {
  tt.func public @nested1(%arg0: !tt.ptr<f32>, %arg1: !tt.ptr<f32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32) attributes {noinline = false} {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c0_i32 = arith.constant 0 : i32
    %c32_i32 = arith.constant 32 : i32
    %0 = tt.make_range {end = 2 : i32, start = 0 : i32} : tensor<2xi32>
    %1 = tt.expand_dims %0 {axis = 1 : i32} : tensor<2xi32> -> tensor<2x1xi32>
    %2 = tt.splat %arg4 : i32 -> tensor<2x1xi32>
    %3 = arith.muli %1, %2 : tensor<2x1xi32>
    %4 = tt.expand_dims %0 {axis = 0 : i32} : tensor<2xi32> -> tensor<1x2xi32>
    %5 = tt.splat %arg5 : i32 -> tensor<1x2xi32>
    %6 = arith.muli %4, %5 : tensor<1x2xi32>
    %7 = tt.broadcast %3 : tensor<2x1xi32> -> tensor<2x2xi32>
    %8 = tt.broadcast %6 : tensor<1x2xi32> -> tensor<2x2xi32>
    %9 = arith.addi %7, %8 : tensor<2x2xi32>
    %10 = tt.splat %arg0 : !tt.ptr<f32> -> tensor<2x2x!tt.ptr<f32>>
    %11 = arith.index_cast %arg4 : i32 to index
    %12 = arith.index_cast %arg5 : i32 to index
    %13 = tts.make_tptr %arg0 to sizes: [2, 2], strides: [%11, %12], offsets: [0, 0], shape: [0, 0], order: [] : <f32> to tensor<2x2x!tt.ptr<f32>>
    %14 = tt.addptr %10, %9 : tensor<2x2x!tt.ptr<f32>>, tensor<2x2xi32>
    %15 = tt.splat %arg6 : i32 -> tensor<2x1xi32>
    %16 = arith.muli %15, %1 : tensor<2x1xi32>
    %17 = tt.splat %arg1 : !tt.ptr<f32> -> tensor<2x1x!tt.ptr<f32>>
    %18 = arith.index_cast %arg6 : i32 to index
    %19 = tts.make_tptr %arg1 to sizes: [2, 1], strides: [%18, 0], offsets: [0, 0], shape: [0, 0], order: [] : <f32> to tensor<2x1x!tt.ptr<f32>>
    %20 = tt.addptr %17, %16 : tensor<2x1x!tt.ptr<f32>>, tensor<2x1xi32>
    %21 = tt.splat %arg7 : i32 -> tensor<1x2xi32>
    %22 = arith.muli %21, %4 : tensor<1x2xi32>
    %23 = tt.broadcast %20 : tensor<2x1x!tt.ptr<f32>> -> tensor<2x2x!tt.ptr<f32>>
    %24 = tt.broadcast %22 : tensor<1x2xi32> -> tensor<2x2xi32>
    %25 = arith.index_cast %arg7 : i32 to index
    %26 = tts.make_tptr %arg1 to sizes: [2, 2], strides: [%18, %25], offsets: [0, 0], shape: [0, 0], order: [] : <f32> to tensor<2x2x!tt.ptr<f32>>
    %27 = tt.addptr %23, %24 : tensor<2x2x!tt.ptr<f32>>, tensor<2x2xi32>
    %28 = arith.muli %arg5, %c32_i32 : i32
    %29 = arith.index_cast %28 : i32 to index
    %30 = arith.index_cast %28 : i32 to index
    %31 = tt.splat %28 : i32 -> tensor<2x2xi32>
    %32 = builtin.unrealized_conversion_cast %14 : tensor<2x2x!tt.ptr<f32>> to tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> {make_state}
    %33 = builtin.unrealized_conversion_cast %27 : tensor<2x2x!tt.ptr<f32>> to tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> {make_state}
    %34:2 = scf.for %arg8 = %c0_i32 to %c2_i32 step %c1_i32 iter_args(%arg9 = %32, %arg10 = %33) -> (tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>>, tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>>)  : i32 {
      %35 = builtin.unrealized_conversion_cast %arg10 : tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> to tensor<2x2x!tt.ptr<f32>> {state_placeholder}
      %36 = builtin.unrealized_conversion_cast %arg9 : tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> to tensor<2x2x!tt.ptr<f32>> {state_placeholder}
      %37 = "tts.load"(%36) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_mask_dims = array<i64>}> : (tensor<2x2x!tt.ptr<f32>>) -> tensor<2x2xf32>
      "tts.store"(%35, %37) <{static_mask_dims = array<i64>}> : (tensor<2x2x!tt.ptr<f32>>, tensor<2x2xf32>) -> ()
      %38 = tts.make_tptr %arg0 to sizes: [2, 2], strides: [%11, %12], offsets: [%30, 0], shape: [0, 0], order: [] : <f32> to tensor<2x2x!tt.ptr<f32>>
      %39 = tt.addptr %36, %31 : tensor<2x2x!tt.ptr<f32>>, tensor<2x2xi32>
      %40 = tts.make_tptr %arg1 to sizes: [2, 2], strides: [%18, %25], offsets: [%29, 0], shape: [0, 0], order: [] : <f32> to tensor<2x2x!tt.ptr<f32>>
      %41 = tt.addptr %35, %31 : tensor<2x2x!tt.ptr<f32>>, tensor<2x2xi32>
      %42 = builtin.unrealized_conversion_cast %39 : tensor<2x2x!tt.ptr<f32>> to tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> {make_state}
      %43 = builtin.unrealized_conversion_cast %41 : tensor<2x2x!tt.ptr<f32>> to tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>> {make_state}
      scf.yield %42, %43 : tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>>, tuple<tensor<2x2x!tt.ptr<f32>>, tuple<index, index>, tuple<index, index>>
    }
    tt.return
  }
}

