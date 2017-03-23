# vkill/ubuntu-systemd-sshd

[`solita/ubuntu-systemd`](https://hub.docker.com/r/solita/ubuntu-systemd/) + an SSH server.

## Supported tags

* `latest`, `16.04`

## Running

[Ref](https://github.com/solita/docker-systemd-ssh#running)

## Test

```
$ touch ~/.ssh/authorized_keys
$ chmod 600 ~/.ssh/authorized_keys
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

$ docker-compose up -d

$ docker-compose exec sshd systemctl status

$ docker-compose exec sshd ps aux

$ ssh root@10.0.99.2
```

## License

Copyright © 2017 [vkill](http://www.vkill.net). Licensed under [the MIT license](LICENSE).
