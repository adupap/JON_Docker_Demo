Red Hat JBoss Operations Network - EAP Managed	
==============================================

Building the Docker image
-------------------------

To be able to build the image, you will have to create the [JON-Agent Image](https://github.com/PatrickSteiner/JON_Docker_Demo/tree/master/JON_Agent) and download [Red Hat JBoss EAP](http://www.jboss.org/download-manager/file/jboss-eap-6.1.0.GA.zip) 

Please note, that you might have to register with the Red Hat customer portal to access the downloads.

After having downloaded the zip-file, please copy it into the `JON_Docker_Demo/managedEAP` directory and run
```
docker build --rm -t psteiner/managed_eap .
```

Starting the Docker image
-------------------------

To start the image, please us the following command
```
docker run --link jon:jon  -d psteiner/managed_eap
```
OR Below..to give the container a specfic name and  make sure container does not exit, when EAP shutdown is called.

To start the image, please us the following command
```
docker run -i -t -h managed_eap1 --name managed_eap1 --link jon:jon  -d psteiner/managed_eap
```


This will do the following things:

 * start the image

 * start a fresh version of the JON agent

 * link this image to the already running Red Hat JBoss Operations Network container

 * start Red Hat JBoss EAP via `appStarterScript.sh`

Feel free to change any of the parameter to your liking, but please only if you know what
you are doing.

How the image works
-------------------
 
The `Dockerfile` is designed in a way that at every new start of a container, the JON Agent is started.
This brings you a fresh environment at every new start.

If you want it any other way, please feel free to create a pull-request.
