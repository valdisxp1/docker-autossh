# valdisxp1/autossh

[![nodesource/node](http://dockeri.co/image/valdisxp1/autossh)](https://registry.hub.docker.com/u/valdisxp1/autossh/)

Docker container for creating tunnels with autossh.

* Both interactive and automated initialization available
* Generates its own SSH key
* Option for skipping "Are you sure you want to continue connecting" (implictly trusting the server key)

## Usage

### Interactive

```bash
docker run -it -e HOST="user@your.server" -e FORWARD="your forwards goes here" valdisxp1/autossh 
```
Remember to forward the ports

example:
```bash
docker run -it -e HOST="root@localhost" -e PORT=2222 -p8080:8080 -e FORWARD="-L:8080:localhost:80 -D5050" valdisxp1/autossh
```

1. Start the container with the command.

2. Wait for it to generate the SSH key.

3. Copy the key to ~/.ssh/authorized_keys for your target and then press enter.

4. Choose whether or not to trust the server key ("Are you sure you want to continue connecting (yes/no)"). Run `ssh-keygen -lf <(ssh-keyscan localhost 2>/dev/null)` on the server to compare. Alternetively you can blindly trust the server not a [man in the middle](https://en.wikipedia.org/wiki/Man-in-the-middle_attack). This can be skipped by setting `-e TRUST="yes"`.

5. It does a test connection first then the tunnel is running.

### Automated
1. Create `known_hosts` and the ssh key (`id_rsa`, `id_rsa.pub`), i.e. the only files in `/root/.ssh` directory. Therefore they can be placed in a single directory.

Generating the ssh key:
```bash
ssh-keygen -t rsa -b 4096 -N '' -f id_rsa
```

`known_hosts` can be populated from output of `ssh-keyscan -H <host>` or set `-e TRUST="yes"`.


2. start the container.

```bash
docker run -v path-to-created-config:/root/.ssh/ -e HOST="user@your.server" -e FORWARD="your forwards goes here" valdisxp1/autossh 
```

or

```bash
docker run -v path-to-known_hosts:/root/.ssh/known_hosts -v path-to-id_rsa:/root/.ssh/id_rsa -v path-to-id_rsa.pub:/root/.ssh/id_rsa.pub -e HOST="user@your.server" -e FORWARD="your forwards goes here" valdisxp1/autossh 
```


## Environment variables

* `HOST` user@hostname of the target ssh server
* `PORT` ssh port to connect; default is 22
* `FORWARD` ssh port forwards seperated by a space. See `man ssh` or [online](https://linux.die.net/man/1/ssh) for full reference.
* `TRUST` set to `yes` or `all` to skip "Are you sure you want to continue connecting" (implictly trusting the server key).

## Gotchas
* To be able access local forwards use `-L:local_port:remote_host:remote_port` instead of `-Llocal_port:remote_host:remote_port`. Leading `:` allows external connections.
* For simplicity, enviroment variables are not sanitised. Arbitrary autossh arguments can be added in `FORWARD` or arbitrary commands injected.
