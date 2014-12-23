Ansible Role: ZSH
#################

.. image:: https://travis-ci.org/loliee/ansible-zsh.svg?branch=master
    :target: https://travis-ci.org/loliee/ansible-zsh
|
|Install `ZSH <http://www.zsh.org/>`_ package and can create `~./zshrc` as you want.
|This role can also set up for you a zsh prompt, check `mlpure <http://github.com/loliee/mlpure>`_ for a nice, fast and customizable one !
|

Requirements
============

- RedHat family
- Debian family

Role Variables
==============

`zsh_users_config`
------------------

Unset by default, dictionary should defined like this:

.. code:: yaml

      zsh_users_config:
        [username]:
          [option]: [value]

**Options**

+---------------------+----------+-----------------------------------------------+
| parameter           | type     | comments                                      |
+=====================+==========+===============================================+
| default_shell       | bool     | Configure as default shell                    |
+---------------------+----------+-----------------------------------------------+
| prompt_install      | bool     | Install prompt in ~/zfunctions/ ?             |
+---------------------+----------+-----------------------------------------------+
| prompt_name         | string   | Prompt name                                   |
+---------------------+----------+-----------------------------------------------+
| prompt_download_url | string   | Prompt download url                           |
+---------------------+----------+-----------------------------------------------+
| file_zshrc          | text     | Lines to append in ~/.zshrc                   |
+---------------------+----------+-----------------------------------------------+


Example Playbook
================

The following playbook will ensure zsh is present for root user and will setup pure as prompt. This playbook will also append an alias in zshrc file.


.. code:: yaml

    # ./test/test_prompt.yml

    - hosts: localhost
      remote_user: root
      vars:
        zsh_users_config:
          root:
            prompt_install: Yes
            prompt_name: pure
            prompt_download_url: >
              https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh
            file_zshrc: |
              alias ls='ls -lah'

      # Run
      roles:
        - zsh

Run test, make sure zsh role is in your role path

.. code:: bash

  sudo ansible-playbook -i ./tests/inventory ./tests/test_prompt.yml --connection=local


Check `.travis.yml <.travis.yml>`_ for detail

Licence
=======

MIT ©  `Maxime Loliée <http://loliee.com/>`_
