module {
  tt.func @kernel(%arg0: !tt.ptr<bf16, 1>) {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    %c12 = arith.constant 12 : index
    %0 = scf.for %arg1 = %c0 to %c12 step %c3 iter_args(%arg2 = %c1024) -> (index) {
      %1 = arith.addi %arg2, %c3 : index
      %2 = tts.make_tptr %arg0 to sizes: [256], strides: [%c1], offsets: [%1], shape: [0], order: [] : <bf16, 1> to tensor<256x!tt.ptr<bf16, 1>>
      %3 = "tts.load"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_dims = array<i64>}> : (tensor<256x!tt.ptr<bf16, 1>>) -> tensor<256xbf16>
      "tts.store"(%2, %3) <{static_dims = array<i64>}> : (tensor<256x!tt.ptr<bf16, 1>>, tensor<256xbf16>) -> ()
      scf.yield %1 : index
    }
    tt.return
  }
}

