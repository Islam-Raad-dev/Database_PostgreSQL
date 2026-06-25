-- Backup & Restore Database


-- Basic Backup:

pg_dump -U username -d my_database -f backup_file.sql


-- Large Backup:            

pg_dump -U username -F c -b -v -f backup_file.dump my_database


-- Basic Restore:

psql -U username -d my_database -f backup_file.sql


-- Large Restore:

pg_restore -U username -d my_database -v backup_file.dump