o -n Enter the name of the person:
read name
echo -n Enter the address:
read address
echo -n Enter the phone number:
read phone_number
echo "$name;$address;$phone_number" >>book.txt
