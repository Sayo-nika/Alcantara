# Mariya
yet another DDLC mod launcher

## But why another?

I always think the current launchers like Doki Doki Mod Launcher, fDDME, and DDMM were too bloated and had a large codebase.

But a launcher's job is only to launch mods - that's it. This is why Mariya was created: to create a more minimal experience take on Mod Launcher design.

## History

Mariya is a indev project birthed from fDDME in hopes I can make the code understandable to myself (which in most cases, also readable for me).

Mariya aims to do the following:

- Provide a sandbox instance for DDLC Mods by providing a stand-alone bundle of DDLC with the mod by grabbing the DDLC installation from Steam or your local HDD if not found.

- Reinvent how Mod Launcher design is supposed to be: Minimal with no gotchas and tricky SDKs to use with.

- To showcase that you can build launchers practically more with less code.

## Technical details

Mariya uses the minimal [Photon](http://photonkit.com/) UI Framework to build its UI, thereby removing our dependency to UI frameworks like React and Angular *which is notoriously large as hell*.

The real beauty of Mariya however, is the backend. We strive to use **NO DEPENDENCIES** as possible. It's always been a misconception in Node.js development you'd need a large library to only use one function. We believe that's dirty as hell and that practice should be avoided.

We maximize the use of all known natively supported ECMAScript 6 syntax available to be used at Node.js, thereby removing the need for us to use another lang like TypeScript, contrary to our larger project Sayonika.

## Copyright

Mariya is licensed under GNU Affero General Public License 3.0 under The Sayonika Project Authors.

Mariya is a Sayonika Project. Sayonika, The Sayonika Logo, The Sayonika Mascot are trademarks of The Sayonika Project. Portions of the project is licensed under Creative Commons 3.0 Non-Commercial Unported.

The Sayonika Project and Mariya is not affiliated with Team Salvato.
