basket4py
=================

## A python environment with anaconda and vagrant
This project gives you an easy start with python:
+ Develop your python scripts within jupyter notebooks
+ Use a full blown anaconda stack for data science task
+ Visualize you data with
    * Matplotlib
    * seaborn
+ The whole environment is setup within a virtual linux box, so your computer won't be impacted by any installation of the python environment.
+ The provisioning is done with chef. So the chef recipes can easily be customized
+ Everything is based on virtualbox and vagrant. So the whole setup is portable from one computer to the next and works independently from your OS (i.e. it works as well with OSX as with windows)

## Integrated platform to edit and run your programs

![Get an idea of a jupyter notebook](images/01_The_Basics_annotated.png)

## How to get started
### Installation
If you know how to insall programs on a Mac or PC, you should be able to get everything up and running. If not, ask someone to help you.

Follow these simple steps to install everything you need to start programming:
1. install [virtual box](https://www.virtualbox.org/wiki/Downloads).
* install [vargrant](https://www.vagrantup.com/downloads.html).
* Copy the [zipfile from Github](https://github.com/rreben/basket4py/). And extract it somewhere.
* Use a terminal (dos-prompt / cmd) and navigate to the folder that contains the extracted files. You should find a file named `vagrantfile`.
* type in `vagrant up`. This command will prepare a "virtual computer" on your pc or mac. Everything will be installed within this "virtual computer" so there won't be any interferences with other programs on your mashine.
* type in `vagrant provision` this command may take even longer (leave it for the night). It will install a modern python development environment.

### Start the tutorial
After the installation. Use [http://localhost:8888](http://localhost:8888) in your web browser, to start the environment. Click on the first lesson to start the tutorial.

## Stoping and resuming
* Use `vagrant status` to check whether the vagrant machine is up and running.
* start and stop vagrant via `vagrant up` and `vagrant halt` (do not use `vagrant suspend` in most cases)
* Use `vagrant destory` if you have to restart completly from scratch or have to reuse the disk space.

## Behind the scenes
* Vagrant is used to install python 3, jupyter and some other tool from the Anaconda eco system to a virtual mashine.
* Vagrant is instructed to use chef as the provisioner.
* The virtual machine is provided via Oracles virtual box.
* A web server is running on the virtual (guest) computer. This server serves the jupyter notebooks.
* These notebooks can be accessed via port forwading from the host computer.
* This way all the tutorials are brought to the users browser.

## Acknowledgement
This work is inspired by Matthew A. Russel's work on [Mining the social Web](https://miningthesocialweb.com), where I found out about iPython (now jupyter) and how to use Vagrant and chef to prepare an easy to deploy development environment.

I followed the ZX81 manual. And adopted it for learning python. So I owe a lot to Steven Vickers and his famous book: "Sinclair ZX81 BASIC Programming by Steven Vickers Second Edition 1981."

I used the following chef recipes to cook up the development environment:
* [anaconda](https://github.com/thmttch/chef-continuum-anaconda)
* [apt](https://github.com/chef-cookbooks/apt)
* bzip2 chef cookbook from John Bellone
* compat chef cookbook from John Keiser
* [packagecloud](https://github.com/computology/packagecloud-cookbook')
* runit chef cookbook from the Heavy Water Operations, LLC.
* tar chef cookbook from the Cramer Development, Inc.


## Status
* The vagrantfile is done, so setting up the development environment is working. Some tweeks to the chef recipes have been necessary to point the jupyter working directory to the right directory that is linked from the guest machine directly to the host machine.
* The first lesson on statements and expressions is finished.


## Handling errors
### Problems with mounting the directories / Guest additions do not match
You might see a warning while vagrant up, telling you that guest additions do not match the version of the virtual box.

![important warning](images/warningGuestAdditions.png)

The effect might be that the directories with the jupyter notebooks are not mounted correctly. In this case you will see that jupyter is running (localhost:8888 will show a webpage), however you will not see any meaningful tutorials.

If this happens, you have to update your virtualbox installation to the newest version. Use `vagrant destroy` to restart from scratch, use `vagrant up` to install again (do this in a strong wifi network). This should fix everything.

#### Tips for analysing errors
In most cases, this should solve your problems. But if the message "The guest additions on this VM do not match the installed version of VirtualBox! ..." persists, you might try to issue. `vagrant plugin install vagrant-vbguest` and restart vagrant. This might indicate further problems with the guest additions.

Use `vagrant ssh` to login to your guest mashine. Here you might issue `ipython notebook --help` to learn more about starting the jupyter service.

### Other bugs and errors
Your stuck with the installation. Please create an issue on Github, I will try to help you then.

## Get in touch
* Use Github to open tickets for support questions.
* Follow me on Twitter `@r_rbn`
* Tweet using `#lhtc` (learn how to code). Or send me a DM.
* Forking, starring, following the github repo would be great.
