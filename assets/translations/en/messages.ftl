# Menu
msg-main-menu =
    { hdr-user-profile }
    { frg-user }

    { hdr-subscription }
    { $status ->
    [ACTIVE]
    { frg-subscription }
    [EXPIRED]
    <blockquote>
    • Subscription has expired.
    
    <i>{ $is_trial ->
    [0] Your subscription has expired. Renew it to continue using the service!
    *[1] Your free trial has ended. Subscribe to continue using the service!
    }</i>
    </blockquote>
    [LIMITED]
    <blockquote>
    • Your traffic has been used up.

    <i>{ $is_trial ->
    [0] { $traffic_strategy ->
        [NO_RESET] Renew your subscription to reset traffic and continue using the service!
        *[RESET] Traffic will be restored in { $reset_time }. You can also renew your subscription to reset traffic now.
        }
    *[1] { $traffic_strategy ->
        [NO_RESET] Subscribe to continue using the service!
        *[RESET] Traffic will be restored in { $reset_time }. You can also subscribe for unlimited access.
        }
    }</i>
    </blockquote>
    [DISABLED]
    <blockquote>
    • Your subscription has been disabled.

    <i>Contact support to find out the reason!</i>
    </blockquote>
    *[NONE]
    <blockquote>
    • You don't have an active subscription.

    <i>{ $trial_available ->
    [1] 🎁 A free trial is available for you — tap the button below to claim it.
    *[0] ↘️ To purchase access, go to the "Subscription" menu.
    }</i>
    </blockquote>
    }

msg-menu-devices =
    <b>📱 Device Management</b>

    Connected: <b>{ $current_count } / { $max_count -> 
    [0] { unlimited }
    *[LIMIT] { $max_count }
    }</b>

    { $has_devices ->
    [0] { empty }
    *[HAS] { $device_single_enabled ->
        [0] To unbind a device, contact support.
        *[OTHER] Tap on a device to remove it.
        }
    }{ $max_count ->
    [0] { space }
    *[LIMIT] If you need more devices — change your subscription plan.
    }

msg-menu-devices-confirm-reissue =
    🔄 <b>Subscription Reissue</b>

    ⚠️ After resetting, the old link <b>will stop working</b> and all devices will need to be reconnected.

    You will need to:
    • Delete the old subscription from the app
    • Add the new link from the "{ btn-menu.connect }" section

    Are you sure you want to reset the link?

msg-menu-devices-confirm-delete =
    🗑 <b>Confirm device removal</b>

    <b>{ $device_model }</b>
    <blockquote>
    • <b>Platform</b>: { $platform_icon } { $platform }
    • <b>Added</b>: { $created_at }
    </blockquote>

msg-menu-devices-confirm-delete-all =
    🗑 <b>Confirm removal of all devices</b>

msg-menu-invite =
    <b>👥 Invite Friends</b>
    
    Share your unique link and earn rewards in the form of { $reward_type ->
        [POINTS] <b>points that can be exchanged for a subscription or real money</b>
        [EXTRA_DAYS] <b>free days added to your subscription</b>
        *[OTHER] { $reward_type }
    }!

    <b>📊 Statistics</b>:
    <blockquote>
    👥 Total invited: { $referrals }
    💳 Payments via your link: { $payments }
    { $reward_type -> 
    [POINTS] 💎 Your points: { $points }
    *[EXTRA_DAYS] { empty }
    }
    </blockquote>

msg-menu-invite-about =
    <b>🎁 Reward Details</b>

    <b>✨ How to Earn Rewards</b>:
    <blockquote>
    { $accrual_strategy ->
    [ON_FIRST_PAYMENT] The reward is credited when the invited user makes their first subscription purchase.
    [ON_EACH_PAYMENT] The reward is credited for every subscription purchase or renewal by the invited user.
    *[OTHER] { $accrual_strategy }
    }
    </blockquote>

    <b>💎 What You Get</b>:
    <blockquote>
    { $max_level -> 
    [1] For invited friends: { $reward_level_1 }
    *[MORE]
    { $identical_reward ->
    [0]
    1️⃣ For your friends: { $reward_level_1 }
    2️⃣ For friends invited by your friends: { $reward_level_2 }
    *[1]
    For your friends and friends invited by your friends: { $reward_level_1 }
    }
    }
    
    { $reward_strategy_type ->
    [AMOUNT] { $reward_type ->
        [POINTS] { space }
        [EXTRA_DAYS] <i>(All extra days are added to your current subscription)</i>
        *[OTHER] { $reward_type }
    }
    [PERCENT] { $reward_type ->
        [POINTS] <i>(Percentage of points from the value of their purchased subscription)</i>
        [EXTRA_DAYS] <i>(Percentage of extra days from their purchased subscription)</i>
        *[OTHER] { $reward_type }
    }
    *[OTHER] { $reward_strategy_type }
    }
    </blockquote>

msg-invite-reward = { $value }{ $reward_strategy_type ->
    [AMOUNT] { $reward_type ->
        [POINTS] { space }{ $value -> 
            [one] point
            *[other] points
            }
        [EXTRA_DAYS] { space }extra { $value -> 
            [one] day
            *[other] days
            }
        *[OTHER] { $reward_type }
    }
    [PERCENT] % { $reward_type ->
        [POINTS] points
        [EXTRA_DAYS] extra days
        *[OTHER] { $reward_type }
    }
    *[OTHER] { $reward_strategy_type }
    }


# Dashboard
msg-dashboard-main = <b>🛠 Control Panel</b>
msg-users-main = <b>👥 Users</b>
msg-broadcast-main = <b>📢 Broadcast</b>
msg-statistics-main = <b>📊 Statistics</b>
    
msg-statistics-users =
    <b>👥 User Statistics</b>

    <blockquote>
    • <b>Total</b>: { $total_users }
    • <b>New today</b>: { $new_users_daily }
    • <b>New this week</b>: { $new_users_weekly }
    • <b>New this month</b>: { $new_users_monthly }

    • <b>With subscription</b>: { $users_with_subscription }
    • <b>Without subscription</b>: { $users_without_subscription }
    • <b>With trial</b>: { $users_with_trial }
    </blockquote>

    <blockquote>
    • <b>Blocked</b>: { $blocked_users }
    • <b>Blocked the bot</b>: { $bot_blocked_users }

    • <b>User → purchase conversion</b>: { $user_conversion }%
    • <b>Trial → subscription conversion</b>: { $trial_conversion }%
    </blockquote>

msg-statistics-subscriptions =
    { $plan_name ->
    [0] <b>💳 Subscription Statistics</b>
    *[HAS] <b>📦 "{ $plan_name }" Plan Statistics</b>
    }

    <blockquote>
    • <b>Total</b>: { $total }
    • <b>Active</b>: { $total_active }
    • <b>Disabled</b>: { $total_disabled }
    • <b>Limited</b>: { $total_limited }
    • <b>Expired</b>: { $total_expired }
    • <b>Expiring soon (7 days)</b>: { $expiring_soon }
    { $plan_name ->
    [0] • <b>Trials</b>: { $active_trial }
    *[HAS] • <b>Popular duration</b>: { $popular_duration }
    }
    </blockquote>

    { $plan_name ->
    [0] <blockquote>
    • <b>Unlimited</b>: { $total_unlimited }
    • <b>With traffic limit</b>: { $total_traffic }  
    • <b>With device limit</b>: { $total_devices }
    </blockquote>
    *[HAS] <b>Total revenue</b>:
    <blockquote>
    { $all_income }
    </blockquote>
    }
    
msg-statistics-subscriptions-plan-income = { $income }{ $currency }
    
msg-statistics-transactions =
    { $gateway_type ->
    [0] <b>🧾 Overall Transaction Statistics</b>
    *[HAS] <b>🧾 { gateway-type } Statistics</b>
    }

    <blockquote>
    • <b>Total transactions</b>: { $total_transactions }
    • <b>Completed transactions</b>: { $completed_transactions }
    • <b>Free transactions</b>: { $free_transactions }
    { $gateway_type ->
    [0] { $popular_gateway ->
        [0] { empty }
        *[HAS] • <b>Most popular payment system</b>: { $popular_gateway }
        }
    *[HAS] { empty }
    }
    </blockquote>

    { $gateway_type ->
    [0] { empty }
    *[HAS] <blockquote>
    • <b>Total revenue</b>: { $total_income }{ $currency }
    • <b>Today's revenue</b>: { $daily_income }{ $currency }
    • <b>Weekly revenue</b>: { $weekly_income }{ $currency }
    • <b>Monthly revenue</b>: { $monthly_income }{ $currency }
    • <b>Last month's revenue</b>: { $last_month_income }{ $currency }
    • <b>Average check</b>: { $average_check }{ $currency }
    • <b>Total discounts</b>: { $total_discounts }{ $currency }
    </blockquote>
    }

msg-statistics-promocodes =
    <b>🎁 Promocode Statistics</b>

    <blockquote>
    • <b>Total promocodes</b>: { $total_promocodes }
    • <b>Active</b>: { $active_promocodes }
    • <b>Total activations</b>: { $total_activations }
    </blockquote>

    <blockquote>
    • <b>Activations today</b>: { $activations_today }
    • <b>Activations this week</b>: { $activations_week }
    • <b>Activations this month</b>: { $activations_month }
    </blockquote>

    <blockquote>
    • <b>Days issued</b>: { $issued_days }
    • <b>Traffic issued (GB)</b>: { $issued_traffic }
    • <b>Devices issued</b>: { $issued_devices }
    • <b>Subscriptions issued</b>: { $issued_subscriptions }
    • <b>Personal discounts issued</b>: { $issued_personal_discounts }
    • <b>One-time discounts issued</b>: { $issued_purchase_discounts }
    </blockquote>

msg-statistics-promocode-detail =
    <b>🎁 Promocode</b> <code>{ $code }</code>

    <blockquote>
    • <b>Type</b>: { promocode-type }
    • <b>Reward</b>: { $reward }
    • <b>Status</b>: { $is_active ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
        }
    • <b>Repeat activation</b>: { $is_reusable ->
        [1] Allowed
        *[0] Not allowed
        }
    </blockquote>

    <blockquote>
    • <b>Created</b>: { $created_at }
    • <b>Expires</b>: { $expires_at }
    • <b>Activation limit</b>: { $max_activations }
    • <b>Remaining activations</b>: { $remaining }
    </blockquote>

    <blockquote>
    • <b>Total activations</b>: { $total_activations }
    • <b>Today</b>: { $activations_today }
    • <b>This week</b>: { $activations_week }
    • <b>This month</b>: { $activations_month }
    </blockquote>

msg-statistics-referrals =
    <b>👪 Referral Statistics</b>

    <blockquote>
    • <b>Total referrals</b>: { $total_referrals }
    • <b>Level 1</b>: { $level_1_count }
    • <b>Level 2</b>: { $level_2_count }
    • <b>Unique referrers</b>: { $unique_referrers }
    { $top_referrer_id ->
        [0] { empty }
        *[HAS] • <b>Top referrer</b>: { $top_referrer_telegram_id ->
            [0] <code>{ $top_referrer_email }</code>
            *[HAS] { $top_referrer_username ->
                [0] { NUMBER($top_referrer_telegram_id, useGrouping: 0) }
                *[HAS] <a href="tg://user?id={ $top_referrer_telegram_id }">@{ $top_referrer_username }</a>
            }
        } ({ $top_referrer_referrals_count } referrals)
    }
    </blockquote>

    <blockquote>
    • <b>Rewards issued</b>: { $total_rewards_issued }
    • <b>Points issued</b>: { $total_points_issued }
    • <b>Days issued</b>: { $total_days_issued }
    </blockquote>


# Access
msg-access-main =
    <b>🔓 Access Mode</b>
    
    <blockquote>
    • <b>Mode</b>: { access-mode }
    • <b>Payments</b>: { $payments_allowed ->
    [0] disabled
    *[1] enabled
    }.
    • <b>Registration</b>: { $registration_allowed ->
    [0] disabled
    *[1] enabled
    }.
    </blockquote>

msg-access-conditions =
    <b>⚙️ Access Conditions</b>

msg-access-rules =
    <b>✳️ Change Rules Link</b>

    { $rules_url ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $rules_url }
    </blockquote>
    }

    Enter the link (in the format https://telegram.org/tos).

msg-access-channel =
    <b>❇️ Change Channel/Group Link</b>

    { $channel_url ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $channel_url } { $channel_id -> 
        [0] { empty } 
        *[HAS] (ID: { $channel_id }) 
        }
    </blockquote>
    }
    
    If your group doesn't have an @username, send the group ID and invite link as separate messages.
    
    If you have a public channel/group, enter only the @username.


# Broadcast
msg-broadcast-list = <b>📄 Broadcast List</b>
msg-broadcast-plan-select = <b>📦 Select a plan for the broadcast</b>
msg-broadcast-send = <b>📢 Send Broadcast ({ audience-type })</b>

    { $audience_count } { $audience_count ->
    [one] user
    *[other] users
    } will receive the broadcast

msg-broadcast-content =
    <b>✉️ Broadcast Content</b>

    Send a message (HTML supported). You can attach a photo, video, or file. Limit: up to 4096 characters without media, up to 1024 characters with media.

msg-broadcast-buttons = <b>✳️ Broadcast Buttons</b>

msg-broadcast-view =
    <b>📢 Broadcast</b>

    <blockquote>
    • <b>ID</b>: <code>{ $broadcast_id }</code>
    • <b>Status</b>: { broadcast-status }
    • <b>Audience</b>: { audience-type }
    • <b>Created</b>: { $created_at }
    </blockquote>

    <blockquote>
    • <b>Total messages</b>: { $total_count }
    • <b>Successful</b>: { $success_count }
    • <b>Failed</b>: { $failed_count }
    </blockquote>


# Users
msg-users-recent-registered = <b>🆕 Recently Registered</b>
msg-users-recent-activity = <b>📝 Recent Activity</b>
msg-user-transactions = <b>🧾 User Transactions</b>
msg-user-devices = <b>📱 User Devices ({ $current_count } / { $max_count })</b>
msg-user-give-access = <b>🔑 Grant Access to Plan</b>

msg-users-search =
    <b>🔍 Search User</b>

    Enter user ID or Email, part of their name, or forward any of their messages.

msg-users-search-results =
    <b>🔍 Search User</b>

    Found <b>{ $count }</b> { $count ->
    [one] user
    *[other] users
    }, { $count ->
    [one] matching
    *[other] matching
    } the query

msg-user-main = 
    <b>📝 User Information</b>

    { hdr-user-profile }
    { frg-user-details }

    <b>💸 Discount</b>:
    <blockquote>
    • <b>Personal</b>: { $personal_discount }%
    • <b>Next purchase</b>: { $purchase_discount }%
    </blockquote>
    
    { hdr-subscription }
    { $status ->
    [ACTIVE]
    { frg-subscription-user-editor }
    [EXPIRED]
    <blockquote>
    • Subscription has expired.
    </blockquote>
    [LIMITED]
    <blockquote>
    • Traffic limit exceeded.
    </blockquote>
    [DISABLED]
    <blockquote>
    • Subscription is disabled.
    </blockquote>
    *[NONE]
    <blockquote>
    • No active subscription.
    </blockquote>
    }

msg-user-statistics =
    <b>📊 User Statistics</b>

    <blockquote>
    • <b>Registration date</b>: { $registered_at }
    • <b>Last payment</b>: { $last_payment_at ->
        [0] { unknown }
        *[HAS] { $last_payment_at }
    }
    </blockquote>

    { $payment_amounts ->
    [0] { space }
    *[HAS] <blockquote>
    { $payment_amounts }
    </blockquote>
    }

    <blockquote>
    • <b>Referred by</b>: { $referrer_telegram_id ->
        [0] { $referrer_email ->
            [0] { unknown }
            *[HAS] <code>{ $referrer_email }</code>
        }
        *[HAS] { $referrer_username ->
            [0] { NUMBER($referrer_telegram_id, useGrouping: 0) }
            *[HAS] <a href="tg://user?id={ $referrer_telegram_id }">@{ $referrer_username }</a>
        }
    }
    • <b>Referrals (lvl 1)</b>: { $referrals_level_1 }
    • <b>Referrals (lvl 2)</b>: { $referrals_level_2 }
    • <b>Points received</b>: { $reward_points }
    • <b>Days received</b>: { $reward_days }
    </blockquote>

msg-user-statistics-payment-amount = • <b>Paid ({ $currency })</b>: { $amount }

msg-user-referrals = <b>👪 User Referrals</b>

msg-user-sync = 
    <b>🌀 Sync User</b>

    <b>🛍 Remnashop</b>: { $bot_version }
    <blockquote>
    { $has_bot_subscription -> 
    [0] No data
    *[HAS]{ $bot_subscription }
    }
    </blockquote>

    <b>🌊 Remnawave</b>: { $remna_version }
    <blockquote>
    { $has_remna_subscription -> 
    [0] No data
    *[HAS] { $remna_subscription }
    }
    </blockquote>

    Select a data source for synchronization.

msg-user-sync-version = { $version ->
    [NEWER] (newer)
    [OLDER] (older)
    *[UNKNOWN] { empty }
    }

msg-user-sync-subscription =
    • <b>ID</b>: <code>{ $id }</code>
    • Status: { $status -> 
    [ACTIVE] Active
    [DISABLED] Disabled
    [LIMITED] Traffic used up
    [EXPIRED] Expired
    [DELETED] Deleted
    *[OTHER] { $status }
    }
    • Link: <a href="{ $url }">*********</a>

    • Traffic limit: { $traffic_limit }
    • Device limit: { $device_limit }
    • Remaining: { $expire_time }

    • Internal squads: { $internal_squads ->
    [0] { unknown }
    *[HAS] { $internal_squads }
    }
    • External squad: { $external_squad ->
    [0] { unknown }
    *[HAS] { $external_squad }
    }
    • Traffic reset: { $traffic_limit_strategy -> 
    [NO_RESET] On payment
    [DAY] Every day
    [WEEK] Every week
    [MONTH] Every month
    [MONTH_ROLLING] Every month (by creation date)
    *[OTHER] { $traffic_limit_strategy }
    }
    • Tag: { $tag -> 
    [0] { unknown }
    *[HAS] { $tag }
    }

msg-user-sync-waiting =
    <b>🌀 Syncing User</b>

    Please wait... User data is being synchronized. You will be automatically returned to the user editor when complete.

msg-user-give-subscription =
    <b>🎁 Grant Subscription</b>

    Select the plan you want to grant to the user.

msg-user-give-subscription-duration =
    <b>⏳ Select Duration</b>

    Select the duration of the subscription to grant.

msg-user-discount =
    <b>💸 Change Discount</b>

    Select the discount type to modify.

msg-user-discount-personal =
    <b>👤 Personal Discount</b>

    Select from the buttons or enter a custom value.

msg-user-discount-purchase =
    <b>🎟 Next Purchase Discount</b>

    Select from the buttons or enter a custom value.
    The discount will be applied once and reset after any payment.

msg-user-points =
    <b>💎 Edit Referral Points</b>

    <b>Current points: { $current_points }</b>

    Select from the buttons or enter a custom value to add or subtract.

msg-user-subscription-traffic-limit =
    <b>🌐 Change Traffic Limit</b>

    Select from the buttons or enter a custom value (in GB) to change the traffic limit.

msg-user-subscription-device-limit =
    <b>📱 Change Device Limit</b>

    Select from the buttons or enter a custom value to change the device limit.

msg-user-subscription-expire-time =
    <b>⏳ Change Expiry Date</b>

    <b>Expires in: { $expire_time }</b>

    Select from the buttons or enter a custom value (in days) to add or subtract.

msg-user-subscription-squads =
    <b>🔗 Change Squad List</b>

    { $internal_squads ->
    [0] { empty }
    *[HAS] <b>⏺️ Internal</b>: { $internal_squads }
    }

    { $external_squad ->
    [0] { empty }
    *[HAS] <b>⏹️ External</b>: { $external_squad }
    }

msg-user-subscription-internal-squads =
    <b>⏺️ Change Internal Squads</b>

    Select which internal groups will be assigned to this user.

msg-user-subscription-external-squads =
    <b>⏹️ Change External Squad</b>

    Select which external group will be assigned to this user.

msg-user-subscription-info =
    <b>💳 Current Subscription Info</b>
    
    { hdr-subscription }
    { frg-subscription-details }

    <blockquote>
    • <b>Internal squads</b>: { $internal_squads ->
    [0] { unknown }
    *[HAS] { $internal_squads }
    }
    • <b>External squad</b>: { $external_squad ->
    [0] { unknown }
    *[HAS] { $external_squad }
    }
    • <b>First connection</b>: { $first_connected_at -> 
    [0] { unknown }
    *[HAS] { $first_connected_at }
    }
    • <b>Last connection</b>: { $last_connected_at ->
    [0] { unknown }
    *[HAS] { $last_connected_at } ({ $node_name })
    } 
    </blockquote>

    { hdr-plan }
    { frg-plan-snapshot }

msg-user-transaction-info =
    <b>🧾 Transaction Info</b>

    { hdr-payment }
    <blockquote>
    • <b>ID</b>: <code>{ $payment_id }</code>
    • <b>User</b>: { $user_name } ({ $user_telegram_id ->
        [0] <code>{ $user_email }</code>
        *[HAS] <code>{ NUMBER($user_telegram_id, useGrouping: 0) }</code>
    })
    • <b>Type</b>: { purchase-type }
    • <b>Status</b>: { transaction-status }
    • <b>Payment method</b>: { gateway-type }
    • <b>Amount</b>: { frg-payment-amount }
    • <b>Created</b>: { $created_at }
    </blockquote>

    { $is_test -> 
    [1] ⚠️ Test transaction
    *[0]
    { hdr-plan }
    { frg-plan-snapshot }
    }
    
msg-user-role = 
    <b>👮♂️ Change Role</b>
    
    Select a new role for the user.

msg-users-blacklist =
    <b>🚫 Blacklist</b>

msg-users-blacklist-list =
    <b>📋 Blocked Users</b>

    Blocked: <b>{ $count_blocked }</b> / <b>{ $count_users }</b> ({ $percent }%).

msg-users-blacklist-block =
    <b>⛔ Block by ID</b>

    Supported formats
    <blockquote>
    • <b>Text</b>: enter one or a list of IDs
    • <b>Link</b>: send a URL with a list of IDs
    • <b>File</b>: attach a .txt file with a list of IDs
    </blockquote>

    For lists: each ID must be on a new line.

    Blocking works even if the user has never used the bot.

msg-users-blacklist-sources =
    <b>🔗 Auto-updating Blacklists</b>

    Tap on a list to remove it.
    Synchronization runs automatically every 6 hours.

    To add a new list — send a direct link to a text file with Telegram IDs.

msg-user-message =
    <b>📩 Send Message to User</b>

    Send any message: text, image, or both (HTML supported).
    

# RemnaWave
msg-remnawave-main =
    <b>🌊 RemnaWave v{ $version }</b>
    
    <b>🖥️ System</b>:
    <blockquote>
    • <b>CPU</b>: { $cpu_cores } { $cpu_cores ->
    [one] core
    *[other] cores
    }
    • <b>RAM</b>: { $ram_used } / { $ram_total } ({ $ram_used_percent }%)
    • <b>Uptime</b>: { $uptime }
    </blockquote>

msg-remnawave-users =
    <b>👥 Users</b>

    <b>📊 Statistics</b>:
    <blockquote>
    • <b>Total</b>: { $users_total }
    • <b>Active</b>: { $users_active }
    • <b>Disabled</b>: { $users_disabled }
    • <b>Limited</b>: { $users_limited }
    • <b>Expired</b>: { $users_expired }
    </blockquote>

    <b>🟢 Online</b>:
    <blockquote>
    • <b>Today</b>: { $online_last_day }
    • <b>This week</b>: { $online_last_week }
    • <b>Never connected</b>: { $online_never }
    • <b>Online now</b>: { $online_now }
    </blockquote>

msg-remnawave-host-details =
    <b>{ $remark } ({ $is_disabled ->
    [1] disabled
    *[0] enabled
    })</b>:
    <blockquote>
    • <b>Address</b>: <code>{ $address }:{ $port }</code>
    { $inbound_uuid ->
    [0] { empty }
    *[HAS] • <b>Inbound</b>: <code>{ $inbound_uuid }</code>
    }
    </blockquote>

msg-remnawave-node-details =
    <b>{ $country } { $name } ({ $is_connected ->
    [1] connected
    *[0] disconnected
    })</b>:
    <blockquote>
    • <b>Address</b>: <code>{ $address }{ $port -> 
    [0] { empty }
    *[HAS]:{ $port }
    }</code>
    • <b>Uptime (xray)</b>: { $xray_uptime }
    • <b>Users online</b>: { $users_online }
    • <b>Traffic</b>: { $traffic_used } / { $traffic_limit }
    </blockquote>

msg-remnawave-inbound-details =
    <b>🔗 { $tag }</b>
    <blockquote>
    • <b>ID</b>: <code>{ $inbound_id }</code>
    • <b>Protocol</b>: { $type } { $network -> 
    [0] { space }
    *[HAS] ({ $network })
    }
    { $port ->
    [0] { empty }
    *[HAS] • <b>Port</b>: { $port }
    }
    { $security ->
    [0] { empty }
    *[HAS] • <b>Security</b>: { $security } 
    }
    </blockquote>

msg-remnawave-hosts =
    <b>🌐 Hosts</b>

    { $is_empty ->
    [1] <i>No hosts</i>
    *[0] { $host }
    }

msg-remnawave-nodes =
    <b>🖥️ Nodes</b>

    { $is_empty ->
    [1] <i>No nodes</i>
    *[0] { $node }
    }

msg-remnawave-inbounds =
    <b>🔌 Inbounds</b>

    { $is_empty ->
    [1] <i>No inbounds</i>
    *[0] { $inbound }
    }


# RemnaShop
msg-remnashop-main = <b>🛍 RemnaShop { $version ->
[0] { space }
*[HAS] { $version }
}</b>

msg-remnashop-transactions = <b>🧾 Recent Transactions</b>


# Backup
msg-backup-main =
    <b>💾 Auto Database Backup</b>

    <blockquote>
    • <b>Status</b>: { $enabled ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
    }
    • <b>Send to chat</b>: { $send_to_chat ->
        [1] ✅ Enabled
        *[0] ❌ Disabled
    }
    • <b>Interval</b>:  { $interval_hours ->
    [one] every
    *[other] every
    } { $interval_hours } hour{ $interval_hours ->
    [one] { space }
    *[other] s
    }
    • <b>File count</b>: { $max_files }
    </blockquote>

msg-backup-set-interval =
    <b>🕐 Backup Interval</b>

    Current value: <b>{ $interval_hours } hour{ $interval_hours ->
    [one] { space }
    *[other] s
    }</b>

    Enter the backup interval in hours (from 1 to 720).

msg-backup-set-max-files =
    <b>📁 File Count</b>

    Current value: <b>{ $max_files }</b>

    Enter the number of backup files to keep (from 1 to 30). Old files will be deleted automatically.

msg-extra-main = <b>⚙️ Additional Settings</b>

msg-extra-device-single =
    ⚙️ <b>Single Device Removal</b>

    Allows users to remove a specific device from the list.

    <blockquote>
    <b>Status:</b> { $enabled -> 
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
    }
    <b>Cooldown:</b> { $cooldown -> 
        [0] { unknown }
        *[OTHER] { $cooldown }h
    }
    </blockquote>

    Enter a number to change the cooldown (in hours. 0 — no limit).

msg-extra-device-all =
    ⚙️ <b>Remove All Devices</b>

    Allows users to remove all devices with a single tap.

    <blockquote>
    <b>Status:</b> { $enabled -> 
        [1] ✅ Enabled
        *[0] ❌ Disabled
    }
    <b>Cooldown:</b> { $cooldown -> 
        [0] { unknown }
        *[OTHER] { $cooldown }h
    }
    </blockquote>

    Enter a number to change the cooldown (in hours. 0 — no limit).

msg-extra-link-reset =
    ⚙️ <b>Subscription Reissue</b>

    Allows reissuing the connection link (invalidates the old one).

    <blockquote>
    <b>Status:</b> { $enabled -> 
        [1] ✅ Enabled
        *[0] ❌ Disabled
    }
    <b>Cooldown:</b> { $cooldown -> 
        [0] { unknown }
        *[OTHER] { $cooldown }h
    }
    </blockquote>

    Enter a number to change the cooldown (in hours. 0 — no limit).

msg-extra-referral-reset =
    ⚙️ <b>Referral Link Reset</b>

    Allows users to change their referral link.

    <blockquote>
    <b>Status:</b> { $enabled -> 
        [1] ✅ Enabled
        *[0] ❌ Disabled
    }
    <b>Cooldown:</b> { $cooldown -> 
        [0] { unknown }
        *[OTHER] { $cooldown }h
    }
    </blockquote>

    Enter a number to change the cooldown (in hours. 0 — no limit).

msg-extra-trial-channel-guard =
    ⚙️ <b>Auto-disable trial on channel unsubscribe</b>

    If a user unsubscribes from a required channel/group during the trial period, their subscription is automatically suspended. After resubscribing, access is restored if the trial hasn't expired yet.

    <blockquote>
    <b>Status:</b> { $enabled ->
        [1] ✅ Enabled
        *[0] ❌ Disabled
    }
    </blockquote>

    Only works when mandatory channel/group subscription is enabled.

msg-extra-mini-app-reserve =
    ⚙️ <b>Reserve connect button when Mini App is active</b>

    A reserve button is added below the main "Connect" button (which opens Mini App) that opens the subscription page in a browser. Useful in regions where Telegram Mini App may be unavailable due to restrictions.

    <blockquote>
    <b>Status:</b> { $enabled ->
        [1] ✅ Enabled
        *[0] ❌ Disabled
    }
    </blockquote>

    Only works when Mini App is enabled (BOT_MINI_APP).

msg-admins-main = <b>👮♂️ Administrators</b>


# Menu editor
msg-menu-editor-main =
    <b>🎛 Main Menu Button Editor</b>

    Select a button to edit.

msg-menu-editor-button =
    <b>🎛 Button Configurator</b>

    <blockquote>
    • <b>Status</b>: { $is_active ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
        }
    • <b>Text</b>: { $text }
    • <b>Access</b>: { role }
    • <b>Visibility</b>: { $subscribers_only ->
        [1] 🔒 Subscribers only
        *[0] 👥 All users
        }
    • <b>Type</b>: { button-type }
    • <b>Color</b>: { $color ->
        [primary] Primary
        [success] Green
        [danger] Red
        *[OTHER] No color
        }
    { $type ->
        [TEXT] { empty }
       *[OTHER] • <b>Data</b>: { $payload }
    }
    </blockquote>

    Select an item to change.

msg-menu-editor-button-text =
    <b>🏷️ Change Button Text</b>

    Enter the button text (max 32 characters) or a translation key.

msg-menu-editor-button-availability =
    <b>✴️ Change Button Access</b>

    Select the role for button access.

msg-menu-editor-button-type =
    <b>🔖 Change Button Type</b>

    Select the button type.

msg-menu-editor-button-payload =
    <b>📄 Change Button Data</b>

    { $button_type ->
        [URL] Enter the link. It must start with <code>https://</code>.
        [COPY] Enter the text that will be copied to the clipboard when tapped.
        [WEB_APP] Enter the web app link. It must start with <code>https://</code>; <code>t.me</code> links are not supported.
        *[TEXT] Send a message (HTML supported). You can attach a photo, video, file, or sticker. Limit: up to 4096 characters without media, up to 1024 characters with media.
    }

msg-menu-editor-button-color =
    <b>🎨 Change Button Color</b>

    Select the button color.


# Gateways
msg-gateways-main = <b>🌐 Payment Systems</b>
msg-gateways-settings = <b>🌐 { gateway-type } Configuration</b>
msg-gateways-default-currency = <b>💸 Default Currency</b>
msg-gateways-placement = <b>🔢 Change Placement</b>

msg-gateways-field =
    <b>🌐 { gateway-type } Configuration</b>

    Enter a new value for { $field ->\n        [display_name] the display name
        [card_number] the card number
        [card_holder_name] the card holder name
        [bank_name] the bank name
        [instructions] the payment instructions
       *[other] { $field }
    }.

# Card-to-Card Payment
msg-card-to-card-info =
    <b>💳 Card-to-Card Payment</b>

    <blockquote>
    • <b>Amount</b>: { $amount } { $currency }
    • <b>Card Number</b>: <code>{ $card_number }</code>
    • <b>Card Holder</b>: { $card_holder_name }
    • <b>Bank</b>: { $bank_name }
    </blockquote>

    { $instructions }

    <b>⬆️ Please transfer the exact amount and send a screenshot of the payment receipt.</b>

msg-card-to-card-receipt-received =
    ✅ Receipt received! Your payment is now pending admin approval.

    You will be notified once the payment is verified.

msg-card-to-card-payment-approved =
    ✅ <b>Payment Approved!</b>

    Your payment has been verified and your subscription is now active.

msg-card-to-card-payment-rejected =
    ❌ <b>Payment Rejected</b>

    { $admin_notes ->\n        [NO_NOTES] Your payment receipt was not approved. Please contact support.
       *[HAS_NOTES] Reason: { $admin_notes }
    }

msg-card-to-card-pending-payments =
    <b>💳 Pending Card-to-Card Payments</b>

    { $count ->\n        [0] No pending payments.
        [one] { $count } payment awaiting review.
       *[other] { $count } payments awaiting review.
    }

msg-card-to-card-payment-details =
    <b>💳 Payment Review</b>

    <blockquote>
    • <b>User</b>: { $user_name } (ID: { $user_id })
    • <b>Amount</b>: { $amount } { $currency }
    • <b>Plan</b>: { $plan_name }
    • <b>Duration</b>: { $duration } days
    • <b>Status</b>: ⏳ Pending
    • <b>Date</b>: { $created_at }
    </blockquote>


# Referral
msg-referral-main =
    <b>👥 Referral System</b>

    <blockquote>
    • <b>Status</b>: { $is_enable -> 
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
        }
    • <b>Reward type</b>: { reward-type }
    • <b>Number of levels</b>: { $referral_level }
    • <b>Accrual condition</b>: { accrual-strategy }
    • <b>Accrual form</b>: { reward-strategy }
    </blockquote>

    Select an item to change.

msg-referral-level =
    <b>🔢 Change Level</b>

    Select the maximum referral level.

msg-referral-reward-type =
    <b>🎀 Change Reward Type</b>

    Select the new reward type.
    
msg-referral-accrual-strategy =
    <b>📍 Change Accrual Condition</b>

    Select when the reward should be credited.


msg-referral-reward-strategy =
    <b>⚖️ Change Accrual Form</b>

    Select the reward calculation method.


msg-referral-reward-level = Level { $level }: { $value }{ $reward_strategy_type ->
    [AMOUNT] { $reward_type ->
        [POINTS] { space }{ $value -> 
            [one] point
            *[other] points
            }
        [EXTRA_DAYS] { space }extra { $value -> 
            [one] day
            *[other] days
            }
        *[OTHER] { $reward_type }
    }
    [PERCENT] % { $reward_type ->
        [POINTS] points
        [EXTRA_DAYS] extra days
        *[OTHER] { $reward_type }
    }
    *[OTHER] { $reward_strategy_type }
    }
    
msg-referral-reward =
    <b>🎁 Change Reward</b>

    <blockquote>
    { $reward }
    </blockquote>

    { $reward_strategy_type ->
        [AMOUNT] Enter the number of { $reward_type ->
            [POINTS] points
            [EXTRA_DAYS] days
            *[OTHER] { $reward_type }
        }
        [PERCENT] Enter the percentage of { $reward_type ->
            [POINTS] <u>subscription cost</u>
            [EXTRA_DAYS] <u>subscription duration</u>
            *[OTHER] { $reward_type }
        }
        *[OTHER] { $reward_strategy_type }
    } (in the format: level=value)


# Plans
msg-plans-main = <b>📦 Plans</b>

msg-plans-import = 
    <b>📦 Import Plans</b>

    Send a JSON file to import.

msg-plans-export = 
    <b>📦 Export Plans</b>

    Select plans to export.

msg-plan-configurator =
    <b>📦 Plan Configurator</b>

    <blockquote>
    • <b>Name</b>: { $name }
    • <b>Type</b>: { plan-type } { $is_trial ->
    [1] (Trial)
    *[0] { space }
    }
    • <b>Availability</b>: { availability-type }
    • <b>Status</b>: { $is_active -> 
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
        }
    </blockquote>
    
    <blockquote>
    • <b>Traffic limit</b>: { $is_unlimited_traffic -> 
        [1] { unlimited }
        *[0] { $traffic_limit }
        }
    • <b>Device limit</b>: { $is_unlimited_devices -> 
        [1] { unlimited }
        *[0] { $device_limit }
        }
    </blockquote>

    Select an item to change.

msg-plan-name =
    <b>🏷️ Change Name</b>

    { $name ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $name }
    </blockquote>
    }

    Enter a unique plan name or translation key (max 32 characters).

msg-plan-description =
    <b>💬 Change Description</b>

    { $description ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $description }
    </blockquote>
    }

    Enter a new plan description or translation key.

msg-plan-tag =
    <b>📌 Change Tag</b>

    { $tag ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $tag }
    </blockquote>
    }

    Enter a new plan tag (uppercase Latin letters, digits, and underscores only).

msg-plan-type =
    <b>🔖 Change Type</b>

    Select a new plan type. Tap the "Trial" button to offer this plan as a trial.

msg-plan-availability =
    <b>✴️ Change Availability</b>

    Select plan availability.

msg-plan-traffic =
    <b>🌐 Change Traffic Limit and Reset Strategy</b>

    Enter a new traffic limit (in GB) and select its reset strategy.

msg-plan-devices =
    <b>📱 Change Device Limit</b>

    Enter a new device limit for the plan.

msg-plan-durations =
    <b>⏳ Plan Durations</b>

    Select a duration to change its price.

msg-plan-duration =
    <b>⏳ Add Plan Duration</b>

    Enter a new duration (in days).

msg-plan-prices =
    <b>💰 Change Prices for Duration ({ $value ->
            [0] { unlimited }
            *[OTHER] { unit-day }
        })</b>

    Select a currency and price to change.

msg-plan-price =
    <b>💰 Change Price for Duration ({ $value ->
            [0] { unlimited }
            *[OTHER] { unit-day }
        })</b>

    Enter a new price for currency { $currency }.

msg-plan-allowed-users = 
    <b>👥 Change Allowed Users List</b>

    Enter a user ID or Email to add to the list.

msg-plan-squads =
    <b>🔗 Squads</b>

    { $internal_squads ->
    [0] { space }
    *[HAS] <b>⏺️ Internal</b>: { $internal_squads }
    }

    { $external_squad ->
    [0] { space }
    *[HAS] <b>⏹️ External</b>: { $external_squad }
    }

msg-plan-internal-squads =
    <b>⏺️ Change Internal Squads</b>

    Select which internal groups will be assigned to this plan.

msg-plan-external-squads =
    <b>⏹️ Change External Squad</b>

    Select which external group will be assigned to this plan.


# Notifications
msg-notifications-main = <b>🔔 Notification Settings</b>
msg-notifications-user = <b>👥 User Notifications</b>
msg-notifications-system = <b>⚙️ System Notifications</b>

msg-notifications-system-type = 
    <b>🔔 { notification-type }</b>

    <blockquote>
    • <b>Status</b>: { $is_active -> 
    [1] 🟢 Enabled
    *[0] 🔴 Disabled
    }
    • <b>Route</b>: { $has_route -> 
    [0] { unknown }
    *[HAS] { NUMBER($chat_id, useGrouping: 0) }{ $thread_id ->
        [0] { space }
        *[HAS] :{ NUMBER($thread_id, useGrouping: 0) }
        }
    }
    </blockquote>

msg-notifications-system-route = 
    <b>📡 Route: { notification-type }</b>

    <blockquote>
    • <b>Chat ID</b>: { $chat_id ->
        [0] { unknown }
        *[HAS] <code>{ NUMBER($chat_id, useGrouping: 0) }</code>
        }
    • <b>Thread ID</b>: { $thread_id ->
        [0] { unknown }
        *[HAS] <code>{ NUMBER($thread_id, useGrouping: 0) }</code>
        }
    </blockquote>

    If the Chat ID is not set, the notification will be sent to Direct Messages.
    
    If the Thread ID is not set, the notification will be sent to the chat.


msg-notifications-system-default-route =
    <b>📡 Default Route</b>

    <blockquote>
    • <b>Chat ID</b>: { $chat_id ->
        [0] { unknown }
        *[HAS] <code>{ NUMBER($chat_id, useGrouping: 0) }</code>
        }
    • <b>Thread ID</b>: { $thread_id ->
        [0] { unknown }
        *[HAS] <code>{ NUMBER($thread_id, useGrouping: 0) }</code>
        }
    </blockquote>

    This route applies to all system notifications that don't have their own route configured.

    If the Chat ID is not set, the notification will be sent to Direct Messages.

    If the Thread ID is not set, the notification will be sent to the chat.


msg-notifications-system-route-chat-id =
    <b>💬 Change Chat ID</b>

    Enter the group ID (e.g.: <code>-1001234567891</code>).

msg-notifications-system-route-thread-id =
    <b>📁 Change Thread ID</b>

    Enter the thread ID (enter <code>0</code> to reset).


# Subscription
msg-subscription-main = <b>💳 Subscription</b>
msg-subscription-plans = <b>📦 Select a Plan</b>
msg-subscription-new-success = To start using our service, tap the <code>`{ btn-subscription.connect }`</code> button and follow the instructions!
msg-subscription-renew-success = Your subscription has been extended by { $added_duration }.

msg-subscription-plan = 
    <b>📦 Plan Available via Link</b>
    
    You have access to the <b>{ $name }</b> plan via a link. Tap the button below to choose a duration and payment method.

    { $description ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $description }
    </blockquote>
    }

    { $purchase_type ->
    [RENEW] <i>⚠️ Your current subscription will be <u>extended</u> for the selected period.</i>
    [CHANGE] <i>⚠️ Your current subscription will be <u>replaced</u> with this plan without recalculating the remaining time.</i>
    *[OTHER] { empty }
    }
    
msg-subscription-details =
    <b>{ $plan }</b>:
    <blockquote>
    { $description ->
    [0] { empty }
    *[HAS]
    { $description }
    }

    • <b>Traffic limit</b>: { $traffic }
    • <b>Device limit</b>: { $devices }
    { $period ->
    [0] { empty }
    *[HAS] • <b>Duration</b>: { $period }
    }
    { $final_amount ->
    [0] { empty }
    *[HAS] • <b>Cost</b>: { frg-payment-amount }
    }
    </blockquote>
    
    { $discount_percent ->
    [0] { empty }
    *[HAS]
    <blockquote>
    <i>Prices shown with { $is_personal_discount ->
        [1] your personal discount of { $discount_percent }%
        *[0] a one-time discount of { $discount_percent }%
        }</i>
    </blockquote>
    }

msg-subscription-duration =
    <b>⏳ Select Duration</b>

    { msg-subscription-details }

    { $plan_is_modified ->
    [1] <i>i️ Plan terms have changed since your last purchase — current details are shown above.</i>
    *[0] { "" }
    }

msg-subscription-payment-method =
    <b>💳 Select Payment Method</b>

    { msg-subscription-details }

    { $plan_is_modified ->
    [0] { empty }
    *[MODIFIED] <i>i️ Plan terms have changed since your last purchase — current details are shown above.</i>
    }

msg-subscription-confirm =
    <b>🛒 Confirm { $purchase_type ->
    [RENEW] renewal
    [CHANGE] change
    *[OTHER] purchase
    } of subscription</b>

    { msg-subscription-details }

    { $purchase_type ->
    [RENEW] <i>⚠️ Your current subscription will be <u>extended</u> for the selected period.</i>
    [CHANGE] <i>⚠️ Your current subscription will be <u>replaced</u> with the selected one without recalculating the remaining time.</i>
    *[OTHER] { empty }
    }

    { $plan_is_modified ->
    [0] { empty }
    *[MODIFIED] <i>i️ Plan terms have changed since your last purchase — current details are shown above.</i>
    }

msg-subscription-trial =
    <b>✅ Trial subscription successfully activated!</b>

    { msg-subscription-new-success }

msg-subscription-success =
    <b>✅ Payment successful!</b>

    { $purchase_type ->
    [NEW] { msg-subscription-new-success }
    [RENEW] { msg-subscription-renew-success }
    [CHANGE] { msg-subscription-change-success }
    *[OTHER] { $purchase_type }
    }

msg-subscription-change-success = 
    Your subscription has been changed.

    <b>{ $plan_name }</b>
    { frg-subscription }

msg-subscription-failed = 
    <b>❌ An error occurred!</b>

    Don't worry, support has been notified and will contact you shortly. We apologize for the inconvenience.


# Importer
msg-importer-main = <b>📥 Import Users</b>

msg-importer-from-xui =
    <b>📥 Import Users (3X-UI)</b>
    
    { $has_exported -> 
    [1]
    <b>🔍 Found</b>:
    <blockquote>
    Total users: { $total }
    With active subscription: { $active }
    With expired subscription: { $expired }
    </blockquote>
    *[0]
    All <b>active</b> users with <b>numeric</b> emails will be imported.

    It is recommended to disable users in advance whose email field doesn't contain a Telegram ID. The operation may take a significant amount of time depending on the number of users.

    Send the database file (in .db format).
    }

msg-importer-squads =
    <b>🔗 Internal Squad List</b>

    Select which internal groups will be available to imported users.

msg-importer-import-completed =
    <b>📥 User Import Complete</b>
    
    <b>📃 Info</b>:
    <blockquote>
    • <b>Total users</b>: { $total_count }
    • <b>Successfully imported</b>: { $success_count }
    • <b>Failed to import</b>: { $failed_count }
    </blockquote>

msg-importer-sync-panel =
    <b>🌀 Sync: Panel → Bot</b>

    Goes through all users in RemnaWave. If a user doesn't exist in the bot — creates them and imports their subscription. If a user exists in the bot without a subscription — imports the subscription from the panel. If a user exists in the bot with a subscription — updates the data.

msg-importer-sync-bot =
    <b>🤖 Sync: Bot → Panel</b>

    Goes through all bot users. If a user has no subscription in the bot — skips them, the panel is not affected. If a subscription exists but the user is missing from the panel — creates them. If the user exists in the panel — updates the data.

msg-importer-sync-panel-completed =
    <b>📥 Sync Panel → Bot Complete</b>

    <b>📃 Info</b>:
    <blockquote>
    Total users in panel: { $total_panel_users }
    Total users in bot: { $total_bot_users }

    New users: { $added_users }
    Subscriptions added: { $added_subscription }
    Subscriptions updated: { $updated }

    Sync errors: { $errors }
    </blockquote>

msg-importer-sync-bot-completed =
    <b>🔄 Sync Bot → Panel Complete</b>

    <b>📃 Info</b>:
    <blockquote>
    Total users in bot: { $total_bot_users }

    Updated in panel: { $updated }
    Recreated in panel: { $recreated }
    
    No subscription (skipped): { $skipped_no_subscription }
    Sync errors: { $errors }
    </blockquote>


# Promocodes
msg-promocodes-main = <b>🎟 Promocodes</b>

msg-promocode-configurator =
    <b>🎟 Promocode Configurator</b>

    <blockquote>
    • <b>Code</b>: <code>{ $code }</code>
    • <b>Type</b>: { promocode-type }
    • <b>Availability</b>: { availability-type }
    • <b>Status</b>: { $is_active ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
        }
    • <b>Repeat activation</b>: { $is_reusable ->
        [1] Allowed
        *[0] Not allowed
        }
    </blockquote>

    <blockquote>
    • <b>Reward</b>: { $reward }
    • <b>Expires</b>: { $expires }
    • <b>Activation limit</b>: { $max_activations }
    </blockquote>

    Select an item to change.

msg-promocode-input-code =
    <b>🏷️ Change Code</b>

    { $code ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $code }
    </blockquote>
    }

    Send your unique code (3 to 16 characters).

msg-promocode-select-type =
    <b>🔖 Change Reward Type</b>

    Select the reward type.

msg-promocode-input-reward =
    <b>🎁 Change Reward</b>

    { $reward ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $reward }
    </blockquote>
    }

    { $promocode_type ->
    [DURATION] Enter the number of <b>days</b> to add to the user's subscription upon activation (a value of <code>0</code> will make the subscription unlimited).
    [TRAFFIC] Enter the number of <b>gigabytes (GB)</b> to add to the subscription's traffic limit (a value of <code>0</code> will make traffic unlimited).
    [DEVICES] Enter the number of <b>devices</b> to add to the subscription limit (a value of <code>0</code> will remove the device limit).
    [PERSONAL_DISCOUNT] Enter the <b>personal discount</b> amount as a percentage — from 1 to 100.
    [PURCHASE_DISCOUNT] Enter the <b>purchase discount</b> amount as a percentage — from 1 to 100.
    *[OTHER] Enter the reward value (integer).
    }

msg-promocode-select-plan =
    <b>📦 Change Plan</b>

    Select a subscription plan.

msg-promocode-select-plan-duration =
    <b>⏳ Change Duration</b>

    Select the plan duration.

msg-promocode-select-availability =
    <b>✴️ Change Availability</b>

    Select the promocode availability.

msg-promocode-input-expires =
    <b>⌛ Expires</b>

    { $expires ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $expires }
    </blockquote>
    }

    Enter the date as "DD.MM.YYYY" (or with time "DD.MM.YYYY HH:MM"), or a number — days from creation.

    Time is in UTC.

msg-promocode-input-max-activations =
    <b>🔢 Change Activation Limit</b>

    { $max_activations ->
    [0] { space }
    *[HAS]
    <blockquote>
    { $max_activations }
    </blockquote>
    }

    Enter the maximum number of activations.

msg-promocode-input =
    <b>🎟 Promocode</b>

    Enter the promocode.

msg-promocode-confirm =
    <b>🎟 Promocode <code>{ $promo_code }</code></b>

    🎁 You will receive: { $reward_type ->
        [DURATION] { $reward ->
            [0] your current subscription will become <b>unlimited</b>.
            *[OTHER] <b>{ $reward } { $reward ->
                [one] day
                *[other] days
            }</b> added to your current subscription.
        }
        [TRAFFIC] { $reward ->
            [0] <b>unlimited traffic</b> on your current subscription.
            *[OTHER] <b>{ $reward } GB</b> added to your traffic limit.
        }
        [DEVICES] { $reward ->
            [0] <b>unlimited devices</b> on your current subscription.
            *[OTHER] <b>{ $reward } { $reward ->
                [one] device
                *[other] devices
            }</b> added to your device limit.
        }
        [SUBSCRIPTION] a <b>new subscription plan</b>.
        [PERSONAL_DISCOUNT] a permanent <b>{ $reward }% discount</b> on all purchases.
        [PURCHASE_DISCOUNT] a <b>{ $reward }% discount</b> on your next purchase.
        *[OTHER] a reward for your account.
    }
    
    { $show_reset_warning ->
        [1] ⚠️ <i>The bonus is valid until your next subscription renewal — upon renewal, the limit will return to the plan's default value.</i>
       *[0] { space }
    }
    { $will_replace_subscription ->
        [1] ⚠️ <i>You already have an active subscription. It will be replaced with the new plan, and the remaining days and traffic will be reset.</i>
       *[0] { space }
    }

    Tap <b>Confirm</b> to activate.


# Ad Links
msg-ad-links-main = <b>🎯 Ad Links</b>

msg-ad-link-configurator =
    <b>🎯 Ad Link Configurator</b>

    <blockquote>
    • <b>Name</b>: { $name ->
        [0] not set
        *[HAS] { $name }
    }
    • <b>Code</b>: { $code ->
        [0] not set
        *[HAS] <code>{ $code }</code>
    }
    • <b>Status</b>: { $is_active ->
        [1] 🟢 Enabled
        *[0] 🔴 Disabled
    }
    </blockquote>

    Select an item to change.

msg-ad-link-name =
    <b>🏷️ Link Name</b>

    { $name ->
    [0] { space }
    *[HAS]
    <blockquote>{ $name }</blockquote>
    }

    Enter the campaign name.

msg-ad-link-code =
    <b>🔗 Link Code</b>

    Current: <code>{ $code }</code>

    Send your unique code or tap below.

msg-ad-link-stats =
    <b>📊 Stats: { $name }</b>

    <blockquote>
    • <b>Registrations</b>: { $registrations }
    • <b>Trials</b>: { $trials }
    • <b>Purchases</b>: { $buyers }

    • <b>Registration → purchase conversion</b>: { $reg_to_buy_rate }%
    • <b>Trial → purchase conversion</b>: { $trial_to_buy_rate }%
    </blockquote>

    <blockquote>
    { $revenue_lines }
    </blockquote>
