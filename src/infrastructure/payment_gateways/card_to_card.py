from decimal import Decimal
from typing import Optional, Union
from uuid import UUID

from fastapi import Request, Response
from loguru import logger

from src.application.dto import PaymentResultDto
from src.core.enums import TransactionStatus

from .base import BasePaymentGateway


class CardToCardGateway(BasePaymentGateway):
    """
    Card-to-card manual payment gateway.

    Flow:
    1. User sees card details and payment instructions
    2. User transfers money manually and uploads receipt screenshot
    3. Admin reviews receipt and approves/rejects payment
    4. System activates subscription on approval
    """

    async def handle_create_payment(self, amount: Decimal, details: str) -> PaymentResultDto:
        """
        Create a pending payment that requires manual approval.
        Returns payment info without a URL since user must upload receipt.
        """
        # Generate a unique payment ID
        payment_id = UUID(int=0)  # This will be replaced by actual transaction UUID

        logger.info(
            f"Card-to-card payment initiated: amount={amount}, details={details}"
        )

        # Return payment result with no URL (handled in bot flow)
        return PaymentResultDto(
            id=payment_id,
            url=None,  # No external redirect needed
        )

    async def handle_webhook(
        self,
        request: Request,
    ) -> Union[tuple[UUID, TransactionStatus], None]:
        """
        Card-to-card payments don't use webhooks.
        Payment status is updated manually by admin approval.
        """
        logger.warning("Card-to-card gateway received unexpected webhook call")
        return None

    async def build_webhook_response(self, request: Request) -> Response:
        """Not applicable for card-to-card payments."""
        return Response(status_code=404, content="Card-to-card payments do not use webhooks")

    def get_payment_instructions(self) -> dict[str, Optional[str]]:
        """
        Get card details and instructions to display to user.
        """
        settings = self.data.settings
        if settings is None:
            return {}

        return {
            "card_number": getattr(settings, "card_number", None),
            "card_holder_name": getattr(settings, "card_holder_name", None),
            "bank_name": getattr(settings, "bank_name", None),
            "instructions": getattr(settings, "instructions", None),
        }
