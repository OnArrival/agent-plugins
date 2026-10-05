---
name: onarrival-flights
description: Search and book flights with OnArrival (fares in INR) and hand the traveller a payment link. Use when the user asks to find, compare or book a flight, or to check a flight booking they made through OnArrival.
---

# Booking flights with OnArrival

The OnArrival tools book on the user's own OnArrival account. You prepare the booking; it is only confirmed once the payment link is paid.

## Flow

1. **Airports.** Turn city or airport names into IATA codes with `airport-search`. If a city has several airports, ask which one unless the user already said.
2. **Travellers first.** Ask how many adults, children and infants are travelling before searching. Never assume one adult.
3. **Search.** Call `flight-search` with the IATA codes, dates and traveller counts. Present a short list: airline, times, stops, duration and total price. To sort, filter or page, pass the same `searchId` back instead of searching again.
4. **Fare families.** If the chosen one-way option has `fareFamilySelectionRequired`, call `flight-fare-options`, let the user pick, and pass `onwardFareOptionId`.
5. **Round trips.** Follow `roundTripSelectionMode`: `INDEPENDENT_LEGS` needs one onward and one return option; `FIXED_ITINERARY` needs only the onward option.
6. **Create the order** with `flight-order-create` once the user confirms the option and price.
7. **Travellers.** Call `traveller-list`, show the saved travellers and let the user choose. Create a profile with `traveller-create` only for someone who isn't saved. Then call `flight-order-travellers-update` with `leadTravellerId` and `otherTravellerIds` (never repeat the lead in the others).
8. **Extras (optional).** Offer seats, meals and bags with `flight-ancillaries-get` and `flight-ancillaries-update` if the user wants them.
9. **Payment link.** Call `order-payment-initialize`. It returns `paymentUrl`, which is also emailed to the user. Share the link and the amount.
10. **Status.** After they pay, check `flight-booking-details` and share the PNR and e-ticket once confirmed.

## Rules

- Confirm the flight, travellers and total price with the user before creating the order.
- Never pay the link yourself: send it to the user, who pays on Razorpay's secure page.
- Fares can change: if the price moves, tell the user before continuing.
- If a tool says the connection isn't active, the user needs a new connection link from https://agents.onarrival.com.
