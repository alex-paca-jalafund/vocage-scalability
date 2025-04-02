CREATE TABLE voca_sessions (
    id SERIAL PRIMARY KEY,
    columns TEXT[],
    decks TEXT[],
    intervals INTEGER[],
    return_to_first BOOLEAN NOT NULL DEFAULT false,
    filename TEXT,
    show_columns INTEGER[][],
    list_delimiter TEXT,
    header BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE voca_data (
    id SERIAL PRIMARY KEY,
    session_id INTEGER NOT NULL REFERENCES voca_sessions(id) ON DELETE CASCADE,
    comments JSONB DEFAULT '[]' -- Array of objects JSON { "line": number, "text": "comment" }
);

CREATE TABLE voca_cards (
    id SERIAL PRIMARY KEY,
    data_id INTEGER NOT NULL REFERENCES voca_data(id) ON DELETE CASCADE,
    fields TEXT[],
    due TIMESTAMP,
    deck SMALLINT NOT NULL
);
