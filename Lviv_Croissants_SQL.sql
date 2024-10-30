CREATE TABLE "orders" (
    "row_id" int   NOT NULL,
    "order_id" varchar(10)   NOT NULL,
    "cust_id" int   NOT NULL,
    "created_at" date   NOT NULL,
    "total_amount" decimal(8,2)   NOT NULL,
    "delivery" boolean   NOT NULL,
    "add_id" int   NOT NULL,
    "order_status" varchar(20)   NOT NULL,
    "delivery_date" date   NOT NULL,
    "payment_method" varchar(20)   NOT NULL,
    "staff_id" int   NOT NULL,
    CONSTRAINT "pk_orders" PRIMARY KEY (
        "row_id"
     ),
    CONSTRAINT "uc_orders_order_id" UNIQUE (
        "order_id"
    )
);

CREATE TABLE "order_items" (
    "order_item_id" int   NOT NULL,
    "order_id" varchar(10)   NOT NULL,
    "item_id" int   NOT NULL,
    "quantity" int   NOT NULL,
    "price_at_purchase" decimal(5,2)   NOT NULL,
    "special_instructions" text   NOT NULL,
    "discount" decimal(4,2)   NULL,
    CONSTRAINT "pk_order_items" PRIMARY KEY (
        "order_item_id"
     )
);

CREATE TABLE "customers" (
    "cust_id" int   NOT NULL,
    "cust_firstname" varchar(50)   NOT NULL,
    "cust_lastname" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    "phone_number" varchar(20)   NOT NULL,
    "primary_add_id" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "loyalty_points" int   NOT NULL,
    "join_date" date   NOT NULL,
    CONSTRAINT "pk_customers" PRIMARY KEY (
        "cust_id"
     ),
    CONSTRAINT "uc_customers_email" UNIQUE (
        "email"
    )
);

CREATE TABLE "address" (
    "add_id" int   NOT NULL,
    "cust_id" int   NOT NULL,
    "delivery_address1" varchar(200)   NOT NULL,
    "delivery_address2" varchar(200)   NULL,
    "delivery_city" varchar(50)   NOT NULL,
    "delivery_state" varchar(50)   NOT NULL,
    "delivery_zipcode" varchar(20)   NOT NULL,
    "delivery_instructions" text   NOT NULL,
    CONSTRAINT "pk_address" PRIMARY KEY (
        "add_id"
     )
);

CREATE TABLE "items" (
    "item_id" int   NOT NULL,
    "item_name" varchar(50)   NOT NULL,
    "item_cat" varchar(50)   NOT NULL,
    "item_size" varchar(20)   NOT NULL,
    "item_price" decimal(5,2)   NOT NULL,
    "item_description" text   NOT NULL,
    "item_stock" int   NOT NULL,
    "ingredients_list" text   NOT NULL,
    CONSTRAINT "pk_items" PRIMARY KEY (
        "item_id"
     )
);

CREATE TABLE "inventory" (
    "inv_id" int   NOT NULL,
    "item_id" int   NOT NULL,
    "ingredient_id" int   NOT NULL,
    "quantity_in_stock" decimal(8,2)   NOT NULL,
    "restock_level" decimal(8,2)   NOT NULL,
    "last_restock_date" date   NOT NULL,
    CONSTRAINT "pk_inventory" PRIMARY KEY (
        "inv_id"
     )
);

CREATE TABLE "recipes" (
    "recipe_id" int   NOT NULL,
    "item_id" int   NOT NULL,
    "ingredient_id" int   NOT NULL,
    "quantity_required" decimal(5,2)   NOT NULL,
    "preparation_time" int   NOT NULL,
    "instructions" text   NOT NULL,
    CONSTRAINT "pk_recipes" PRIMARY KEY (
        "recipe_id"
     )
);

CREATE TABLE "ingredients" (
    "ingredient_id" int   NOT NULL,
    "ingredient_name" varchar(50)   NOT NULL,
    "unit" varchar(20)   NOT NULL,
    "unit_price" decimal(6,2)   NOT NULL,
    "current_stock" decimal(8,2)   NOT NULL,
    "reorder_level" decimal(8,2)   NOT NULL,
    CONSTRAINT "pk_ingredients" PRIMARY KEY (
        "ingredient_id"
     )
);

CREATE TABLE "staff" (
    "staff_id" int   NOT NULL,
    "staff_firstname" varchar(50)   NOT NULL,
    "staff_lastname" varchar(50)   NOT NULL,
    "position" varchar(50)   NOT NULL,
    "phone_number" varchar(20)   NOT NULL,
    "hire_date" date   NOT NULL,
    "salary" decimal(8,2)   NOT NULL,
    "shift_id" int   NOT NULL,
    CONSTRAINT "pk_staff" PRIMARY KEY (
        "staff_id"
     )
);

CREATE TABLE "shifts" (
    "shift_id" int   NOT NULL,
    "shift_date" date   NOT NULL,
    "start_time" time   NOT NULL,
    "end_time" time   NOT NULL,
    CONSTRAINT "pk_shifts" PRIMARY KEY (
        "shift_id"
     )
);

--Adding relationship between databases
ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_cust_id" FOREIGN KEY("cust_id")
REFERENCES "customers" ("cust_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_add_id" FOREIGN KEY("add_id")
REFERENCES "address" ("add_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_staff_id" FOREIGN KEY("staff_id")
REFERENCES "staff" ("staff_id");

ALTER TABLE "order_items" ADD CONSTRAINT "fk_order_items_order_id" FOREIGN KEY("order_id")
REFERENCES "orders" ("order_id");

ALTER TABLE "order_items" ADD CONSTRAINT "fk_order_items_item_id" FOREIGN KEY("item_id")
REFERENCES "items" ("item_id");

ALTER TABLE "customers" ADD CONSTRAINT "fk_customers_primary_add_id" FOREIGN KEY("primary_add_id")
REFERENCES "address" ("add_id");

ALTER TABLE "address" ADD CONSTRAINT "fk_address_cust_id" FOREIGN KEY("cust_id")
REFERENCES "customers" ("cust_id");

ALTER TABLE "inventory" ADD CONSTRAINT "fk_inventory_item_id" FOREIGN KEY("item_id")
REFERENCES "items" ("item_id");

ALTER TABLE "inventory" ADD CONSTRAINT "fk_inventory_ingredient_id" FOREIGN KEY("ingredient_id")
REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "recipes" ADD CONSTRAINT "fk_recipes_item_id" FOREIGN KEY("item_id")
REFERENCES "items" ("item_id");

ALTER TABLE "recipes" ADD CONSTRAINT "fk_recipes_ingredient_id" FOREIGN KEY("ingredient_id")
REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "staff" ADD CONSTRAINT "fk_staff_shift_id" FOREIGN KEY("shift_id")
REFERENCES "shifts" ("shift_id");

