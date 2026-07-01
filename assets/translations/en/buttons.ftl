btn-back =
    .general = ⬅️ Back
    .menu = ↩️ Main Menu
    .menu-return = ↩️ Return to Main Menu
    .dashboard = ↩️ Return to Dashboard
    .referrals = 👪 Back to Referrals

btn-common =
    .notification-close = ❌ Close
    .devices-empty = ⚠️ You have no connected devices
    .cancel = Cancel
    .next = ▶️ Next
    .prev = ◀️ Back

    .squad-choice = { $selected -> 
    [1] 🔘
    *[0] ⚪
    } { $name }

    .duration = ⌛ { $value ->
    [0] { unlimited }
    *[OTHER] { unit-day }
    }

btn-devices =
    .delete-all = 🗑 Delete All Devices
    .reissue = 🔄 Reissue Subscription
    .confirm-delete = ✅ Yes, Delete
    .confirm-reissue = ✅ Yes, Reset
    .cancel-reissue = ❌ No

    .item = { $platform_icon } { $platform } { $device_model -> 
    [0] { space }
    *[HAS] ({ $device_model }){ space }
    }— { $created_at }

btn-backup =
    .active-toggle = { $enabled ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
    }
    .set-interval = 🕐 Interval
    .set-max-files = 📁 File Count
    .send-toggle = { $send_to_chat ->
        [1] ✅ Send to Chat: Enabled
        *[0] ❌ Send to Chat: Disabled
    }
    .backup-assets = 📦 Start Assets Backup
    .backup-db = 🗄 Start Database Backup
    
btn-remnashop-info =
    .release-latest = 👀 View
    .how-upgrade = ❓ How to Upgrade
    .github = ⭐ GitHub
    .telegram = 👪 Telegram
    .donate = 💰 Support the Developer
    .docs = 📖 Documentation

btn-requirement =
    .rules-accept = ✅ Accept the Rules
    .channel-join = ❤️ Go to Channel
    .channel-confirm = ✅ Confirm

btn-menu =
    .trial = 🎁 TRY FOR FREE
    .trial-paid = 🚀 TRY FOR { $trial_price }
    .connect = 🚀 Connect
    .connect-reserve = 🔗 Connect (reserve)
    .get-links = 📋 Get Links
    .devices = 📱 Devices
    .subscription = 💳 Subscription
    .invite = 👥 Invite
    .support = 🆘 Support
    .web-cabinet = 🌐 Web Cabinet
    .dashboard = 🛠 Dashboard

    .connect-not-available =
    ⚠️ { $status ->
    [LIMITED] TRAFFIC LIMIT EXCEEDED
    [EXPIRED] SUBSCRIPTION EXPIRED
    *[OTHER] YOUR SUBSCRIPTION IS NOT ACTIVE
    } ⚠️

btn-invite =
    .about = ❓ About the Reward
    .copy = 📋 Copy Link
    .send = 📩 Invite
    .qr = 🧾 QR Code
    .withdraw-points = 💎 Exchange Points
    .reset-referral = 🔄 Reset Referral Link

btn-dashboard =
    .statistics = 📊 Statistics
    .users = 👥 Users
    .broadcast = 📢 Broadcast
    .promocodes = 🎟 Promo Codes
    .access = 🔓 Access Mode
    .remnawave = 🌊 RemnaWave
    .remnashop = 🛍 RemnaShop
    .transactions = 🧾 Transactions
    .pending-payments = 💳 Pending Payments ({ $count })

btn-card-to-card =
    .upload-receipt = 📤 Upload Receipt
    .approve-payment = ✅ Approve Payment
    .reject-payment = ❌ Reject Payment
    .view-receipt = 🖼 View Receipt
    .add-notes = 📝 Add Notes
    .importer = 📥 Import Users

btn-statistics =
    .users = 👥 Users
    .subscriptions = 💳 Subscriptions
    .transactions = 🧾 Transactions
    .promocodes = 🎁 Promo Codes
    .referrals = 👪 Referrals

    .subscription-page =
    { $page ->
        [0] { $is_current ->
            [1] [ General Statistics ]
            *[0] General Statistics
        }
        *[OTHER] { $is_current ->
            [1] [ { $plan_name } ]
            *[0] { $plan_name }
        }
    }

    .transaction-page =
    { $page ->
        [0] { $is_current ->
            [1] [ General Statistics ]
            *[0] General Statistics
        }
        *[OTHER] { $is_current ->
            [1] [ { gateway-type } ]
            *[0] { gateway-type }
        }
    }

btn-users =
    .search = 🔍 Search User
    .recent-registered = 🆕 Recently Registered
    .recent-activity = 📝 Recent Activity
    .blacklist = 🚫 Blacklist
    .unblock-all = 🔓 Unblock All
    .blacklist-view = 🗒️ Blocked List
    .blacklist-block = ⛔ Block by ID
    .blacklist-sources = 🔗 Auto-Updated Lists
    .blacklist-sources-sync = 🔄 Sync
    .blacklist-block-clear = 🗑 Clear ID List

    .blacklist-source = 🔗 { $source }

btn-user =
    .discount = 💸 Discount
    .discount-personal = 👤 Personal Discount
    .discount-purchase = 🎟 Next Purchase
    .points = 💎 Points
    .statistics = 📊 Statistics
    .referrals = 👪 Referrals
    .message = 📩 Message
    .role = 👮♂️ Role
    .transactions = 🧾 Transactions
    .give-access = 🔑 Plan Access
    .current-subscription = 💳 Current Subscription
    .subscription-traffic-limit = 🌐 Traffic Limit
    .subscription-device-limit = 📱 Device Limit
    .subscription-expire-time = ⏳ Expiration Time
    .subscription-squads = 🔗 Squads
    .subscription-traffic-reset = 🔄 Reset Traffic
    .subscription-devices = 🗒️ Device List
    .subscription-url = 📋 Copy Link
    .subscription-delete = ❌ Delete
    .subscription-reissue = ♻️ Reissue
    .message-preview = 👀 Preview
    .message-confirm = ✅ Send
    .referral-reset = 🔄 Reset Referral Link
    .sync = 🌀 Sync
    .sync-remnawave = 🌊 Use Remnawave Data
    .sync-remnashop = 🛍 Use Remnashop Data
    .give-subscription = 🎁 Grant Subscription
    .subscription-internal-squads = ⏺️ Internal Squads
    .subscription-external-squads = ⏹️ External Squad

    .allowed-plan-choice = { $selected ->
    [1] 🔘
    *[0] ⚪
    } { $plan_name }

    .subscription-active-toggle = { $is_active ->
    [1] 🔴 Disable
    *[0] 🟢 Enable
    }

    .transaction = { $status ->
    [PENDING] 🕓
    [COMPLETED] ✅
    [CANCELED] ❌
    [REFUNDED] 💸
    [FAILED] ⚠️
    *[OTHER] { $status }
    } { $created_at } · { gateway-type }
    
    .trial-toggle = { $is_trial_available ->
    [1] 🧪 Trial: Available
    *[0] 🧪 Trial: Not Available
    }

    .block = { $is_blocked ->
    [1] 🔓 Unblock
    *[0] 🔒 Block
    }

btn-broadcast =
    .list = 🗒️ All Broadcasts
    .all = 👥 Everyone
    .plan = 📦 By Plan
    .subscribed = ✅ Subscribed
    .unsubscribed = ❌ Unsubscribed
    .expired = ⌛ Expired
    .trial = ✳️ With Trial
    .content = ✉️ Edit Content
    .buttons = ✳️ Edit Buttons
    .preview = 👀 Preview
    .confirm = ✅ Start Broadcast
    .refresh = 🔄 Refresh Data
    .cancel = ⛔ Stop Broadcast
    .delete = ❌ Delete Sent

    .plan-title = { $is_active ->
    [1] 🟢
    *[0] 🔴 
    } { $name }
    
    .button-choice = { $selected ->
    [1] 🔘
    *[0] ⚪
    }
    
    .title = { $status ->
    [PROCESSING] ⏳
    [COMPLETED] ✅
    [CANCELED] ⛔
    [DELETED] ❌
    [ERROR] ⚠️
    *[OTHER] { $status }
    } { $created_at }
    
btn-goto =
    .subscription = 💳 Buy Subscription
    .promocode = 🎟 Activate Promo Code
    .invite = 👥 Invite
    .subscription-renew = 🔄 Renew Subscription
    .user-profile = 👤 Go to User
    .referrer-profile = 🤝 Go to Referrer
    .contact-support = 📩 Contact Support

btn-promocodes =
    .save = ✅ Save
    .create = 🆕 Create Promo Code
    .confirm = ✅ Create Promo Code
    .delete = 🗑️ Delete
    .regenerate = 🔄 Regenerate
    .code = 🏷️ Code
    .type = 🔖 Reward Type
    .availability = ✴️ Access
    .reward = 🎁 Reward
    .plan = 📦 Plan
    .expires = ⌛ Expiration
    .max-activations = 🔢 Activation Limit
    .reset = 🔄 Reset

    .plan-duration = { $days -> 
        [one] { $days } day
        *[other] { $days } days
    }

    .item = 🎟 { $code } — { promocode-type }

    .active-toggle = { $is_active ->
    [1] 🟢 Enabled
    *[0] 🔴 Disabled
    }

    .reusable-toggle = 🔁 { $is_reusable ->
    [1] Reusable: Yes
    *[0] Reusable: No
    }

btn-access =
    .mode = { access-mode }
    .conditions = ⚙️ Access Conditions
    .rules = ✳️ Rules Acceptance
    .channel = ❇️ Channel Subscription

    .payments-toggle = { $enabled ->
    [1] 🔘
    *[0] ⚪
    } Payments

    .registration-toggle = { $enabled ->
    [1] 🔘
    *[0] ⚪
    } Registration

    .condition-toggle = { $enabled ->
    [1] 🔘 Enabled
    *[0] ⚪ Disabled
    }

btn-remnashop =
    .admins = 👮♂️ Administrators
    .gateways = 🌐 Payment Systems
    .referral = 👥 Referral System
    .advertising = 🎯 Advertising
    .plans = 📦 Plans
    .notifications = 🔔 Notifications
    .logs = 📄 Logs
    .menu-editor = 🎛 Main Menu Editor
    .backup = 💾 Backup
    .extra = ⚙️ Extra Settings

btn-remnashop-transaction = { $status ->
    [PENDING] 🕓
    [COMPLETED] ✅
    [CANCELED] ❌
    [REFUNDED] 💸
    [FAILED] ⚠️
    *[OTHER] { $status }
    } #{ $user_id } · { gateway-type } · { $created_at }

btn-remnashop-extra =
    .device-single = { $enabled -> 
        [1] 🟢
        *[0] 🔴
    } Device Deletion

    .device-all = { $enabled -> 
        [1] 🟢
        *[0] 🔴
    } Delete All Devices

    .link-reset = { $enabled -> 
        [1] 🟢
        *[0] 🔴
    } Subscription Reissue
    .referral-reset = { $enabled -> 
        [1] 🟢
        *[0] 🔴
    } Reset Referral Link

    .trial-channel-guard = { $enabled ->
        [1] 🟢
        *[0] 🔴
    } Auto-Disable Trial

    .mini-app-reserve = { $enabled ->
        [1] 🟢
        *[0] 🔴
    } Reserve Connection Button

    .toggle = { $enabled ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
    }

btn-menu-editor =
    .text = 🏷️ Text
    .availability = ✴️ Access
    .type = 🔖 Type
    .payload = 📄 Data
    .color = 🎨 Color
    .confirm = ✅ Save
    .color-default = No Color
    .color-primary = Primary
    .color-success = Green
    .color-danger = Red

    .button = { $is_active ->
        [1] 🟢
        *[0] 🔴
    } { $text }

    .active-toggle = { $is_active ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
    }

    .subscribers-only-toggle = { $subscribers_only ->
        [1] 💳 Subscribers Only
        *[0] 👥 Everyone
    }

btn-gateway =
    .title = { gateway-type }
    .setting = { $field }
    .display-name = 🏷️ Display Name
    .webhook-copy = 📋 Copy Webhook
    .test = 🐞 Test
    .default-currency = 💸 Default Currency
    .placement = 🔢 Change Position
    .field-reset = ♻️ Reset Value

    .active-toggle = { $is_active ->
    [1] 🟢 Enabled
    *[0] 🔴 Disabled
    }

    .default-currency-choice = { $enabled ->
    [1] 🔘
    *[0] ⚪
    } { $symbol } { $currency }

btn-referral =
    .level = 🔢 Level
    .reward-type = 🎀 Reward Type
    .accrual-strategy = 📍 Accrual Condition
    .reward-strategy = ⚖️ Accrual Form
    .reward = 🎁 Reward
    
    .active-toggle = { $is_enable -> 
    [1] 🟢 Enabled
    *[0] 🔴 Disabled
    }

    .level-choice = { $type -> 
    [1] 1️⃣
    [2] 2️⃣
    [3] 3️⃣
    *[OTHER] { $type }
    }

    .reward-choice = { $type -> 
    [POINTS] 💎 Points
    [EXTRA_DAYS] ⏳ Days
    *[OTHER] { $type }
    }

    .accrual-strategy-choice = { $type -> 
    [ON_FIRST_PAYMENT] 💳 First Payment
    [ON_EACH_PAYMENT] 💸 Each Payment
    *[OTHER] { $type }
    }

    .reward-strategy-choice = { $type -> 
    [AMOUNT] 🔸 Fixed
    [PERCENT] 🔹 Percentage
    *[OTHER] { $type }
    }

btn-notifications =
    .user = 👥 User
    .system = ⚙️ System
    .route = 📡 Route
    .default-route = 📡 Default Route
    .chat-id = 💬 Change Chat
    .thread-id = 📁 Change Thread
    .route-clear = ❌ Delete Route
    
    .user-choice = { $enabled ->
    [1] 🔘
    *[0] ⚪
    } { notification-type }

    .system-choice = { $enabled -> 
    [1] 🔘
    *[0] ⚪
    } { $has_route ->
    [1] 📡
    *[0] { space }
    } { notification-type }

    .active-toggle = { $is_active ->
    [1] 🟢 Enabled
    *[0] 🔴 Disabled
    }

btn-plans =
    .save = ✅ Save
    .create = 🆕 Create Plan
    .create-confirm = ✅ Create Plan
    .delete = ❌ Delete
    .name = 🏷️ Name
    .description = 💬 Description
    .description-remove = ❌ Remove Current Description
    .tag = 📌 Tag
    .tag-remove = ❌ Remove Current Tag
    .type = 🔖 Type
    .availability = ✴️ Access
    .durations-prices = ⏳ Durations and 💰 Prices
    .traffic = 🌐 Traffic
    .devices = 📱 Devices
    .allowed = 👥 Allowed Users
    .squads = 🔗 Squads
    .internal-squads = ⏺️ Internal Squads
    .external-squads = ⏹️ External Squad
    .duration-add = 🆕 Add Duration
    .price-choice = 💸 { $price } { $currency }
    .export = 📤 Export
    .import = 📥 Import
    .exporting = 📤 Export
    .importing = 📥 Import
    .url = 📋 Copy Plan Link

    .trial = { $is_trial ->
    [1] 🔘
    *[0] ⚪
    } Trial 

    .export-choice = { $selected ->
    [1] 🔘
    *[0] ⚪
    } { $name }

    .title = { $is_active ->
    [1] 🟢
    *[0] 🔴 
    } { $name }

    .active-toggle = { $is_active -> 
    [1] 🟢 Enabled
    *[0] 🔴 Disabled
    }
    
    .type-choice = { $type -> 
    [TRAFFIC] 🌐 Traffic
    [DEVICES] 📱 Devices
    [BOTH] 🔗 Traffic + Devices
    [UNLIMITED] ♾️ Unlimited
    *[OTHER] { $type }
    }

    .availability-choice = { $type -> 
    [ALL] 🌍 For Everyone
    [NEW] 🌱 For New Users
    [EXISTING] 👥 For Existing Customers
    [INVITED] ✉️ For Invited
    [ALLOWED] 🔐 For Allowed
    [LINK] 🔗 Via Link
    *[OTHER] { $type }
    }

    .traffic-strategy-choice = { $selected ->
    [1] 🔘 { traffic-strategy }
    *[0] ⚪ { traffic-strategy }
    }

    
btn-remnawave =
    .users = 👥 Users
    .hosts = 🌐 Hosts
    .nodes = 🖥️ Nodes
    .inbounds = 🔌 Inbounds

btn-importer =
    .from-xui = 💩 Import from 3X-UI Panel
    .sync-from-panel = 🌀 Sync: Panel → Bot
    .sync-from-bot = 🤖 Sync: Bot → Panel
    .sync-start = ▶️ Sync
    .squads = 🔗 Internal Squads
    .import-all = ✅ Import All
    .import-active = ❇️ Import Active

btn-subscription =
    .plan = 💳 Go to Checkout
    .new = 💸 Buy Subscription
    .renew = 🔄 Renew
    .change = 🔃 Change
    .promocode = 🎟 Activate Promo Code
    .promocode-confirm = ✅ Confirm
    .pay = 💳 Pay
    .get = 🎁 Get for Free
    .back-plans = ⬅️ Back to Plan Selection
    .back-duration = ⬅️ Change Duration
    .back-payment-method = ⬅️ Change Payment Method
    .connect = 🚀 Connect

    .payment-method = { $gateway_title } | { $final_amount ->
    [0] 🎁
    *[HAS] { $final_amount }{ $currency }
    }
    
    .duration = { $period } | { $final_amount -> 
    [0] 🎁
    *[HAS] { $final_amount }{ $currency }
    }

btn-ad-links =
    .save = ✅ Save
    .create = 🆕 Create Link
    .create-confirm = ✅ Create Link
    .delete = ❌ Delete Link
    .name = 🏷️ Name
    .code = 🔗 Code
    .regenerate = 🔄 Regenerate
    .stats = 📊 Statistics
    .url = 📋 Copy Link

    .title = { $is_active ->
    [1] 🟢
    *[0] 🔴
    } { $name }

    .active-toggle = { $is_active ->
    [1] 🟢 Enabled
    *[0] 🔴 Disabled
    }