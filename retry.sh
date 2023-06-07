COUNT=$(cat temp.txt)
if [ $COUNT -ge 3 ]
then
	exit 0
else
	echo $(( COUNT + 1 )) > temp.txt
	exit 1
fi
