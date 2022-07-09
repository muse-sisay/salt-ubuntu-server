# Salt State for setting up Ubuntu servers
This a Salt implemantation of [jasonheecs/ubuntu-server-setup](https://github.com/jasonheecs/ubuntu-server-setup/blob/master/setup.sh), which is a bash script for setting up Ubuntu Servers.

THIS IS A WORK IN PROGRESS

## Lab Setup
I am storing configuratin data inside Salt Pillar's, currently my pillar structure and content looks as follows:
```
/srv/pillar/
├── top.sls
└── ubuntu_server.sls
```
```yaml
# file: /srv/pillar/ubuntu.sls
username: tux
public_key: |
  <REDACTED>
```

My highstate for pillar looks as follows:
```yaml
# file: /srv/pillar/top.sls
base:
  '*':
    - ubuntu_server
```