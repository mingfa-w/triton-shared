#map = affine_map<(d0) -> (d0)>
module {
  func.func @atan2_kernel_0123(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: memref<*xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg7, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg3 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%8], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc_2 = memref.alloc() : memref<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %10 = arith.addi %9, %c32 : index
    %11 = arith.index_cast %arg3 : i32 to index
    %12 = arith.minsi %10, %11 : index
    %13 = arith.subi %12, %9 : index
    %subview_3 = memref.subview %reinterpret_cast_1[0] [%13] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_4 = memref.subview %alloc_2[0] [%13] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview_3, %subview_4 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %14 = bufferization.to_tensor %alloc_2 restrict writable : memref<32xf32>
    %15 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%7, %14 : tensor<32xf32>, tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_6: f32, %out: f32):
      %17 = math.atan2 %in, %in_6 : f32
      linalg.yield %17 : f32
    } -> tensor<32xf32>
    %16 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_5 = memref.reinterpret_cast %arg2 to offset: [%16], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %15 in writable %reinterpret_cast_5 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @pow_kernel_0123(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: memref<*xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg7, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg3 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%8], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc_2 = memref.alloc() : memref<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %10 = arith.addi %9, %c32 : index
    %11 = arith.index_cast %arg3 : i32 to index
    %12 = arith.minsi %10, %11 : index
    %13 = arith.subi %12, %9 : index
    %subview_3 = memref.subview %reinterpret_cast_1[0] [%13] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_4 = memref.subview %alloc_2[0] [%13] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview_3, %subview_4 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %14 = bufferization.to_tensor %alloc_2 restrict writable : memref<32xf32>
    %15 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%7, %14 : tensor<32xf32>, tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %in_6: f32, %out: f32):
      %17 = math.powf %in, %in_6 : f32
      linalg.yield %17 : f32
    } -> tensor<32xf32>
    %16 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_5 = memref.reinterpret_cast %arg2 to offset: [%16], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %15 in writable %reinterpret_cast_5 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @fabs_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.absf %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @sin_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.sin %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @cos_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.cos %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @tan_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.tan %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @asin_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.asin %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @acos_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.acos %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @atan_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.atan %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @sinh_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.sinh %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @cosh_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.cosh %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @tanh_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.tanh %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @asinh_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.asinh %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @acosh_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.acosh %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @atanh_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.atanh %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @log_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.log %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @log10_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.log10 %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @log1p_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.log1p %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @exp_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.exp %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @exp2_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.exp2 %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @erf_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.erf %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @sqrt_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.sqrt %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @rsqrt_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.rsqrt %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @ceil_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.ceil %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @floor_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.floor %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}


// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @trunc_kernel_012(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32) {
    %c32 = arith.constant 32 : index
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.muli %arg6, %c32_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<32xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c32 : index
    %4 = arith.index_cast %arg2 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<32xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<32xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc restrict writable : memref<32xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%7 : tensor<32xf32>) outs(%7 : tensor<32xf32>) {
    ^bb0(%in: f32, %out: f32):
      %10 = math.trunc %in : f32
      linalg.yield %10 : f32
    } -> tensor<32xf32>
    %9 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%9], sizes: [32], strides: [1] : memref<*xf32> to memref<32xf32, strided<[1], offset: ?>>
    bufferization.materialize_in_destination %8 in writable %reinterpret_cast_1 : (tensor<32xf32>, memref<32xf32, strided<[1], offset: ?>>) -> ()
    return
  }
}
