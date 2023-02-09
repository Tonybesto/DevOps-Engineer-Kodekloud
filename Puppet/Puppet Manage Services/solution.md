#### Puppet Manage Services

1. change directory to manifests, 

```
cd /etc/puppetlabs/code/environments/production/manifests
```

2. Create a puppet programming file `beta.pp` and write the connfiguration,

```
vi beta.pp
#### Refer same directory for config file 
```

3. Use validate the check if there is any issue with the above script, blank, means everything is fine.

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate beta.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. Now, SSH to App servers respectively and run using --noop and without noop,

```
[root@stapp01 tony]# puppet agent -tv --noop
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Applying configuration version '1675951745'
Notice: Applied catalog in 0.19 seconds

[root@stapp01 tony]# puppet agent -tv 
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp01.stratos.xfusioncorp.com
Info: Applying configuration version '1675951796'
Notice: Applied catalog in 0.20 seconds
```

5. Finally validate the status of the `tomcat` service which we installed,

```
[root@stapp01 tony]# service tomcat status
Redirecting to /bin/systemctl status tomcat.service
● tomcat.service - Apache Tomcat Web Application Container
   Loaded: loaded (/usr/lib/systemd/system/tomcat.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2023-02-09 14:08:54 UTC; 1min 46s ago
 Main PID: 1254 (java)
   CGroup: /docker/7b25172aff1255d6acbbe6d419f6c2d3ff978a2e0ad48c7af70c0c54efc4f4be/system.slice/tomcat.service
           └─1254 /usr/lib/jvm/jre/bin/java -Djavax.sql.DataSource.Factory=org.apache.commons.dbcp.BasicDataSourceFactory -classpath /usr/share/tomcat/bin/...

Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: Feb 09, 2023 2:08:59 PM org.apache.catalina.core.StandardService startInternal
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: INFO: Starting service Catalina
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: Feb 09, 2023 2:08:59 PM org.apache.catalina.core.StandardEngine startInternal
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: INFO: Starting Servlet Engine: Apache Tomcat/7.0.76
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: Feb 09, 2023 2:08:59 PM org.apache.coyote.AbstractProtocol start
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: INFO: Starting ProtocolHandler ["http-bio-8080"]
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: Feb 09, 2023 2:08:59 PM org.apache.coyote.AbstractProtocol start
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: INFO: Starting ProtocolHandler ["ajp-bio-8009"]
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: Feb 09, 2023 2:08:59 PM org.apache.catalina.startup.Catalina start
Feb 09 14:08:59 stapp01.stratos.xfusioncorp.com server[1254]: INFO: Server startup in 1295 ms
```
Thank you.
