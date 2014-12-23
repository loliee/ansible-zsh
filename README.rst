Ansible Role: ZSH
#################

Install and set up `ZSH <http://www.zsh.org/>`_

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

      zsh_users_config
        user:
          option: value

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

Licence
=======

MIT ©  `Maxime Loliée <http://loliee.com/>`_
