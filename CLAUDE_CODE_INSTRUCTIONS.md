# Claude Code Instructions — Add Power BI Animation to Training Hub

## What you're adding
An animated Power BI for Beginners presentation that opens as a popup modal when clicked.

## Files in this package
- `powerbi-beginner.html` — the animated presentation (self-contained)
- `CLAUDE_CODE_INSTRUCTIONS.md` — this file

---

## Step 1 — Copy the animation file into your repo

Place `powerbi-beginner.html` in the root of your repo, alongside `index.html`:

```
training-hub/
├── index.html
├── powerbi-beginner.html   ← add this
└── ...
```

---

## Step 2 — Add modal styles to index.html

Add this CSS inside the `<head>` tag of your `index.html` (or in your existing `<style>` block):

```css
/* ── Power BI Modal ── */
#pbi-modal {
  display: none;
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.88);
  z-index: 9999;
  align-items: center;
  justify-content: center;
  backdrop-filter: blur(6px);
  animation: fadeOverlay 0.3s ease;
}
#pbi-modal.open {
  display: flex;
}
@keyframes fadeOverlay {
  from { opacity: 0; }
  to   { opacity: 1; }
}
#pbi-modal-inner {
  position: relative;
  width: 90vw;
  max-width: 960px;
  height: 85vh;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 32px 80px rgba(0,0,0,0.6);
  animation: slideUp 0.4s ease;
}
@keyframes slideUp {
  from { transform: translateY(40px); opacity: 0; }
  to   { transform: translateY(0);    opacity: 1; }
}
#pbi-modal-inner iframe {
  width: 100%;
  height: 100%;
  border: none;
  display: block;
}
#pbi-modal-close {
  position: absolute;
  top: 14px;
  right: 18px;
  background: rgba(0,0,0,0.5);
  border: none;
  color: #fff;
  font-size: 22px;
  width: 36px;
  height: 36px;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 10;
  transition: background 0.2s;
}
#pbi-modal-close:hover { background: rgba(255,255,255,0.2); }
```

---

## Step 3 — Add the modal HTML to index.html

Add this just before the closing `</body>` tag in `index.html`:

```html
<!-- Power BI Modal -->
<div id="pbi-modal" role="dialog" aria-modal="true" aria-label="Power BI for Beginners">
  <div id="pbi-modal-inner">
    <button id="pbi-modal-close" onclick="closePbiModal()" aria-label="Close">✕</button>
    <iframe src="powerbi-beginner.html" title="Power BI for Beginners Animation"></iframe>
  </div>
</div>
```

---

## Step 4 — Add the modal JavaScript to index.html

Add this just before the closing `</body>` tag (after the modal HTML):

```html
<script>
  function openPbiModal() {
    const modal = document.getElementById('pbi-modal');
    modal.classList.add('open');
    document.body.style.overflow = 'hidden';
  }
  function closePbiModal() {
    const modal = document.getElementById('pbi-modal');
    modal.classList.remove('open');
    document.body.style.overflow = '';
    // Reload iframe to reset animation state
    const iframe = modal.querySelector('iframe');
    iframe.src = iframe.src;
  }
  // Close on backdrop click
  document.getElementById('pbi-modal').addEventListener('click', function(e) {
    if (e.target === this) closePbiModal();
  });
  // Close on Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') closePbiModal();
  });
</script>
```

---

## Step 5 — Add the launch button

Place this button wherever you want in your Videos section of `index.html`:

```html
<button onclick="openPbiModal()" class="video-card-btn">
  ▶ Power BI for Beginners
  <span style="font-size:11px;opacity:0.7;display:block;margin-top:4px">6 scenes · ~5 min · Interactive</span>
</button>
```

Style the button to match your existing site theme, or use this minimal style:

```css
.video-card-btn {
  background: #FFD23F;
  color: #0A0A0A;
  border: none;
  padding: 14px 28px;
  border-radius: 12px;
  font-weight: 700;
  font-size: 15px;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
  text-align: left;
}
.video-card-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(255, 210, 63, 0.3);
}
```

---

## Prompts to use with Claude Code

Once you have the files in your repo, paste one of these into Claude Code:

**To add the animation with modal:**
```
Add powerbi-beginner.html as a popup modal to index.html.
Follow the instructions in CLAUDE_CODE_INSTRUCTIONS.md exactly.
Place the launch button in the Videos section.
```

**To adjust the button style:**
```
Style the Power BI modal launch button to match the existing card/button style in index.html.
```

**To add more animations later:**
```
I have another animation file called [filename].html.
Add it as a modal to index.html using the same pattern as the Power BI modal.
The button should go in the [section name] section.
```

---

## Testing checklist

After Claude Code makes the changes, verify:
- [ ] Button appears in the Videos section
- [ ] Clicking the button opens the modal
- [ ] Animation plays and nav arrows work
- [ ] Clicking outside the modal closes it
- [ ] Pressing Escape closes it
- [ ] Reopening the modal resets the animation to slide 1
- [ ] Page doesn't scroll behind the open modal
