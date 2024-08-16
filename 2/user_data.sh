#!/bin/bash
yum -y update
yum -y install httpd

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="green">

<h2><font color="blue">Build by Terraform <font color="red">  Version-0.0.1 </font></h2><br><p>
<font color="green"> My Appache Server <br><br>

</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on
