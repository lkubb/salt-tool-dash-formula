Available states
----------------

The following states are found in this formula:

.. contents::
   :local:


``tool_dash``
~~~~~~~~~~~~~
*Meta-state*.

Performs all operations described in this formula according to the specified configuration.


``tool_dash.package``
~~~~~~~~~~~~~~~~~~~~~
Installs the Dash package only.


``tool_dash.licensed``
~~~~~~~~~~~~~~~~~~~~~~



``tool_dash.clean``
~~~~~~~~~~~~~~~~~~~
*Meta-state*.

Undoes everything performed in the ``tool_dash`` meta-state
in reverse order.


``tool_dash.package.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the Dash package.


``tool_dash.licensed.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~



