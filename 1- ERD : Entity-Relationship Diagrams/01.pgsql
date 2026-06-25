--
Entity-Relationship Diagrams (ERD):
  
1. **Definition:** An ERD (Entity-Relationship Diagram) is a visual representation of a database's logical structure, showing how different entities interact with one another.
2. **Primary Purpose:** It bridges the gap between business requirements and database implementation, serving as a blueprint for developers and stakeholders.
3. **Database Independence:** High-level ERDs are agnostic, meaning they can be designed before deciding whether to use PostgreSQL, MySQL, or Oracle.

4. **Entities:** The primary objects or concepts in the system (e.g., `Customer`, `Order`, `Product`). In a PostgreSQL database, entities directly translate into **Tables**.
5. **Attributes:** The specific details or properties defining an entity (e.g., `customer_name`, `order_date`). In a database, these become **Columns**.
6. **Relationships:** The logical rules that define how entities are connected or interact with each other (e.g., a `Customer` "places" an `Order`).

7. **Strong Entity:** An entity that can exist independently in the database and has its own unique identifier.
8. **Weak Entity:** An entity that cannot exist without a relationship to a strong entity (e.g., an `Order Item` depends entirely on an `Order`).
9. **Primary Key (PK):** A strictly unique attribute used to identify a specific record within an entity (e.g., `user_id`).
10. **Foreign Key (FK):** An attribute in one entity that refers to the Primary Key of another entity, physically enforcing the relationship in PostgreSQL.
11. **Composite Attribute:** An attribute that can be broken down into smaller, meaningful parts (e.g., `Address` split into `street`, `city`, `zip_code`).
12. **Derived Attribute:** An attribute whose value is calculated from other related attributes (e.g., `total_price` derived from `quantity * unit_price`).

13. **One-to-One (1:1):** One instance of Entity A is associated with exactly one instance of Entity B (e.g., `User` and `User_Profile`).
14. **One-to-Many (1:N):** One instance of Entity A is associated with multiple instances of Entity B (e.g., One `Department` has many `Employees`).
15. **Many-to-Many (M:N):** Multiple instances of Entity A are associated with multiple instances of Entity B. In PostgreSQL, this requires creating a **Junction/Link Table** to resolve.
16. **Modality/Participation:** Defines whether a relationship is mandatory (at least one must exist) or optional (zero allowed).

17. **Conceptual Model:** The highest level view. Defines *what* should be in the system (Entities and Relationships) without technical details.
18. **Logical Model:** Adds more detail, including all Attributes, Primary Keys, and Foreign Keys, but ignores specific database management system (DBMS) rules.
19. **Physical Model:** The final blueprint. It dictates exactly how the model will be built in **PostgreSQL**, defining strict Data Types (e.g., `VARCHAR`, `SERIAL`, `TIMESTAMP`) and constraints.
---.