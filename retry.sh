COUNT=$(cat temp.txt)
if [ $COUNT -ge 3 ]
then
	echo "COUNT is 3 or bigger"
	exit 0
else
	echo "COUNT is less than 3"
	echo $(( COUNT + 1 )) > temp.txt
	exit 1
fi
