#sh run_hindi_parser.sh /path/hindi_wx_input /path/hindi_new_out
#sh run_hindi_parser.sh /home/kishori/csnlp/demo demo.out


input_file=$1  #tmp_anu_dir/tmp/oneE_tmp/oneH  ........ when called from Anusaaraka_alignment.sh
output_file=$2 #tmp_anu_dir/tmp/oneE_tmp/hindi_dep_parser_out.txt ............... when called from Anusaaraka_alignment.sh


cd $hindi_parser/tokenizer/     # Go to tokenizer directory
echo in  tokenizer *****************
isc-tokenizer  -i $input_file -o $hindi_parser/hindi_wx_tokenised

echo tokenizer ran *****************
echo "Tokenized sentences are:"
cat $hindi_parser/hindi_wx_tokenised

cd $hindi_parser   #Go to hindi parser directory
python mono_jm_parser.py --load $hindi_parser/PARSER/UD/HI/PARSER/hi-ud-parser --test $hindi_parser/hindi_wx_tokenised --output-file $output_file
#/home/kishori/csnlp/PARSER/UD/HI/PARSER/hi-ud-parser
echo "Parsed sentences are:"
cat $output_file
#echo > $hindi_parser/hindi_wx_tokenised


#cd $hindi_parser/tokenizer

#isc-tokenizer  -i $hindi_parser/$input_file -o $hindi_parser/hindi_wx_tokenised

#python mono_jm_parser.py --load $hindi_parser/PARSER/UD/HI/PARSER/hi-ud-parser --test hindi_wx_tokenised --output-file hindi_parse

