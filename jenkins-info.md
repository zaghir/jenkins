### Installation de server ssh dans centos 

Pour démarrer un serveur SSH dans CentOS, vous devez installer le paquet OpenSSH Server et ensuite démarrer et activer le service SSH. Voici les étapes à suivre :

1 - Installer le paquet OpenSSH Server :
Ouvrez un terminal et exécutez la commande suivante pour installer le paquet OpenSSH Server si ce n'est pas déjà installé :

> sudo yum install openssh-server  

2 - Démarrer et activer le service SSH :
Après l'installation du paquet OpenSSH Server, vous pouvez démarrer et activer le service SSH en utilisant les commandes suivantes :

> sudo systemctl start sshd  # Démarrer le service SSH
> sudo systemctl enable sshd # Activer le service SSH pour qu'il démarre automatiquement au démarrage du système
C'est tout ! Le serveur SSH est maintenant démarré et prêt à accepter des connexions entrantes. Vous pouvez vous connecter au serveur via SSH à l'aide d'un client SSH tel que ssh sur Linux/Mac ou PuTTY sur Windows.

3 - Assurez-vous également que le pare-feu (firewall) autorise les connexions entrantes sur le port 22 (port par défaut du service SSH). Si le pare-feu est activé, vous pouvez ouvrir le port 22 en exécutant la commande suivante :

> sudo firewall-cmd --add-service=ssh --permanent
> sudo firewall-cmd --reload
Après avoir effectué ces étapes, votre serveur SSH sera opérationnel et prêt à accepter les connexions sécurisées à distance.



4 -  connecter avec un client ssh au serveur 
> ssh root@192.168.0.16


---------------------------------------------

### Installation de Jenkins

>  sudo yum install java-17-openjdk-devel
>  java -version

> cat >> /etc/environment <<EOL
> JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.6.0.9-0.3.ea.el8.x86_64
> JRE_HOME=/usr/lib/jvm/jre-17-openjdk-17.0.6.0.9-0.3.ea.el8.x86_64
> EOL

cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.6.0.9-0.3.ea.el8.x86_64
JRE_HOME=/usr/lib/jvm/jre-17-openjdk-17.0.6.0.9-0.3.ea.el8.x86_64
EOL

https://access.redhat.com/documentation/fr-fr/openjdk/11/html/installing_and_using_openjdk_11_on_rhel/installing-openjdk11-on-rhel8
pour de probleme de compatibilité avec les encien depot 
on va utiliser la version 11 de java 
>  sudo yum install java-11-openjdk-devel
>  sudo yum install java-1.8.0-openjdk
>  sudo yum list installed "java*"

https://linuxize.com/post/install-java-on-centos-8/

> sudo alternatives --config java
There is 3 program that provides 'java'.

  Selection    Command
-----------------------------------------------
   1           java-17-openjdk.x86_64 (/usr/lib/jvm/java-17-openjdk-17.0.6.0.9-0.3.ea.el8.x86_64/bin/java)
*+ 2           java-1.8.0-openjdk.x86_64 (/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.362.b08-3.el8.x86_64/jre/bin/java)
   3           java-11-openjdk.x86_64 (/usr/lib/jvm/java-11-openjdk-11.0.18.0.9-0.3.ea.el8.x86_64/bin/java)

> Enter to keep the current selection[+], or type selection number: 3


> sudo systemctl restart jenkins
> sudo systemctl enable jenkins


> cat >> /etc/environment <<EOL
> JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.18.0.9-0.3.ea.el8.x86_64
> JRE_HOME=/usr/lib/jvm/jre-11-openjdk-11.0.18.0.9-0.3.ea.el8.x86_64
> EOL
export PATH=${PATH}:${JAVA_HOME}/bin

echo ${PATH}


https://phoenixnap.com/kb/how-to-install-jenkins-on-centos-8



Pour installer Jenkins dans CentOS, vous pouvez suivre les étapes ci-dessous :

Ajouter le référentiel Jenkins :
Pour installer Jenkins, vous devez d'abord ajouter le référentiel Jenkins à votre système CentOS. Créez un fichier de configuration pour le référentiel Jenkins à l'aide de la commande suivante :


> sudo wget –O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo

si le fichier jenkins.repo n'est recupré  creer le manuallement

> sudo vi /etc/yum.repos.d/jenkins.repo
Ajoutez les lignes suivantes dans le fichier de configuration :
>
[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat
gpgcheck=1
>

Enregistrez et quittez l'éditeur.

Importer la clé GPG :
Pour valider les paquets Jenkins téléchargés à partir du référentiel, vous devez importer la clé GPG Jenkins. Exécutez la commande suivante pour importer la clé GPG :

> sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key  
> sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key


pour vérifier si la clé GPG jenkins.io.key est ajoutée dans CentOS, vous pouvez utiliser la commande rpm pour afficher la liste des clés GPG importées sur votre système. Voici comment procéder :

> sudo rpm -qa gpg-pubkey*

> our connaître le hachage (fingerprint) de la clé GPG jenkins.io.key, vous pouvez utiliser la commande gpg. Voici comment faire :

Téléchargez la clé GPG jenkins.io.key sur votre système CentOS en utilisant la commande wget :

> wget https://pkg.jenkins.io/redhat/jenkins.io.key

Importez la clé GPG téléchargée dans la base de données des clés GPG de votre système :

> gpg --import jenkins.io.key
Vérifiez le hachage de la clé GPG à l'aide de la commande gpg --fingerprint en spécifiant l'ID de la clé. L'ID de la clé est généralement affiché après l'importation de la clé. Par exemple :

> gpg --fingerprint 9B7D32F2D50582E6
Remplacez 9B7D32F2D50582E6 par l'ID réel de la clé jenkins.io.key que vous avez importée.

verifier la date d'expiration de certificat

https://github.com/jenkins-infra/helpdesk/issues/3457


Installer Jenkins :
Maintenant que vous avez ajouté le référentiel et importé la clé GPG, vous pouvez installer Jenkins à l'aide de la commande yum :

yum clean packages

> sudo yum install jenkins   
sudo dnf install jenkins
Démarrer le service Jenkins :
Après l'installation, vous pouvez démarrer le service Jenkins et l'activer pour qu'il démarre automatiquement au démarrage du système :


s'il vous avez un probleme de ==> Error: GPG check FAILED 
> sudo yum clean all
> sudo yum clean metadata
> sudo dnf clean all
> rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
> sudo yum update
> sudo yum install jenkins


> sudo systemctl start jenkins
> sudo systemctl enable jenkins

Ouvrir le pare-feu pour Jenkins :
Si le pare-feu est activé sur votre système, vous devez ouvrir le port 8080 pour permettre l'accès à l'interface Web Jenkins. Exécutez les commandes suivantes pour ouvrir le port :

> sudo firewall-cmd --permanent --add-port=8080/tcp
> sudo firewall-cmd --reload
Accéder à l'interface Web Jenkins :
Jenkins est maintenant installé et en cours d'exécution sur votre système CentOS. Vous pouvez accéder à l'interface Web Jenkins en ouvrant votre navigateur et en saisissant l'URL suivante :

http://votre_adresse_ip:8080
Lors de la première visite de l'interface Web, Jenkins vous demandera de déverrouiller Jenkins en accédant au fichier initialAdminPassword. Vous pouvez trouver le mot de passe initial en exécutant la commande suivante :


sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Pour redemarrer jenkins 
> sudo systemctl restart jenkins

Pour demarrer jenkins 
> sudo systemctl start jenkins

vérifier l'état du service Jenkins pour vous assurer qu'il fonctionne correctement :
> sudo systemctl status jenkins



--------------------------
### Executer un script dans un job jenkins

> cd /tmp 

> vi testscript.sh

ajouter le contenu 

#!/bin/bash
Name=$1
LastName=$2
Age=$3
Visible=$4

if [ "$Visble" = "true" ]; then 
	echo "Hello I am $Name $LastName, and I am $Age years old."
else
	echo "Please pass Visible True!!!"
fi

> ls -lrt 

drwx------. 2 jenkins jenkins       6 Aug  1 03:16 jetty-0_0_0_0-8080-war-_-any-12687653750448803660
-rw-r--r--. 1 root    root         77 Aug  1 03:39 testscript.sh


executer le script

> ./testscript.sh


changer le meta donnée de fichier 

> chmod 755 testscript.sh

> ls -lrt 
drwx------. 2 jenkins jenkins       6 Aug  1 03:16 jetty-0_0_0_0-8080-war-_-any-12687653750448803660
-rwxr-xr-x. 1 root    root         77 Aug  1 03:39 testscript.sh


> # ./testscript.sh Youssef 40
Hello I am Youssef, and I am 40 years old.






-----------------------------

https://github.com/anshulc55/Jenkins_Upgradev3

### Installer le plugin de Github integration 
verifier que git est installer dans le serveur 
> git --version
git version 2.39.3 

Dans Jenkins 
Dashboard > Manage Jenkins > Plugins > Available Plugins 

installer le plugin =>> GitHub Integration


### Installer Maven dans le serveur 
 > mvn --version
 > yum install maven
 
 > mvn --version
 Apache Maven 3.5.4 (Red Hat 3.5.4-5)                                                         
 Maven home: /usr/share/maven                                                                 
 Java version: 17.0.6-ea, vendor: Red Hat, Inc., runtime: /usr/lib/jvm/java-17-openjdk-17.0.6.
 Default locale: en_GB, platform encoding: UTF-8                                              
 OS name: "linux", version: "4.18.0-500.el8.x86_64", arch: "amd64", family: "unix"            




ajouter la config de maven dans jenkins 

------------------------------------------------

### Install Tomcat 

step 1
Install Java 

step 2 
> sudo yum install unzip wget 
> cd /tmp
> wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.91/bin/apache-tomcat-8.5.91.zip
> unzip apache-tomcat-*.zip
> sudo mkdir -p /opt/tomcat
> sudo mv apache-tomcat-8.5.91 /opt/tomcat

Step 3 : change Tomcat Sertver Port 

Go to /opt/tomcat/apache-tomcat-8.5.91/conf/server.xml file 
Search for Connector and change the Port value , save file 

Dans vi la recherche ce fait par /nom_a_chercher 
<Connector port="9090" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />


Step 4 : Change Permission of Scripts in /bin 
> cd /opt/tomcat/apache-tomcat-8.5.91/bin 
> ls -la 
> sudo chmod +x *

Step 5 : Start tomcat server and access via browser on port 9090 
> /opt/tomcat/apache-tomcat-8.5.91/bin/startup.sh

Step 6 : Configure Jenkins with Tomcat for Auto Deployment of Artifacts
Set Credentials of Tomcat that Jenkins use.
> cd /opt/tomcat/apache-tomcat-8.5.91/conf

update tomcat-users.xml file 
> vi tomcat-users.xml
roles : manager-script & manager-gui
Set password : tomcat

Like that
  <role rolename="manager-script"/>
  <role rolename="manager-gui"/>
  <user username="tomcat" password="tomcat" roles="manager-script,manager-gui"/>
</tomcat-users>


> cd /opt/tomcat/apache-tomcat-8.5.91/webapps/manager/META-INF
> vi context.xml

metre en commentaire 
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                   sameSiteCookies="strict" />
<!-- --------------------------------
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
-->
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>


Step 7 : Restart the tomcat server 
> /opt/tomcat/apache-tomcat-8.5.91/bin/shutdown.sh
> /opt/tomcat/apache-tomcat-8.5.91/bin/startup.sh


--------------------------

Jeninks 
Install plugins : Copy Artifact & Deploy to Containers 

Copy Artifact   = copy artifcat from Job A to Job B 

Build pipeline plugin this plugin provides a Build pipeline View of upstream and downstream connected jobs 


-------------------------------

### create an other Tomcat server for production 

in the same machine we have two server 
  - stagin     server with 9090
  - production server with 8090

> /opt/tomcat/apache-tomcat-8.5.91/bin/shutdown.sh
> /opt/tomcat/apache-tomcat-8.5.91/bin/startup.sh

> cd /opt/tomcat 
> cp -r apache-tomcat-8.5.91/ apache-tomcat-8.5.91-prod/
> vi /opt/tomcat/apache-tomcat-8.5.91-prod/conf/server.xml
  <Connector port="8090" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000"
               />


> sudo firewall-cmd --permanent --add-port=8090/tcp
> sudo firewall-cmd --permanent --add-port=9091/tcp
> sudo firewall-cmd --reload
			   
> cd /opt/tomcat			   
> /opt/tomcat/apache-tomcat-8.5.91/bin/startup.sh
> tail -f apache-tomcat-8.5.91/logs/catalina.out

> /opt/tomcat/apache-tomcat-8.5.91-prod/bin/startup.sh

> /opt/tomcat
> tail -f apache-tomcat-8.5.91/logs/catalina.out
> tail -f apache-tomcat-8.5.91-prod/logs/catalina.out
01-Aug-2023 10:34:32.244 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in 3152 ms



install DSL plugin  = JOB DSL


### url doc plugin DSL 
https://jenkinsci.github.io/job-dsl-plugin/#path/job-scm-baseClearCase
https://jenkinsci.github.io/job-dsl-plugin/#path/job




----------------------------------------

> sudo -iu jenkins 

generate key for ssh 

> ssh-keygen -t rsa
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.

create .ssh directory in the slave node 

Mater node  ip 192.168.0.16 
Salve node  ip 192.168.0.11 

 -p = dont show me any error
> ssh root@192.168.0.11 mkdir -p .ssh

Il faut avoir la clé public creer dans le dossier jenkins  
Exemple /var/lib/jenkins/.ssh/id_rsa.pub

pour des raison en continu comme ca 

copy public key from /root/.ssh/id_rsa.pub to directory .ssh/auhorized_key in slave node 
> cat /root/.ssh/id_rsa.pub |  ssh root@192.168.0.11 'cat >> .ssh/auhorized_key'

pour verifier que la connxion depuis le master node vers le slave node fonction on se connecte avec ssh sans password

> ssh root@192.168.0.11

dans la machine slave c'est le dossier bin dans /root

> cd /root
> mkdir -p bin
> cd bin 
> pwd
/root/bin

download jar file from master node 

> wget http://192.168.0.16:8080/jnlpJars/slave.jar

verifier que java existe 
> java -verion 

dans Jenkins master 
Dashboard > Manage Jenkins > Nodes  -> new node 


installer le plugin pour la security et les roles 

Role-Based Authorization Plugin   restart after installation 