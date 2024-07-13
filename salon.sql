#!/bin/bash

# Connect to the salon database
DATABASE_NAME="salon"

# Function to display services
display_services() {
  echo "Welcome to My Salon, how can I help you?"
  echo ""
  psql -d $DATABASE_NAME -t -c "SELECT service_id, name FROM services ORDER BY service_id;" | while IFS="|" read id name
  do
	echo "$id) $(echo $name | xargs)"
  done
  echo ""
}

# Function to prompt for service selection and validate it
prompt_for_service() {
  while true; do
	display_services
	read -p "" SERVICE_ID_SELECTED
	SERVICE_NAME=$(psql -d $DATABASE_NAME -t -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;" | xargs)
	if [ -z "$SERVICE_NAME" ]; then
	  echo "I could not find that service. What would you like today?"
	else
	  break
	fi
  done
}

# Function to handle customer information and prompt for appointment details
book_appointment() {
  read -p "What's your phone number? " CUSTOMER_PHONE
  CUSTOMER_NAME=$(psql -d $DATABASE_NAME -t -c "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';" | xargs)
  if [ -z "$CUSTOMER_NAME" ]; then
	read -p "I don't have a record for that phone number, what's your name? " CUSTOMER_NAME
	psql -d $DATABASE_NAME -c "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"
  fi
  read -p "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME? " SERVICE_TIME
  psql -d $DATABASE_NAME -c "INSERT INTO appointments (customer_id, service_id, time) VALUES ((SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'), $SERVICE_ID_SELECTED, '$SERVICE_TIME');"
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

# Main script execution
echo "~~~~~ MY SALON ~~~~~"
echo ""
prompt_for_service
book_appointment