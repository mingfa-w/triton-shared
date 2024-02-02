module {
  tt.func @kernel(%arg0: !tt.ptr<i1, 1>, %arg1: !tt.ptr<f32, 1>, %arg2: !tt.ptr<f32, 1>, %arg3: tensor<128x128x!tt.ptr<f32, 1>>) {
    %0 = tts.make_tptr %arg0 to sizes: [128, 128], strides: [1, 1], offsets: [0, 0], shape: [0, 0], order: [] : <i1, 1> to tensor<128x128x!tt.ptr<i1, 1>>
    %1 = tts.make_tptr %arg1 to sizes: [128, 128], strides: [1, 1], offsets: [0, 0], shape: [0, 0], order: [] : <f32, 1> to tensor<128x128x!tt.ptr<f32, 1>>
    %2 = tts.make_tptr %arg2 to sizes: [128, 128], strides: [1, 1], offsets: [0, 0], shape: [0, 0], order: [] : <f32, 1> to tensor<128x128x!tt.ptr<f32, 1>>
    %3 = "tts.load"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_dims = array<i64>}> : (tensor<128x128x!tt.ptr<i1, 1>>) -> tensor<128x128xi1>
    %4 = "tts.load"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_dims = array<i64>}> : (tensor<128x128x!tt.ptr<f32, 1>>) -> tensor<128x128xf32>
    %5 = "tts.load"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_dims = array<i64>}> : (tensor<128x128x!tt.ptr<f32, 1>>) -> tensor<128x128xf32>
    %6 = arith.select %3, %4, %5 : tensor<128x128xi1>, tensor<128x128xf32>
    tt.store %arg3, %6 {cache = 1 : i32, evict = 1 : i32} : tensor<128x128xf32>
    tt.return
  }
}

