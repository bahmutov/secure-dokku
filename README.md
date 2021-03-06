# secure-dokku

# DEPRECATED - these settings are now set on by default in Dokku!

Run the script [secure-dokku.sh](secure-dokku.sh) on your
[Dokku](http://dokku.viewdocs.io/dokku/) machine
to set Nginx settings to maximum security. On a fresh Dokku install the
[SSL Labs test](https://www.ssllabs.com/ssltest) will go from "C-" to "A".

Typical command to grab the script and run it on the Dokku machine

```sh
wget -O - https://raw.githubusercontent.com/bahmutov/secure-dokku/master/secure-dokku.sh | bash
```

For more details, read [Running multiple applications in Dokku][running].
Another good resource is [My First 5 Minutes On A Server](https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)
and [Server configs for Nginx repo](https://github.com/h5bp/server-configs-nginx).

[running]: https://glebbahmutov.com/blog/running-multiple-applications-in-dokku/

### Small print

Author: Gleb Bahmutov &lt;gleb.bahmutov@gmail.com&gt; &copy; 2016

* [@bahmutov](https://twitter.com/bahmutov)
* [glebbahmutov.com](http://glebbahmutov.com)
* [blog](http://glebbahmutov.com/blog)


License: MIT - do anything with the code, but don't blame me if it does not work.

Support: if you find any problems with this module, email / tweet /
[open issue](https://github.com/bahmutov/secure-dokku/issues) on Github
