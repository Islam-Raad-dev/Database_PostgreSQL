-- 

Relational Schema

1. **Blueprint Architecture:** A relational schema is the definitive structural framework of a database. It defines tables, attributes, and constraints, entirely independent of the physical data it will eventually store.

2. **Relation (Table):** The absolute core container of structured data. Example: `benthic_glider_telemetry` (a specialized data set), avoiding cliché structures like 'employees' or 'customers'.

3. **Tuple (Row):** A single, indivisible, and distinct record within a relation, representing one specific real-world occurrence.

4. **Attribute (Column):** A defined property of a relation. Every tuple must have exactly one atomic value for each attribute.

5. **Domain (Data Type):** The strict pool of permissible atomic values an attribute can hold. In PostgreSQL, this requires precision, favoring specialized types like `jsonb` or `numrange` over generic text strings.

6. **Degree:** The exact count of attributes within a relation. A heavily inflated degree often signals catastrophic schema design and the need for normalization.

7. **Cardinality:** The dynamic count of tuples within a relation at any given microsecond.

8. **Primary Key (PK):** The non-negotiable unique identifier for a tuple. Example: A UUID like `glider_chassis_id` that guarantees absolute uniqueness.

9. **Foreign Key (FK):** An attribute that directly maps to a PK in another relation, enforcing strict dependency (e.g., locking a `maintenance_log` entry to a valid `glider_chassis_id`).

10. **Referential Integrity:** The strict database law demanding that every Foreign Key must either map to an existing Primary Key or remain NULL. Orphaned records are rejected.

11. **Entity Integrity:** The fundamental rule that no component of a Primary Key can ever be NULL.

12. **Candidate Key:** Any minimal set of attributes capable of uniquely identifying a tuple. The Primary Key is selected from this group.

13. **Alternate Key:** Valid Candidate Keys that were rejected during the schema design phase in favor of the Primary Key. They are often enforced via `UNIQUE` constraints.

14. **CHECK Constraints:** Hardcoded domain-level logic that filters invalid data before insertion. Example: `CHECK (operating_depth_meters < 6000)`.

15. **Normalization:** The ruthless elimination of data redundancy and update anomalies through systematic division of relations into logical tiers (1NF, 2NF, 3NF).

16. **View:** A virtual relation constructed dynamically from base tables. It projects specific data logic without consuming raw storage space.

17. **Schema vs. Instance:** The schema is the rigid, static architecture; the instance is the fluid, ever-changing state of the data at a precise moment in time.

18. **Index Mapping:** Physical access paths (such as B-Tree or GiST in PostgreSQL) embedded within the schema structure to force rapid query execution.

19. **Data Definition Language (DDL):** Relational schemas are exclusively constructed, modified, and annihilated using DDL commands (`CREATE`, `ALTER`, `DROP`).
--