+++
title = "Create your own blog with Hugo"
date = 2018-07-29T08:12:13-07:00
draft = true
tags = ["Hugo", "deployment", "personal-website"]
categories = [
    "Hugo",
    "deployment",
    "personal-website"
]
+++

[Hugo][1] is a framework for building websites, technically speaking, building static pages. You could build your own website with the only prerequisite of some [command line][2] and start writing immediately with [markdown][3]. 

## Step 0. Install Homebrew 
If you have a Mac but not using [Homebrew][4], you definitely have to try this package manager. And we will need it to install [Hugo][hugo] anyway. Hugo is the 
  
Use the following command to install Homebrew:

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew --version # check installation

## Step 1. 
If you have installed Homebrew successfully, then you could have Hugo installed in one line:

	> brew install hugo
	> hugo help # you are good to go!

If you are **not** using macOS, you need to check more complete instructions at [Install Hugo][5].

## Step 2. Create a new site
	> hugo new site /@path/your-new-site
The above will create a folder named `your-new-site` in your designated @path. And it will be the root of your newly created Hugo web application.

## Step 3. Add a theme
Being one of the most popular open-source framework for building websites, Hugo has a large and responsive community producing cool themes. Complete list of available themes can be found [here][6].

From the root of you Hugo site:

	> # clone your favorite theme into `themes/@your-theme`:
	> git clone https://github.com/@author/@your-theme.git themes/@your-theme
	
	> # Generate site files into public directory
	> hugo -t @your-theme

## Step 4. Start writing
Congratulations, your first blog post is only one stone's throw from here!
### Creating Posts
Posts should generally go under a `content/blog` directory. Simply run:

	> hugo new blog/your-new-post.md

the above will create `your-new-post.md` under `content/blog/`, as well as the `ontent/blog/` directory itself if not exist.
  
For posts to appear on your site, you may need draft = false in the post’s front matter or use the --buildDrafts option when building.
### Creating Fixed Pages
Fixed pages such as an About page should preferably go under `content/fixed` or be present at the root of the `content` directory(my preferable way).

	> hugo new about.md

The static pages you are going to build is genuinely text-based and the only tool you need to grab is the [markdown makeup][7] language.

## Step 5 - Infinity. Have fun playing with it.
The best approach to learn something is to play with it. Actually I build this site as a 2018 birthday gift to myself.
  
Recommended starting point: 

  - [Hugo docs][8].
  - [Hugo 中文文档][9]
  - [Hugo 从入门到会用][10]


[4]: https://brew.sh
[1]: https://gohugo.io
[2]: https://www.learnenough.com/command-line-tutorial
[3]: https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf
[5]: https://gohugo.io/getting-started/installing/
[6]: https://themes.gohugo.io
[7]: https://www.markdownguide.org
[8]: https://gohugo.io/documentation/
[9]: http://www.gohugo.org/doc/tutorials/github-pages-blog/
[10]: https://blog.olowolo.com/post/hugo-quick-start/
