# Lviv Croissants Restaurant Database Project
This project defines a relational database for Lviv Croissants, a restaurant specialising in bakery products and coffee. The database supports key operations and functions required to manage orders, customers, products, recipes, ingredients, inventory and staff schedules. 
![Lviv_Croissants_Database_Diagram](https://github.com/user-attachments/assets/a7021617-7b66-43fb-874d-0e061cbb0833)

Key Relationships
- **Customer Orders**: The orders table links with order_items to handle multiple items in a single order, and with customers to track who placed each order.
- **Delivery and Address**: Orders can be marked for delivery, with delivery addresses stored in the address table linked to customers.
- **Product Recipes and Inventory**: Each item on the menu has a defined recipe, which lists ingredients. The inventory table tracks ingredient availability, ensuring production requirements are met.
- **Staff and Scheduling**: The staff table links to shifts for managing schedules, and to orders to record which staff managed each order, enabling performance tracking.

