# Title: Automation script
# Author: Rickard Andersson
# Please; Run the script with sudo or as root!
# 
# Internet function
conn_func () { ping -c1  google.com>/dev/null &&  echo "$?"
}

# Fail2ban function
fail2ban_func () { rpm -q fail2ban>/dev/null && echo "$?"
}

# Nginx html 
nignx_func () { echo "
 <html>
 </head>
  
 <body>
  
   
 <hi> Hello and welcome to webserver 1! </h1>
  
 <p>
 This is webserver1 so if the load balancer work
  then it should read webserver 2 above when the webserver2 is active..
  Have a nice day!
 </p>
" > /usr/share/nginx/html/index.html
}


# Checking the internet connection
conn_func "$@"
if [ "$?" -eq 0 ] 
	then 
	echo "The machine has internet connection.."
	else echo "The ping command failed, no connection.."
	exit 1
fi

# Install epel-release repo
yum makecache 
yum install epel-release -y

# Is Nginx installed? If not, it gets installed
if [ "$(rpm -q --last='${Status}' "nginx" 2>/dev/null | grep -c "nginx-1.14*")" == "1" ]
	then
	echo " Nginx installed, OK"
	else
 	echo "Nginx NOT installed..Installing it for you!"
	yum install nginx -y
	systemctl start nginx
	systemctl enable nginx	

fi

# Let's edit the index.html file! 
nginx_func "$@"

# Reloading Nginx
systemctl reload nginx

# Curl http://localhost
# curl http://localhost>/dev/null && echo "$?"

# Checking if fail2ban is installed and installs it, if it's not.
fail2ban_func "$@"
if [ "$?" -eq 0 ]
	then echo "Fail2ban is already installed"
	else  echo "Fail2ban is NOT installed, installing it for you.."
	yum install fail2ban -y
	cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
	cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
	systemctl start fail2ban
	systemctl enable fail2ban

fi
exit 0 



