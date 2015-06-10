fun toPigLatin (nil) = nil
  | toPigLatin (L) = if isInitCharVowel(L)=true then L@[#"y", #"a", #"y"] 
                     else toPigLatinNotVoewl(L)

fun toPigLatinNotVoewl (nil) = nil
  | toPigLatinNotVoewl (x::xs) = if isInitCharVowel(x::xs)=true then x::xs@[#"a",
  #"y"]
                                 else toPigLatinNotVoewl(xs@[x])
