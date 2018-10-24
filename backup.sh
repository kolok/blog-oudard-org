#!/bin/sh

date=`date +%Y-%m-%d`

echo "## Get DB dump from remote server"
ssh nicolas@oudard.org "mysqldump -u $MYSQL_WP_USER -p$MYSQL_WP_PASSWD $MYSQL_WP_DB --lock-tables=false > 'oudard.org-$date.sql'"
scp nicolas@oudard.org:"oudard.org-$date.sql" .
ssh nicolas@oudard.org "rm oudard.org-$date.sql"

echo "## Get WP source from remote server"
ssh nicolas@oudard.org "tar cfz blog.oudard.org-$date.tar.gz production/wordpress"
scp nicolas@oudard.org:"blog.oudard.org-$date.tar.gz" .
ssh nicolas@oudard.org "rm blog.oudard.org-$date.tar.gz"

#
#
# After run ./backup.sh 
tar xfz blog.oudard.org-$date.tar.gz
mv blog-oudard-org-wp/wp-config.php .
rm blog-oudard-org-wp
mv production/wordpress blog-oudard-org-wp
mv wp-config.php blog-oudard-org-wp
rm -rf production "blog.oudard.org-$date.tar.gz"
