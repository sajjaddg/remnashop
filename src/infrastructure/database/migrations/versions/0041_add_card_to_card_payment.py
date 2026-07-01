from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op

revision: str = "0041"
down_revision: Union[str, None] = "0040"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # Add receipt image and approval fields for card-to-card payments
    op.add_column(
        "transactions",
        sa.Column("receipt_image", sa.String(), nullable=True),
    )
    op.add_column(
        "transactions",
        sa.Column("admin_approval_status", sa.String(), nullable=True),
    )
    op.add_column(
        "transactions",
        sa.Column("admin_notes", sa.Text(), nullable=True),
    )


def downgrade() -> None:
    op.drop_column("transactions", "admin_notes")
    op.drop_column("transactions", "admin_approval_status")
    op.drop_column("transactions", "receipt_image")
