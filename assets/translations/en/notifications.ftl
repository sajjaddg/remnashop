ntf-error =
    .unknown = ⚠️ <i>An error occurred.</i>
    .permission-denied = ⚠️ <i>You don't have sufficient permissions.</i>
    .log-not-found = ⚠️ <i>Log file not found.</i>
    .logs-disabled = ⚠️ <i>File logging is disabled.</i>
    
    .lost-context = ⚠️ <i>An error occurred. Restart the dialog with the /start command.</i>
    .lost-context-restart = ⚠️ <i>An error occurred. The dialog has been restarted.</i>

ntf-common =
    .trial-unavailable = ⚠️ <i>Trial subscription is temporarily unavailable.</i>
    .throttling = ⚠️ <i>You are sending too many requests. Please wait.</i>
    .double-click-confirm = ⚠️ <i>Click again to confirm the action.</i>
    .squads-empty = ⚠️ <i>Squads not found. Check their availability in the panel.</i>

    .withdraw-points = ❌ <i>You don't have enough points to complete the exchange.</i>
    .internal-squads-empty = ❌ <i>Select at least one internal squad.</i>

    .invalid-value = ❌ <i>Invalid value.</i>
    .value-updated = ✅ <i>Parameter updated successfully.</i>
    .cooldown-active = ⏳ <i>Temporarily unavailable. Try again in { $available_at }.</i>

    .plan-not-found = ❌ <i>Plan not found or unavailable.</i>
    .connect-not-available =
    ⚠️ { $status ->
    [LIMITED]
    You have used up all available traffic. { $is_trial ->
    [0] { $traffic_strategy ->
        [NO_RESET] Renew your subscription to reset traffic and continue using the service!
        *[RESET] Traffic will be restored in { $reset_time }. You can also renew your subscription to reset traffic.
        }
    *[1] { $traffic_strategy ->
        [NO_RESET] Subscribe to continue using the service!
        *[RESET] Traffic will be restored in { $reset_time }. You can also subscribe to use the service without limits.
        }
    }
    [EXPIRED]  
    { $is_trial ->
    [0] Your subscription has expired. Renew it or purchase a new one.
    *[1] Your free trial has ended. Subscribe to continue using the service.
    }
    *[OTHER] An error occurred while checking the status or the subscription has been disabled. Contact support.
    }
    
ntf-command =
    .paysupport = 💸 <b>To request a refund, contact support.</b>
    .rules = ⚠️ <b>Please read the <a href="{ $url }">Terms of Use</a> before using the service.</b>
    .help = 🆘 <b>Click the button below to contact support.</b>

ntf-requirement =
    .channel-join-required = ❇️ Subscribe to our channel and get <b>free days, promotions, and news</b>. After subscribing, press "Confirm".
    .channel-join-required-left = ⚠️ You have unsubscribed from the channel. Subscribe to continue using the bot.
    .rules-accept-required = ⚠️ <b>Before using the service, please read and accept the <a href="{ $url }">Terms of Use</a>.</b>
    .channel-join-error = ⚠️ We don't see your channel subscription. Check your subscription and try again.
    .trial-paused = ⚠️ Trial paused — you unsubscribed from the channel. Subscribe again to restore access.
    .trial-restored = ✅ Trial resumed.
    
ntf-user =
    .not-found = <i>❌ User not found.</i>
    .transaction-not-found = ❌ <i>Transaction not found.</i>
    .transactions-empty = ❌ <i>Transaction list is empty.</i>
    .subscription-empty = ❌ <i>No active subscription found.</i>
    .subscription-deleted = ✅ <i>Subscription deleted successfully.</i>
    .plans-empty = ❌ <i>No available plans.</i>
    .devices-empty = ❌ <i>Device list is empty.</i>
    .allowed-plans-empty = ❌ <i>No available plans for granting access.</i>
    .referral-reset = ✅ <i>Referral link reset successfully.</i>
    .message-success = ✅ <i>Message sent successfully.</i>
    .message-failed = ❌ <i>Failed to send message.</i>

    .sync-already = ✅ <i>Subscription data is identical.</i>
    .sync-missing-data = ⚠️ <i>Synchronization impossible. Subscription data is missing in both the panel and the bot.</i>
    .sync-success = ✅ <i>Subscription synchronization completed.</i>

    .invalid-expire-time = ❌ <i>Unable to { $operation ->
    [ADD] extend
    *[SUB] reduce
    } the subscription by the specified number of days.</i>

    .invalid-points = ❌ <i>Unable to { $operation ->
    [ADD] add
    *[SUB] deduct
    } the specified number of points.</i>

ntf-access =
    .maintenance = 🚧 <i>The bot is under maintenance. Please try again later.</i>
    .registration-disabled = ❌ <i>New user registration is disabled.</i>
    .registration-invite-only = ❌ <i>Registration is available by invitation only.</i>
    .payments-disabled = 🚧 <i>Payments are temporarily unavailable! You will be notified once they are restored.</i>
    .payments-restored = ❇️ <i>Payments restored! You can now purchase or renew your subscription. Thank you for your patience.</i>

ntf-plan =
    .not-file = ⚠️ <i>Please send plans as a JSON file.</i>
    .import-failed = ❌ <i>Import failed.</i>
    .import-success = ✅ <i>Imported successfully.</i>
    .export-plans-not-selected = ❌ <i>Select at least one plan to export.</i>
    .export-failed = ❌ <i>Export failed.</i>
    .export-success = ✅ <i>Selected plans exported.</i>
    .trial-single-duration = ❌ <i>Trial plan can have only one duration.</i>
    .duration-already-exists = ❌ <i>This duration already exists.</i>
    .name-already-exists = ❌ <i>A plan with this name already exists.</i>
    .user-already-allowed = ❌ <i>User ID already added.</i>

    .updated = ✅ <i>Plan updated successfully.</i>
    .created = ✅ <i>Plan created successfully.</i>
    .deleted = ✅ <i>Plan deleted successfully.</i>

ntf-gateway =
    .not-configured = ❌ <i>Payment gateway is not configured.</i>
    .not-configurable = ❌ <i>Payment gateway has no configurable settings.</i>
    .test-payment-created = ✅ <i><a href="{ $url }">Test payment</a> created successfully.</i>
    .test-payment-error = ❌ <i>Error creating test payment.</i>
    .test-payment-confirmed = ✅ <i>Test payment processed successfully.</i>
    .field-reset = ✅ <i>Field value cleared.</i>
    .field-reset-deactivated = ✅ <i>Field value cleared. Gateway deactivated: required settings are missing.</i>

ntf-subscription =
    .plans-unavailable = ❌ <i>There are no available plans at the moment.</i>
    .gateways-unavailable = ❌ <i>There are no available payment systems at the moment.</i>
    .renew-plan-unavailable = ❌ <i>Your current plan is outdated and unavailable for renewal.</i>
    .payment-creation-failed = ❌ <i>Error creating payment. Please try again later.</i>

ntf-broadcast =
    .text-too-long = ❌ Maximum character limit exceeded ({ $max_limit }).
    .list-empty = ❌ <i>Broadcast list is empty.</i>
    .plans-unavailable = ❌ <i>No available plans.</i>
    .audience-unavailable = ❌ <i>No users for the selected audience.</i>
    .content-empty = ❌ <i>Content is empty.</i>
    .content-saved = ✅ <i>Content saved successfully.</i>

    .not-cancelable = ❌ <i>Broadcast cannot be canceled.</i>
    .canceled = ✅ <i>Broadcast canceled successfully.</i>
    .deleting = ⚠️ <i>Deleting sent messages.</i>
    .already-deleted = ❌ <i>Broadcast already deleted or is being deleted.</i>

    .deleted-success =
        i️ Broadcast deletion result <code>{ $task_id }</code>.

        <blockquote>
        • <b>Total messages</b>: { $total_count }
        • <b>Deleted</b>: { $deleted_count }
        • <b>Failed to delete</b>: { $failed_count }
        </blockquote>

ntf-importer =
    .not-file = ⚠️ <i>Please send the database as a file.</i>
    .db-failed = ❌ <i>Error exporting users from database.</i>
    .users-empty = ❌ <i>User list in the database is empty.</i>

    .started = ✅ <i>Import started. Please wait for completion...</i>
    .already-running = ⚠️ <i>Import is already in progress. Please wait.</i>

ntf-sync =
    .from-panel-started = ✅ <i>Panel → bot synchronization started. Please wait for completion...</i>
    .from-bot-started = ✅ <i>Bot → panel synchronization started. Please wait for completion...</i>
    .users-not-found = ❌ <i>No users found for synchronization.</i>
    .already-running = ⚠️ <i>Synchronization is already in progress. Please wait.</i>

ntf-menu-editor =
    .button-saved = ✅ <i>Button saved successfully.</i>
    .invalid-payload = ❌ <i>Invalid URL format.</i>

ntf-devices =
    .deleted = ✅ <i>Device deleted.</i>
    .all-deleted = ✅ <i>All devices deleted.</i>
    .reissued = ✅ <i>Subscription reissued successfully.</i>

ntf-backup =
    .assets-started = ⏳ <i>Creating assets backup...</i>
    .db-started = ⏳ <i>Creating database backup...</i>
    .error = ❌ <i>Error creating backup</i>

ntf-blacklist =
    .list-empty = ❌ <i>Block list is empty.</i>
    .no-ids-found = ❌ <i>No IDs found via the link.</i>
    .source-removed = ✅ <i>List deleted.</i>
    .blocked-ids-empty = ❌ <i>Blocked ID list is empty.</i>
    .blocked-ids-cleared = ✅ <i>Cleared { $count } IDs.</i>
    
    .block-result =
    i️ Blocking result.

    <blockquote>
    • <b>Total IDs</b>: { $total }
    • <b>Blocked users</b>: { $blocked_users }
    • <b>Blocked IDs</b>: { $blocked_ids }
    • <b>Already blocked</b>: { $already_blocked }
    </blockquote>

ntf-invite =
    .referral-reset = ✅ <i>Referral link updated.</i>

ntf-promocode =
    .not-found = ❌ <i>Promo code not found or invalid.</i>
    .not-available = ❌ <i>Promo code is unavailable.</i>
    .expired = ❌ <i>Promo code has expired.</i>
    .already-activated = ❌ <i>You have already activated this promo code.</i>
    .activated = ✅ <i>Promo code activated successfully!</i>
    .activation-failed = ❌ <i>Failed to activate promo code. Please try again later.</i>
    .code-exists = ❌ <i>A promo code with this code already exists.</i>
    .created = ✅ <i>Promo code created.</i>
    .deleted = ✅ <i>Promo code deleted.</i>
    .fields-required = ❌ <i>Please fill in the reward value.</i>
    .invalid-code = ❌ <i>Code can only contain Latin letters, numbers, hyphens, and underscores.</i>
    .plans-empty = ❌ <i>No available plans.</i>
    .updated = ✅ <i>Promo code updated.</i>

ntf-ad-link =
    .created = ✅ <i>Ad link created.</i>
    .updated = ✅ <i>Ad link updated.</i>
    .deleted = ✅ <i>Ad link deleted.</i>
