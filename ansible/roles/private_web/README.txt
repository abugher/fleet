I can't decide if there should be a separate role for hosting pictures.
It probably doesn't matter.

There's some corresponding material in the storage_server role, like
authorized keys.  There are some hostname references which should
probably be replaced with role variables.  ("Authorize
root@${private_web_server}" instead of "authorize root@neuron".)

Thumbnails for the images might be nice.  More ambitiously, the display
of thumbnails could be limited to a range, based on either time or
number of pictures, toggleable and adjustable.

Videos might require some html5 for in-browser playing, and/or some HTTP
magic to make them download instead of trying to display in the browser.
