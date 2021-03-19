FROM wnameless/oracle-xe-11g-r2
EXPOSE 1521
# Set oracle db encoding to UTF-8
ENV NLS_LANG=.AL32UTF8
# Add scripts that creates the default schemas needed by the application
ADD resources/db/init-scripts/* /docker-entrypoint-initdb.d/
