mysql_open(){
  mysql -u$DATABASE_USERNAME -p$DATABASE_PASSWORD -h$DATABASE_HOSTNAME
}

mysql_info(){
  mysql -u$DATABASE_USERNAME -p$DATABASE_PASSWORD -se "SHOW VARIABLES" | grep -e log_error -e general_log -e slow_query_log
}
