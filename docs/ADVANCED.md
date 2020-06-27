# TODO: REVIEW
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
