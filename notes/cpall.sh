echo "# lib5\n" >> ~/workspace/college/func-programming/notes/all5.md
for file in *; do    
  echo ${file} >> ~/workspace/college/func-programming/notes/all5.md
  echo "\n" >> ~/workspace/college/func-programming/notes/all5.md
  echo "\`\`\`\n" >> ~/workspace/college/func-programming/notes/all5.md
  cat "${file}" >> ~/workspace/college/func-programming/notes/all5.md
  echo "\`\`\`\n" >> ~/workspace/college/func-programming/notes/all5.md
done
