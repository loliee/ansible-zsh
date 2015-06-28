# Ansible Role: ZSH

[![Build Status](https://travis-ci.org/loliee/ansible-zsh.svg?branch=master)](https://travis-ci.org/loliee/ansible-zsh)

Install and set up [ZSH](http://www.zsh.org/).  
This role can also configure `~./zshrc` file, upload functions files or download and set up a nice standalone `prompt`.

## Requirements

- RedHat family
- Debian family
- Darwin (OSX) with [homebrew](http://brew.sh/) package manager installed.

## Role Variables

### `__users__`

Unset by default, dictionary should defined like this:

```yaml
__users__:
  [username]:
    [option]: [value]
```
**Options**

| Option                    | Type     | Comments                                                      |
|---------------------------|----------|---------------------------------------------------------------|
| zsh_default_shell         | bool     | Configure as default shell. Create `.zshrc`and `.zfunctions`. |
| zsh_prompt_install        | bool     | Install prompt ?, default value is `No`                       |
| zsh_prompt_name           | string   | Prompt name to load in `.zshrc`.                              |
| zsh_prompt_download_url   | string   | Prompt download url, e.g [pure](https://github.com/sindresorhus/pure) |
| zsh_prompt_additional_url | string   | Prompt additional download url to put in `.zfunctions`.       |
| zsh_zfunctions_directory  | string   | Directory of files to upload on remote `.zfunctions`.         |
| zsh_zshrc_content         | text     | Lines to append in `~/.zshrc`.                                |


### Defaults

Check [defaults/main.yml](defaults/main.yml) for default values.

| Variable                          | Type     | Comments                                            |
|-----------------------------------|----------|-----------------------------------------------------|
| zsh_default_prompt_name           | string   | Default prompt_name, `mlpure`.                      |
| zsh_default_prompt_download_url   | string   | Prompt download url, [mlpure](https://github.com/loliee/mlpure) |
| zsh_default_prompt_additional_url | text     | `mlpure` async lib.                                 |

## Example Playbook

The following playbook will ensure zsh is present for root user and will setup pure as prompt. This playbook will also append an alias in zshrc file.

```yaml
# ./test/playbooks/configuration.yml
- hosts: localhost
  remote_user: root
  vars:
    __users__:
      root:
        zsh_prompt_install: Yes
        zsh_prompt_name: pure
        zsh_prompt_download_url: https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh
        zsh_prompt_additional_url: https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh
        zfunctions_directory: ./files/zfunctions
        zshrc_content: |
          alias ls='ls -lah'

  # Run
  roles:
    - zsh
```

## Run Tests

Require [serverspec](http://serverspec.org/), check [.travis.yml](.travis.yml) for details.

## Licence

MIT © [Maxime Loliée](https://github.com/loliee/)
