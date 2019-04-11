#!/bin/bash
bundle 
#bash
#PATH=$PATH:/app/volumes/bundler/bin
SQL_FILE_PATH=/usr/app/sql/export_migration.sql
echo 'start migration'
if [ -f ${SQL_FILE_PATH} ]; then
  bundle exec sequel -m db/migrations $DB_CONNECTION
else
  bundle exec sequel -m db/migrations -E $DB_CONNECTION > ${SQL_FILE_PATH}
  chmod +x ${SQL_FILE_PATH}
  bundle exec ruby /usr/app/bin/migration_script_cleanup.rb ${SQL_FILE_PATH}
  echo 'migration exported'
fi
echo 'migration done'