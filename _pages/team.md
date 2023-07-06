---
permalink: /team/
title: "Team"
author_profile: false
sidebar_nav: true
---

## Staff

{% for person in site.staff %}
  ![Mugshot of {{person.author.short_name}}]({{site.url}}{{site.baseurl}}{{person.author.avatar}})
  <h4> <a href = "{{site.url}}{{site.baseurl}}{{person.url}}"> {{person.author.name_title}} {{person.author.name}} </a> </h4>
  <h5> {{person.author.position}} </h5>
  
{% endfor %}

## Students

{% for person in site.students %}
  <h4> {{person.title}} {{person.name}} </h4>
  <h5> {{person.position}} </h5>
  <p> {{person.content | markdownify}} </p>
  
  
{% endfor %}

## Alumni