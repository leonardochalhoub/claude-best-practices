# Before / after

Small, real shapes of the discipline. Each one is a rung of the
[decision ladder](../docs/principles.md#2-simplicity-first--the-decision-ladder)
or a principle, shown as the *over-engineered* version next to the *minimal* one.

---

## 1. YAGNI — does it need to exist?

The task: "add a function to format a user's full name."

**Before** — speculative options nobody asked for:
```ts
interface NameOptions { uppercase?: boolean; reverse?: boolean; initialsOnly?: boolean }
function formatName(first: string, last: string, opts: NameOptions = {}) {
  let out = opts.reverse ? `${last} ${first}` : `${first} ${last}`
  if (opts.uppercase) out = out.toUpperCase()
  if (opts.initialsOnly) out = out.split(" ").map(w => w[0]).join("")
  return out
}
```

**After** — what was asked:
```ts
const formatName = (first: string, last: string) => `${first} ${last}`
```
> Skipped: uppercase/reverse/initials options. Add them when a caller needs one.

---

## 2. Reuse, don't rewrite — already in the codebase?

The codebase already has `lib/money.ts` with `formatBRL(cents)`.

**Before** — a second money formatter:
```ts
function showPrice(cents: number) {
  return "R$ " + (cents / 100).toFixed(2).replace(".", ",")
}
```

**After** — reuse the canonical one (and stay correct for thousands/negatives):
```ts
import { formatBRL } from "@/lib/money"
const showPrice = formatBRL
```

---

## 3. Native platform feature — over the hand-rolled one

The task: "show items in a responsive grid; truncate long titles."

**Before** — JS measuring widths and slicing strings on resize.

**After** — let the platform do it:
```css
.grid  { display: grid; grid-template-columns: repeat(auto-fill, minmax(12rem, 1fr)); }
.title { white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
```
> CSS over JS. Same for **DB constraints over app-layer checks**: a
> `unique (user_id, slug)` beats a read-then-write uniqueness guard that races.

---

## 4. One function — not a framework

The task: "pick a greeting based on the hour."

**Before** — strategy pattern for three strings:
```ts
interface GreetingStrategy { match(h: number): boolean; text(): string }
class MorningGreeting implements GreetingStrategy { /* ... */ }
class GreetingFactory { /* register/resolve ... */ }
```

**After**:
```ts
const greeting = (h: number) =>
  h < 12 ? "Good morning" : h < 18 ? "Good afternoon" : "Good evening"
```

---

## 5. Surgical diff — touch only what the task needs

The task: "fix the off-by-one in `lastPage()`."

**Before** — the fix, plus a reformat of the whole file, renamed variables, and
a "while I was here" refactor of an unrelated function. 200-line diff, real
change buried.

**After** — one line:
```diff
- return Math.floor(total / perPage)
+ return Math.ceil(total / perPage)
```
> Pre-existing dead code or messy style nearby? **Flag it**, don't fold it into
> this diff.

---

## 6. Goal-driven — verify, don't eyeball

**Before** — "Looks right to me." Ship.

**After** — name the check, run it, report it:
```
$ npm run typecheck && npm test
✓ types ok · 112 passing
```
> If it fails, say so with the output. "Done" means *verified*, not *inspected*.

---

## The non-negotiable counter-example

Minimal is never an excuse to drop a guard. This is **wrong**, not lazy:

```ts
// BAD: "simplified" away the validation on a trust boundary
app.post("/transfer", (req) => transfer(req.body.from, req.body.to, req.body.amount))
```
Keep input validation, error handling, security, and accessibility — always.
