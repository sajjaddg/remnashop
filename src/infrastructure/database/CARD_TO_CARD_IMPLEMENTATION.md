# Card-to-Card Payment System Implementation

## Overview

This document outlines the implementation of a Card-to-Card payment system with admin approval for the Remnashop VPN Telegram bot. This allows users to pay for subscriptions by transferring money directly from their card to a configured card, uploading a receipt, and having an admin approve or reject the payment.

## Features Implemented

### 1. Currency Support: Iranian Toman (IRR)
- Added `IRR` to the `Currency` enum in `src/core/enums.py`
- Symbol: `ریال`
- This allows pricing plans in Toman alongside USD, XTR (Telegram Stars), and RUB

### 2. New Payment Gateway Type: CARD_TO_CARD
- Added `CARD_TO_CARD` to `PaymentGatewayType` enum
- Mapped to `IRR` currency by default
- Configured as a gateway that does NOT require webhook (manual approval process)

### 3. Database Schema Changes

**New fields added to `Transaction` model** (migration `0041_add_card_to_card_payment.py`):
- `receipt_image` (String, nullable) - Stores the Telegram file_id of the uploaded receipt
- `admin_approval_status` (String, nullable) - Status: `PENDING`, `APPROVED`, or `REJECTED`
- `admin_notes` (String, nullable) - Admin's notes about the approval/rejection decision

**To apply the migration:**
```bash
# From project root
docker compose -f docker-compose.local.yml exec remnashop alembic upgrade head
# OR rebuild the container
docker compose -f docker-compose.local.yml up -d --build
```

### 4. Payment Gateway Implementation

**File:** `src/infrastructure/payment_gateways/card_to_card.py`

**Settings (`CardToCardGatewaySettingsDto`):**
- `card_number` - The card number to receive payments
- `card_holder_name` - Name on the card
- `bank_name` - Name of the bank
- `instructions` - Additional instructions for users (optional)

**Flow:**
1. `handle_create_payment()` - Creates a PENDING transaction and returns card details to the user
2. User sees card information and is prompted to upload a receipt
3. Receipt is stored in `transaction.receipt_image` with status `PENDING`
4. Admin reviews the payment in the dashboard
5. Admin approves → transaction status changes to `COMPLETED`, subscription activates
6. Admin rejects → transaction status changes to `FAILED`, user is notified

### 5. Internationalization (i18n)

**Translation keys added** (both `en/` and `ru/`):

**Messages (`messages.ftl`):**
- `msg-card-to-card-info` - Shows card details and payment instructions
- `msg-card-to-card-receipt-received` - Confirmation after receipt upload
- `msg-card-to-card-payment-approved` - Notification when payment is approved
- `msg-card-to-card-payment-rejected` - Notification when payment is rejected
- `msg-card-to-card-pending-payments` - List of pending payments for admin
- `msg-card-to-card-payment-details` - Payment review details for admin
- Updated `msg-gateways-field` to include card-to-card configuration fields

**Buttons (`buttons.ftl`):**
- `btn-dashboard.pending-payments` - Button to view pending payments (with count)
- `btn-card-to-card.upload-receipt` - User button to upload receipt
- `btn-card-to-card.approve-payment` - Admin button to approve payment
- `btn-card-to-card.reject-payment` - Admin button to reject payment
- `btn-card-to-card.view-receipt` - Admin button to view uploaded receipt
- `btn-card-to-card.add-notes` - Admin button to add rejection notes

**Utils (`utils.ftl`):**
- Added `[CARD_TO_CARD]` to `gateway-type` selector
  - English: "💳 Card-to-Card"
  - Russian: "💳 Оплата с карты на карту"

### 6. Gateway Registration

**Files updated:**
- `src/infrastructure/payment_gateways/__init__.py` - Exported `CardToCardGateway`
- `src/infrastructure/di/providers/payment_gateways.py` - Registered in `GATEWAY_MAP`
- `src/application/dto/payment_gateway.py` - Added `CardToCardGatewaySettingsDto` to union type

## Usage Flow

### For Users

1. User selects a plan and chooses "💳 Card-to-Card" as payment method
2. Bot displays:
   - Amount to pay (in Toman/IRR)
   - Card number (formatted)
   - Card holder name
   - Bank name
   - Custom instructions (if configured)
3. User transfers exact amount via their banking app
4. User takes a screenshot of the receipt
5. User uploads the screenshot to the bot
6. Bot confirms receipt and notifies user that payment is pending approval
7. User receives notification once admin approves or rejects

### For Admins

1. Admin sees "💳 Pending Payments (N)" button in dashboard
2. Admin opens pending payments list
3. Admin selects a payment to review
4. Bot shows:
   - User details
   - Amount and plan
   - Uploaded receipt image
5. Admin clicks:
   - **✅ Approve Payment** → Transaction completed, subscription activates, user notified
   - **❌ Reject Payment** → Admin can add notes, transaction marked failed, user notified with reason

## Configuration Steps

### 1. Enable Card-to-Card Gateway in Admin Panel

1. Go to Dashboard → Payment Systems
2. Find "💳 Card-to-Card" in the list
3. Click to configure
4. Set the following fields:
   - **Display Name** (optional): e.g., "Iranian Card Payment"
   - **Card Number**: e.g., "6037-9978-1234-5678"
   - **Card Holder Name**: e.g., "Ahmad Mohammadi"
   - **Bank Name**: e.g., "Mellat Bank"
   - **Instructions** (optional): e.g., "Please include your user ID in the transfer description"
5. Toggle "Active" to enable the gateway
6. Set display order if you have multiple gateways

### 2. Create Plan Prices in IRR (Toman)

1. Go to Dashboard → Plans
2. Select a plan
3. Add or edit durations
4. For each duration, add a price with currency **IRR**
5. Set the price in Toman (e.g., 50000 for 50,000 Tomans)

### 3. Set IRR as Default Currency (Optional)

If most of your users pay in Toman:
1. Go to Dashboard → Payment Systems → Default Currency
2. Select **IRR (ریال)**

## Implementation TODO (Next Steps)

The following features still need to be implemented:

### Required (Core Flow)

1. **Subscription Purchase Handler Updates**
   - Update `src/telegram/routers/subscription/handlers.py` to handle Card-to-Card flow
   - After payment creation, prompt user to upload receipt image
   - Store uploaded photo's `file_id` in `transaction.receipt_image`
   - Set `admin_approval_status = 'PENDING'`

2. **Admin Dashboard Integration**
   - Create new router: `src/telegram/routers/dashboard/pending_payments/`
   - Add dialog with states:
     - `PendingPaymentsList` - List all pending payments
     - `PaymentReview` - Show payment details + receipt + approve/reject buttons
     - `RejectReason` - Input field for admin notes
   - Add handlers:
     - `on_view_pending_payments()` - Query all PENDING transactions
     - `on_select_payment()` - Show payment details
     - `on_approve_payment()` - Mark COMPLETED, trigger subscription activation
     - `on_reject_payment()` - Prompt for notes
     - `on_submit_rejection()` - Mark FAILED, send notification to user
   - Update dashboard main menu to show "Pending Payments (N)" button

3. **Notification System**
   - Send notification to user when payment is approved:
     - Use `msg-card-to-card-payment-approved`
   - Send notification to user when payment is rejected:
     - Use `msg-card-to-card-payment-rejected` with admin notes

4. **Transaction DAO Updates**
   - Add methods to `src/application/common/dao/transaction.py`:
     - `get_pending_card_to_card_payments()` - Query all PENDING transactions for Card-to-Card gateway
     - `update_approval_status(transaction_id, status, admin_notes)` - Update approval fields
     - `get_transaction_with_user_details(transaction_id)` - For admin review screen

### Optional (Enhancements)

5. **Receipt Validation**
   - Check that uploaded image is actually an image
   - Validate image size/format
   - Store receipt in persistent storage (not just file_id)

6. **Admin Notifications**
   - Send notification to admins when new receipt is uploaded
   - Badge count on dashboard button

7. **User Payment History**
   - Show pending/approved/rejected payments in user subscription menu
   - Allow user to re-upload receipt if rejected

8. **Auto-Expiry**
   - Automatically reject payments older than X days with no admin action

9. **Payment Reference Numbers**
   - Generate unique reference numbers for tracking
   - Ask users to include reference in transfer description

## Testing Checklist

After implementing the TODO items:

- [ ] Create a test plan with IRR pricing
- [ ] Enable Card-to-Card gateway
- [ ] User can select Card-to-Card payment method
- [ ] User sees correct card details
- [ ] User can upload a receipt image
- [ ] Receipt is stored in transaction
- [ ] Admin sees payment in pending list
- [ ] Admin can view receipt image
- [ ] Admin can approve payment → subscription activates
- [ ] Admin can reject payment → user receives notification with reason
- [ ] Transaction history shows correct statuses
- [ ] Test with multiple simultaneous pending payments
- [ ] Test edge cases: invalid images, double-approval, etc.

## Code Structure Reference

```
src/
├── core/
│   └── enums.py                          # Added IRR currency, CARD_TO_CARD gateway type
├── application/
│   └── dto/
│       └── payment_gateway.py            # Added CardToCardGatewaySettingsDto
├── infrastructure/
│   ├── database/
│   │   ├── models/
│   │   │   └── transaction.py            # Added receipt_image, admin_approval_status, admin_notes
│   │   └── migrations/
│   │       └── versions/
│   │           └── 0041_add_card_to_card_payment.py  # New migration
│   ├── payment_gateways/
│   │   ├── __init__.py                   # Exported CardToCardGateway
│   │   ├── card_to_card.py               # New gateway implementation
│   └── di/
│       └── providers/
│           └── payment_gateways.py       # Registered in GATEWAY_MAP
└── telegram/
    └── routers/
        ├── subscription/
        │   └── handlers.py                # TODO: Update for receipt upload
        └── dashboard/
            └── pending_payments/          # TODO: Create new router
                ├── __init__.py
                ├── dialog.py
                ├── handlers.py
                ├── getters.py
                └── states.py

assets/
└── translations/
    ├── en/
    │   ├── messages.ftl                   # Added card-to-card messages
    │   ├── buttons.ftl                    # Added card-to-card buttons
    │   └── utils.ftl                      # Added CARD_TO_CARD to gateway-type
    └── ru/
        ├── messages.ftl                   # Added Russian translations
        ├── buttons.ftl
        └── utils.ftl
```

## Migration Commands

```bash
# Apply migration (inside container)
docker compose -f docker-compose.local.yml exec remnashop alembic upgrade head

# OR rebuild container (applies migrations automatically)
docker compose -f docker-compose.local.yml up -d --build

# Check migration status
docker compose -f docker-compose.local.yml exec remnashop alembic current

# Rollback if needed
docker compose -f docker-compose.local.yml exec remnashop alembic downgrade -1
```

## Notes

- The Card-to-Card gateway is configured as a **manual approval** system, so it does NOT use webhooks
- Transactions start with status `PENDING` instead of `COMPLETED`
- The subscription activation logic needs to be called when admin approves payment
- Receipt images are stored by Telegram `file_id` - consider backing up to persistent storage for audit trails
- The `instructions` field in gateway settings allows customization per deployment (e.g., different banks, different card numbers)

## Next Steps

To complete this implementation:

1. Implement the subscription handler receipt upload flow (item 1 in TODO)
2. Create the admin dashboard pending payments interface (item 2 in TODO)
3. Wire up the notification system (item 3 in TODO)
4. Test the full flow end-to-end
5. Deploy with `docker-compose.local.yml up -d --build`

---

**Status:** Backend implementation complete, frontend (Telegram bot UI) pending.
