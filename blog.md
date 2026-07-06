---
layout: default
title: Blog
permalink: /blog/
---

# Blog

Plain-language reflections on my published research: what each paper found, why it matters, and what I'd approach differently now.

<ul class="post-list">
  {% for post in site.posts %}
  <li>
    <span class="post-meta">{{ post.date | date: "%b %Y" }}</span>
    <h3>
      <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </h3>
    <p>{{ post.excerpt }}</p>
  </li>
  {% endfor %}
</ul>
