# Write a program in the following steps
# a. Roll a die and find the number between 1 to 6
# b. Repeat the Die roll and find the result each time
# c. Store the result in a dictionary
# d. Repeat till any one of the number has reached 10 times
# e. Find the number that reached maximum times and the one that was for minimum times

declare -A dictionary

# set the dictionary key and value to 0
dictionary=( [num1]=0 [num2]=0 [num3]=0 [num4]=0 [num5]=0 [num6]=0 )
condition=10

# Start rolling the dice

while [[ ${dictionary[num$diceNumber]} -lt $condition ]]
do
		diceNumber=$(( RANDOM%6+1))
		if [ $diceNumber -eq 1 ]
		then
				dictionary["num1"]=$(( ${dictionary[num1]}+1 ))
		elif [ $diceNumber -eq 2 ]
		then
				dictionary["num2"]=$(( ${dictionary[num2]}+1 ))
		elif [ $diceNumber -eq 3 ]
      then
            dictionary["num3"]=$(( ${dictionary[num3]}+1 ))
		elif [ $diceNumber -eq 4 ]
      then
            dictionary["num4"]=$(( ${dictionary[num4]}+1 ))
		elif [ $diceNumber -eq 5 ]
      then
            dictionary["num5"]=$(( ${dictionary[num5]}+1 ))
		else
            dictionary["num6"]=$(( ${dictionary[num6]}+1 ))
		fi

		# To get Maximum number of time dice number is

		if [[ ${dictionary[num$diceNumber]} -eq condition ]]
		then
				max=num$diceNumber
		fi
done
 
# to display the elements of dictionary
for key in "${!dictionary[@]}"
do
		echo "$key: ${dictionary[$key]}"
done


# to get minimum value of count
min=10
for key in "${!dictionary[@]}"
do
		if [[ ${dictionary[$key]} -lt $min ]]
		then
				min="${dictionary[$key]}"
				minKey=$key
		fi
done

# display the outputs

echo minimum face is $minKey with count $min
echo maximum face is $max with count $condition
