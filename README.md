# Salt State for setting up Ubuntu servers
This a Salt implementation of [jasonheecs/ubuntu-server-setup](https://github.com/jasonheecs/ubuntu-server-setup), which is a bash script for setting up Ubuntu Servers.

THIS IS A WORK IN PROGRESS

## Lab Setup
I am storing configuration data inside Salt Pillar's, currently my pillar structure and content looks as follows:
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