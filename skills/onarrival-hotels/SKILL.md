---
name: onarrival-hotels
description: Search and book hotels with OnArrival and hand the guest a payment link. Use when the user asks to find, compare or book a hotel or stay, or to check a hotel booking they made through OnArrival.
---

# Booking hotels with OnArrival

The OnArrival tools book on the user's own OnArrival account. You prepare the booking; it is only confirmed once the payment link is paid.

## Flow

1. **Destination.** Call `hotel-anchor-search` with the city, area, landmark or hotel name. Pick the matching anchor; it carries a `listingInput`.
2. **Stay details.** Confirm check-in and check-out dates, the number of rooms, and adults and children per room (with children's ages) before searching.
3. **Listing.** Call `hotel-listing` with the anchor's `listingInput` fields exactly as returned, plus the dates and guests. Present a short list: name, area, rating and total price.
4. **Details.** For the hotels the user likes, call `hotel-details` for rooms, rates, inclusions and cancellation terms. Use `hotel-reviews-get` if they ask about reviews.
5. **Create the order** with `hotel-order-create` once the user confirms the room, rate and total price.
6. **Guests.** Check the order's `validationInfo`: if `panCountRequired` is above 0, prefer guests with PAN details; if `passportMandatory` is true, prefer guests with passport details. Call `traveller-list`, let the user choose, create profiles with `traveller-create` only if needed, then call `hotel-order-travellers-review` with `leadTravellerId` and `otherTravellerIds` (never repeat the lead).
7. **Payment link.** Call `order-payment-initialize`. It returns `paymentUrl`, which is also emailed to the user. Share the link and the amount.
8. **Status.** After they pay, check `hotel-booking-details` and share the confirmation and voucher.

## Rules

- Confirm the hotel, room, dates, guests and total price with the user before creating the order.
- Mention the cancellation policy before they pay.
- Never pay the link yourself: send it to the user, who pays on Razorpay's secure page.
- If a tool says the connection isn't active, the user needs a new connection link from https://agents.onarrival.com.
