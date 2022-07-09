"Create User":
  user.present:
    - name: {{ pillar['username'] }}
    - groups:
      - sudo

# Create ~/.ssh directory
# ~/.ssh/authorized_keys
# copy public key
"Copy ssh public key":
  file.directory:
    - name: /home/{{ pillar['username'] }}/.ssh
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 700

"Create ~/.ssh/authorized_key file":
  file.managed:
    - name: /home/{{ pillar['username'] }}/.ssh/authorized_keys
    - mode: 600
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}

"Copy public key":
  file.append:
    - name: /home/{{ pillar['username'] }}/.ssh/authorized_keys
    - text: {{ pillar['public_key'] }}

# edit ssh config
#   disable password authentication
#   disable root login
#   only allow the current user to ssh 

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
