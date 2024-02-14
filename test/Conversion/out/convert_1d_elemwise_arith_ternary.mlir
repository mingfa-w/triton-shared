#map = affine_map<(d0) -> (d0)>
module {
  func.func @kernel(%arg0: memref<*xi1>, %arg1: memref<*xf32>, %arg2: memref<*xf32>, %arg3: tensor<1024x!tt.ptr<f32, 1>>, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [1024], strides: [1] : memref<*xi1> to memref<1024xi1, strided<[1]>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [0], sizes: [1024], strides: [1] : memref<*xf32> to memref<1024xf32, strided<[1]>>
    %reinterpret_cast_1 = memref.reinterpret_cast %arg2 to offset: [0], sizes: [1024], strides: [1] : memref<*xf32> to memref<1024xf32, strided<[1]>>
    %alloc = memref.alloc() : memref<1024xi1>
    memref.copy %reinterpret_cast, %alloc : memref<1024xi1, strided<[1]>> to memref<1024xi1>
    %0 = bufferization.to_tensor %alloc restrict writable : memref<1024xi1>
    %alloc_2 = memref.alloc() : memref<1024xf32>
    memref.copy %reinterpret_cast_0, %alloc_2 : memref<1024xf32, strided<[1]>> to memref<1024xf32>
    %1 = bufferization.to_tensor %alloc_2 restrict writable : memref<1024xf32>
    %alloc_3 = memref.alloc() : memref<1024xf32>
    memref.copy %reinterpret_cast_1, %alloc_3 : memref<1024xf32, strided<[1]>> to memref<1024xf32>
    %2 = bufferization.to_tensor %alloc_3 restrict writable : memref<1024xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel"]} ins(%0, %1, %2 : tensor<1024xi1>, tensor<1024xf32>, tensor<1024xf32>) outs(%1 : tensor<1024xf32>) {
    ^bb0(%in: i1, %in_4: f32, %in_5: f32, %out: f32):
      %4 = arith.select %in, %in_4, %in_5 : f32
      linalg.yield %4 : f32
    } -> tensor<1024xf32>
    tt.store %arg3, %3 {cache = 1 : i32, evict = 1 : i32} : tensor<1024xf32>
    return
  }
}
