# k-workspace

A warmy place to build future

Author: Christophe Tiraoui since 2020

Document status: `DRAFT-20.6.22`

## Main Goal

This project, is a tool, for building new "cloud-style" system, but, on your pocket on in the cloud.

With it, you could :

- Put your flag somewhere, on a well-featured scratch environnement
- Move your "system" easily from a place to another.  
- Store, "as a service" multiple projects ( depending your creativity )
- Suspend / Resume or Shutdown projects that doen't need to stay up forever
- Backup/Snapshot/Restore state of a project
- Nuke easily draft project

Ok, what's the cost ?

- A machine thats support docker working, desktop or server <https://docs.docker.com/engine/install/#supported-platforms>
- A browser capable to communicate to the machine
- Dot.

How:

- Kubernetes is the master peace of this "stack-maker" and "stack-runner" for little or ambitious project
- Community Contributions from open-sourced and mature "open-minded", serious, ready to use, tools , libs and apps (thanks to Helm packages and Docker imaging)
- Some (not always directly related) personnal contribution to make my everyday life easier with this product
- An elegant declarative and opensourced glue to make everything working ( with lowest prequisites as possible)
  
## Documentations ( in french only )

### Architecture

Approche: Pragmatique
Design: Hamburger
Ref: [20.6-Architecture (draw.io format)](./docs/20.6-architecture.drawio)
<!-- 
## Config

Per-Stage config file in folder ./configs

- `startup.yaml` is a ready-to-use local-run config, working as standalone ( mac os only supported for the moment )

Customize it as needed ( customizable helm values depends in each charts, in each module, in each layer) are under `helm-values` node in config -->

## Installation

### Targeting platform
  
- on a `macos X` ( wherever `docker-machine` is installable in reality), development started with Catalina 10.15
- `windows` (planed)
- Raspberry PI (`raspbian`) (planed)
- `linux` (famous distribution/ansible package manager support) (comming soon)

#### Checkout repo inside a clean folder

````bash
git clone https://github.com/krux-raoui/k-workspace.git
````

#### Inside folder

````bash
cd k-workspace/src
````

#### Launch

````bash
make up_mac
````

or

````bash
make install_mac
make deploy_mac
````

Measures:

- about 5 minutes for setup "k8s-host" stage stack with 5GB used on my dev environnement

#### Reset / Nuke a workspace

##### BE CAREFULL

This command remove ALL your "unshared" datas

This is not a problem, by design, but it can create damage in those cases:

- if your reuse some components for other usage (docker deamon, kubernetes cluster...)
- if you made some "custom cooking" with your tools
- some other cases where datas are not stored in the `shared` workspace datas folder

##### Commands

````bash
make down_mac
````

or

````bash
make undeploy_mac
````

#### Uninstall

## BE CAREFULL: this command remove core tools that could have an impact on your environment*

```bash
make undeploy
```

shared files inside in your workspace data folder, by default:

`~/ws_dev_root`

## Usage

Open a webbrowser, an go to <http://localhost> ( WIP )

Authenticate with credentials defined in your config ( WIP )
(don't forget to change it as soon as possible, often when setup and backup are set up as you like)

Enjoy

## Datas

By default, local datas are stored inside

`~/ws_startup` ( override it inside config file )

This folder is only needed while:

- `make deploy` has been done (of course)
- `docker` is up and running.

## Data Protection

Datas is precious, or not, depending your case. If not, this paragraph is not relevant, but good to know.

The last point is important when private files are VERY important.

If docker is stopped, there is no need to keep datas on "local machine".

If datas are from remote volume mount, portable storages, legacy / new / secured / test / exotic files based storage, ... too.

One of the goals of this project is the capability to "pop" envirnonnement only based on 2 elements :

- "stage" YAML config file
- "external" persistent datas ( physicaly on the host where `make deploy` has been run)
- Dot.

You have be vigilent on thoses datas, ephemeral volume and "external" volumes doesn't offer same performances.

Prefere "cold" objects storage ( like S3 ) for storing "precious datas" only, running datas cas be keept on ephemeral volumes ( emptyDir ) for better performance.

If you contributing on this project, and plan to store datas (statefull apps), you HAVE TO take care of this point.

But,

This is not magic, (at this time), and if it's misconfigured, some datas can persists on ephemeral storage whenever docker is stopped.

The only way to guarantee that no personnal 'cached' datas remains consists in two approch ( depending your use case or your philosophy )

- `undeploy` "sensitive" modules only on each layer (of course , dependent module can be affected)
- `undeploy` "sensitive" layer. (low-level layers try to implement data protection strategy described earlier, but it's not guarantee)
- `undeploy` all. ( nothing resist, just your "external" pesistent folder )

## Mutiple workspace on same machine

This is possible, technicaly.

Nice cooking config files is needed, but that's all. (WIP)

## Scalability

It's a nice to have capability but not the purpose of this project.
Build on kubernetes-compliance, any "well-architectured app" can horizontaly scale
Based on docker, this project can horizontaly scale (theoricaly) ( WIP / Missing Ref )

## Disclamer

This project is provided as-this.
Your datas is your on your own responsability.
Security, Datas and network exposition too.
External code not maintened in this reposity are under your trust.

Software contains bugs, that's life, less as possible, sure, but be bienveillant please :)

Be carefull.
