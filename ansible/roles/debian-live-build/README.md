If you change the configuration scripts, you'll have to remove the generated config file in order to get ansible to run the script again.

Options:

1.  Add dependency, and remove the generated file thing.  (Set it to a file that doesn't get generated.)  Deploy script only when script has changed.  I don't think that information is available.

2.  Stop running this stupid script.  Get the generated config, which I'm guessing is mostly the same as my script without leading dashes and trailing backslashes on every line.  Try this after the current method is demonstrated to be repaired.  (Stale repo problems.)
