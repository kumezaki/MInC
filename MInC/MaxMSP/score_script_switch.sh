ls A?.txt > tmp0

ls A??.txt >> tmp0

cat tmp0 | awk 'BEGIN { FS="\."; } { mod = substr($1,2); printf("case %d: [mSequences[i] AssignNotes:num_notes_%02d:note_sequence_%02d:dur_sequence_%02d]; break;\n",mod-1,mod,mod,mod); }'

cat tmp0 | awk 'BEGIN { FS="\."; } { mod = substr($1,2); printf("[UIImage imageNamed:@\"InC%02d.jpg\"],\n",mod); }'

rm tmp0
