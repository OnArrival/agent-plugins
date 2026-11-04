---
name: onarrival-hotels
description: Search, compare and book hotels with OnArrival, with live prices for the user's dates, and hand the guest a payment link. Use when the user asks to find, compare or book a hotel or stay in a city or area, near a place or of a brand, asks about one hotel (its rooms, amenities, check-in time or reviews), wants flights and a hotel put together as one trip, or asks about a hotel booking made through OnArrival.
---

# Hotels with OnArrival

The OnArrival tools work on the user's own OnArrival account. You find and hold the stay; nothing is booked until the user pays the payment link. The server's own instructions, and each result's notes and hints, come first. This skill only says which tool covers what, and in what order.

## Finding a stay

- **Where:** for a state or wide region (Goa, Kerala), search one of its areas or cities, and ask which if it matters.
- **Before searching**, have the check-in and check-out dates, the number of rooms, and the adults and children in each room (with the children's ages).
- **Hotels in a city or area:** `hotel-listing`, with the place in words, the dates and the guests, and whatever the user asked for (a budget, stars) in the same call. `hotel-destination-search` is only for when the user must choose between places with the same name.
- **A brand, or near a place** ("any Taj in Goa?", "walking distance from the venue"): `hotel-find`.
- **One hotel by name, no dates needed** (amenities, check-in time, how far from the beach): `hotel-info`. With dates it prices the stay too.
- **Rooms, rates and cancellation terms:** `hotel-details`.
- **Choosing:** `hotel-reviews-get` for what guests say, `hotel-compare` to set a few stays side by side, and `hotel-recommend` to rank them for what matters to the user.
- **Flights and a hotel as one trip:** `trip-plan` puts picked flights and a stay together with the total, and checks that the dates fit. Each part is still booked as its own order.

## Booking

1. **Hold:** `hotel-order-create` once the user has picked the room and rate.
2. **Guests:** `traveller-list` shows the saved travellers. Ask before creating a profile with `traveller-create`. The held order says whether the guests need a PAN or a passport. A stay abroad that needs a PAN takes it from the guest's saved profile, added in the OnArrival app or website, never in chat; the result says when one is missing. Then `hotel-order-add-travellers`, with the contact email and phone.
3. **Payment link:** `order-payment-initialize`, only when the user asks to pay. It emails them the link, and they pay on OnArrival's secure payment page. Never pay it yourself.
4. **After paying:** `hotel-booking-details` has the booking's confirmation.

Mention the cancellation terms before the user pays.

## Notes

- Dates are in India time.
- If a tool says the connection isn't active, the user needs a new connection from https://agents.onarrival.com.
