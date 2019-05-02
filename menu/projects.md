---
layout: page
title: Projects
---
<ul class="posts">
  {% for project in site.projects %}

    {% unless project.next %}
      <h3>{{ project.date | date: '%Y' }}</h3>
    {% else %}
      {% capture year %}{{ project.date | date: '%Y' }}{% endcapture %}
      {% capture nyear %}{{ project.next.date | date: '%Y' }}{% endcapture %}
      {% if year != nyear %}
        <h3>{{ project.date | date: '%Y' }}</h3>
      {% endif %}
    {% endunless %}

    <li itemscope>
      <a href="{{ site.github.url }}{{ project.url }}">{{ project.title }}</a>
      <p class="project-date"><span><i class="fa fa-calendar" aria-hidden="true"></i> {{ project.date | date: "%B %-d" }} - <i class="fa fa-clock-o" aria-hidden="true"></i> {% include read-time2.html %}</span></p>
    </li>

  {% endfor %}
</ul>
