---
title: "Building a Self-Hosted Ebook System with BookLore and KOReader"
description: ""
date: 2025-09-09
publishDate: 2025-12-18
lastmod: 2025-12-18
draft: false
categories: []
tags: []
---

I used to be a big reader, but as I got older and busier, I realized I almost never read full-length novels. Of course I read a lot of interesting things online, but it’s just not the same.

Recently I was gifted a Kobo e-ink reader and thought it would be a great time to develop a system I can use to manage my books and facilitate easy transfers. Unfortunately, it runs a custom operating system and lacks any sort of app store, which limits the built-in options for ebook management. 

Here’s an overview of the most common ways to get books onto a reader:

1. Kobo Store - Proprietary store, purchases are wrapped in DRM, KEPUB format is not portable
2. Copy over USB - Requires physically connecting the reader to a computer to copy over the ebook files.
3. Cloud Storage (Dropbox/Google Drive) - Must maintain all the books that are synced with your device through another computer.

Individually these methods work fine, but none of them fit how I wanted to read and manage my books long-term. As an avid self-hoster and someone who enjoys optimizing my experience as much as possible, any of these were completely unacceptable! So I set out to find my ideal setup. My goals:

1. Easily download any books from my library to a device.
2. Sync reading progress across multiple devices.
3. Book organization and sorting.

## The Solution

I'll go ahead and explain each aspect of my setup, and how it works. This setup is aimed at people who are comfortable self-hosting or tinkering a bit, but who may be new to ebook infrastructure specifically.

### Library Management Server - BookLore

"[BookLore](https://github.com/booklore-app/BookLore) is a self-hosted app for managing and reading books & comics (PDF, EPUB, CBZ) with metadata editing, OPDS, reading progress, and multi-user support".

Basically, it's the centerpiece of this whole operation. I have a server at home running TrueNAS Community Edition (formerly SCALE) which stores all my books and also runs the application using Docker[^1]. With BookLore, you can access your library through a very sleek and modern web interface. It provides features such as uploading books, editing book metadata (cover, author, publisher, etc.), built-in reader, statistics (I have an unhealthy addiction to stats), progress sync, and very importantly an OPDS server.

OPDS (Open Publication Distribution System) is simply a way for other devices, primarily ebook readers, to interact with your library. It allows for many different types of clients to interact with and download books from a server. It allows many different types of clients to browse and download books from a server.

Sometimes it’s not practical to browse your library through a web browser. In my opinion, web browsers on e-ink displays offer a poor experience.

#### Honorable Mention - Calibre

If you are new to e-book managers, Calibre is the gold standard. It has all of the features you would expect such as a reader, metadata fetching, a book editor, OPDS server, and an extensive set of plugins to further extend its functionality.

Calibre was the first e-book manager I used, and it works very well. Ultimately it came down to personal taste. Calibre is about fifteen years old, which is a testament to its success and longevity. It also looks and acts like a fifteen-year-old application.

The biggest limitation, for me, is that it’s strictly a desktop application. This means there’s no native way to run it on a traditional server and access it through a web browser. There is a workaround[^2], but this results in a poor user experience as the app is running through a Remote Desktop.

There are some companion apps that were created around it such as [Calibre Web](https://github.com/janeczku/calibre-web), and others that do a good job of providing a modern interface. I’ll still use BookLore myself, but there are definitely some projects worth checking out if you don’t like it.

All this being said, I still use Calibre for processing books before adding them to my server because it has a great ebook editor built in, which I use to remove extra crud like advertisements.

### E-Reading App - KOReader

Just as important as the server is the reading app itself. My reader of choice is [KOReader](https://koreader.rocks/). It supports reading many filetypes and is available across many types of devices such as Kindle, Kobo, Android, and more. It is designed for e-ink screens so the interface looks quite basic when used on a regular display. But what it lacks in style, it makes up for in functionality!

I picked it because it supports OPDS (my Kobo does not by default), and progress sync. Sadly, there’s no iOS app 😕. I’m not a fan of reading on my phone anyway, so it’s not a deal-breaker, but it would be a nice-to-have.

#### About Progress Sync

Unfortunately, there is no universal standard for syncing book progress between different devices. As a result, most readers provide their own methods which allow you to sync progress between devices while using the same reader. In many cases “free” readers found on Android/iOS require a subscription to access syncing features or impose other limits.

KOReader also has its own sync, with the main difference that you run the server yourself. BookLore has the sync server built-in, Calibre has a plugin available, and there is a standalone server as well. Here are the instructions for setting up the progress sync in BookLore: https://booklore-app.github.io/booklore-docs/docs/integration/koreader

BookLore also supports progress syncing when using its web reader, but this is separate from KOReader’s sync system. See this issue for more information or updates: https://github.com/booklore-app/booklore/issues/953

### Book Management

Now that we have all the pieces, we can figure out how to actually get your books onto your reader. As mentioned earlier, BookLore supports providing an OPDS feed which can be consumed by any OPDS-capable client, which KOReader supports out of the box.

Once configured, all you need to do is browse the catalog in the KOReader app, select your book, and press download. Books can be uploaded to the server, and downloaded to any device easily and without the hassle of cables or SD cards. This can enable access outside of your home network as well, if you have the technical know-how and are aware of the risks of exposing services to the internet.

Here's a guide for setting up the server and connecting with KOReader: https://booklore-app.github.io/booklore-docs/docs/integration/opds/

## Conclusion

In short: **BookLore** manages and serves the library → **OPDS** exposes it → **KOReader** consumes it on any device and syncs progress.

I spent a decent amount of time testing and researching different servers and readers, and found BookLore + KOReader to provide the most simple but powerful solution for me. It’s completely self-hosted, allows for complete control over your data, and uses Free and Open Source Software. 

[^1]: A dedicated always-on computer is crucial for anyone interested in getting into self-hosting! It doesn't have to be anything fancy, any old computer/laptop works fine.

[^2]: Luckily, the folks at linuxserver.io have us covered with a [Docker image](https://docs.linuxserver.io/images/docker-calibre/).
