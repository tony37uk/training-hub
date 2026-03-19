# 🚀 Tony's AI & Cloud Training Hub

A bright, cheerful, single-page training resource website built with plain HTML, CSS, and JavaScript — hosted for free on GitHub Pages. No frameworks, no build tools, no backend required.

---

## 📋 What's Inside

The site includes four sections:

| Section | Description |
|---|---|
| 🔗 **Training Links** | Curated links to courses, cert prep paths, and learning platforms |
| 📖 **How-To Guides** | Step-by-step walkthroughs for tools, techniques, and processes |
| 🎬 **Training Videos** | Video resources covering AI, Azure, Intune, and more |
| 💬 **Feedback & Suggestions** | A form for friends to suggest resources or flag broken links |

---

## 🌐 Live Site

> (https://github.com/tony37uk/training-hub)

*(Replace with your actual GitHub Pages URL once deployed)*

---

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/tony37uk/training-hub.git
cd YOUR-REPO-NAME
```

### 2. Open locally

Just open `index.html` in your browser — no local server needed.

```bash
open index.html        # macOS
start index.html       # Windows
xdg-open index.html   # Linux
```

### 3. Deploy to GitHub Pages

1. Push your changes to the `main` branch
2. Go to your repo on GitHub → **Settings** → **Pages**
3. Under **Source**, select `Deploy from a branch`
4. Choose `main` branch and `/ (root)` folder
5. Click **Save** — your site will be live in a few minutes

---

## ✏️ Adding Content

All content lives in `index.html`. To add a new card to any section, copy and paste an existing card block and update the details.

### Adding a Training Link

Find the `Training Links` section and add a new card:

```html
<div class="card">
  <span class="card-tag tag-blue">Category</span>
  <h3>Resource Title</h3>
  <p>Short description of what this link covers.</p>
  <a href="https://your-link-here.com" target="_blank">Visit →</a>
</div>
```

### Adding a How-To Guide

Find the `How-To Guides` section and add a new card:

```html
<div class="card">
  <span class="card-tag tag-orange">Topic</span>
  <h3>Guide Title</h3>
  <p>Short description of what the guide covers.</p>
  <a href="your-guide-link.html">Read guide →</a>
</div>
```

### Adding a Video

Find the `Training Videos` section and add a new card:

```html
<div class="card">
  <div class="video-thumb" style="background:#ffe0ec;">🎬</div>
  <span class="card-tag tag-pink">Topic</span>
  <h3>Video Title</h3>
  <p>Short description of what the video covers.</p>
  <a href="https://youtube.com/your-video" target="_blank">Watch →</a>
</div>
```

### Card tag colour options

| Class | Colour | Best used for |
|---|---|---|
| `tag-blue` | Blue | Microsoft / Cloud / Certifications |
| `tag-orange` | Orange | Guides / Tutorials |
| `tag-pink` | Pink | Videos / Media |
| `tag-green` | Green | Success / Completed / General |

---

## 🗂️ Project Structure

```
your-repo/
│
├── index.html        # The entire site (HTML + CSS + JS in one file)
└── README.md         # This file
```

Everything is self-contained in `index.html` — no external dependencies, no package manager, no build step.

---

## 🔧 Built With

- Plain **HTML5**, **CSS3**, and **JavaScript**
- [Google Fonts](https://fonts.google.com) — Nunito & Poppins
- Hosted on **GitHub Pages** (free)
- Built with the help of **Claude** (Anthropic)

---

## 🤝 Contributing

This is a personal learning resource, but suggestions are welcome! Use the **Feedback & Suggestions** form on the site, or open a GitHub Issue.

---

## 📄 Licence

Feel free to fork and adapt this for your own training hub. No attribution required.

---

*Built as a Claude Code training exercise — learning by doing!* 🎓
