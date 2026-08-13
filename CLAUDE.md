# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The Jekyll source for the Population Biology and Genomics group website (popbiolgenomics.org), a Curtin University research group. Built on the [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes) remote theme. There is no application code here — this is content (Markdown/YAML) plus a handful of custom layouts and includes on top of the theme.

## Commands

```bash
bundle install          # install gems (first time / after Gemfile changes)
bundle exec jekyll serve # local dev server with live rebuild, http://localhost:4000
bundle exec jekyll build # build to _site/
```

There are no tests, linters, or CI configured. The site deploys via GitHub Pages (`github-pages` gem in the Gemfile keeps plugin versions pinned to what Pages supports; CNAME file sets the custom domain). Validate changes by running `jekyll serve` and checking the page in a browser — there's no automated check.

## Workflow

`master` is protected and deploys directly to GitHub Pages, so it can't be pushed to directly. Make changes on a feature branch and open a pull request into `master`.

## Content architecture

The site is entirely collection-driven. Each collection is configured in `_config.yml` under `collections:` and gets default front matter via the `defaults:` block (layout, `author_profile`, `classes`, etc.) — check there before adding front matter that duplicates a default.

- **`_staff/`** — current staff. Order on the team page is controlled by `order:` front matter (see `_config.yml`'s `collections.staff.order` and `_pages/team.md`, which does `site.staff | sort: 'order'`).
- **`_students/`** — current students, listed after staff on `_pages/team.md`.
- **`_alumni/`** — *not* a real collection; alumni are just a hand-maintained list of paragraphs inside `_pages/team.md`. Add departed people there, not as a new file.
- **`_projects/`** — research projects. Filenames are date-prefixed (`YYYY-01-01-Name.md`) but this isn't a Jekyll posts collection, just a naming convention. Uses the `project` layout (`_layouts/project.html`) with `_includes/project-sidebar.html`. Front matter carries `funders`, `collaborators`, `industry_partners` (matched against `_data/funders.yml`, `_data/collaborators.yml`, `_data/partners.yml`), plus a `gallery:` array for the `{% include gallery %}` shortcode.
- **`_opportunities/`** — open positions (Honours/MSc/PhD/Postdoc). `_pages/opportunities.md` filters this collection live with Liquid (`where:"open","true"`, then `where:"type","PhD"` etc.), so front matter `type:` (must be exactly `Hons`/`MSc`/`PhD`/`Postdoc`) and `open:` (`true`/`false`) drive what shows up — don't add new type strings without updating that page. `supervisors:` front matter is matched against `_data/authors.yml` to render a mailto link.
- **`_posts/`** — news/blog. Category (`news` vs blog) is set via `categories:` front matter; older posts are `.html`, newer ones `.md` — new posts should be Markdown. Common front matter: `title`, `date`, `categories`, `tags`, `author` (matched against `_data/authors.yml`), and an optional `gallery:` for image galleries.
- **`_pages/`** — standalone pages (About, Team, News, Gallery, Opportunities, Publications, etc.), registered via `include: [_pages]` in `_config.yml` since pages aren't in the default include path.

## People data (`_data/authors.yml`)

This is the single source of truth for a person's name, avatar, email, institutional position, and social links. Individual `_staff/*.md` / `_students/*.md` files hold only a bio and set `author:` to the matching key in `authors.yml`; the profile card (`_includes/author-profile-flat.html`) pulls everything else from there. When adding a new team member, add an entry to `authors.yml` *and* a collection file whose `author:` front matter matches the `authors.yml` key exactly (this is a plain string match, not a slug).

`_data/funders.yml`, `_data/collaborators.yml`, `_data/partners.yml` work the same way for project front matter, and `_data/navigation.yml` drives the top nav — add a page there if it should appear in the main menu.

## Layouts/includes customized beyond the theme

Only `_layouts/staff.html` and `_layouts/project.html`, plus `_includes/author-profile-flat.html`, `_includes/staff-projects.html`, `_includes/project-sidebar.html`, `_includes/footer.html`, and `_includes/head/custom.html` are local overrides/additions — everything else (archive templates, hero, breadcrumbs, etc.) comes from the remote `minimal-mistakes` theme and isn't in this repo. `staff.html`'s `page.projects` flag triggers `staff-projects.html`, which cross-references `_projects/*` against the staff member's name in `collaborators:`/author fields to auto-list their projects.

## Assets

Images live under `assets/images/...` (mugshots, project teasers, gallery photos) and `assets/pubs/` (publication PDFs). `assets/YYYY/` folders hold post-specific images referenced by date-matching posts. `_config.yml` excludes `_assets/pubs/` from processing — don't rely on that path.
