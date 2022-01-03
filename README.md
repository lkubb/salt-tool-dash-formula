# Dash Formula
Sets up and activates Dash documentation browser. Currently, automatic docset installation is not supported, but might be possible.

## Usage
Applying `tool-dash` will make sure Dash is configured as specified.

## Configuration
### Pillar
#### General `tool` architecture
Since installing user environments is not the primary use case for saltstack, the architecture is currently a bit awkward. All `tool` formulas assume running as root. There are three scopes of configuration:
1. per-user `tool`-specific
  > e.g. generally force usage of XDG dirs in `tool` formulas for this user
2. per-user formula-specific
  > e.g. setup this tool with the following configuration values for this user
3. global formula-specific (All formulas will accept `defaults` for `users:username:formula` default values in this scope as well.)
  > e.g. setup system-wide configuration files like this

**3** goes into `tool:formula` (e.g. `tool:git`). Both user scopes (**1**+**2**) are mixed per user in `users`. `users` can be defined in `tool:users` and/or `tool:formula:users`, the latter taking precedence. (**1**) is namespaced directly under `username`, (**2**) is namespaced under `username: {formula: {}}`.

```yaml
tool:
######### user-scope 1+2 #########
  users:                         #
    username:                    #
      xdg: true                  #
      dotconfig: true            #
      formula:                   #
        config: value            #
####### user-scope 1+2 end #######
  formula:
    formulaspecificstuff:
      conf: val
    defaults:
      yetanotherconfig: somevalue
######### user-scope 1+2 #########
    users:                       #
      username:                  #
        xdg: false               #
        formula:                 #
          otherconfig: otherval  #
####### user-scope 1+2 end #######
```

#### User-specific
The following shows an example of `tool-dash` pillar configuration. Namespace it to `tool:users` and/or `tool:dash:users`.
```yaml
user:
  dash:
    license: |
      dash-license-text
```

#### Formula-specific
```yaml
tool:
  dash:
    defaults:                           # default formula configuration for all users
      license: |
        dash-license-text
```

## Todo
* [manage docsets](https://kapeli.com/dash_install). that was quite hard to find. it's ironic that a documentation browser does not have an easily accessible documentation (or I am missing something lol)

## References
* [Dash user guide](https://kapeli.com/dash_guide) (not even linked on the website)
