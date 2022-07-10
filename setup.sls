"Create User":
  user.present:
    - name: {{ pillar['username'] }}
    - groups:
      - sudo

# COPY PUBLIC KEY
# Make sure ~/.ssh directory exists
"Copy ssh public key":
  file.directory:
    - name: /home/{{ pillar['username'] }}/.ssh
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 700

# Make sure authorized file exists
"Create ~/.ssh/authorized_key file":
  file.managed:
    - name: /home/{{ pillar['username'] }}/.ssh/authorized_keys
    - mode: 600
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}

# Copy public key to authorized_file
"Copy public key":
  file.append:
    - name: /home/{{ pillar['username'] }}/.ssh/authorized_keys
    - text: {{ pillar['public_key'] }}

# SECURE SSH
# Disable Password Authentication for all users
"Disable Password Authentication":
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: "^PasswordAuthentication yes"
    - repl: "PasswordAuthentication no"
    - append_if_not_found: True

# Disable root from ssh-ing
"Disable root login":
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: "^PermitRootLogin yes"
    - repl: "PermitRootLogin no"
    - append_if_not_found: True

#   only allow the current user to ssh 

"Restart SSH Daemon":
  service.running:
    - name: sshd
    - enable: True
    - reload: True
    - watch:
      - file: "Disable Password Authentication"
      - file: "Disable root login"

# secure shared memory

# Setup UFW 
#   allow ssh 

# Setup swap space

# set timezone

# install and configure NTP

# install yarn

# install useful node packages

# setup git

# install and setup ZSH/ fish

# install ruby

# setup python dev enviroment

# setup and install vim-nox with powerline status
#  vim-nox is a minimal vim installation and does not have a GUI.
#  It comes with mouse support, but no clipboard support, IIRC.

# configure tmux, install tmux-plugin manager

# setup database
#   install postgress 
#   install redis
#   memcached


# setup webserver
#   install nginx
#   copy nginx configuration file
#   install lets' encrypt
#   auto renew certs (add to crontab)
