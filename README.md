# Hajj-itinerary-Database-System
This is a database system project using the Vapor framework to manage the information of pilgrims and their Hajj itinerary.

## Features
The project provides the following features:
1-	CRUD operations
2-	Automatic generation of UUID for each Itinerary and Pilgrim item.
3-	Automatic calculation of Age in Pilgrim by Date of Birth.
4-	Support for JSON

## Tools

1-	Download the following:
Vapor 
A server-side Swift web framework that allows developers to build high-performance web applications and APIs.
Postgres
An open-source relational database management system that provides advanced features and scalability for handling complex data storage and retrieval needs.
Postico 
A popular and user-friendly PostgreSQL client for macOS that allows users to manage and interact with PostgreSQL databases using a visual interface.

## Requirements
You will need Swift 5.2+

## Usage
The project provides the following endpoints:
1-	GET /Itinerary: Returns a list of all itinerary items.
2-	POST /Itinerary: Creates a new itinerary item.
3-	PATCH /Itinerary/:id: Updates an existing itinerary item by ID.
4-	DELETE /Itinerary/:id: Deletes an existing itinerary item by ID.

All endpoints support JSON encoding and decoding of each Itinerary and Pilgrim items. 
To create, delete, or update on itinerary’s type, send a JSON payload in the request body.

Example : 
<img width="920" alt="Screenshot 1444-08-30 at 2 16 23 PM" src="https://user-images.githubusercontent.com/105675970/226888285-81193234-e1d6-488e-90bb-486e4c823d1b.png">

## Credits
The project was created by:
Noura Althemali
Maha Alassaf 
Ahod Alshanwah

@2023







