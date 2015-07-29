for file in *; do    
  echo ${file} >> ~/workspace/college/func-programming/notes/all.md
  echo "\n" >> ~/workspace/college/func-programming/notes/all.md
  echo "\`\`\`\n" >> ~/workspace/college/func-programming/notes/all.md
  cat "${file}" >> ~/workspace/college/func-programming/notes/all.md
  echo "\`\`\`\n" >> ~/workspace/college/func-programming/notes/all.md
done
