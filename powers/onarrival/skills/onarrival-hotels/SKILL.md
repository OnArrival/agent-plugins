---
name: onarrival-hotels
description: Find and compare hotels with OnArrival, with live prices for the user's dates. Use when the user asks to find or compare hotels or stays in a city or area, near a place or of a brand, or asks about one hotel (its rooms, amenities, check-in time or reviews).
---

# Hotels with OnArrival

The OnArrival tools work on the user's own OnArrival account. The server's own instructions, and each result's notes and hints, come first. This skill only says which tool covers what, and in what order.

## Finding a stay

- **Where:** for a state or wide region (Goa, Kerala), search one of its areas or cities, and ask which if it matters.
- **Before searching**, have the check-in and check-out dates, the number of rooms, and the adults and children in each room (with the children's ages).
- **Hotels in a city or area:** `hotel-listing`, with the place in words, the dates and the guests, and whatever the user asked for (a budget, stars) in the same call. `hotel-destination-search` is only for when the user must choose between places with the same name.
- **A brand, or near a place** ("any Taj in Goa?", "walking distance from the venue"): `hotel-find`.
- **One hotel by name, no dates needed** (amenities, check-in time, how far from the beach): `hotel-info`. With dates it prices the stay too.
- **Rooms, rates and cancellation terms:** `hotel-details`.
- **Choosing:** `hotel-reviews-get` for what guests say, `hotel-compare` to set a few stays side by side, and `hotel-recommend` to rank them for what matters to the user.

## Notes

- Dates are in India time.
- If a tool says the connection isn't active, the user needs a new connection from https://agents.onarrival.com.
