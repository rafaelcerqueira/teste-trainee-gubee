CREATE OR REPLACE FUNCTION uuid_generate_v4()
RETURNS UUID AS $$
BEGIN
    RETURN md5(random()::text || clock_timestamp()::text)::uuid;
END;
$$ LANGUAGE PLPGSQL;

CREATE TABLE power_stats
(
    id           UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    strength     SMALLINT         NOT NULL,
    agility      SMALLINT         NOT NULL,
    dexterity    SMALLINT         NOT NULL,
    intelligence SMALLINT         NOT NULL,
    created_at   TIMESTAMPTZ      NOT NULL DEFAULT now(),
    updated_at   TIMESTAMPTZ      NOT NULL DEFAULT now()
);
