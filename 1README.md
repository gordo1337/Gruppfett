########################
# Gruppfett            #
#Group 1 Agile projekt.#
########################

General Gateway/DNS = 192.168.40.1
{Webserver 1 = 192.168.40.22
Hostname = Web01
Username= devops
Passwd = mariestad
}
{Webserver 2 = 192.168.40.23
Username= devops
Passwd = mariestad
}
{Proxy/DHCP = 192.168.40.21
Username= devops
Passwd = mariestad
}
{Loadbalancer = 192.168.40.20 (Port 7878 with SSH)
Username= devops
Passwd = mariestad

{FTP = 192.168.40.10
Username= devops
Passwd = mariestad
}
{Email = 192.168.40.32
Username= devops
Passwd = mariestad
}
{Testclient = 192.168.40.15
