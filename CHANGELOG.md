# Changelog

## 1.1.0 (Claude Code, Codex, Cursor, Gemini CLI, Kiro, MCP Registry) · OpenAI plugin 1.0.4

Every plugin now says only what OnArrival does today.

**Flights**
- The flights skill covers every step: the cheapest day across several (`flight-flexible-dates`, `flight-fare-calendar`), multi-city trips (`flight-trip-search`), places to go (`flight-explore`), a flight's fares with their bags and charges (`flight-fare-options`), a fare's rules where the app lists `flight-fare-rules`, corporate fares for work trips within India, seats, meals and bags, booking in the card, cancelling a paid booking after a yes, and fare-drop alerts on WhatsApp.

**Hotels**
- The hotels skill uses today's tool names: `hotel-listing` takes the place in words, and `hotel-destination-search` is only for places that share a name. It adds `hotel-find` (a brand, or near a place), `hotel-info` (one hotel by name), `hotel-compare`, `hotel-reviews-get` and `hotel-recommend`.
- Hotels are for finding and comparing stays, with live prices. Booking a hotel through an agent isn't described until it's proven end to end.

**Listings**
- Every description, the README and the OpenAI listing say the same thing. Cards are described for Claude and ChatGPT.
- Live flight status, hotel price alerts, trip plans, support requests and the company GST step on the payment page are no longer described.
- The OpenAI plugin and the Codex plugin describe only the tools ChatGPT and Codex have today: no fare rules there, and the 1.0.3 review cases are back.

**Repo**
- `scripts/check.sh` fails if the Kiro power's copy of the skills differs from `skills/`, or a manifest isn't valid JSON. The `check` workflow runs it on every pull request.
