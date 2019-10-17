SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bets (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    winner_id bigint NOT NULL,
    match_id bigint NOT NULL,
    placed_at timestamp without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bets_id_seq OWNED BY public.bets.id;


--
-- Name: friendships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.friendships (
    id bigint NOT NULL,
    state character varying NOT NULL,
    requester_id bigint NOT NULL,
    receiver_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendships_id_seq OWNED BY public.friendships.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    likeable_type character varying NOT NULL,
    likeable_id bigint NOT NULL,
    type character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: matches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.matches (
    id bigint NOT NULL,
    upper_roster_id bigint,
    lower_roster_id bigint,
    winner_id bigint,
    tournament_id bigint NOT NULL,
    stage character varying NOT NULL,
    start_at timestamp without time zone,
    end_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.matches_id_seq OWNED BY public.matches.id;


--
-- Name: player_rankings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_rankings (
    id bigint NOT NULL,
    player_id bigint NOT NULL,
    rank integer NOT NULL,
    ranked_at timestamp without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: player_rankings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_rankings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_rankings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_rankings_id_seq OWNED BY public.player_rankings.id;


--
-- Name: player_rosters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_rosters (
    id bigint NOT NULL,
    roster_id bigint NOT NULL,
    player_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: player_rosters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_rosters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_rosters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_rosters_id_seq OWNED BY public.player_rosters.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id bigint NOT NULL,
    name character varying NOT NULL,
    nickname character varying NOT NULL,
    nationality character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: rosters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rosters (
    id bigint NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone,
    team_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: rosters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rosters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rosters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rosters_id_seq OWNED BY public.rosters.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: team_rankings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_rankings (
    id bigint NOT NULL,
    roster_id bigint NOT NULL,
    rank integer NOT NULL,
    ranked_at timestamp without time zone NOT NULL,
    points integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: team_rankings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.team_rankings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_rankings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.team_rankings_id_seq OWNED BY public.team_rankings.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    name character varying NOT NULL,
    logo character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: tournament_placements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tournament_placements (
    id bigint NOT NULL,
    tournament_id bigint NOT NULL,
    roster_id bigint NOT NULL,
    place integer NOT NULL,
    prize integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tournament_placements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tournament_placements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tournament_placements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tournament_placements_id_seq OWNED BY public.tournament_placements.id;


--
-- Name: tournaments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tournaments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    location character varying,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tournaments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tournaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tournaments_id_seq OWNED BY public.tournaments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: bets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets ALTER COLUMN id SET DEFAULT nextval('public.bets_id_seq'::regclass);


--
-- Name: friendships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendships ALTER COLUMN id SET DEFAULT nextval('public.friendships_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: matches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches ALTER COLUMN id SET DEFAULT nextval('public.matches_id_seq'::regclass);


--
-- Name: player_rankings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_rankings ALTER COLUMN id SET DEFAULT nextval('public.player_rankings_id_seq'::regclass);


--
-- Name: player_rosters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_rosters ALTER COLUMN id SET DEFAULT nextval('public.player_rosters_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: rosters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rosters ALTER COLUMN id SET DEFAULT nextval('public.rosters_id_seq'::regclass);


--
-- Name: team_rankings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_rankings ALTER COLUMN id SET DEFAULT nextval('public.team_rankings_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: tournament_placements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tournament_placements ALTER COLUMN id SET DEFAULT nextval('public.tournament_placements_id_seq'::regclass);


--
-- Name: tournaments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tournaments ALTER COLUMN id SET DEFAULT nextval('public.tournaments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bets bets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT bets_pkey PRIMARY KEY (id);


--
-- Name: friendships friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id);


--
-- Name: player_rankings player_rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_rankings
    ADD CONSTRAINT player_rankings_pkey PRIMARY KEY (id);


--
-- Name: player_rosters player_rosters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_rosters
    ADD CONSTRAINT player_rosters_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: rosters rosters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rosters
    ADD CONSTRAINT rosters_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: team_rankings team_rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_rankings
    ADD CONSTRAINT team_rankings_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: tournament_placements tournament_placements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tournament_placements
    ADD CONSTRAINT tournament_placements_pkey PRIMARY KEY (id);


--
-- Name: tournaments tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_bets_on_match_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bets_on_match_id ON public.bets USING btree (match_id);


--
-- Name: index_bets_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bets_on_user_id ON public.bets USING btree (user_id);


--
-- Name: index_bets_on_winner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bets_on_winner_id ON public.bets USING btree (winner_id);


--
-- Name: index_friendships_on_receiver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendships_on_receiver_id ON public.friendships USING btree (receiver_id);


--
-- Name: index_friendships_on_requester_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendships_on_requester_id ON public.friendships USING btree (requester_id);


--
-- Name: index_likes_on_likeable_type_and_likeable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_likes_on_likeable_type_and_likeable_id ON public.likes USING btree (likeable_type, likeable_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_likes_on_user_id ON public.likes USING btree (user_id);


--
-- Name: index_matches_on_lower_roster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_matches_on_lower_roster_id ON public.matches USING btree (lower_roster_id);


--
-- Name: index_matches_on_tournament_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_matches_on_tournament_id ON public.matches USING btree (tournament_id);


--
-- Name: index_matches_on_upper_roster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_matches_on_upper_roster_id ON public.matches USING btree (upper_roster_id);


--
-- Name: index_matches_on_winner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_matches_on_winner_id ON public.matches USING btree (winner_id);


--
-- Name: index_player_rankings_on_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_player_rankings_on_player_id ON public.player_rankings USING btree (player_id);


--
-- Name: index_player_rosters_on_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_player_rosters_on_player_id ON public.player_rosters USING btree (player_id);


--
-- Name: index_player_rosters_on_roster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_player_rosters_on_roster_id ON public.player_rosters USING btree (roster_id);


--
-- Name: index_rosters_on_team_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rosters_on_team_id ON public.rosters USING btree (team_id);


--
-- Name: index_team_rankings_on_roster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_team_rankings_on_roster_id ON public.team_rankings USING btree (roster_id);


--
-- Name: index_tournament_placements_on_roster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tournament_placements_on_roster_id ON public.tournament_placements USING btree (roster_id);


--
-- Name: index_tournament_placements_on_tournament_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tournament_placements_on_tournament_id ON public.tournament_placements USING btree (tournament_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: likes fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_rails_1e09b5dabf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: matches fk_rails_2f3503a044; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT fk_rails_2f3503a044 FOREIGN KEY (lower_roster_id) REFERENCES public.rosters(id);


--
-- Name: tournament_placements fk_rails_34eb0347b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tournament_placements
    ADD CONSTRAINT fk_rails_34eb0347b8 FOREIGN KEY (tournament_id) REFERENCES public.tournaments(id);


--
-- Name: player_rosters fk_rails_55a40a6da3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_rosters
    ADD CONSTRAINT fk_rails_55a40a6da3 FOREIGN KEY (roster_id) REFERENCES public.rosters(id);


--
-- Name: player_rosters fk_rails_59e6a88817; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_rosters
    ADD CONSTRAINT fk_rails_59e6a88817 FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: team_rankings fk_rails_6e81a5ced2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_rankings
    ADD CONSTRAINT fk_rails_6e81a5ced2 FOREIGN KEY (roster_id) REFERENCES public.rosters(id);


--
-- Name: matches fk_rails_700eaa2935; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT fk_rails_700eaa2935 FOREIGN KEY (tournament_id) REFERENCES public.tournaments(id);


--
-- Name: bets fk_rails_87dbfdd206; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT fk_rails_87dbfdd206 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: bets fk_rails_8ec9911289; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT fk_rails_8ec9911289 FOREIGN KEY (winner_id) REFERENCES public.rosters(id);


--
-- Name: matches fk_rails_9d0deeb219; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT fk_rails_9d0deeb219 FOREIGN KEY (winner_id) REFERENCES public.rosters(id);


--
-- Name: tournament_placements fk_rails_a8465af968; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tournament_placements
    ADD CONSTRAINT fk_rails_a8465af968 FOREIGN KEY (roster_id) REFERENCES public.rosters(id);


--
-- Name: friendships fk_rails_a87446a2d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT fk_rails_a87446a2d6 FOREIGN KEY (requester_id) REFERENCES public.users(id);


--
-- Name: bets fk_rails_ac8e6fd9cd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT fk_rails_ac8e6fd9cd FOREIGN KEY (match_id) REFERENCES public.matches(id);


--
-- Name: player_rankings fk_rails_d09ba54706; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_rankings
    ADD CONSTRAINT fk_rails_d09ba54706 FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: friendships fk_rails_e507fb3bae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT fk_rails_e507fb3bae FOREIGN KEY (receiver_id) REFERENCES public.users(id);


--
-- Name: matches fk_rails_f47b6f26a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT fk_rails_f47b6f26a1 FOREIGN KEY (upper_roster_id) REFERENCES public.rosters(id);


--
-- Name: rosters fk_rails_f86e1a5aa2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rosters
    ADD CONSTRAINT fk_rails_f86e1a5aa2 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20191014034325'),
('20191014034422'),
('20191016165948'),
('20191017005605'),
('20191017010128'),
('20191017010410'),
('20191017012315'),
('20191017013157'),
('20191017014317'),
('20191017020201'),
('20191017021426'),
('20191017024856'),
('20191017025800'),
('20191017030456');


