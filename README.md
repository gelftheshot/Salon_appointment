# Salon Appointment Scheduler

## Overview

The Salon Appointment Scheduler is a command-line application designed to help manage appointments for a salon. It allows customers to book appointments for various services offered by the salon, such as haircuts, coloring, perms, styling, and trimming. The application handles customer information, service selection, and appointment scheduling.

## Features

- **Service Display**: Lists all the available services with their IDs.
- **Service Selection**: Allows customers to select a service by its ID.
- **Customer Information Handling**: Captures and stores new customer information or retrieves existing customer details.
- **Appointment Scheduling**: Enables customers to choose a preferred time for their selected service.
- **Confirmation**: Confirms the appointment details to the customer.

## Installation

To set up the Salon Appointment Scheduler, follow these steps:

1. Clone the repository to your local machine.
2. Ensure you have PostgreSQL installed and running on your system.
3. Create a database named `salon` and import the `salon.sql` file to set up the necessary tables.
4. Modify the [`salon.sh`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2Fworkspace%2Fproject%2Fsalon.sh%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%5D "/workspace/project/salon.sh") script to include your PostgreSQL connection details.

## Usage

To start the application, navigate to the directory containing [`salon.sh`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2Fworkspace%2Fproject%2Fsalon.sh%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%5D "/workspace/project/salon.sh") and run the following command in your terminal:

```sh
./salon.sh
