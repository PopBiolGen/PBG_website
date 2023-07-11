---
permalink: /team/
title: "Team"
author_profile: false
toc: true
---
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/jpswalsh/academicons@1/css/academicons.min.css">

## Staff

{% for person in site.staff %}
  {% include author-profile-flat.html author=person.author %}
{% endfor %}

## Students

{% for person in site.students %}
  <h4> {{person.title}} {{person.name}} </h4>
  <h5> {{person.position}} </h5>
  <p> {{person.content | markdownify}} </p>
  
  
{% endfor %}

## Alumni