---
layout: page
permalink: /teaching/
title: teaching
description: Teaching materials 
nav: true
nav_order: 2
horizontal: false
---

<!-- pages/teaching.md -->
<div class="teaching">
  <!-- Generate cards for each project -->
  {% if page.horizontal -%}
  <div class="container">
    <div class="row row-cols-2">
    {%- for project in sorted_projects -%}
      {% include teaching_horizontal.html %}
    {%- endfor %}
    </div>
  </div>
  {%- else -%}
  <div class="grid">
    {%- for project in sorted_projects -%}
      {% include teaching.html %}
    {%- endfor %}
  </div>
</div>
