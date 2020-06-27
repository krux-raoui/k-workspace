# k-workspace

A warmy place to build future

Author: Christophe Tiraoui since 2020

Document status: `DRAFT-20.6.27`

## Main Goal

This project, is a tool, for building new "cloud-style" system, but, on your pocket or in the cloud.

With it, you could :

- Put your flag somewhere, on a well-featured scratch environnement
- Move your "system" easily from a place to another.  
- Store, "as a service" multiple projects ( depending your creativity )
- Suspend / Resume or Shutdown projects that doen't need to stay up forever
- Nuke easily draft project
- Backup/Snapshot/Restore state of a project

Ok, what's the cost ?

- A machine thats support docker working, desktop or server <https://docs.docker.com/engine/install/#supported-platforms>
- A browser capable to communicate to the machine
- Dot.

### How

- Kubernetes is the master peace of this "stack-maker" and "stack-runner" for little or ambitious project
- Community Contributions from open-sourced and mature "open-minded", serious, ready to use, tools, libs and apps (thanks to Helm packages and Docker imaging)
- Some (not always directly related) personnal contribution to make my everyday life easier with this product
- An elegant declarative and opensourced glue to make everything working ( with lowest prequisites as possible)

## Installation

### Supported host machine

- `macos x`, tested on Catalina 10.15
- `windows` (planed)
- `raspbian` (arm debian linux tuned for RaspBerry PI) (planed)
- `linux` (famous distribution/ansible package manager support) (comming soon)

### Guide

#### Configure

Customize configs/example.yaml be I recommand to duplicate with your own values ( keep example one if your are not sure)

Set `USER_CONFIG` environnement variable with the path of your file for being used in the next commands

For **demo** effect, skip this step.

#### Setup

Checkout this repositoy ( or your forked yours) inside a clean folder

````bash
mkdir ~/kws-example

cd ~/kws-example

git clone https://github.com/krux-raoui/k-workspace.git
````

#### Install

````bash

cd ~/kws-example/k-workspace

make install

````

##### Privileges and behaviours

- you will be prompted for "sudo" (aka BECOME) privilege escalation for some specific host-wide configuration (dnsmasq, ...)

- in some cases, you may need to perform command twice (on a first-time install or after a full uninstall). Command output will indicate when it's needed.
  
#### Deploy

````bash

cd ~/kws-example/k-workspace

make install

````

##### Privilege needs

- you will be prompted for "sudo" (aka BECOME) privilege escalation for some specific host-wide configuration (dnsmasq service restart, ...)

#### Up

This command perform install AND deploy operations.

If you already run the previous command, no problem, everithing will be leave in place ( or adjusted if needed)

````bash

cd ~/kws-example/k-workspace

make up

````

Measures:

- It take about 5 minutes for install and deploy "workspace" based on example config
- 5GB disk used after install and deploy

#### Usage

Open a webbrowser on the local machine, an go to <http://example.kws>

Enjoy

#### Undeploy

**BE CAREFULL** this command remove all 'unshared' datas (#NEED_INFO)

````bash

cd ~/kws-example/k-workspace

make undeploy

````

#### Uninstall

**BE CAREFULL** this command remove core tools that could have an impact on your environment

````bash

cd ~/kws-example/k-workspace

make uninstall

````

## Documentation

### More docs

- [Advanced usage and datas considerrations](./docs/ADVANCED.md)

### Architecture

- Approch: Pragmatic
- Design: Hamburger
- Ref: [20.6-Architecture (draw.io format)](./docs/20.6-architecture.drawio) *( in french only )*

## Licensing

This project is a generic receipe of a lot of tools.

Each tools may have specific licence terms ( and you have to accept each of them).

This projet is the 'glue' to make all this tools working together.

This receipe is open-source under licence decribe inside the reposity. Each tools have it's own licence, can be more/less restrictive. Ensure yourself and your usage and distribution condition don't break any **legal** rule.

## Disclamer

This project is provided as-this.
Your datas is yours and on your own responsability. Security, Datas and network exposition too.
External code not maintened in this reposity are under your trust.

Software contains bugs, that's life, less as possible, sure, but be **tolerant** please :), and report issue to the concerned project if possible.

Be carefull.
