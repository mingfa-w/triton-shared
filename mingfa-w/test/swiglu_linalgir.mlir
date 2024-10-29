module {
  tt.func public @_fg_kernel(%arg0: !tt.ptr<f32> {tt.divisibility = 16 : i32}, %arg1: !tt.ptr<f32> {tt.divisibility = 16 : i32}, %arg2: !tt.ptr<f32> {tt.divisibility = 16 : i32}, %arg3: i32 {tt.divisibility = 16 : i32}) attributes {noinline = false} {
    %cst = arith.constant dense<1.000000e+00> : tensor<1024xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<1024xf32>
    %c1024_i32 = arith.constant 1024 : i32
    %0 = tt.get_program_id x : i32
    %1 = arith.muli %0, %c1024_i32 : i32
    %2 = tt.make_range {end = 1024 : i32, start = 0 : i32} : tensor<1024xi32>
    %3 = tt.splat %1 : i32 -> tensor<1024xi32>
    %4 = arith.addi %3, %2 : tensor<1024xi32>
    %5 = tt.splat %arg3 : i32 -> tensor<1024xi32>
    %6 = arith.cmpi slt, %4, %5 : tensor<1024xi32>
    %7 = tt.splat %arg0 : !tt.ptr<f32> -> tensor<1024x!tt.ptr<f32>>
    %8 = tt.addptr %7, %4 : tensor<1024x!tt.ptr<f32>>, tensor<1024xi32>
    %9 = tt.load %8, %6, %cst_0 : tensor<1024x!tt.ptr<f32>>
    %10 = tt.splat %arg1 : !tt.ptr<f32> -> tensor<1024x!tt.ptr<f32>>
    %11 = tt.addptr %10, %4 : tensor<1024x!tt.ptr<f32>>, tensor<1024xi32>
    %12 = tt.load %11, %6, %cst_0 : tensor<1024x!tt.ptr<f32>>
    %13 = arith.subf %cst_0, %9 : tensor<1024xf32>
    %14 = math.exp %13 : tensor<1024xf32>
    %15 = arith.addf %14, %cst : tensor<1024xf32>
    %16 = arith.divf %cst, %15 : tensor<1024xf32>
    %17 = arith.mulf %9, %16 : tensor<1024xf32>
    %18 = arith.mulf %17, %12 : tensor<1024xf32>
    %19 = tt.splat %arg2 : !tt.ptr<f32> -> tensor<1024x!tt.ptr<f32>>
    %20 = tt.addptr %19, %4 : tensor<1024x!tt.ptr<f32>>, tensor<1024xi32>
    tt.store %20, %18, %6 : tensor<1024x!tt.ptr<f32>>
    tt.return
  }
}