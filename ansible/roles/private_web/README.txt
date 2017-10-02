I can't decide if there should be a separate role for hosting pictures.
It probably doesn't matter.

There's some corresponding material in the storage_server role, like
authorized keys.  There are some hostname references which should
probably be replaced with role variables.  ("Authorize
root@${private_web_server}" instead of "authorize root@neuron".)
