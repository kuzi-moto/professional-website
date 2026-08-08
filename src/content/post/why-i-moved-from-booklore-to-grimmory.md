---
title: "Why I Moved From BookLore to Grimmory"
description: "A brief explanation of why I switched from the BookLore ebook manager to Grimmory."
date: 2026-08-08 16:33:20 -0500 CDT
publishDate: 2026-08-08
lastmod: 2026-08-08
draft: false
categories: []
tags: []
---

In December 2025, I posted [an article](/post/ebook-system-booklore-koreader/) about setting up a self-hosted ebook system using BookLore. Several months later, the [selfh.st newsletter](https://selfh.st/weekly/2026-03-13/) highlighted some controversy surrounding the BookLore project and its developer. Shortly afterward, the project and several related resources were pulled, including the GitHub repository and Discord server. About a month later the project returned to GitHub, however it's clear that its relationship with at least part of the user base had been damaged.

This is the world of open source. We're not guaranteed or owed anything, and I appreciate the value I received from BookLore while I used it. That said, one upside of open source is that forks can spring up as replacements. One of these is [Grimmory](https://grimmory.org), and after deploying it myself and following the project for several months, I can confidently recommend it going forward to anyone interested in an ebook library manager. The migration was easy, and only required changing the image to `ghcr.io/grimmory-tools/grimmory`.

Despite BookLore's return, I will not be using it and **I cannot recommend that anyone else use it either**. I'm not particularly interested in the drama surrounding the developer, but as someone with limited time, I look for software that is dependable, regularly updated, and managed by developers I can trust. I don't want to rely on software that may disappear without warning or whose maintainers struggle to address community concerns constructively. I'm not confident that BookLore can provide that going forward. At the time of writing, BookLore has roughly 740 stars and 63 forks, compared with Grimmory's 3.9k stars and 283 forks. Those statistics are only a small part of the picture, but they do provide a quick snapshot of where the two projects currently stand. A [Wayback Machine snapshot from March 16](https://web.archive.org/web/20260316035501/https://github.com/booklore-app/booklore) shows the original BookLore repository at 11.3k stars and 674 forks before it disappeared. It's important to note that deleting a repository resets these statistics, so the difference in numbers shouldn't be interpreted as 10,000+ people actively un-starring it. The archived figured are included simply to provide context for the project's previous popularity.

In a relatively short amount of time, Grimmory is already showing strong progress. Since the first release in March, we've seen some notable updates, including:

- Mobile reading-progress API endpoints
- An overhauled PDF reader with bookmarks, document mode, and support for saving document edits
- Vertical and infinite scrolling in the PDF reader
- Kobo reading-progress improvements, personal Kobo rating sync, and more
- Improved bidirectional KOReader reading-progress sync
- A redesigned sidebar and search UI, along with improved mobile layouts
- A new theming system with light mode and an OLED dark mode
- And much more