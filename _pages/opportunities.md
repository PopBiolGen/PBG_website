---
title: Opportunities
permalink: /opportunities/
toc: true
toc_sticky: true
header:
  overlay_color: "#000"
  overlay_filter: "0.00"
  overlay_image: /assets/images/gallery/bluemtnspano.jpg
---

# Opportunities

Opportunities regularly emerge to work with us, and sometimes you can make your own opportunity. We run an inclusive group, with an emphasis on good supervision over lots of supervision.  We work towards excellence, but are kind towards mistakes and try to have fun along the way. We demand numerical competency of our staff and students, as well as an ability to write well, be self-motivated, and to work independently.  If you already have (or are willing to strive for) these qualities and you have an interest in ecology and evolution, then read on!

{% assign opps=site.opportunities | where:"open","true" %}

## Honours / Masters

The transition from undergraduate study to running your own research project can be equal parts daunting and exhilarating.  Our job is to support you through the ups and downs of that journey, and to help you produce publication-standard work. Students looking to do Honours or Masters will typically take on a slightly more ‘received’ project.  This is not to say that the project will be prescriptive, but rather that we’ll have a strong role in defining the questions and techniques that you might use.    

{% assign honsopps=opps | where:"type","Hons" %}
{% if honsopps.size>0 %}
We currently have Honours projects available.

  {% for hh in honsopps %}
  - [{{hh.title}}]({{hh.permalink}})
  {% endfor %}
{% endif %}

{% assign mscopps=opps | where:"type","MSc" %}
{% if mscopps.size>0 %}
We currently have Masters projects available.

  {% for mm in mscopps %}
  - [{{mm.title}}]({{mm.permalink}})
  {% endfor %}
{% endif %}

## PhD

While Honours and Masters acts like a capstone to undergraduate study, a PhD is more like a full-blown research apprenticeship.  PhDs can lead you to new places and are a great launching pad for a professional career. If you are interested in doing a PhD it is critical that you are excited about the broad ideas behind the project.  This enthusiasm both provides you with the energy and stamina you need, but also allows you to quickly make the project your own.  

Given the time and resource commitment required to execute high quality PhD-level research, PhD projects often need to be an alignment between your interests and the projects we have resources to support.  We, of course, welcome students that have their own burning questions they want to answer, but we need to work out how to support the work.  There are often ways, particularly for strong students, so it is worth having a chat with us.

{% assign phdopps=opps | where:"type","PhD" %}
{% if phdopps.size>0 %}
We currently have PhD opportunities available.

  {% for pp in phdopps %}
  - [{{pp.title}}]({{pp.permalink}})
  {% endfor %}
{% endif %}

## Postdoctoral positions

Having completed their PhD, Postdocs are fully-fledged researchers and so expected to be quite independent.  We encourage postdocs in our group to drive their own research agenda, to engage with the supervision of graduate students, and to build their careers.

As new projects start we will have, from time to time, postdoctoral positions that come up.  These will usually be advertised.  For exceptionally strong candidates, it is also possible to make your own opportunities in this space, through fellowship schemes such as the Forrest Fellowship, or the ARC DECRA fellowship.  Again, it is worth having a chat with us if you see an alignment and want to take a tilt at an externally funded fellowship.

{% assign postdocopps=opps | where:"type","Postdoc" %}
{% if postdocopps.size>0 %}
We currently have Postdoc projects available.

  {% for pd in postdocopps %}
  - [{{pd.title}}]({{pd.permalink}})
  {% endfor %}
{% endif %}


## Contact

If you would like to work with us in any capacity, please drop either [Ben]({{site.data.authors["Ben Phillips"].home | relative_url}}) or [Brenton]({{site.data.authors["Brenton von Takach"].home | relative_url}}) a line.  Simplest is an email introducing yourself and a copy of your academic transcript and CV.  Including these two pieces will allow us to give you an informed reply.