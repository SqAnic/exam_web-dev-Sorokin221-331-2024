"""Создание таблиц book_genre_table  и Book

Revision ID: 7d1b52a7dcef
Revises: 3f310eceb714
Create Date: 2024-06-10 18:41:26.070596

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7d1b52a7dcef'
down_revision = '3f310eceb714'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('books',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('title', sa.String(length=100), nullable=False),
    sa.Column('description', sa.Text(), nullable=False),
    sa.Column('year', sa.Integer(), nullable=False),
    sa.Column('publisher', sa.String(length=100), nullable=False),
    sa.Column('author', sa.String(length=100), nullable=False),
    sa.Column('pages', sa.Integer(), nullable=False),
    sa.Column('cover_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['cover_id'], ['covers.id'], name=op.f('fk_books_cover_id_covers')),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_books'))
    )
    op.create_table('book_genre',
    sa.Column('book_id', sa.Integer(), nullable=False),
    sa.Column('genre_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['book_id'], ['books.id'], name=op.f('fk_book_genre_book_id_books')),
    sa.ForeignKeyConstraint(['genre_id'], ['genres.id'], name=op.f('fk_book_genre_genre_id_genres')),
    sa.PrimaryKeyConstraint('book_id', 'genre_id', name=op.f('pk_book_genre'))
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('book_genre')
    op.drop_table('books')
    # ### end Alembic commands ###
