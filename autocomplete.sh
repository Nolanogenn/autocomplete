query=$1
awk -v pat="$query" '{
for (i=1; i<=NF; i++){
	if ($i ~ "^" pat) {
		print $i;
		found=1;
		break;
		}
	}
	if (found)
		exit;
}' $2 

