---
permalink: /team/
title: "Team"
author_profile: false
sidebar_nav: true
---

# Staff

{% for person in site.staff %}
  ![Mugshot of {{person.short_name}}]({{site.url}}{{base.url}}{{person.image_file}})
  <h3> <a href = "{{site.url}}{{site.baseurl}}{{person.url}}"> {{person.title}} {{person.name}} </a> </h3>
  <h4> {{person.position}} </h4>
  
{% endfor %}

# Students

{% for person in site.students %}
  <h3> {{person.title}} {{person.name}} </h3>
  <h4> {{person.position}} </h4>
  <p> {{person.content | markdownify}} </p>
  
  
{% endfor %}

# Alumni