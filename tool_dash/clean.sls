# vim: ft=sls

{#-
    *Meta-state*.

    Undoes everything performed in the ``tool_dash`` meta-state
    in reverse order.
#}

include:
  - .licensed.clean
  - .package.clean
