(* 5.5.1 *)
fun applyList nil _ = nil
  | applyList (F::Fs) x = F x :: applyList Fs x;

(* 5.5.4 *)

fun isSubsequence2 (x, nil) = isSubsequence1 (x, nil)
  | isSubsequence2 (x, y::ys) = isSubsequence1 (x, y::ys) orelse isSubsequence2
  (x, ys);



(*
* answer
*)

(* 5.5.6 *)
fun sq (nil, _) = true
  | sq (_, nil) = false
  | sq (x::xs, y::ys) = if x=y then sq (xs, ys)
                        else sq (x::xs, ys);

fun subsequence x y = sq (explode(x), explode(y));

- val g = makeFnList subsequence;
- val [ear, part, trap, seat] = g ["ear", "part", "trap", "seat"];
- applyList [ear, part, trap, seat] "separate";

(* [true, true, false, true] *)
