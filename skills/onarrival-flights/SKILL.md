---
name: onarrival-flights
description: Search, compare and book flights with OnArrival (fares in INR), one way, return or multi-city, and hand the traveller a payment link. Use when the user asks to find, compare, hold or book a flight, wants the cheapest day to fly, asks what a fare includes, asks about or wants to cancel a flight booking made through OnArrival, or wants to hear when a fare drops.
---

# Flights with OnArrival

The OnArrival tools work on the user's own OnArrival account. You find and hold the flight; nothing is booked until the user pays the payment link. The server's own instructions, and each result's notes and hints, come first. This skill only says which tool covers what, and in what order.

## Finding flights

- **Airports.** `airport-search` turns a city or airport name into its code. If a city has several airports and the user didn't say which, ask.
- **Before searching**, have the trip type (one way, round trip, multi-city), the dates (a round trip's return date too) and who's flying (adults, children with their ages, infants). Ask only for what's missing.
- **One route, one way or return:** `flight-search`, once per trip, with every filter in that one call. A return trip is one round-trip search and one booking.
- **Several days, or the cheapest day:** `flight-flexible-dates`, once, rather than one search per day. `flight-fare-calendar` gives a route's fares day by day.
- **Multi-city, or a return as two one-ways:** `flight-trip-search` searches every leg at once. Each leg is then booked as its own order.
- **Where to go:** `flight-explore` finds the cheapest places to fly to from an airport over a range of dates.
- **A closer look:** `flight-option-details` gives one option in full, and `flight-compare` sets a few side by side.
- **Fares:** when a picked option needs a fare choice, `flight-fare-options` lists its fares with their bags and their cancellation and date-change charges. `flight-fare-rules`, where your tools include it, gives one fare's rules in full.
- **Work trips:** `flight-search` with corporate fares, when the user asks for them or says the trip is for work. They're for flights within India.

Rows in a result are numbered (a return's way back lettered), so the user can pick one by its number, letter or flight number. A call with the latest `searchId` refreshes its fares, so there's no need to search again just to re-check a price.

## Booking

1. **Travellers ready first.** A held fare lasts only minutes, so have the travellers and the contact email and phone before holding. `traveller-list` shows the saved travellers. Ask before creating a new profile with `traveller-create`.
2. **Hold:** `flight-order-create` with the picked option.
3. **Travellers and contact:** `flight-order-travellers-update`, with the contact email and phone in the same call.
4. **Seats, meals and bags, if the user wants them:** `flight-ancillaries-get`, then `flight-ancillaries-update`. Some flights have none to add here, and the result says so.
5. **Payment link:** `order-payment-initialize`, only when the user asks to pay. It emails them the link, and they pay on OnArrival's secure payment page. Never pay it yourself.

In apps that show OnArrival's cards, the user can also choose and book in the card. The card then holds the fare, adds the travellers and makes the payment link itself.

## After booking

- **Where a booking stands:** `booking-list` and `flight-booking-details`, with the PNR and e-ticket once it's confirmed. Asked about a booking, say its status and ask whether they want to pay; don't make a payment link unasked.
- **Cancelling a paid booking:** `booking-cancel-quote` first, then `booking-cancel` only after the user has heard the quote and clearly said yes.

## Fare alerts

`flight-price-watch` watches a route's fare and messages the user on WhatsApp when it drops. It needs their WhatsApp number and their yes to alerts there. `price-watch-list` shows their watches and `price-watch-stop` ends one.

## Notes

- Dates and times are in India time unless an airport says otherwise.
- If a tool says the connection isn't active, the user needs a new connection from https://agents.onarrival.com.
