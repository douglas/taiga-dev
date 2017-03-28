# Welcome to Taiga Dev =)

This is an effort to make Taiga development approachable and simpler to
potential contributors. 

## About Taiga

Taiga is a project management platform for agile developers & designers
and project managers who want a beautiful tool that makes work truly
enjoyable.

To learn more about it, visit <http://taiga.io>.

## For the impatient

To get yourself a development environment quickly:

```bash
git clone https://github.com/douglas/taiga-dev.git
cd taiga-dev
make quickstart
```

When taiga-backend logs displays something like this:

```
[2017-03-28 13:57:01 +0000] [1] [INFO] Starting gunicorn 19.6.0
[2017-03-28 13:57:01 +0000] [1] [INFO] Listening at: http://0.0.0.0:8000 (1)
[2017-03-28 13:57:01 +0000] [1] [INFO] Using worker: sync
[2017-03-28 13:57:01 +0000] [110] [INFO] Booting worker with pid: 110
```

You can access the url http://localhost on your browser and
login with ``admin`` and password ``123123``.

These procedures will get you an environment to experiment or to get Taiga running quickly to test it, but it is not the best way to
contribute.

To prepare a better development environment, follow the procedures in the section below. 

## Preparing an ideal development environment

To setup your development environment, you need to do the following:

1. Have ``Git`` and ``Docker`` installed on your development machine
2. To do Frontend development on Taiga, also install [yarnpkg](https://yarnpkg.com/en/).
2. Create an account on Github
3. Fork the following projects on Github:

* <https://github.com/taigaio/taiga-front>
* <https://github.com/taigaio/taiga-back>

4. Clone Taiga-dev

```bash
git clone https://github.com/douglas/taiga-dev.git
```

5. Enter in the Taiga-dev directory

```bash
cd taiga-dev
```

6. Clone the repositories your forked to this directory:

First, for ``taiga-back``:

```bash
git clone https://github.com/<YOUR-GITHUB-USERNAME>/taiga-back.git
cd taiga-back
git remote add taiga https://github.com/taigaio/taiga-back.git
cd ..
```

Now the same for ``taiga-front``:

```bash
git clone https://github.com/<YOUR-GITHUB-USERNAME>/taiga-front.git
cd taiga-front
git remote add taiga https://github.com/taigaio/taiga-front.git
cd ..
```

7. Now we need to prepare the frontend application:

```bash
make frontend_app
```

8. Finally, we are ready to build everything and start developing:

```bash
make setup
```

9. When taiga-backend logs displays something like this:

```
[2017-03-28 13:57:01 +0000] [1] [INFO] Starting gunicorn 19.6.0
[2017-03-28 13:57:01 +0000] [1] [INFO] Listening at: http://0.0.0.0:8000 (1)
[2017-03-28 13:57:01 +0000] [1] [INFO] Using worker: sync
[2017-03-28 13:57:01 +0000] [110] [INFO] Booting worker with pid: 110
```

You can access the url http://localhost on your browser and
login with ``admin`` and password ``123123``.

10. Now you are ready to help us make Taiga awesome =)

If you have any doubt or need a hand to get going, send me
an email: contato at douglasandrade.com.

## Credits

This project is heavily based on Douglas Miranda (@douglasmiranda) work - congrats, Xará ;-)

https://github.com/douglasmiranda/docker-taiga

Also inspired by:

* <https://github.com/praekeltfoundation/alpine-buildpack-deps>
* <https://nickjanetakis.com/blog/alpine-based-docker-images-make-a-difference-in-real-world-apps>
* <https://taigaio.github.io/taiga-doc/dist/setup-production.html>
* <https://github.com/benhutchins/docker-taiga>
* <https://github.com/ipedrazas/taiga-docker>
