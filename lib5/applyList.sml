fun applyList nil _ = nil
  | applyList (F::Fs) x = F x :: applyList Fs x;
