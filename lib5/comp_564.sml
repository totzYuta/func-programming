(* 5.6.4
* 以下の式が与えられている時、関数の場合には型、定数の場合にはその値を答えよ *)

fun comp F G = (* カリー化形式 *)
let
  fun C x = G(F(x))
in 
  C
end;

fun add1 x = x + 1;

(* val comp = fn : ('a -> b)->('b -> 'c)->'a->'c *)



(* a *)
- val compA1 = comp add1;

             (* compA1の型 *) 
copm: ('a->'b)->('b->'c)->'a->'c
                (int->a)->int->'a
                  


(* b *)
- val compCampaA1 = comp compA1

((int->'a)->'c)-:(int->'a)->'c
((int->'a)->'b)-:(int->'a)->'b


(* c *)
- val f = compA1 add1;

compA1: (int->'a)->(int->'a)

(* d *)
- f(2);

val it = 4 : int


(* e *)
- val g = compCompA1 compA1;

compAcompA1: ((int->'a)->'b) -> (int->'a)->'b)
compA1(init->'a ) ->(int->'a') 


(* f *)
val h = g add1;

h: int -> int

(* g *)
h (2);

val it = 5: int
