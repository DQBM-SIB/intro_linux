#!/bin/bash

#########################################################
# BIO609 - Introduction to UNIX/Linux and Bash Scripting
# Bash scripting
#
# @author: Heidi Tschanz-Lischer
#########################################################

# Exercise 1a: --------
cd data
gunzip *.gz

# Exercise 1b: --------
for file in *R1.fastq
do
  # test if reverse doesn't file exist
  if [[ ! -e ${file%R1.fastq}R2.fastq ]]
  then
    mv $file ${file%.fastq}_unpair.fastq
  fi
done

# Exercise 1c: --------
cat *_unpair.fastq > Unpair.fastq



# Exercise 2: --------
compressFiles(){
  #check if folder doesn't exist
  if [[ ! -d $2 ]]
  then
    mkdir compressed
  fi
  
  gzip -c $1 > ${2}/${1}.gz
}

for file in *.fastq
do
  compressFiles $file compressed
done


# Exercise 3: --------
for file in *.fastq
do
  nbLines=($(wc -l $file))
  echo "${file}: $((${nbLines[0]}/4))" >> readNumber.txt
done


# Exercise 4a: --------
file=ERR000061.1_R1.fastq
newFile=${file%.fastq}.fa

#remove newFile if it already exists
if [[ -e $newFile ]]
then
  rm $newFile
fi

#go through file line by line
count=0
while read line
do
  let count+=1  #or count=$(( $count + 1))
  
  if [[ $count -eq 1 ]]
  then
    #write header line to file without leading @ 
    echo ">${line#@}" >> $newFile
  elif [[ $count -eq 2 ]]
  then
    #write sequence line to file
    echo $line >> $newFile
  elif [[ $count -eq 4 ]]
  then
    #reset count variable to 0
    count=0
  fi
done < $file

# Exercise 4b: --------
Fq2Fa(){
  newFile=${1%.fastq}.fa

  #remove newFile if it already exists
  if [[ -e $newFile ]]
  then
  rm $newFile
  fi

  #go through file line by line
  count=0
  while read line
  do
    let count+=1  #or count=$(( $count + 1))
  
    if [[ $count -eq 1 ]]
    then
      #write header line to file without leading @ 
      echo ">${line#@}" >> $newFile
    elif [[ $count -eq 2 ]]
    then
      #write sequence line to file
      echo $line >> $newFile
    elif [[ $count -eq 4 ]]
    then
      #reset count variable to 0
      count=0
    fi
  done < $1
}

for file in *.fastq
do
  Fq2Fa $file
done
