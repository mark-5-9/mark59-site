# mark59-site
Jekyll-based build for the mark59.com website




# Building a Single-Page Site with Jekyll (based on mark59.com)

> What follows is a general reference guide generated from GitHub Copilot chat — June 2026


## What mark59.com consists of

- Sticky top navbar with anchor links (Overview, Downloads, Documentation, About, Contact)
- Hero banner with headline and tagline
- Sections: Overview (image gallery), Downloads, Documentation, Links, About (subsections), Contact
- Footer with logo

---

## Step 1 — Prerequisites

Install Ruby and Jekyll locally (for previewing before pushing to GitHub):

```powershell
# Install Ruby via https://rubyinstaller.org/ (Windows), then:
gem install jekyll bundler
```

---

## Step 2 — Create the Jekyll Project

```bash
jekyll new mark59-site --blank
cd mark59-site
```

The `--blank` flag gives a minimal structure without a default blog theme.

Your folder layout:

```
mark59-site/
├── _config.yml
├── _layouts/
│   └── default.html       ← you create this
├── _includes/             ← section partials go here
├── assets/
│   ├── css/main.scss
│   └── images/
├── index.md               ← your one page
└── Gemfile
```

---

## Step 3 — `_config.yml`

```yaml
title: Mark59 Performance and Volume Testing Framework
description: Simplifies JMeter performance testing via automated test execution, reporting and trend analysis.
url: "https://mark59.com"
baseurl: ""
```

---

## Step 4 — Create the Layout (`_layouts/default.html`)

Holds the navbar, wraps all content, and has the footer:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ site.title }}</title>
  <link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
</head>
<body>

  <!-- Sticky Navbar -->
  <nav class="navbar">
    <a href="#" class="nav-logo">
      <img src="{{ '/assets/images/logo.png' | relative_url }}" alt="Mark59 Logo">
    </a>
    <ul>
      <li><a href="#overview">Overview</a></li>
      <li><a href="#downloads">Downloads</a></li>
      <li><a href="#documentation">Documentation</a></li>
      <li><a href="#about">About</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>

  <!-- Hero Banner -->
  <header class="hero">
    <h1>{{ site.title }}</h1>
    <p>{{ site.description }}</p>
  </header>

  <!-- Page Sections -->
  <main>
    {{ content }}
  </main>

  <footer>
    <a href="#"><img src="{{ '/assets/images/logo.png' | relative_url }}" alt="Mark59"></a>
    <p>© {{ site.time | date: "%Y" }} Mark59</p>
  </footer>

</body>
</html>
```

---

## Step 5 — Break Sections into Includes (`_includes/`)

Each section becomes its own file. This keeps things manageable.

### `_includes/overview.html`
```html
<section id="overview">
  <h2>Overview</h2>
  <p>Mark59 is an open-source Java-based set of tools...</p>

  <!-- Image Gallery -->
  <div class="gallery">
    <figure>
      <a href="/assets/images/gallery/screen1.jpg">
        <img src="/assets/images/gallery/screen1-thumb.jpg" alt="Visualise your test against trends">
      </a>
      <figcaption>Visualise your test against trends</figcaption>
    </figure>
    <!-- repeat for each image -->
  </div>
</section>
```

### `_includes/downloads.html`
```html
<section id="downloads">
  <h2>Downloads</h2>
  <h3>Current Release: Version 6.5 (March 2026)</h3>
  <p>
    <a href="https://drive.google.com/...">mark59-6.5.zip</a> (649.3 MB via Google Drive)
  </p>
  <p>Release notes...</p>
</section>
```

### `_includes/documentation.html`
```html
<section id="documentation">
  <h2>Documentation</h2>
  <ul>
    <li><a href="https://drive.google.com/...">Mark59 User Guide v6 (PDF)</a></li>
    <li><a href="https://docs.google.com/...">Mark59 User Guide v6 (Google Doc)</a></li>
  </ul>
</section>
```

Also create: `_includes/links.html`, `_includes/about.html`, `_includes/contact.html` following the same pattern.

---

## Step 6 — `index.md` (The One Page)

```markdown
---
layout: default
---

{% include overview.html %}
{% include downloads.html %}
{% include documentation.html %}
{% include links.html %}
{% include about.html %}
{% include contact.html %}
```

The entire page is assembled from these 6 include tags.

---

## Step 7 — CSS (`assets/css/main.scss`)

Jekyll processes SCSS natively. The front matter dashes (`---`) at the top are required.

```scss
---
---

* { box-sizing: border-box; margin: 0; padding: 0; }

body { font-family: Arial, sans-serif; color: #333; }

.navbar {
  position: sticky; top: 0; z-index: 100;
  background: #1a1a2e; display: flex; align-items: center;
  padding: 0.75rem 2rem; gap: 2rem;
  ul { list-style: none; display: flex; gap: 1.5rem; }
  a { color: #fff; text-decoration: none; }
}

.hero {
  background: #1a1a2e; color: white;
  padding: 4rem 2rem; text-align: center;
  h1 { font-size: 2.5rem; margin-bottom: 1rem; }
}

main section {
  padding: 3rem 2rem; max-width: 900px; margin: 0 auto;
  h2 { font-size: 1.8rem; margin-bottom: 1rem; border-bottom: 2px solid #eee; }
}

.gallery {
  display: flex; flex-wrap: wrap; gap: 1rem;
  figure { width: 220px; text-align: center; }
  img { width: 100%; border-radius: 4px; }
}

footer { text-align: center; padding: 2rem; background: #f4f4f4; }
```

---

## Step 8 — Preview Locally

Initial setup after pulling the existing repo locally,
- perform Step 1 (pre-requisites - Ruby install)

```bash
cd C:\gitrepo\mark-5-9\mark59-site
gem install bundler
bundle install
bundle exec jekyll serve
# Open http://localhost:4000
```
(Tip: Add --livereload at the end if you want the browser to automatically refresh whenever you save a file.)

Once this setup is done,  just:

```bash
cd C:\gitrepo\mark-5-9\mark59-site
bundle exec jekyll serve
# Open http://localhost:4000
```

---

## Step 9 — Deploy to GitHub Pages

Your workspace folder is `mark59-site`, which you will push to a GitHub repository.

### 9a — Decide on your repository name and resulting URL

There are two options for GitHub Pages:

| Repository name              | Resulting URL                                      | Notes                              |
|------------------------------|----------------------------------------------------|------------------------------------|
| `mark-5-9.github.io`         | `https://mark-5-9.github.io`                       | User/org "root" site               |
| `mark59-site` (or any name)  | `https://mark-5-9.github.io/mark59-site`           | Project site — has a path prefix   |

For a custom domain (e.g. `mark59.com`) either option works.
For the site to work on the sub-path URL without a custom domain you must set `baseurl` in `_config.yml` (see note below).

### 9b — Create the repository on GitHub

1. Go to [https://github.com/new](https://github.com/new)
2. Set the repository name to match your chosen option above — e.g. `mark59-site`
3. Leave it **public** (required for free GitHub Pages)
4. **Do not** tick "Add a README" — your local repo already has content

### 9c — Push your local `mark59-site` folder

Open a terminal in your `mark59-site` folder (the workspace root) and run:

```powershell
git init
git remote add origin https://github.com/mark-5-9/mark59-site.git
git add .
git commit -m "Initial Jekyll site"
git push -u origin main
```

> If your default branch is `master` rather than `main`, replace `main` with `master` in the last line,
> and also use `master` in the GitHub Pages setting below.

### 9d — Enable GitHub Pages in the repository settings

1. On GitHub, open your repository: `https://github.com/mark-5-9/mark59-site`
2. Click **Settings → Pages** (left sidebar)
3. Under **Build and deployment**, set:
   - **Source**: `Deploy from a branch`
   - **Branch**: `main` → `/ (root)`
4. Click **Save**

GitHub will build and deploy your site automatically — typically within 1–2 minutes.
A green banner will appear showing your live URL:

- `https://mark-5-9.github.io/mark59-site/`

### 9e — `_config.yml` `baseurl` for a project site

If you are **not** using a custom domain and your repo is named `mark59-site` (not `mark-5-9.github.io`), you must tell Jekyll about the sub-path so all asset and page links resolve correctly:

```yaml
# _config.yml
baseurl: "/mark59-site"
url: "https://mark-5-9.github.io"
```

If you are using a custom domain (`mark59.com`), set:

```yaml
baseurl: ""
url: "https://mark59.com"
```

After changing `_config.yml`, commit and push again:

```powershell
git add _config.yml
git commit -m "Set baseurl for GitHub Pages"
git push
```

### 9f — Verify the deployment

- Watch the build progress under **Actions** tab in the repo (GitHub runs Jekyll automatically)
- Once the action shows a green tick, visit `https://mark-5-9.github.io/mark59-site/`
- Check the browser console for any 404s on CSS or images — these usually indicate a missing or wrong `baseurl`

GitHub Pages runs Jekyll automatically — no Actions workflow needed for a standard Jekyll site.

---

## Custom Domain (e.g. mark59.com)

1. In repo: **Settings → Pages → Custom domain** → enter `mark59.com`
2. At your DNS registrar, add:

| Type  | Host  | Value                        |
|-------|-------|------------------------------|
| `A`   | `@`   | `185.199.108.153`            |
| `A`   | `@`   | `185.199.109.153`            |
| `A`   | `@`   | `185.199.110.153`            |
| `A`   | `@`   | `185.199.111.153`            |
| `CNAME` | `www` | `your-username.github.io` |

3. GitHub auto-provisions a free HTTPS certificate via Let's Encrypt once DNS propagates.

---

## Summary — What Maps to What

| mark59.com element        | Jekyll equivalent                        |
|---------------------------|------------------------------------------|
| Sticky navbar             | `_layouts/default.html`                  |
| Hero banner               | `_layouts/default.html` header section   |
| Each content section      | `_includes/xxx.html`                     |
| Page assembly             | `index.md` with `{% include %}` tags     |
| Styles                    | `assets/css/main.scss`                   |
| Images                    | `assets/images/`                         |
| PDF / Google Drive links  | Plain `<a href>` in include files        |
| Site title & description  | `_config.yml`                            |


