## What problem does this project solves?

**First**, as I [maintain many Ghost Themes](https://github.com/firepress-org), my pain was growing exponentially. I needed to develop & maintain those themes quickly, test them, using real content that makes sense. All of this without putting unnecessary stuff in the git repo of each theme. 

I was always running after my tail as soon as I was switching between different themes or duplicating hundred of MB to duplicate my Ghost setup.

**Second**, there are many Ghost themes on Github without a proper live demo. I just wanted to download a few of them to see the result locally. Oh, and did I saw the pain to work between different machines?

This project solves all of that and makes the whole process efficient.

## What is this?

It’s a workflow to run Ghost locally within a Docker container. Once your local paths are define it’s really fun and easy to work between many themes.

**Two-goal here**:

1. It’s for **developers** who needs to quickly re-start ghost on the fly (about 3 sec) while they develop a their Ghost themes.
2. It’s for **everyone** who wants to see & try Ghost theme locally.

I have worked and re-work this workflow and with my experience, I can confirm it covers many **use cases** I have.

- Run Ghost images with tag `edge` or `stable` (you can choose them from: https://hub.docker.com/r/devmtl/ghostfire/tags/)
- Run Ghost Themes I develop actively which are in my Github local setup.
- Rename `_my_themes_sample` to `_my_themes`
- Run Ghost Themes I want to try on the fly. Just unzip any themes in the directory `_my_themes` and your Ghost container will see it.
- It shut down the containers automatically after 1 hours.
- When starting, the workflow tests many elements like:
    - What is the Ghost version
    - What is the Node version
    - Ensure Ghost does response is up

## Video & tutorial about using this

- ToDo, 2021-01-11_23h23

## Docker image source

The [docker images I use](https://github.com/firepress-org/ghostfire) are continuously integrated (built every day) thanks to Travis. See the latest images at: https://hub.docker.com/r/devmtl/ghostfire/tags/

## Basic Setup

Because this workflow syncs themes locally, you need to tweak some variables before anything.

1. Duplicate `var-config-example.sh` and rename it as `var-config.sh`
2. Configure your local environment within `var-config.sh`
3. `./run.sh`
4. In your browser, go to `http://localhost:2368/` & `http://localhost:2368/ghost`

That’s it!

## Details

- Executing `./runup.sh` runs the `stable` image
- Executing `./runedge.sh` runs the `edge` image
- Executing `./rundown.sh` shutdown the container
- Directory `theme_stable` is where your Ghost Themes are considered stable. You should never copy anything manually in there.
- Directory `theme_tryout` is where you can manually copy theme within. Copy and unzip Ghost theme you want to try here
- Directory `content` is where the Ghost container mount its volume. You should never copy anything manually in there.

## Contributing

Thanks to the power of communities, this is where `1 + 1 = 3`.

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request


## Sources & Fork

- This Git repo is available at:<br> https://github.com/firepress-org/ghost-local-dev-in-docker


## License

- This git repo is under the **GNU** license information. [Find it here](https://github.com/pascalandy/GNU-GENERAL-PUBLIC-LICENSE).
- The Ghost’s software, is under the **MIT** license. [Find it here](https://ghost.org/license/).


## FirePress Hosting

**At FirePress we do one thing and we do it with our whole heart: we host fully managed Ghost’s websites**. The idea behind FirePress is to empower freelancers and small organizations to be able to build an outstanding mobile-first website.

We also offer a **workshop** where participants ends up with a website/blog they can easily operate themselves. Details are coming soon. It is available in those cities:

- Montréal - Canada
- Toronto - Canada
- New-York - USA
- Québec City - Canada

Because we believe your website should speak up in your name, we consider our mission completed once your site has become [your impresario](https://play-with-ghost.com/ghost-themes/why-launching-your-next-website-with-firepress/). Start your [free trial here](https://play-with-ghost.com/ghost-themes/free-10-day-trial/).


## Keep in touch

- [Pascal Andy’s « now page »](https://pascalandy.com/blog/now/)
- Follow me on [Twitter](https://twitter.com/askpascalandy)
- Find more Ghost Themes on [play-with-ghost.com](https://play-with-ghost.com/)