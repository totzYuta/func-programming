(* 5.5.1 *)
fun applyList nil _ = nil
  | applyList (F::Fs) x = F x :: applyList Fs x;

(* 5.5.4 *)

fun isSubsequence2 (x, nil) = isSubsequence1 (x, nil)
  | isSubsequence2 (x, y::ys) = isSubsequence1 (x, y::ys) orelse isSubsequence2
  (x, ys);
