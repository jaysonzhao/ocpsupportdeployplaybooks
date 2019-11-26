--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    device character varying(255),
    hash_iterations integer,
    salt bytea,
    type character varying(255),
    value character varying(4000),
    user_id character varying(36),
    created_date bigint,
    counter integer DEFAULT 0,
    digits integer DEFAULT 6,
    period integer DEFAULT 30,
    algorithm character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: credential_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential_attribute (
    id character varying(36) NOT NULL,
    credential_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.credential_attribute OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_credential_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_credential_attribute (
    id character varying(36) NOT NULL,
    credential_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.fed_credential_attribute OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    device character varying(255),
    hash_iterations integer,
    salt bytea,
    type character varying(255),
    value character varying(255),
    created_date bigint,
    counter integer DEFAULT 0,
    digits integer DEFAULT 6,
    period integer DEFAULT 30,
    algorithm character varying(36) DEFAULT 'HmacSHA1'::character varying,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36),
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(36),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36)
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(36) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(36) NOT NULL,
    requester character varying(36) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(36)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(36) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(36),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
fc3cc39f-6321-41be-9ba7-a564b275fa1f	\N	auth-cookie	master	e6251d47-fb79-4981-b93d-0ef1d037ec34	2	10	f	\N	\N
81065815-84a6-4d72-9d92-402566c148f8	\N	auth-spnego	master	e6251d47-fb79-4981-b93d-0ef1d037ec34	3	20	f	\N	\N
b58edab0-678a-4835-9258-e4ca16038e15	\N	identity-provider-redirector	master	e6251d47-fb79-4981-b93d-0ef1d037ec34	2	25	f	\N	\N
7b718988-e0b8-4e65-af86-1f9df44af2b5	\N	\N	master	e6251d47-fb79-4981-b93d-0ef1d037ec34	2	30	t	4f3add14-a091-4771-beda-a439d38abfae	\N
111957ba-9c3c-4a45-b75b-55c93fd032ec	\N	auth-username-password-form	master	4f3add14-a091-4771-beda-a439d38abfae	0	10	f	\N	\N
5d730191-7e1c-4725-aa4a-edd5fd83c80b	\N	auth-otp-form	master	4f3add14-a091-4771-beda-a439d38abfae	1	20	f	\N	\N
5c261d85-8054-4c88-8297-0d1eae8ad128	\N	direct-grant-validate-username	master	f1fc046b-9139-407e-9946-5b9c9e737e03	0	10	f	\N	\N
fb92157e-d726-4f96-8e67-373fb07dad24	\N	direct-grant-validate-password	master	f1fc046b-9139-407e-9946-5b9c9e737e03	0	20	f	\N	\N
ee8340fd-9d1f-41bd-b435-5aaaa63125e1	\N	direct-grant-validate-otp	master	f1fc046b-9139-407e-9946-5b9c9e737e03	1	30	f	\N	\N
51afaeb2-3ced-4559-a6ef-320940285b79	\N	registration-page-form	master	75498bf3-3281-4d6f-94d6-2804621b2cce	0	10	t	145607f3-8a09-492f-904f-e9a60bb6e361	\N
c0384b8c-20a1-4416-8c1f-551d3381894a	\N	registration-user-creation	master	145607f3-8a09-492f-904f-e9a60bb6e361	0	20	f	\N	\N
f357b969-08ec-4905-9462-e8486b4c456f	\N	registration-profile-action	master	145607f3-8a09-492f-904f-e9a60bb6e361	0	40	f	\N	\N
f84e5937-1f2e-466d-9ba7-0220d9a4f4c5	\N	registration-password-action	master	145607f3-8a09-492f-904f-e9a60bb6e361	0	50	f	\N	\N
2d586eb0-14bd-4ec4-a8c7-906cd4719f45	\N	registration-recaptcha-action	master	145607f3-8a09-492f-904f-e9a60bb6e361	3	60	f	\N	\N
a50b78ad-e994-4e5c-a895-076e1bddcab6	\N	reset-credentials-choose-user	master	b0fbae2a-179f-4005-8031-10f87fbaa4e6	0	10	f	\N	\N
94b819b7-de7c-400d-8a4f-14701f24d476	\N	reset-credential-email	master	b0fbae2a-179f-4005-8031-10f87fbaa4e6	0	20	f	\N	\N
3f92f7b9-d36b-4535-ab95-7627386ff0f2	\N	reset-password	master	b0fbae2a-179f-4005-8031-10f87fbaa4e6	0	30	f	\N	\N
f378b177-b478-437f-8c9d-e4c9b6a8bc63	\N	reset-otp	master	b0fbae2a-179f-4005-8031-10f87fbaa4e6	1	40	f	\N	\N
339419ff-3bc7-40fb-9648-e2705825e858	\N	client-secret	master	8e93e0bb-138a-4630-af97-5379c4be9b64	2	10	f	\N	\N
7607d1c2-250e-4ce3-aec9-54919766dbeb	\N	client-jwt	master	8e93e0bb-138a-4630-af97-5379c4be9b64	2	20	f	\N	\N
ee42e986-ee4f-4464-a4d8-afcc731f34e0	\N	client-secret-jwt	master	8e93e0bb-138a-4630-af97-5379c4be9b64	2	30	f	\N	\N
2399f537-6805-4aa2-869f-8c84d3244af9	\N	client-x509	master	8e93e0bb-138a-4630-af97-5379c4be9b64	2	40	f	\N	\N
143a7558-6e0d-42f2-8523-fa834c9b8e6a	\N	idp-review-profile	master	7a49aa3f-aac7-4469-898b-fad387de227a	0	10	f	\N	5015501a-cc1b-4931-9269-2310e6d27f96
9541885d-240b-455a-b93c-573983974f2a	\N	idp-create-user-if-unique	master	7a49aa3f-aac7-4469-898b-fad387de227a	2	20	f	\N	bee4c50d-59c7-4037-a94d-40db95a48e31
312534d4-c4bc-4ceb-8010-3e3f90e6ab3f	\N	\N	master	7a49aa3f-aac7-4469-898b-fad387de227a	2	30	t	c2f58bd1-5b3a-42f6-866c-1a388f389117	\N
5dd1b175-4e0b-49b3-b875-58e44ec94317	\N	idp-confirm-link	master	c2f58bd1-5b3a-42f6-866c-1a388f389117	0	10	f	\N	\N
a36a4a38-30dc-441d-8e3b-ff6ba2c6571d	\N	idp-email-verification	master	c2f58bd1-5b3a-42f6-866c-1a388f389117	2	20	f	\N	\N
532b0832-626d-4823-b140-19844ffbdc1a	\N	\N	master	c2f58bd1-5b3a-42f6-866c-1a388f389117	2	30	t	0727475e-6517-4e46-8189-954c8ef084a0	\N
23a17823-2141-482b-a592-33c3fe72aa6f	\N	idp-username-password-form	master	0727475e-6517-4e46-8189-954c8ef084a0	0	10	f	\N	\N
dcf3957b-294e-40bc-9fac-f2165860c477	\N	auth-otp-form	master	0727475e-6517-4e46-8189-954c8ef084a0	1	20	f	\N	\N
3bfdb41f-7140-4216-8b9e-307fb774ac55	\N	http-basic-authenticator	master	c206e084-6cbf-499a-90c8-25ae7d3da7ee	0	10	f	\N	\N
8dbe823f-1de6-4c55-be8f-4118cac67169	\N	docker-http-basic-authenticator	master	651e3842-5a42-4126-bfa0-8fa00ebb3398	0	10	f	\N	\N
66bb0ee1-c18b-4daf-af2d-1332c6c272d6	\N	no-cookie-redirect	master	b7d5fa18-d643-497c-b399-b04de67e158a	0	10	f	\N	\N
deda1128-8b82-4b68-8cc1-6564d3c758f8	\N	basic-auth	master	b7d5fa18-d643-497c-b399-b04de67e158a	0	20	f	\N	\N
43bf2265-04a7-40b9-a13a-88148c4b1f69	\N	basic-auth-otp	master	b7d5fa18-d643-497c-b399-b04de67e158a	3	30	f	\N	\N
0be424b2-9da2-4b0b-9512-9e96c5716d12	\N	auth-spnego	master	b7d5fa18-d643-497c-b399-b04de67e158a	3	40	f	\N	\N
be0119e5-2387-4155-bbff-2bed7dba5d6c	\N	auth-cookie	springbootdemo	d6fc056f-b7db-45ed-ac6d-3ad716777462	2	10	f	\N	\N
5e8baecb-2fbf-44bc-86bd-de7dd31cdd38	\N	auth-spnego	springbootdemo	d6fc056f-b7db-45ed-ac6d-3ad716777462	3	20	f	\N	\N
91e93060-8d72-40f5-8a18-c2f7e46a9daf	\N	identity-provider-redirector	springbootdemo	d6fc056f-b7db-45ed-ac6d-3ad716777462	2	25	f	\N	\N
b8798391-32ea-4b41-b52d-06a7593e5f06	\N	\N	springbootdemo	d6fc056f-b7db-45ed-ac6d-3ad716777462	2	30	t	e4da0656-986e-41b5-96b8-2274d16751e3	\N
5136aa7d-0da7-43cd-a878-9e2daa424f37	\N	auth-username-password-form	springbootdemo	e4da0656-986e-41b5-96b8-2274d16751e3	0	10	f	\N	\N
02b674b9-bc8c-4236-93db-feb214b2c48e	\N	auth-otp-form	springbootdemo	e4da0656-986e-41b5-96b8-2274d16751e3	1	20	f	\N	\N
4699660a-9afb-46f6-8867-314acb6654af	\N	direct-grant-validate-username	springbootdemo	8d8a02eb-9114-4703-897c-68ce6a0d76c0	0	10	f	\N	\N
aeabea81-7353-4e7e-a9f6-4e6217e99903	\N	direct-grant-validate-password	springbootdemo	8d8a02eb-9114-4703-897c-68ce6a0d76c0	0	20	f	\N	\N
01f94573-4e0e-4d4d-b538-d5dd29ac00b9	\N	direct-grant-validate-otp	springbootdemo	8d8a02eb-9114-4703-897c-68ce6a0d76c0	1	30	f	\N	\N
3ed5f56c-a300-4aa3-a71a-5a5bb1735c5b	\N	registration-page-form	springbootdemo	216c6b7b-8bb4-4667-bd8c-c7c137d74e9e	0	10	t	30cd5947-8972-4bfc-b6b2-f37eaade59c2	\N
55b166df-7270-439c-a056-39e13a07dbd1	\N	registration-user-creation	springbootdemo	30cd5947-8972-4bfc-b6b2-f37eaade59c2	0	20	f	\N	\N
d63a58fe-d850-42a4-a377-dd5b0941b084	\N	registration-profile-action	springbootdemo	30cd5947-8972-4bfc-b6b2-f37eaade59c2	0	40	f	\N	\N
31592f35-3f56-4ed2-a09b-4ebe7d14de10	\N	registration-password-action	springbootdemo	30cd5947-8972-4bfc-b6b2-f37eaade59c2	0	50	f	\N	\N
302fe2ec-e59e-4860-8de1-925592bdad71	\N	registration-recaptcha-action	springbootdemo	30cd5947-8972-4bfc-b6b2-f37eaade59c2	3	60	f	\N	\N
cbd0766d-3f06-4dec-95a0-414a33b0a9eb	\N	reset-credentials-choose-user	springbootdemo	5c14f71c-0995-407d-9e9b-d825d557eb17	0	10	f	\N	\N
4f009924-a464-49ce-a14f-babb1035cfd8	\N	reset-credential-email	springbootdemo	5c14f71c-0995-407d-9e9b-d825d557eb17	0	20	f	\N	\N
da6458bf-1dbc-4c7e-9bfd-704be445bb09	\N	reset-password	springbootdemo	5c14f71c-0995-407d-9e9b-d825d557eb17	0	30	f	\N	\N
0dbb1115-fc94-4fb0-9fdf-3fded6b90364	\N	reset-otp	springbootdemo	5c14f71c-0995-407d-9e9b-d825d557eb17	1	40	f	\N	\N
aa039d61-9088-4c9f-81c3-3fb52d7ac339	\N	client-secret	springbootdemo	28d31dd5-456e-4871-90c7-285536e2d3c1	2	10	f	\N	\N
d5a2dbeb-a166-4bd8-b1c5-de3ddb826d19	\N	client-jwt	springbootdemo	28d31dd5-456e-4871-90c7-285536e2d3c1	2	20	f	\N	\N
2496be7d-6b39-4a80-bbfa-b984b2b93546	\N	client-secret-jwt	springbootdemo	28d31dd5-456e-4871-90c7-285536e2d3c1	2	30	f	\N	\N
9f3f9a4a-0e8a-4155-ab50-23f8712a8504	\N	client-x509	springbootdemo	28d31dd5-456e-4871-90c7-285536e2d3c1	2	40	f	\N	\N
fe23f35e-9895-42aa-8468-56503d95a6bd	\N	idp-review-profile	springbootdemo	8e551078-4b78-43a3-bbb7-c0a3630a8e6c	0	10	f	\N	e68de248-8281-43be-99c1-cc7dc8e00367
b7947678-1409-43f2-93cc-7bf1b15f803c	\N	idp-create-user-if-unique	springbootdemo	8e551078-4b78-43a3-bbb7-c0a3630a8e6c	2	20	f	\N	e2bc4bd8-93e6-45c8-ad4e-063f16b927eb
5dc061b4-187c-411b-96ea-db7abdbd3e76	\N	\N	springbootdemo	8e551078-4b78-43a3-bbb7-c0a3630a8e6c	2	30	t	71b1a06b-4a9a-4985-9dcf-ddfe5117eb11	\N
2d4e822c-b945-4409-b795-a1feb55b8b23	\N	idp-confirm-link	springbootdemo	71b1a06b-4a9a-4985-9dcf-ddfe5117eb11	0	10	f	\N	\N
68ff572f-27e8-4623-a7a4-580cfaf2ca51	\N	idp-email-verification	springbootdemo	71b1a06b-4a9a-4985-9dcf-ddfe5117eb11	2	20	f	\N	\N
c1e642f8-c52e-4226-a32b-dfa73622a13d	\N	\N	springbootdemo	71b1a06b-4a9a-4985-9dcf-ddfe5117eb11	2	30	t	863ee66c-42a7-41c7-9d3d-a06b01ad4ee1	\N
adb652cf-373e-4bb0-aa60-7607e50338d0	\N	idp-username-password-form	springbootdemo	863ee66c-42a7-41c7-9d3d-a06b01ad4ee1	0	10	f	\N	\N
5953768e-1e00-432c-b9e5-c75f0958d3bb	\N	auth-otp-form	springbootdemo	863ee66c-42a7-41c7-9d3d-a06b01ad4ee1	1	20	f	\N	\N
9fe84c6b-1383-4af6-bf63-38d2d2483a5c	\N	http-basic-authenticator	springbootdemo	dd8ef55d-5d5d-4e1b-bb10-74a1e6da1bf9	0	10	f	\N	\N
cdc4915f-d43d-498f-a7fc-e6f3ddbb4bb8	\N	docker-http-basic-authenticator	springbootdemo	d1fda7f2-958c-427c-9b07-50a2b6ff8494	0	10	f	\N	\N
dfb12685-6dea-4256-a87d-45259fba8de5	\N	no-cookie-redirect	springbootdemo	352bb92c-cd01-4aa2-bf0d-f983c509b8ff	0	10	f	\N	\N
402c6099-ce34-4456-8bd0-e6b7bbff53e9	\N	basic-auth	springbootdemo	352bb92c-cd01-4aa2-bf0d-f983c509b8ff	0	20	f	\N	\N
d7423387-8986-4d43-98a2-3a37b9da3f21	\N	basic-auth-otp	springbootdemo	352bb92c-cd01-4aa2-bf0d-f983c509b8ff	3	30	f	\N	\N
84a207a7-def9-47a8-b572-606232735a84	\N	auth-spnego	springbootdemo	352bb92c-cd01-4aa2-bf0d-f983c509b8ff	3	40	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
e6251d47-fb79-4981-b93d-0ef1d037ec34	browser	browser based authentication	master	basic-flow	t	t
4f3add14-a091-4771-beda-a439d38abfae	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
f1fc046b-9139-407e-9946-5b9c9e737e03	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
75498bf3-3281-4d6f-94d6-2804621b2cce	registration	registration flow	master	basic-flow	t	t
145607f3-8a09-492f-904f-e9a60bb6e361	registration form	registration form	master	form-flow	f	t
b0fbae2a-179f-4005-8031-10f87fbaa4e6	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
8e93e0bb-138a-4630-af97-5379c4be9b64	clients	Base authentication for clients	master	client-flow	t	t
7a49aa3f-aac7-4469-898b-fad387de227a	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
c2f58bd1-5b3a-42f6-866c-1a388f389117	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
0727475e-6517-4e46-8189-954c8ef084a0	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
c206e084-6cbf-499a-90c8-25ae7d3da7ee	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
651e3842-5a42-4126-bfa0-8fa00ebb3398	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
b7d5fa18-d643-497c-b399-b04de67e158a	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
d6fc056f-b7db-45ed-ac6d-3ad716777462	browser	browser based authentication	springbootdemo	basic-flow	t	t
e4da0656-986e-41b5-96b8-2274d16751e3	forms	Username, password, otp and other auth forms.	springbootdemo	basic-flow	f	t
8d8a02eb-9114-4703-897c-68ce6a0d76c0	direct grant	OpenID Connect Resource Owner Grant	springbootdemo	basic-flow	t	t
216c6b7b-8bb4-4667-bd8c-c7c137d74e9e	registration	registration flow	springbootdemo	basic-flow	t	t
30cd5947-8972-4bfc-b6b2-f37eaade59c2	registration form	registration form	springbootdemo	form-flow	f	t
5c14f71c-0995-407d-9e9b-d825d557eb17	reset credentials	Reset credentials for a user if they forgot their password or something	springbootdemo	basic-flow	t	t
28d31dd5-456e-4871-90c7-285536e2d3c1	clients	Base authentication for clients	springbootdemo	client-flow	t	t
8e551078-4b78-43a3-bbb7-c0a3630a8e6c	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	springbootdemo	basic-flow	t	t
71b1a06b-4a9a-4985-9dcf-ddfe5117eb11	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	springbootdemo	basic-flow	f	t
863ee66c-42a7-41c7-9d3d-a06b01ad4ee1	Verify Existing Account by Re-authentication	Reauthentication of existing account	springbootdemo	basic-flow	f	t
dd8ef55d-5d5d-4e1b-bb10-74a1e6da1bf9	saml ecp	SAML ECP Profile Authentication Flow	springbootdemo	basic-flow	t	t
d1fda7f2-958c-427c-9b07-50a2b6ff8494	docker auth	Used by Docker clients to authenticate against the IDP	springbootdemo	basic-flow	t	t
352bb92c-cd01-4aa2-bf0d-f983c509b8ff	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	springbootdemo	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
5015501a-cc1b-4931-9269-2310e6d27f96	review profile config	master
bee4c50d-59c7-4037-a94d-40db95a48e31	create unique user config	master
e68de248-8281-43be-99c1-cc7dc8e00367	review profile config	springbootdemo
e2bc4bd8-93e6-45c8-ad4e-063f16b927eb	create unique user config	springbootdemo
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
5015501a-cc1b-4931-9269-2310e6d27f96	missing	update.profile.on.first.login
bee4c50d-59c7-4037-a94d-40db95a48e31	false	require.password.update.after.registration
e68de248-8281-43be-99c1-cc7dc8e00367	missing	update.profile.on.first.login
e2bc4bd8-93e6-45c8-ad4e-063f16b927eb	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled) FROM stdin;
ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	t	master-realm	0	f	a797b525-55fa-4948-8e44-f68b228596e3	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f
b1baf168-38e1-4ed7-b048-c4fb4da6515d	t	f	account	0	f	f4363452-6146-433f-88c3-341e5bd315ca	/auth/realms/master/account	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	\N	\N	\N	t	f	f
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	t	f	broker	0	f	48a1df82-b1ed-4d9e-860f-1bef92d26809	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	t	f	security-admin-console	0	t	2b69db96-46f6-400f-afad-67762fc185ef	/auth/admin/master/console/index.html	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	\N	\N	\N	t	f	f
2496ba87-e239-4eee-a173-973a1c8a6130	t	f	admin-cli	0	t	b5a9bba0-383f-4609-a403-0172e75bf020	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
d334a082-af1d-419b-a39a-90211c50e772	t	t	springbootdemo-realm	0	f	78d18183-67f2-4ff4-b58a-a203a1c5c8ec	\N	t	\N	f	master	\N	0	f	f	springbootdemo Realm	f	client-secret	\N	\N	\N	t	f	f
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	f	realm-management	0	f	fa0cb217-6d3f-4da4-b2a2-0d10189e431d	\N	t	\N	f	springbootdemo	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	t	f	account	0	f	f1bfebf4-ee23-4f2e-9631-db48e2419ace	/auth/realms/springbootdemo/account	f	\N	f	springbootdemo	openid-connect	0	f	f	${client_account}	f	client-secret	\N	\N	\N	t	f	f
3033351d-7dca-480d-bc93-004d7739d9c5	t	f	broker	0	f	c3979f32-30f4-4ea1-bf4d-133b4f294b0b	\N	f	\N	f	springbootdemo	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
7fb3bb78-3890-4d24-9e1e-77b8c574225b	t	f	security-admin-console	0	t	37190edb-51a3-4c0b-b99c-ec86a465a4c9	/auth/admin/springbootdemo/console/index.html	f	\N	f	springbootdemo	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	\N	\N	\N	t	f	f
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	t	f	admin-cli	0	t	8cc5c7c6-f336-4e0d-8a2e-f87857eae9c8	\N	f	\N	f	springbootdemo	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
889e8c59-7152-4b68-8e4f-66713ca62719	t	t	springbootdemo	0	t	4c6bfbc1-2b51-4acf-a309-702bea559152	\N	f	\N	f	springbootdemo	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	t	f	t
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.server.signature
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.server.signature.keyinfo.ext
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.assertion.signature
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.client.signature
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.encrypt
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.authnstatement
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.onetimeuse.condition
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml_force_name_id_format
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.multivalued.roles
889e8c59-7152-4b68-8e4f-66713ca62719	false	saml.force.post.binding
889e8c59-7152-4b68-8e4f-66713ca62719	false	exclude.session.state.from.auth.response
889e8c59-7152-4b68-8e4f-66713ca62719	false	tls.client.certificate.bound.access.tokens
889e8c59-7152-4b68-8e4f-66713ca62719	false	display.on.consent.screen
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
b1baf168-38e1-4ed7-b048-c4fb4da6515d	4eceed7b-8038-4ad5-9520-e6d9e1cfd323
b1baf168-38e1-4ed7-b048-c4fb4da6515d	d8806b86-b4c5-42ee-9299-dd26373903a1
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	a7b934e1-3a7e-482c-97ca-3615b2ac1161
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	7e06319f-247e-4090-990c-7bc06d1309a5
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
c7628938-2fbc-4bc4-a2c0-c44f73a945e2	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
959558d5-2498-4f4d-b504-1efdbeb3a193	role_list	master	SAML role list	saml
981163b6-7677-47f8-9574-c99c14e1a5ed	profile	master	OpenID Connect built-in scope: profile	openid-connect
da78286e-4c20-46d7-8b50-7a5fdecae14a	email	master	OpenID Connect built-in scope: email	openid-connect
5c3d10a1-c229-4755-9aca-d6fc00f04366	address	master	OpenID Connect built-in scope: address	openid-connect
2a159abc-a9dd-446a-b001-e5a3ec65a0dc	phone	master	OpenID Connect built-in scope: phone	openid-connect
e53977ae-eb24-457f-8c2e-afa63f78fb46	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
10050cc7-c8fb-4448-b12f-1e44a15231ce	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
73a817cf-7e6e-4c5d-a20a-061dc9e08794	offline_access	springbootdemo	OpenID Connect built-in scope: offline_access	openid-connect
57feb9c1-a4fe-4a2a-bd66-296b658e85d1	role_list	springbootdemo	SAML role list	saml
09c8d07c-18d7-45fb-9682-1656c6af1f86	profile	springbootdemo	OpenID Connect built-in scope: profile	openid-connect
726a7534-43a7-459d-bfe2-6e711bb7c381	email	springbootdemo	OpenID Connect built-in scope: email	openid-connect
ce722919-fe73-48a0-94ee-9defc0d256eb	address	springbootdemo	OpenID Connect built-in scope: address	openid-connect
0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	phone	springbootdemo	OpenID Connect built-in scope: phone	openid-connect
a0583b2b-df29-4a62-a2b0-9243cffd4467	roles	springbootdemo	OpenID Connect scope for add user roles to the access token	openid-connect
88bc5bae-9d29-400d-93f3-be916c64bd68	web-origins	springbootdemo	OpenID Connect scope for add allowed web origins to the access token	openid-connect
bfa393cf-ce22-4eea-8c37-89d9580b76a0	microprofile-jwt	springbootdemo	Microprofile - JWT built-in scope	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
c7628938-2fbc-4bc4-a2c0-c44f73a945e2	true	display.on.consent.screen
c7628938-2fbc-4bc4-a2c0-c44f73a945e2	${offlineAccessScopeConsentText}	consent.screen.text
959558d5-2498-4f4d-b504-1efdbeb3a193	true	display.on.consent.screen
959558d5-2498-4f4d-b504-1efdbeb3a193	${samlRoleListScopeConsentText}	consent.screen.text
981163b6-7677-47f8-9574-c99c14e1a5ed	true	display.on.consent.screen
981163b6-7677-47f8-9574-c99c14e1a5ed	${profileScopeConsentText}	consent.screen.text
981163b6-7677-47f8-9574-c99c14e1a5ed	true	include.in.token.scope
da78286e-4c20-46d7-8b50-7a5fdecae14a	true	display.on.consent.screen
da78286e-4c20-46d7-8b50-7a5fdecae14a	${emailScopeConsentText}	consent.screen.text
da78286e-4c20-46d7-8b50-7a5fdecae14a	true	include.in.token.scope
5c3d10a1-c229-4755-9aca-d6fc00f04366	true	display.on.consent.screen
5c3d10a1-c229-4755-9aca-d6fc00f04366	${addressScopeConsentText}	consent.screen.text
5c3d10a1-c229-4755-9aca-d6fc00f04366	true	include.in.token.scope
2a159abc-a9dd-446a-b001-e5a3ec65a0dc	true	display.on.consent.screen
2a159abc-a9dd-446a-b001-e5a3ec65a0dc	${phoneScopeConsentText}	consent.screen.text
2a159abc-a9dd-446a-b001-e5a3ec65a0dc	true	include.in.token.scope
e53977ae-eb24-457f-8c2e-afa63f78fb46	true	display.on.consent.screen
e53977ae-eb24-457f-8c2e-afa63f78fb46	${rolesScopeConsentText}	consent.screen.text
e53977ae-eb24-457f-8c2e-afa63f78fb46	false	include.in.token.scope
10050cc7-c8fb-4448-b12f-1e44a15231ce	false	display.on.consent.screen
10050cc7-c8fb-4448-b12f-1e44a15231ce		consent.screen.text
10050cc7-c8fb-4448-b12f-1e44a15231ce	false	include.in.token.scope
8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	false	display.on.consent.screen
8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	true	include.in.token.scope
73a817cf-7e6e-4c5d-a20a-061dc9e08794	true	display.on.consent.screen
73a817cf-7e6e-4c5d-a20a-061dc9e08794	${offlineAccessScopeConsentText}	consent.screen.text
57feb9c1-a4fe-4a2a-bd66-296b658e85d1	true	display.on.consent.screen
57feb9c1-a4fe-4a2a-bd66-296b658e85d1	${samlRoleListScopeConsentText}	consent.screen.text
09c8d07c-18d7-45fb-9682-1656c6af1f86	true	display.on.consent.screen
09c8d07c-18d7-45fb-9682-1656c6af1f86	${profileScopeConsentText}	consent.screen.text
09c8d07c-18d7-45fb-9682-1656c6af1f86	true	include.in.token.scope
726a7534-43a7-459d-bfe2-6e711bb7c381	true	display.on.consent.screen
726a7534-43a7-459d-bfe2-6e711bb7c381	${emailScopeConsentText}	consent.screen.text
726a7534-43a7-459d-bfe2-6e711bb7c381	true	include.in.token.scope
ce722919-fe73-48a0-94ee-9defc0d256eb	true	display.on.consent.screen
ce722919-fe73-48a0-94ee-9defc0d256eb	${addressScopeConsentText}	consent.screen.text
ce722919-fe73-48a0-94ee-9defc0d256eb	true	include.in.token.scope
0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	true	display.on.consent.screen
0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	${phoneScopeConsentText}	consent.screen.text
0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	true	include.in.token.scope
a0583b2b-df29-4a62-a2b0-9243cffd4467	true	display.on.consent.screen
a0583b2b-df29-4a62-a2b0-9243cffd4467	${rolesScopeConsentText}	consent.screen.text
a0583b2b-df29-4a62-a2b0-9243cffd4467	false	include.in.token.scope
88bc5bae-9d29-400d-93f3-be916c64bd68	false	display.on.consent.screen
88bc5bae-9d29-400d-93f3-be916c64bd68		consent.screen.text
88bc5bae-9d29-400d-93f3-be916c64bd68	false	include.in.token.scope
bfa393cf-ce22-4eea-8c37-89d9580b76a0	false	display.on.consent.screen
bfa393cf-ce22-4eea-8c37-89d9580b76a0	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
b1baf168-38e1-4ed7-b048-c4fb4da6515d	959558d5-2498-4f4d-b504-1efdbeb3a193	t
2496ba87-e239-4eee-a173-973a1c8a6130	959558d5-2498-4f4d-b504-1efdbeb3a193	t
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	959558d5-2498-4f4d-b504-1efdbeb3a193	t
ebc8042a-5d5d-4108-9956-4b79ad9faff8	959558d5-2498-4f4d-b504-1efdbeb3a193	t
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	959558d5-2498-4f4d-b504-1efdbeb3a193	t
b1baf168-38e1-4ed7-b048-c4fb4da6515d	981163b6-7677-47f8-9574-c99c14e1a5ed	t
b1baf168-38e1-4ed7-b048-c4fb4da6515d	da78286e-4c20-46d7-8b50-7a5fdecae14a	t
b1baf168-38e1-4ed7-b048-c4fb4da6515d	e53977ae-eb24-457f-8c2e-afa63f78fb46	t
b1baf168-38e1-4ed7-b048-c4fb4da6515d	10050cc7-c8fb-4448-b12f-1e44a15231ce	t
b1baf168-38e1-4ed7-b048-c4fb4da6515d	c7628938-2fbc-4bc4-a2c0-c44f73a945e2	f
b1baf168-38e1-4ed7-b048-c4fb4da6515d	5c3d10a1-c229-4755-9aca-d6fc00f04366	f
b1baf168-38e1-4ed7-b048-c4fb4da6515d	2a159abc-a9dd-446a-b001-e5a3ec65a0dc	f
b1baf168-38e1-4ed7-b048-c4fb4da6515d	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	f
2496ba87-e239-4eee-a173-973a1c8a6130	981163b6-7677-47f8-9574-c99c14e1a5ed	t
2496ba87-e239-4eee-a173-973a1c8a6130	da78286e-4c20-46d7-8b50-7a5fdecae14a	t
2496ba87-e239-4eee-a173-973a1c8a6130	e53977ae-eb24-457f-8c2e-afa63f78fb46	t
2496ba87-e239-4eee-a173-973a1c8a6130	10050cc7-c8fb-4448-b12f-1e44a15231ce	t
2496ba87-e239-4eee-a173-973a1c8a6130	c7628938-2fbc-4bc4-a2c0-c44f73a945e2	f
2496ba87-e239-4eee-a173-973a1c8a6130	5c3d10a1-c229-4755-9aca-d6fc00f04366	f
2496ba87-e239-4eee-a173-973a1c8a6130	2a159abc-a9dd-446a-b001-e5a3ec65a0dc	f
2496ba87-e239-4eee-a173-973a1c8a6130	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	f
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	981163b6-7677-47f8-9574-c99c14e1a5ed	t
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	da78286e-4c20-46d7-8b50-7a5fdecae14a	t
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	e53977ae-eb24-457f-8c2e-afa63f78fb46	t
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	10050cc7-c8fb-4448-b12f-1e44a15231ce	t
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	c7628938-2fbc-4bc4-a2c0-c44f73a945e2	f
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	5c3d10a1-c229-4755-9aca-d6fc00f04366	f
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	2a159abc-a9dd-446a-b001-e5a3ec65a0dc	f
9e3f9bdd-ae70-42f1-b195-8ac62619fddb	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	f
ebc8042a-5d5d-4108-9956-4b79ad9faff8	981163b6-7677-47f8-9574-c99c14e1a5ed	t
ebc8042a-5d5d-4108-9956-4b79ad9faff8	da78286e-4c20-46d7-8b50-7a5fdecae14a	t
ebc8042a-5d5d-4108-9956-4b79ad9faff8	e53977ae-eb24-457f-8c2e-afa63f78fb46	t
ebc8042a-5d5d-4108-9956-4b79ad9faff8	10050cc7-c8fb-4448-b12f-1e44a15231ce	t
ebc8042a-5d5d-4108-9956-4b79ad9faff8	c7628938-2fbc-4bc4-a2c0-c44f73a945e2	f
ebc8042a-5d5d-4108-9956-4b79ad9faff8	5c3d10a1-c229-4755-9aca-d6fc00f04366	f
ebc8042a-5d5d-4108-9956-4b79ad9faff8	2a159abc-a9dd-446a-b001-e5a3ec65a0dc	f
ebc8042a-5d5d-4108-9956-4b79ad9faff8	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	f
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	981163b6-7677-47f8-9574-c99c14e1a5ed	t
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	da78286e-4c20-46d7-8b50-7a5fdecae14a	t
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	e53977ae-eb24-457f-8c2e-afa63f78fb46	t
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	10050cc7-c8fb-4448-b12f-1e44a15231ce	t
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	c7628938-2fbc-4bc4-a2c0-c44f73a945e2	f
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	5c3d10a1-c229-4755-9aca-d6fc00f04366	f
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	2a159abc-a9dd-446a-b001-e5a3ec65a0dc	f
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	f
d334a082-af1d-419b-a39a-90211c50e772	959558d5-2498-4f4d-b504-1efdbeb3a193	t
d334a082-af1d-419b-a39a-90211c50e772	981163b6-7677-47f8-9574-c99c14e1a5ed	t
d334a082-af1d-419b-a39a-90211c50e772	da78286e-4c20-46d7-8b50-7a5fdecae14a	t
d334a082-af1d-419b-a39a-90211c50e772	e53977ae-eb24-457f-8c2e-afa63f78fb46	t
d334a082-af1d-419b-a39a-90211c50e772	10050cc7-c8fb-4448-b12f-1e44a15231ce	t
d334a082-af1d-419b-a39a-90211c50e772	c7628938-2fbc-4bc4-a2c0-c44f73a945e2	f
d334a082-af1d-419b-a39a-90211c50e772	5c3d10a1-c229-4755-9aca-d6fc00f04366	f
d334a082-af1d-419b-a39a-90211c50e772	2a159abc-a9dd-446a-b001-e5a3ec65a0dc	f
d334a082-af1d-419b-a39a-90211c50e772	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	f
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	57feb9c1-a4fe-4a2a-bd66-296b658e85d1	t
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	57feb9c1-a4fe-4a2a-bd66-296b658e85d1	t
3033351d-7dca-480d-bc93-004d7739d9c5	57feb9c1-a4fe-4a2a-bd66-296b658e85d1	t
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	57feb9c1-a4fe-4a2a-bd66-296b658e85d1	t
7fb3bb78-3890-4d24-9e1e-77b8c574225b	57feb9c1-a4fe-4a2a-bd66-296b658e85d1	t
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	09c8d07c-18d7-45fb-9682-1656c6af1f86	t
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	726a7534-43a7-459d-bfe2-6e711bb7c381	t
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	a0583b2b-df29-4a62-a2b0-9243cffd4467	t
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	88bc5bae-9d29-400d-93f3-be916c64bd68	t
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	73a817cf-7e6e-4c5d-a20a-061dc9e08794	f
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	ce722919-fe73-48a0-94ee-9defc0d256eb	f
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	f
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	bfa393cf-ce22-4eea-8c37-89d9580b76a0	f
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	09c8d07c-18d7-45fb-9682-1656c6af1f86	t
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	726a7534-43a7-459d-bfe2-6e711bb7c381	t
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	a0583b2b-df29-4a62-a2b0-9243cffd4467	t
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	88bc5bae-9d29-400d-93f3-be916c64bd68	t
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	73a817cf-7e6e-4c5d-a20a-061dc9e08794	f
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	ce722919-fe73-48a0-94ee-9defc0d256eb	f
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	f
b8009636-b7e6-400e-9aa3-6ceeb0edbd0f	bfa393cf-ce22-4eea-8c37-89d9580b76a0	f
3033351d-7dca-480d-bc93-004d7739d9c5	09c8d07c-18d7-45fb-9682-1656c6af1f86	t
3033351d-7dca-480d-bc93-004d7739d9c5	726a7534-43a7-459d-bfe2-6e711bb7c381	t
3033351d-7dca-480d-bc93-004d7739d9c5	a0583b2b-df29-4a62-a2b0-9243cffd4467	t
3033351d-7dca-480d-bc93-004d7739d9c5	88bc5bae-9d29-400d-93f3-be916c64bd68	t
3033351d-7dca-480d-bc93-004d7739d9c5	73a817cf-7e6e-4c5d-a20a-061dc9e08794	f
3033351d-7dca-480d-bc93-004d7739d9c5	ce722919-fe73-48a0-94ee-9defc0d256eb	f
3033351d-7dca-480d-bc93-004d7739d9c5	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	f
3033351d-7dca-480d-bc93-004d7739d9c5	bfa393cf-ce22-4eea-8c37-89d9580b76a0	f
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	09c8d07c-18d7-45fb-9682-1656c6af1f86	t
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	726a7534-43a7-459d-bfe2-6e711bb7c381	t
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	a0583b2b-df29-4a62-a2b0-9243cffd4467	t
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	88bc5bae-9d29-400d-93f3-be916c64bd68	t
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	73a817cf-7e6e-4c5d-a20a-061dc9e08794	f
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	ce722919-fe73-48a0-94ee-9defc0d256eb	f
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	f
94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	bfa393cf-ce22-4eea-8c37-89d9580b76a0	f
7fb3bb78-3890-4d24-9e1e-77b8c574225b	09c8d07c-18d7-45fb-9682-1656c6af1f86	t
7fb3bb78-3890-4d24-9e1e-77b8c574225b	726a7534-43a7-459d-bfe2-6e711bb7c381	t
7fb3bb78-3890-4d24-9e1e-77b8c574225b	a0583b2b-df29-4a62-a2b0-9243cffd4467	t
7fb3bb78-3890-4d24-9e1e-77b8c574225b	88bc5bae-9d29-400d-93f3-be916c64bd68	t
7fb3bb78-3890-4d24-9e1e-77b8c574225b	73a817cf-7e6e-4c5d-a20a-061dc9e08794	f
7fb3bb78-3890-4d24-9e1e-77b8c574225b	ce722919-fe73-48a0-94ee-9defc0d256eb	f
7fb3bb78-3890-4d24-9e1e-77b8c574225b	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	f
7fb3bb78-3890-4d24-9e1e-77b8c574225b	bfa393cf-ce22-4eea-8c37-89d9580b76a0	f
889e8c59-7152-4b68-8e4f-66713ca62719	57feb9c1-a4fe-4a2a-bd66-296b658e85d1	t
889e8c59-7152-4b68-8e4f-66713ca62719	09c8d07c-18d7-45fb-9682-1656c6af1f86	t
889e8c59-7152-4b68-8e4f-66713ca62719	726a7534-43a7-459d-bfe2-6e711bb7c381	t
889e8c59-7152-4b68-8e4f-66713ca62719	a0583b2b-df29-4a62-a2b0-9243cffd4467	t
889e8c59-7152-4b68-8e4f-66713ca62719	88bc5bae-9d29-400d-93f3-be916c64bd68	t
889e8c59-7152-4b68-8e4f-66713ca62719	73a817cf-7e6e-4c5d-a20a-061dc9e08794	f
889e8c59-7152-4b68-8e4f-66713ca62719	ce722919-fe73-48a0-94ee-9defc0d256eb	f
889e8c59-7152-4b68-8e4f-66713ca62719	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	f
889e8c59-7152-4b68-8e4f-66713ca62719	bfa393cf-ce22-4eea-8c37-89d9580b76a0	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
c7628938-2fbc-4bc4-a2c0-c44f73a945e2	c433d664-6c61-46c3-b7fc-cac7d80e82cf
73a817cf-7e6e-4c5d-a20a-061dc9e08794	606e1885-04cc-4be2-b39c-28eec4c12a0a
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
aa40ab79-1319-40f1-b5c0-6ca56059656e	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
fe9b0a10-538c-4934-9d5c-4c3737a3f780	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
cb8579fc-5296-4544-8f3c-c31ab6b6ec1e	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
c6fa014c-cc07-4ecb-aa39-a3bce966738d	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
38f191e5-ac5b-47db-b318-f36f2b8ce4eb	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
0136a0cc-6dd2-4a0f-8abb-2371a279c0eb	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
623ee001-077b-4289-ade0-26b9d874a654	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
5fbed5b6-5b53-47ff-82a1-45fa14c4fa6e	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
146e0b17-0658-4aec-89b3-35fb6d1a4f4d	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
f49572bf-1fad-425b-a391-8cb868c5e67b	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
760dd6b7-f546-4f42-9c7a-31202daf1ae0	rsa-generated	springbootdemo	rsa-generated	org.keycloak.keys.KeyProvider	springbootdemo	\N
692a5a7c-78e6-4386-98a7-260699cf8dae	hmac-generated	springbootdemo	hmac-generated	org.keycloak.keys.KeyProvider	springbootdemo	\N
f4fc2591-8ae4-4967-a5aa-f84d251efa69	aes-generated	springbootdemo	aes-generated	org.keycloak.keys.KeyProvider	springbootdemo	\N
5b94cb6b-ec74-475a-975a-588f24b886f8	Trusted Hosts	springbootdemo	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	anonymous
ef80b7d3-d88d-42c7-86f2-d9201600a40c	Consent Required	springbootdemo	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	anonymous
d353fc9a-64b4-4bca-8de0-a9fbf65faa00	Full Scope Disabled	springbootdemo	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	anonymous
c2efae6d-e24e-4366-9f54-77b81409dd0e	Max Clients Limit	springbootdemo	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	anonymous
8b7715c0-0104-46d2-a79a-27de2e49bca8	Allowed Protocol Mapper Types	springbootdemo	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	anonymous
9ff176ae-7a7c-4b15-9c40-da3d8ea7ecb9	Allowed Client Scopes	springbootdemo	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	anonymous
f46db951-aa60-44e4-b380-da5ddce4ed95	Allowed Protocol Mapper Types	springbootdemo	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	authenticated
8b9d4ea7-160b-4eae-8962-6b322a40d034	Allowed Client Scopes	springbootdemo	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	springbootdemo	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
d357acff-7da8-4c99-ad8f-8ce3da6d6386	aa40ab79-1319-40f1-b5c0-6ca56059656e	host-sending-registration-request-must-match	true
7239904c-fae2-4bbe-8014-3ba0fd5dfe35	aa40ab79-1319-40f1-b5c0-6ca56059656e	client-uris-must-match	true
f00af6a7-e8d6-424e-8b4a-60868aa0d090	0136a0cc-6dd2-4a0f-8abb-2371a279c0eb	allow-default-scopes	true
8eabe79a-9743-4923-9406-fee9d5b8f4cc	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
5ee5cef2-79b7-4f35-82c7-f20028035de5	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	saml-user-attribute-mapper
bcd7b8a6-2c21-4382-b794-979b6b167989	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
71985c50-bab0-4b83-a4aa-ee657320dbff	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	saml-role-list-mapper
cf566c28-5203-417f-a89f-81c98184884f	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	oidc-address-mapper
10463928-642f-4527-9469-4cdb6d8a9ae7	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	saml-user-property-mapper
08593ba3-f742-411f-a10f-5c76dc856d36	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b4f3c942-fd76-4652-844b-bcc0be72f576	345b2a83-41f0-49cb-b1f8-5d9cf65dd39d	allowed-protocol-mapper-types	oidc-full-name-mapper
dae82745-3c3d-409c-9e29-3411e9b00f01	c6fa014c-cc07-4ecb-aa39-a3bce966738d	max-clients	200
fa43c98b-c8c1-4dec-b3c1-45993f9e06db	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	saml-user-property-mapper
6db7e99a-686b-4faa-9055-12eec1d52c6c	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	saml-user-attribute-mapper
c98904fc-1ea2-40ca-8fb6-43e83398ca66	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
aabf49b1-fc07-4d94-8042-ecaf0f57ec35	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	oidc-address-mapper
931f447f-1b2f-44a4-ac65-377e89d0ca40	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	saml-role-list-mapper
e33526dd-7e20-4b6a-9610-5cfd388ad4a8	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f6b1bfef-ae76-4a69-a8de-7f0d0d653fe7	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
28c347ff-021e-4909-a774-c60554ffcdf2	38f191e5-ac5b-47db-b318-f36f2b8ce4eb	allowed-protocol-mapper-types	oidc-full-name-mapper
4b30be97-12b0-4a01-85e2-f6a2dc0050c6	623ee001-077b-4289-ade0-26b9d874a654	allow-default-scopes	true
50f7f155-71f1-443d-b112-403d504f40f6	f49572bf-1fad-425b-a391-8cb868c5e67b	secret	X8gNtlflrqHPu83omPAlHQ
40815dc7-5e3c-4ab1-91f7-53dd47ed6479	f49572bf-1fad-425b-a391-8cb868c5e67b	priority	100
2a7a2c11-4b33-4ef6-9c8c-20b0aebb041a	f49572bf-1fad-425b-a391-8cb868c5e67b	kid	a7136e10-81ce-432f-a44e-7bce1690c08e
35090fa5-74d7-4179-9f30-3f6ed2cac2fa	146e0b17-0658-4aec-89b3-35fb6d1a4f4d	secret	B9xGoIHZr4bcQWf26TcSluxlqhQms--anCWR9JTKEAlc2HP7oIJZoNzPm7-pjliE1KiIH-bP0bpc5SRVHWbJdg
742bef53-e08c-4528-a53d-f851706600be	146e0b17-0658-4aec-89b3-35fb6d1a4f4d	kid	a4e17557-3f18-4a9f-b225-97098c045a44
5a48344a-b2d5-4d25-a286-f92eb5a1af5a	146e0b17-0658-4aec-89b3-35fb6d1a4f4d	algorithm	HS256
d235b80e-78f0-4b34-b0b9-7910f8b8395b	146e0b17-0658-4aec-89b3-35fb6d1a4f4d	priority	100
60c356d0-da40-4911-909e-06971d524d88	5fbed5b6-5b53-47ff-82a1-45fa14c4fa6e	privateKey	MIIEowIBAAKCAQEArbWa7xorAP3H3StP65JBvG0cUkKFC9lIS3BAIIHbhRvyt6SxRmZnHcLknpBmud8WfdK5R0qNM6Jkc3EBMgIiKftbXto7zJkeR9mjn8LDMwM5ds4kMqefPqQQz/HRASTrjAQnUGStQUC1cXH0frr5HSBOO52tZDDDjS6v51EETvZaloq7jjkLnfb4KfGXxeFW2+SP1yJi9dg5laUXZi9LSrFR6Evc/n13pKiiyOLqj3T+xXv5dv6QO8d0MTWw/N5Pjvbokz0aFgRC8emfHDO7MCUUIZubLDQBNG5pLYKH/RLrBTAbVEZ5o6T9ye/W5iTrI4D/rYUNpb14os4+bu9DxQIDAQABAoIBAE/IyrmpZjkVVvgRjaqgSYsW/lwV62/uw5LKotmLa10u4gNRJI82N4Rm4ISnxFb4zSbLY4gICOS/YK3ZKHhknHZ12ZiuWar2ZP8RSmL1nJxQjdMwiVWuwaiOyJ4J7jo9T+bGfZwiMaV36B6L/YU7sXGcRfKB0ILlFtxAplBzWKw/HIr7z/nF1wUjUaAk7Ji/91jON6W+Tjw0tywY/hQZ4IQn9eyAOgH4uwRuqO88PM+OGxsSw5BWwLmOtAelGHJ+lRvhqNdcp9Fx10ryDUBkff7xmDIpRyTs7dO2lhgYRDA4YCkRcqjaQs7u+02byPJdov4k0GOVHBabqIWVKHJlvkECgYEA9dW4Ogk1Buqv42bbIqKoPnFXfdJVBtl3O3WXgxHjWRhw2vB/f8P6EXuVrf69+hDSXFoqhApcLYMou9ttZ2Lx9n5UF8wkiwtzmF8sud+jc8QR/62WdLraN572FnC6FQV7YNq9j6qLd/JqCI0/gncRwDXbO223KjBcU6zJmtmRD5ECgYEAtORnJsT7Kq63XLdlyHpZUaEYbLANoUijRD+AhNmVLMA5qQf9bpXBAdia9dP9xDIIvqlrrohU2QTYD/BlkpnAvTq6TKPW+A50Y/GHQS+FAcgvFa4RtYHS3ve9AkBsmI3FjAHvM4a3ohSvocaBuCZ070c4fmE3CPDt7hqIEgVSfvUCgYBGpd7FvvOgQz286kg7kecr2sK8BAAvcbuUON0L684cQqvcH5VkkFuDPrLrR/QsszzhEYB6ZcfLxI+mPQ8Z0ROcNP3RwPcXhnj35xIhcKW2lThe8/HzJeekaGhsVoUDmYm1cedcLDTciavzPTRtN+7AADo6v/MNisxdt6BQggnwIQKBgGzc/Fsvtvyj80QAN2gkgbaHndxjQ4Cp51/+W4kYLRemg8z/Ov0fcO18fx2svA8kEXE1ItIByBZnPOSyx14n2//F5TKUc54LjO5NABoxz/kXkYaZoJy8ibyYGY7OWMyinZ252EwJKmCH1H8mqRC7TCpokU41kVp3LKncG8HEpDY1AoGBAKX4ax3AqHDkhzv171+V8IJrQOY64h1Mzv0FYe72ipL2SXL5T1hgrJSh2q4kIxUymucM+Z75MhI+67YSeZIJHlrGH42gcRdWpvDKlNmTCEkhT7M84noo5KQGoseIcvNS1dDUxa3KsNeu+ciRzG8lJSXg7paDD+hl1UEauKunT1fJ
6f42b403-acf3-4b54-b576-c0d251cf7be6	5fbed5b6-5b53-47ff-82a1-45fa14c4fa6e	priority	100
ad31236e-ce50-4861-ae4b-eafaf194e6be	5fbed5b6-5b53-47ff-82a1-45fa14c4fa6e	certificate	MIICmzCCAYMCBgFuodRCYjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTkxMTI1MDkwOTMyWhcNMjkxMTI1MDkxMTEyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCttZrvGisA/cfdK0/rkkG8bRxSQoUL2UhLcEAggduFG/K3pLFGZmcdwuSekGa53xZ90rlHSo0zomRzcQEyAiIp+1te2jvMmR5H2aOfwsMzAzl2ziQyp58+pBDP8dEBJOuMBCdQZK1BQLVxcfR+uvkdIE47na1kMMONLq/nUQRO9lqWiruOOQud9vgp8ZfF4Vbb5I/XImL12DmVpRdmL0tKsVHoS9z+fXekqKLI4uqPdP7Fe/l2/pA7x3QxNbD83k+O9uiTPRoWBELx6Z8cM7swJRQhm5ssNAE0bmktgof9EusFMBtURnmjpP3J79bmJOsjgP+thQ2lvXiizj5u70PFAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAF+LGPEqXY6rYyUPJWBsJvwvEf4+4YdWl9Tnq4m/crniWpFeft38XnWCgWVauVLLyvAsX0knlr+PWjXYffjNfqF/ZgA5IaUF1BKAjGBQkFkXoqscd6Slb6vA7d2TpoViJkOJSNV5CPJ+AXvpt/UsDvSCkMBohC6cX1ytJgXBkh/0llwuWb4dkLSSFnI63VW0JhEVhmbEWpxnplBmgxLeenVnOfvjWy9a+o88nWRXd//H+OptoYWxjgCQKzRY8oZnsvDp+H+82X4/D5Jm9jLqBk0fltBbKAsePbZAoSJnlV/AfAiElZ5arjO0m367DIN+ljQlAwAbldPb0Ke3atXJlMk=
5c84b6cf-c569-4a02-9c49-60070279fe6a	760dd6b7-f546-4f42-9c7a-31202daf1ae0	certificate	MIICqzCCAZMCBgFuohOoVzANBgkqhkiG9w0BAQsFADAZMRcwFQYDVQQDDA5zcHJpbmdib290ZGVtbzAeFw0xOTExMjUxMDE4NDdaFw0yOTExMjUxMDIwMjdaMBkxFzAVBgNVBAMMDnNwcmluZ2Jvb3RkZW1vMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm+j8MczCp9wSKfCcJ+dpdfRWw542kgBIyFk+AFOvLsGQ4rJEqC78sPiPRu8gypNp2E78JY9SgkyIFe2ojHqJ5uuI2z9+DLrJGi29vasaieFGY924NlXoOS/94PYZf36j8sxD6YH5XYDV6k8oZrfhHVru+ZagTWaELOh4Cpwt6usxK03KnCpzdjPeD2QwHVETnx1yreF8yEy788bJkV8RIKn3FlOlvixgmfL4hRWS3d/bOlEuSn6JkZXpjj3xIJU76OlLT/Cu7EC6y/72itEmN+r+S7fzWhib4wpBofVo2Ju+7YEZGcf5HamT0r4/UI+G2vOST3Ne+RmwfwunQW0zLQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQB/qRDDm8LSBFA+fc4N0bOUPrjWtA/Cf/9qyM/YeIGXiiSl7zOKGCJpQGRXk+FWdTP9HsGLV5JsBhu7XAPegZKTxbNABNnYpmCgbuGuT36NB9gus+wVHeteJHY5vK/uTWF0A8xRY33p9l5LqvxoieGNDftOTVTPUusjBA4UxirgJ1CNFmP6spVISn7YEjb8FvUBCQsNzwkBcYifV9sscUkR4ykE1kFsJaJUezQoE5AROy9qujEE1nygSHpjwMZ9Puw5TByAbXIZa1HpY0jgRu5yRqOQV8rIrLNG4MgxmRX1n3Ec9h8Iv0922BqW2efTB8wYFjXYxcfeerwKFbOsmEUL
63926cb7-926c-47cd-942d-9cc4c4c7388d	760dd6b7-f546-4f42-9c7a-31202daf1ae0	priority	100
f7d32646-2052-4b50-8e88-60e5fc616b49	760dd6b7-f546-4f42-9c7a-31202daf1ae0	privateKey	MIIEpQIBAAKCAQEAm+j8MczCp9wSKfCcJ+dpdfRWw542kgBIyFk+AFOvLsGQ4rJEqC78sPiPRu8gypNp2E78JY9SgkyIFe2ojHqJ5uuI2z9+DLrJGi29vasaieFGY924NlXoOS/94PYZf36j8sxD6YH5XYDV6k8oZrfhHVru+ZagTWaELOh4Cpwt6usxK03KnCpzdjPeD2QwHVETnx1yreF8yEy788bJkV8RIKn3FlOlvixgmfL4hRWS3d/bOlEuSn6JkZXpjj3xIJU76OlLT/Cu7EC6y/72itEmN+r+S7fzWhib4wpBofVo2Ju+7YEZGcf5HamT0r4/UI+G2vOST3Ne+RmwfwunQW0zLQIDAQABAoIBAC3ni1meUDHcOfzfOxsEp6hzKJiwHKEgNE3I+Nhfy1SY6W/VzSE3tG7mwEjCX4VFogRuPQ9SA5kZr3fFYbr62V+EOedT6mkVFeD/Vr5hgo7WJUOCJJra8GTmHHn/+8HuJ5d1TQmTmzhMlq9GXz7fJQjfnT0ffFNNu9z9FVsKYPqpj0tPGtVBvLKJdRFw66Y2AA7qZYx0UGov6YME5kLj2Ju3DTYlkpvL0CyFm8omEQmbUO+q4Owpzj9ZtkyjB0bziVIthW49HTx+aNjIvEwbk1E64xJDbhp4jzGkItpMT+84m7Hnbbk0keQrqHviYWo4YYHxF+qVmG8KbOCTnrY75AECgYEAyDUJyWZn0Tr82BDPUz0oRe1tmW+Pltzu5etZR+lMGOxshBKWEjSbkmuCZqIwyqBoLszqVZSabhlto1Sw/QX/btjT4SKGoL6I2riX8SNeyh3smaWs9GKnFjJyL4pxV3+ND0c1w+Dh94uYplfAL21eP5d7ZxBZBFupsHirL2xgXHkCgYEAx1vAvTmgbpevEYZbKdXyzaD9sXUq4bGfzbcmD1nS7FKZdPZUmQnMgd18xXi7qlBodl1TGO98l71AnFKv7S3CKYmf7Wrwe8u01SeMGe4ijZpxLNvfsAd820/3UjgBLCdFu2W43sQeUsE5F2kEd08b5UTrufNa2Dfu/i5HAUD0t1UCgYEAnlJjBON4odsV6/+PFHI+kN3rV/UDBfh861Er71Qsm2ELh33zMz5q8GUYX/VOxE4JVUky3q5/WSW+r/TfaZf+oTfShiz5bdB/BQgJD+Y6pXb4jaCYn0IMg98ssS+35cu2Tyiu+dGyoEHCW3j1QAwrBfrS2XPyESIzlJw4M25u3XECgYEAwLfH+KTOnFpx2OUjF6xFjdbFqFj13TwSmZElb82LgvzOcCz41wCL/DaauWLfN+OHOHU7MW3B6gX/gZ7FhuinO/RY7/BjDal85FnYq/By4qScJ5teABMc9f21vnt5Vq+YT3IkZuT701AK2sCgmp2U/+vCXP4NodtgY8NkzKd4agkCgYEAu5erdQVnMOn66SQr2Ddat3roxZKtcmxDbIAFwdKan4q9yu329KZk2OtBfHSNkP1IVQR3Jug1JGXagmAHiijHp86btoo9BPMMD5ZdyC/sPuwnH+iDxyjXPmYrN4jMTwUchSZWvdB3jaax0i19tFucKfL96rS7XTU4BfdxRKVv5jQ=
fda85289-f760-4ecf-85ca-65ae9c2565c6	692a5a7c-78e6-4386-98a7-260699cf8dae	kid	683fbb53-0ae8-419a-bb4d-f583de26bfc0
eb68d504-1991-41cc-9e19-2bdb532bd9dd	692a5a7c-78e6-4386-98a7-260699cf8dae	algorithm	HS256
cb68b269-6d80-473a-887e-17584c2e292b	692a5a7c-78e6-4386-98a7-260699cf8dae	priority	100
7e06c7cb-4bf2-406e-b236-27e25169063a	692a5a7c-78e6-4386-98a7-260699cf8dae	secret	3C20FUn7jdt-Z3S_QHVE1HtQz7DKsAhExASlHamfRLfS69r5033EooBQfLSILGykf-VuwD-Uhxa4G8c6Sl7pEQ
1ee30ad6-fd76-4456-bc51-8d9894717eda	f4fc2591-8ae4-4967-a5aa-f84d251efa69	priority	100
bf023896-d04c-4ef8-8cd9-ffed31c5aa47	f4fc2591-8ae4-4967-a5aa-f84d251efa69	secret	MQn9dv5sR6xDOez7awDZZA
081d7af7-f458-4b40-9785-798b58af6f16	f4fc2591-8ae4-4967-a5aa-f84d251efa69	kid	b765e55d-d15f-4c6f-9ab6-9d96309fc3bf
2d1a26e8-7399-4af9-b263-91afe95fbfd2	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
86ec4dce-cf04-4657-8f76-4784a394d119	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	saml-role-list-mapper
8add80f1-eced-4734-a628-9db0003125c8	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	saml-user-attribute-mapper
12a08a7c-a4e5-48c2-869b-71b72a315cb8	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	oidc-full-name-mapper
30d16608-bfa7-47d6-a849-3bea12f19e61	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	saml-user-property-mapper
6c648c76-8f15-4d8b-b7ac-50b2af3654bb	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
0a298c06-5d8d-4b2e-b90a-92d77ef705f1	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4706f9b9-adc4-49dd-8268-22de63f61ce4	8b7715c0-0104-46d2-a79a-27de2e49bca8	allowed-protocol-mapper-types	oidc-address-mapper
4dcfb99e-99a3-4ee7-85df-6d6276dcd4db	9ff176ae-7a7c-4b15-9c40-da3d8ea7ecb9	allow-default-scopes	true
f5bcc453-2a52-47d9-80bf-adee45b8eef1	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	saml-user-property-mapper
d2876bb9-8b92-4038-8467-41a71b951da8	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	saml-role-list-mapper
82960c5a-fc48-478d-8c1c-a748c0c3b37d	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c4d9e867-141a-4baf-95da-60e8f63322ed	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c51f7b76-2b92-4ab4-9cae-f94862987ae4	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	oidc-full-name-mapper
da1af4d3-bf87-4412-b66c-1dce446212f5	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
4d2a91f0-4486-4b55-8242-8bae86dbc68d	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	saml-user-attribute-mapper
66757e2b-ec90-4ef9-b898-bd3dbc0df415	f46db951-aa60-44e4-b380-da5ddce4ed95	allowed-protocol-mapper-types	oidc-address-mapper
00f5b234-1b62-4a12-ab3f-e2b3b514b84d	8b9d4ea7-160b-4eae-8962-6b322a40d034	allow-default-scopes	true
20841117-e50a-4b33-b225-018023ded4d4	5b94cb6b-ec74-475a-975a-588f24b886f8	host-sending-registration-request-must-match	true
6b7c400c-4061-4f49-857b-034060f42f72	5b94cb6b-ec74-475a-975a-588f24b886f8	client-uris-must-match	true
efc27087-bad9-4a6a-8590-d499de3ce7be	c2efae6d-e24e-4366-9f54-77b81409dd0e	max-clients	200
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
23a6f689-951d-433e-8d1d-83298ef446c7	d3dccc0f-2724-407b-85a9-d5b0ebb64c3a
23a6f689-951d-433e-8d1d-83298ef446c7	c641e881-a88b-41bc-977c-6b3582f2b1da
23a6f689-951d-433e-8d1d-83298ef446c7	28d8075d-327a-4187-a0db-41d0c69525f1
23a6f689-951d-433e-8d1d-83298ef446c7	90581d3a-2bb2-4023-98f4-d6127918d31e
23a6f689-951d-433e-8d1d-83298ef446c7	b2c837bb-bfa8-4fb9-93a9-633f794502a2
23a6f689-951d-433e-8d1d-83298ef446c7	705f7281-313e-4a4b-b49d-e35d3cb359fd
23a6f689-951d-433e-8d1d-83298ef446c7	f449a16a-eed3-434a-8192-1e4d07f308ca
23a6f689-951d-433e-8d1d-83298ef446c7	6a5a0ca5-f8df-4eef-9141-c4aee83c3013
23a6f689-951d-433e-8d1d-83298ef446c7	0f485977-72c8-4dc9-a613-e41d2c251167
23a6f689-951d-433e-8d1d-83298ef446c7	3296920a-dcf9-4821-b462-29f659e56164
23a6f689-951d-433e-8d1d-83298ef446c7	0596c1fc-b379-4507-8d9a-bd54cef1b1f4
23a6f689-951d-433e-8d1d-83298ef446c7	4403e6a0-efef-4a03-a891-3339fd6123fb
23a6f689-951d-433e-8d1d-83298ef446c7	ca9cf69d-3a98-4f89-8f97-1032f173efb2
23a6f689-951d-433e-8d1d-83298ef446c7	8640e350-543f-4d30-9c7c-e3fc44eb7f84
23a6f689-951d-433e-8d1d-83298ef446c7	1c4d9dde-4d17-483f-b47b-1f10cb460483
23a6f689-951d-433e-8d1d-83298ef446c7	0a81ae6d-c01e-4f10-901f-358070c48a0d
23a6f689-951d-433e-8d1d-83298ef446c7	f09e375a-7a7e-4c23-8326-a8315accc9ea
23a6f689-951d-433e-8d1d-83298ef446c7	761c8387-1530-416d-8d30-681549272de4
90581d3a-2bb2-4023-98f4-d6127918d31e	1c4d9dde-4d17-483f-b47b-1f10cb460483
90581d3a-2bb2-4023-98f4-d6127918d31e	761c8387-1530-416d-8d30-681549272de4
b2c837bb-bfa8-4fb9-93a9-633f794502a2	0a81ae6d-c01e-4f10-901f-358070c48a0d
d8806b86-b4c5-42ee-9299-dd26373903a1	9760ff1e-a8a7-4371-846b-c1c08c916d36
23a6f689-951d-433e-8d1d-83298ef446c7	d7a41063-c647-44b0-8890-387c90c4ff87
23a6f689-951d-433e-8d1d-83298ef446c7	17b8929a-5061-41d4-b4f0-d8430e504c66
23a6f689-951d-433e-8d1d-83298ef446c7	0e3b210b-4128-48ab-801d-6358ce911b7b
23a6f689-951d-433e-8d1d-83298ef446c7	5f7693ed-8cea-4344-9af9-2c4b364c2307
23a6f689-951d-433e-8d1d-83298ef446c7	bab64d59-f244-4b8e-9265-ff4ab34ba3ee
23a6f689-951d-433e-8d1d-83298ef446c7	1edb0dca-4b29-4116-b4d5-cf6c0687c521
23a6f689-951d-433e-8d1d-83298ef446c7	29a77a6e-0975-40b1-9b27-b2d3a7b40752
23a6f689-951d-433e-8d1d-83298ef446c7	bad793b5-d178-4a56-b4ed-604bfcac3eed
23a6f689-951d-433e-8d1d-83298ef446c7	0e778020-af3c-407d-84e7-5a6b4775a29a
23a6f689-951d-433e-8d1d-83298ef446c7	edefccdd-55e6-4b1d-a377-69104926f549
23a6f689-951d-433e-8d1d-83298ef446c7	b6f4378d-a606-4250-baf1-cc0b00889cdd
23a6f689-951d-433e-8d1d-83298ef446c7	2647811f-48ff-4147-8c5f-01ca0c92f62b
23a6f689-951d-433e-8d1d-83298ef446c7	3aef83fc-3181-493a-a87f-75ba211a852a
23a6f689-951d-433e-8d1d-83298ef446c7	63f279f5-7e45-4f35-b09a-8e2ad8d6837f
23a6f689-951d-433e-8d1d-83298ef446c7	ab8e982b-0b57-4775-a019-614e65805d82
23a6f689-951d-433e-8d1d-83298ef446c7	e2ab6dcf-be3c-473c-929d-377fd859fa3f
23a6f689-951d-433e-8d1d-83298ef446c7	0c798853-6e18-472a-9d7e-390b4e38190a
23a6f689-951d-433e-8d1d-83298ef446c7	496cdab8-5e72-46c1-ac26-907251dbbdce
5f7693ed-8cea-4344-9af9-2c4b364c2307	ab8e982b-0b57-4775-a019-614e65805d82
5f7693ed-8cea-4344-9af9-2c4b364c2307	496cdab8-5e72-46c1-ac26-907251dbbdce
bab64d59-f244-4b8e-9265-ff4ab34ba3ee	e2ab6dcf-be3c-473c-929d-377fd859fa3f
a4b6950a-7fc7-449b-a488-5ec373f900ef	429569e7-016c-4ec2-98ca-ab3038959ea1
a4b6950a-7fc7-449b-a488-5ec373f900ef	69fd0615-74e8-40d3-a923-b6e7dec497a6
a4b6950a-7fc7-449b-a488-5ec373f900ef	b85bcd05-36e9-4870-a06d-deee4a258579
a4b6950a-7fc7-449b-a488-5ec373f900ef	5f229545-51ae-4e37-b616-46bd9494c3cc
a4b6950a-7fc7-449b-a488-5ec373f900ef	07b0f071-6677-4596-a694-06f89032c83b
a4b6950a-7fc7-449b-a488-5ec373f900ef	d9b8f8e4-c294-4f89-a0ee-5328fb3c9949
a4b6950a-7fc7-449b-a488-5ec373f900ef	690ac34a-511d-4af4-a93f-cd123f733a09
a4b6950a-7fc7-449b-a488-5ec373f900ef	00bfa525-3ed6-4784-b1c2-97daff141ed9
a4b6950a-7fc7-449b-a488-5ec373f900ef	d25ff2eb-ce3c-408d-8a5d-9d6d70977e42
a4b6950a-7fc7-449b-a488-5ec373f900ef	8087d232-5e47-4b1c-8f3a-b8ce1d6ef2d8
a4b6950a-7fc7-449b-a488-5ec373f900ef	d5101c1f-1435-4a96-a0ef-7bd8e4c2f834
a4b6950a-7fc7-449b-a488-5ec373f900ef	8b1145f9-6385-4054-b245-de4200dd5c0e
a4b6950a-7fc7-449b-a488-5ec373f900ef	70e9c6ce-0330-4824-ac29-f206f394e7dd
a4b6950a-7fc7-449b-a488-5ec373f900ef	32583e4b-4f51-4057-a428-fe5a7a3f72cf
a4b6950a-7fc7-449b-a488-5ec373f900ef	5a9184a4-316e-4d16-bc19-fc728f54039f
a4b6950a-7fc7-449b-a488-5ec373f900ef	8e6b00fa-0cde-4ec6-90d0-cbe4dba471a1
a4b6950a-7fc7-449b-a488-5ec373f900ef	aac3ef66-db2f-4e61-b2b4-641d633f7d5d
b85bcd05-36e9-4870-a06d-deee4a258579	32583e4b-4f51-4057-a428-fe5a7a3f72cf
b85bcd05-36e9-4870-a06d-deee4a258579	aac3ef66-db2f-4e61-b2b4-641d633f7d5d
5f229545-51ae-4e37-b616-46bd9494c3cc	5a9184a4-316e-4d16-bc19-fc728f54039f
23a6f689-951d-433e-8d1d-83298ef446c7	76f4ba59-912f-4302-8267-eb30a8c0dab2
7e06319f-247e-4090-990c-7bc06d1309a5	895f640a-5d44-4995-9755-1c5b3461b0cb
a4b6950a-7fc7-449b-a488-5ec373f900ef	93b3d90a-d9d8-4ddd-b04e-e51c9fd0b531
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, device, hash_iterations, salt, type, value, user_id, created_date, counter, digits, period, algorithm) FROM stdin;
a4e4469e-ee99-443b-8631-63065e70d3bc	\N	27500	\\xffb6420b04be7444b3abce2cb9ade41f	password	iOd+VWRPrHWmjcS+7NKnvLvjO6e8rvNrp1jnzwexNqWsikfyPcebZe8FSvhrgCQPIg8Dxy22Q/xrhitLzydS6A==	c5eee830-8a39-4ab5-8b86-9b86c42acd13	\N	0	0	0	pbkdf2-sha256
a982407e-fe86-46ff-907a-d3d836264c8d	\N	27500	\\x476fdd87bb0992538d2afc2dd5dc9cd1	password	6Yy3VjO/P6YlD0yU/YhXEQzwA8nA7cT6CVf2PUwdK0uDZjpd5cE/2kOIhkt9KvJv+HoSJSRl2xnHIAcT6Wk4OA==	426c9380-2262-4211-977f-0dcb668523d0	1574677632879	0	0	0	pbkdf2-sha256
\.


--
-- Data for Name: credential_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential_attribute (id, credential_id, name, value) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2019-11-25 09:11:00.56828	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	4673059908
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2019-11-25 09:11:00.607258	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	4673059908
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2019-11-25 09:11:00.725563	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	4673059908
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2019-11-25 09:11:00.732669	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	4673059908
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2019-11-25 09:11:00.947638	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	4673059908
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2019-11-25 09:11:00.954926	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	4673059908
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2019-11-25 09:11:01.10576	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	4673059908
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2019-11-25 09:11:01.119762	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	4673059908
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2019-11-25 09:11:01.130744	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	4673059908
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2019-11-25 09:11:01.33509	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	4673059908
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2019-11-25 09:11:01.546089	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	4673059908
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2019-11-25 09:11:01.552731	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	4673059908
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2019-11-25 09:11:01.694143	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	4673059908
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-25 09:11:01.762481	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	4673059908
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-25 09:11:01.767374	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	4673059908
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-25 09:11:01.770783	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	4673059908
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-25 09:11:01.774175	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	4673059908
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2019-11-25 09:11:01.875731	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	4673059908
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2019-11-25 09:11:01.95975	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	4673059908
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2019-11-25 09:11:01.965962	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	4673059908
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-25 09:11:02.707348	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	4673059908
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2019-11-25 09:11:01.968847	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	4673059908
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2019-11-25 09:11:01.971992	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	4673059908
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2019-11-25 09:11:02.003794	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	4673059908
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2019-11-25 09:11:02.011123	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	4673059908
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2019-11-25 09:11:02.013848	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	4673059908
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2019-11-25 09:11:02.059981	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	4673059908
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2019-11-25 09:11:02.267071	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	4673059908
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2019-11-25 09:11:02.27375	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	4673059908
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2019-11-25 09:11:02.34748	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	4673059908
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2019-11-25 09:11:02.364431	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	4673059908
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2019-11-25 09:11:02.387383	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	4673059908
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2019-11-25 09:11:02.394179	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	4673059908
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-25 09:11:02.402947	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	4673059908
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-25 09:11:02.406116	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	4673059908
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-25 09:11:02.446485	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	4673059908
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2019-11-25 09:11:02.472745	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	4673059908
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-25 09:11:02.481774	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	4673059908
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2019-11-25 09:11:02.487753	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	4673059908
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2019-11-25 09:11:02.504764	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	4673059908
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-11-25 09:11:02.510156	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	4673059908
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-11-25 09:11:02.513036	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	4673059908
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2019-11-25 09:11:02.522444	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	4673059908
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-11-25 09:11:02.679338	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	4673059908
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2019-11-25 09:11:02.700949	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	4673059908
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-25 09:11:02.713367	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	4673059908
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-25 09:11:02.716163	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	4673059908
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-25 09:11:02.766673	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	4673059908
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-25 09:11:02.78628	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	4673059908
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2019-11-25 09:11:02.845202	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	4673059908
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2019-11-25 09:11:02.89405	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	4673059908
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2019-11-25 09:11:02.899893	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	4673059908
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2019-11-25 09:11:02.904753	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	4673059908
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2019-11-25 09:11:02.91502	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	4673059908
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-25 09:11:02.927751	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	4673059908
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-25 09:11:02.934834	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	4673059908
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-25 09:11:02.981268	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	4673059908
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-25 09:11:03.104351	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	4673059908
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2019-11-25 09:11:03.160743	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	4673059908
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2019-11-25 09:11:03.169999	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	4673059908
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2019-11-25 09:11:03.180742	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	4673059908
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2019-11-25 09:11:03.185214	62	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	4673059908
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2019-11-25 09:11:03.189027	63	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	4673059908
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2019-11-25 09:11:03.193367	64	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	4673059908
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2019-11-25 09:11:03.210616	65	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	4673059908
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2019-11-25 09:11:03.218554	66	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	4673059908
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2019-11-25 09:11:03.248427	67	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	4673059908
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2019-11-25 09:11:03.270786	68	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	4673059908
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2019-11-25 09:11:03.279737	69	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	4673059908
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	c7628938-2fbc-4bc4-a2c0-c44f73a945e2	f
master	959558d5-2498-4f4d-b504-1efdbeb3a193	t
master	981163b6-7677-47f8-9574-c99c14e1a5ed	t
master	da78286e-4c20-46d7-8b50-7a5fdecae14a	t
master	5c3d10a1-c229-4755-9aca-d6fc00f04366	f
master	2a159abc-a9dd-446a-b001-e5a3ec65a0dc	f
master	e53977ae-eb24-457f-8c2e-afa63f78fb46	t
master	10050cc7-c8fb-4448-b12f-1e44a15231ce	t
master	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52	f
springbootdemo	73a817cf-7e6e-4c5d-a20a-061dc9e08794	f
springbootdemo	57feb9c1-a4fe-4a2a-bd66-296b658e85d1	t
springbootdemo	09c8d07c-18d7-45fb-9682-1656c6af1f86	t
springbootdemo	726a7534-43a7-459d-bfe2-6e711bb7c381	t
springbootdemo	ce722919-fe73-48a0-94ee-9defc0d256eb	f
springbootdemo	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c	f
springbootdemo	a0583b2b-df29-4a62-a2b0-9243cffd4467	t
springbootdemo	88bc5bae-9d29-400d-93f3-be916c64bd68	t
springbootdemo	bfa393cf-ce22-4eea-8c37-89d9580b76a0	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_credential_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_credential_attribute (id, credential_id, name, value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, device, hash_iterations, salt, type, value, created_date, counter, digits, period, algorithm, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
23a6f689-951d-433e-8d1d-83298ef446c7	master	f	${role_admin}	admin	master	\N	master
d3dccc0f-2724-407b-85a9-d5b0ebb64c3a	master	f	${role_create-realm}	create-realm	master	\N	master
c641e881-a88b-41bc-977c-6b3582f2b1da	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_create-client}	create-client	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
28d8075d-327a-4187-a0db-41d0c69525f1	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_view-realm}	view-realm	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
90581d3a-2bb2-4023-98f4-d6127918d31e	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_view-users}	view-users	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
b2c837bb-bfa8-4fb9-93a9-633f794502a2	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_view-clients}	view-clients	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
705f7281-313e-4a4b-b49d-e35d3cb359fd	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_view-events}	view-events	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
f449a16a-eed3-434a-8192-1e4d07f308ca	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_view-identity-providers}	view-identity-providers	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
6a5a0ca5-f8df-4eef-9141-c4aee83c3013	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_view-authorization}	view-authorization	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
0f485977-72c8-4dc9-a613-e41d2c251167	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_manage-realm}	manage-realm	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
3296920a-dcf9-4821-b462-29f659e56164	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_manage-users}	manage-users	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
0596c1fc-b379-4507-8d9a-bd54cef1b1f4	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_manage-clients}	manage-clients	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
4403e6a0-efef-4a03-a891-3339fd6123fb	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_manage-events}	manage-events	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
ca9cf69d-3a98-4f89-8f97-1032f173efb2	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_manage-identity-providers}	manage-identity-providers	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
8640e350-543f-4d30-9c7c-e3fc44eb7f84	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_manage-authorization}	manage-authorization	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
1c4d9dde-4d17-483f-b47b-1f10cb460483	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_query-users}	query-users	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
0a81ae6d-c01e-4f10-901f-358070c48a0d	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_query-clients}	query-clients	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
f09e375a-7a7e-4c23-8326-a8315accc9ea	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_query-realms}	query-realms	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
761c8387-1530-416d-8d30-681549272de4	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_query-groups}	query-groups	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
4eceed7b-8038-4ad5-9520-e6d9e1cfd323	b1baf168-38e1-4ed7-b048-c4fb4da6515d	t	${role_view-profile}	view-profile	master	b1baf168-38e1-4ed7-b048-c4fb4da6515d	\N
d8806b86-b4c5-42ee-9299-dd26373903a1	b1baf168-38e1-4ed7-b048-c4fb4da6515d	t	${role_manage-account}	manage-account	master	b1baf168-38e1-4ed7-b048-c4fb4da6515d	\N
9760ff1e-a8a7-4371-846b-c1c08c916d36	b1baf168-38e1-4ed7-b048-c4fb4da6515d	t	${role_manage-account-links}	manage-account-links	master	b1baf168-38e1-4ed7-b048-c4fb4da6515d	\N
5ad5d61c-dfa6-47ff-83d3-c45ee50e6bd0	9e3f9bdd-ae70-42f1-b195-8ac62619fddb	t	${role_read-token}	read-token	master	9e3f9bdd-ae70-42f1-b195-8ac62619fddb	\N
d7a41063-c647-44b0-8890-387c90c4ff87	ebc8042a-5d5d-4108-9956-4b79ad9faff8	t	${role_impersonation}	impersonation	master	ebc8042a-5d5d-4108-9956-4b79ad9faff8	\N
c433d664-6c61-46c3-b7fc-cac7d80e82cf	master	f	${role_offline-access}	offline_access	master	\N	master
6db541db-fdab-46d8-8f50-76ccbafaa5ae	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
17b8929a-5061-41d4-b4f0-d8430e504c66	d334a082-af1d-419b-a39a-90211c50e772	t	${role_create-client}	create-client	master	d334a082-af1d-419b-a39a-90211c50e772	\N
0e3b210b-4128-48ab-801d-6358ce911b7b	d334a082-af1d-419b-a39a-90211c50e772	t	${role_view-realm}	view-realm	master	d334a082-af1d-419b-a39a-90211c50e772	\N
5f7693ed-8cea-4344-9af9-2c4b364c2307	d334a082-af1d-419b-a39a-90211c50e772	t	${role_view-users}	view-users	master	d334a082-af1d-419b-a39a-90211c50e772	\N
bab64d59-f244-4b8e-9265-ff4ab34ba3ee	d334a082-af1d-419b-a39a-90211c50e772	t	${role_view-clients}	view-clients	master	d334a082-af1d-419b-a39a-90211c50e772	\N
1edb0dca-4b29-4116-b4d5-cf6c0687c521	d334a082-af1d-419b-a39a-90211c50e772	t	${role_view-events}	view-events	master	d334a082-af1d-419b-a39a-90211c50e772	\N
29a77a6e-0975-40b1-9b27-b2d3a7b40752	d334a082-af1d-419b-a39a-90211c50e772	t	${role_view-identity-providers}	view-identity-providers	master	d334a082-af1d-419b-a39a-90211c50e772	\N
bad793b5-d178-4a56-b4ed-604bfcac3eed	d334a082-af1d-419b-a39a-90211c50e772	t	${role_view-authorization}	view-authorization	master	d334a082-af1d-419b-a39a-90211c50e772	\N
0e778020-af3c-407d-84e7-5a6b4775a29a	d334a082-af1d-419b-a39a-90211c50e772	t	${role_manage-realm}	manage-realm	master	d334a082-af1d-419b-a39a-90211c50e772	\N
edefccdd-55e6-4b1d-a377-69104926f549	d334a082-af1d-419b-a39a-90211c50e772	t	${role_manage-users}	manage-users	master	d334a082-af1d-419b-a39a-90211c50e772	\N
b6f4378d-a606-4250-baf1-cc0b00889cdd	d334a082-af1d-419b-a39a-90211c50e772	t	${role_manage-clients}	manage-clients	master	d334a082-af1d-419b-a39a-90211c50e772	\N
2647811f-48ff-4147-8c5f-01ca0c92f62b	d334a082-af1d-419b-a39a-90211c50e772	t	${role_manage-events}	manage-events	master	d334a082-af1d-419b-a39a-90211c50e772	\N
3aef83fc-3181-493a-a87f-75ba211a852a	d334a082-af1d-419b-a39a-90211c50e772	t	${role_manage-identity-providers}	manage-identity-providers	master	d334a082-af1d-419b-a39a-90211c50e772	\N
63f279f5-7e45-4f35-b09a-8e2ad8d6837f	d334a082-af1d-419b-a39a-90211c50e772	t	${role_manage-authorization}	manage-authorization	master	d334a082-af1d-419b-a39a-90211c50e772	\N
ab8e982b-0b57-4775-a019-614e65805d82	d334a082-af1d-419b-a39a-90211c50e772	t	${role_query-users}	query-users	master	d334a082-af1d-419b-a39a-90211c50e772	\N
e2ab6dcf-be3c-473c-929d-377fd859fa3f	d334a082-af1d-419b-a39a-90211c50e772	t	${role_query-clients}	query-clients	master	d334a082-af1d-419b-a39a-90211c50e772	\N
0c798853-6e18-472a-9d7e-390b4e38190a	d334a082-af1d-419b-a39a-90211c50e772	t	${role_query-realms}	query-realms	master	d334a082-af1d-419b-a39a-90211c50e772	\N
496cdab8-5e72-46c1-ac26-907251dbbdce	d334a082-af1d-419b-a39a-90211c50e772	t	${role_query-groups}	query-groups	master	d334a082-af1d-419b-a39a-90211c50e772	\N
a4b6950a-7fc7-449b-a488-5ec373f900ef	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_realm-admin}	realm-admin	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
429569e7-016c-4ec2-98ca-ab3038959ea1	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_create-client}	create-client	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
69fd0615-74e8-40d3-a923-b6e7dec497a6	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_view-realm}	view-realm	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
b85bcd05-36e9-4870-a06d-deee4a258579	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_view-users}	view-users	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
5f229545-51ae-4e37-b616-46bd9494c3cc	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_view-clients}	view-clients	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
07b0f071-6677-4596-a694-06f89032c83b	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_view-events}	view-events	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
d9b8f8e4-c294-4f89-a0ee-5328fb3c9949	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_view-identity-providers}	view-identity-providers	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
690ac34a-511d-4af4-a93f-cd123f733a09	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_view-authorization}	view-authorization	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
00bfa525-3ed6-4784-b1c2-97daff141ed9	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_manage-realm}	manage-realm	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
d25ff2eb-ce3c-408d-8a5d-9d6d70977e42	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_manage-users}	manage-users	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
8087d232-5e47-4b1c-8f3a-b8ce1d6ef2d8	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_manage-clients}	manage-clients	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
d5101c1f-1435-4a96-a0ef-7bd8e4c2f834	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_manage-events}	manage-events	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
8b1145f9-6385-4054-b245-de4200dd5c0e	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_manage-identity-providers}	manage-identity-providers	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
70e9c6ce-0330-4824-ac29-f206f394e7dd	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_manage-authorization}	manage-authorization	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
32583e4b-4f51-4057-a428-fe5a7a3f72cf	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_query-users}	query-users	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
5a9184a4-316e-4d16-bc19-fc728f54039f	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_query-clients}	query-clients	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
8e6b00fa-0cde-4ec6-90d0-cbe4dba471a1	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_query-realms}	query-realms	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
aac3ef66-db2f-4e61-b2b4-641d633f7d5d	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_query-groups}	query-groups	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
a7b934e1-3a7e-482c-97ca-3615b2ac1161	cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	t	${role_view-profile}	view-profile	springbootdemo	cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	\N
7e06319f-247e-4090-990c-7bc06d1309a5	cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	t	${role_manage-account}	manage-account	springbootdemo	cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	\N
895f640a-5d44-4995-9755-1c5b3461b0cb	cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	t	${role_manage-account-links}	manage-account-links	springbootdemo	cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	\N
76f4ba59-912f-4302-8267-eb30a8c0dab2	d334a082-af1d-419b-a39a-90211c50e772	t	${role_impersonation}	impersonation	master	d334a082-af1d-419b-a39a-90211c50e772	\N
93b3d90a-d9d8-4ddd-b04e-e51c9fd0b531	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	t	${role_impersonation}	impersonation	springbootdemo	94d3ef86-fb85-46fa-b8c9-d3b69f15b4ff	\N
a5474d55-7253-494d-9411-93eff27e94c3	3033351d-7dca-480d-bc93-004d7739d9c5	t	${role_read-token}	read-token	springbootdemo	3033351d-7dca-480d-bc93-004d7739d9c5	\N
606e1885-04cc-4be2-b39c-28eec4c12a0a	springbootdemo	f	${role_offline-access}	offline_access	springbootdemo	\N	springbootdemo
ab0cd474-9e39-46ba-81d4-c9826de7b3a3	springbootdemo	f	${role_uma_authorization}	uma_authorization	springbootdemo	\N	springbootdemo
ed985f50-76f0-4d60-9d46-242281d3594d	springbootdemo	f	\N	springbootdemo	springbootdemo	\N	springbootdemo
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version) FROM stdin;
SINGLETON	4.6.0
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
17484a03-9546-43a9-aa9f-6ee569960d29	locale	openid-connect	oidc-usermodel-attribute-mapper	e7830d6e-6f4d-49e3-83bf-4c36945a7d82	\N
0a010eed-c327-4cb2-ade3-180e7bcb93cc	role list	saml	saml-role-list-mapper	\N	959558d5-2498-4f4d-b504-1efdbeb3a193
ce63351e-17b0-4e62-961e-aaed465242b6	full name	openid-connect	oidc-full-name-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
73185df2-4fe4-4b2a-8ecc-bb56d833092b	family name	openid-connect	oidc-usermodel-property-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
35d8b70c-0f9a-4824-9885-37acd04401ce	given name	openid-connect	oidc-usermodel-property-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
06957abb-41f2-4666-bf5a-58e3602767e3	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
7675a8b1-693c-48cc-a880-1af162a8937e	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
6d3f2b5a-e8d4-40b3-9ef1-e47e9fad9924	username	openid-connect	oidc-usermodel-property-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
d8336265-5410-49e1-b686-b802b586fd2d	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
5495e9cb-158e-48f6-a58c-07607a34bf08	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
8e213ec7-b2bf-4caa-bf76-4d7880444e0d	website	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
d42d291e-ee0a-47bf-b473-7975ed6790a1	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
07041613-ca67-40be-9929-36d61c997da1	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
9fc2bc51-5658-45be-997a-2855a0536371	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
09b473cb-0f06-4835-9562-11a110f014bd	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
dc79d921-0675-47c5-9180-045bf024d1c4	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	981163b6-7677-47f8-9574-c99c14e1a5ed
7b8e9d61-0642-4d25-8cca-b960e0f9ac77	email	openid-connect	oidc-usermodel-property-mapper	\N	da78286e-4c20-46d7-8b50-7a5fdecae14a
b8538134-9211-4458-876d-05ed9e1379bf	email verified	openid-connect	oidc-usermodel-property-mapper	\N	da78286e-4c20-46d7-8b50-7a5fdecae14a
a5393216-b8d1-43b7-94a1-5f750f0ade07	address	openid-connect	oidc-address-mapper	\N	5c3d10a1-c229-4755-9aca-d6fc00f04366
33afdd1c-b5ad-4370-bf9b-82eaabbed02e	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	2a159abc-a9dd-446a-b001-e5a3ec65a0dc
828f4f19-b190-41e0-8360-9e2f0257643d	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	2a159abc-a9dd-446a-b001-e5a3ec65a0dc
17f4f298-016e-4e41-bb04-f4596c357275	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	e53977ae-eb24-457f-8c2e-afa63f78fb46
74026f31-1ae2-4ae7-809b-02d13de5ef38	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	e53977ae-eb24-457f-8c2e-afa63f78fb46
23734b75-54d1-42c5-93a7-de24b7bc4744	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	e53977ae-eb24-457f-8c2e-afa63f78fb46
75a58d45-9844-43ef-87a5-b83a2417d85e	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	10050cc7-c8fb-4448-b12f-1e44a15231ce
f168f927-b851-4d65-a8e1-cb321c77a745	upn	openid-connect	oidc-usermodel-property-mapper	\N	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52
ef95887d-085e-4620-8ac3-7248d5cf2281	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	8dae9bec-9f90-4a7c-b83b-2b1bf4e34f52
e3141b5a-25ca-41b0-9ad1-39a077919453	role list	saml	saml-role-list-mapper	\N	57feb9c1-a4fe-4a2a-bd66-296b658e85d1
b13e8d05-bc18-4688-8f79-1d4ea6eeed76	full name	openid-connect	oidc-full-name-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
14e4d322-8487-4bca-931c-57f5199e589f	family name	openid-connect	oidc-usermodel-property-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
b63cdff3-404b-415b-ab30-0dcd1aec6fba	given name	openid-connect	oidc-usermodel-property-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
54fe7c04-1b95-482f-9f9f-29e4810faf40	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
dd9d8267-84d3-4eca-a92d-efe37dbde4eb	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
3a907933-e3aa-4683-aa7d-95e80fa06d38	username	openid-connect	oidc-usermodel-property-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
787c52b4-dcfb-4e5d-962d-da75fdf0b79b	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
4fb838f9-8e21-4d1f-8496-c8aad5d65291	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
38bc76e2-237d-44f7-be8f-899f64a2e763	website	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
c0c4ff83-d54b-4115-a28b-fc1f9aa71be2	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
c525a27c-984f-47c8-b2e4-18d97eefc51b	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
2818bd7f-ec6b-4b41-86ef-703c4ef437af	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
ba9b9381-a2fb-4861-b9cc-7fc7e58f4281	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
17a7423e-e33c-4559-a661-7d3ce942b86c	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	09c8d07c-18d7-45fb-9682-1656c6af1f86
9864eff5-7580-4a64-af7e-3035197eee6a	email	openid-connect	oidc-usermodel-property-mapper	\N	726a7534-43a7-459d-bfe2-6e711bb7c381
adbc6b14-a7ac-4330-ace0-55516401c1e0	email verified	openid-connect	oidc-usermodel-property-mapper	\N	726a7534-43a7-459d-bfe2-6e711bb7c381
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	address	openid-connect	oidc-address-mapper	\N	ce722919-fe73-48a0-94ee-9defc0d256eb
df76d37f-92de-4c68-aa80-04a822ff0b50	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c
819153f2-a655-47da-855b-08bb449c1618	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	0195ca74-287b-4eb7-9ecc-b51ab07dcc2c
dae9d27c-ff51-44f9-83cd-55ea371b7d7c	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	a0583b2b-df29-4a62-a2b0-9243cffd4467
60ec766b-1a58-48d3-94c9-ee38cb08fa10	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	a0583b2b-df29-4a62-a2b0-9243cffd4467
eb65cdc1-84b8-48f0-ab45-c5ce1f1d5e2f	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	a0583b2b-df29-4a62-a2b0-9243cffd4467
d050a695-e890-4738-9af7-20baa746f9b6	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	88bc5bae-9d29-400d-93f3-be916c64bd68
062110c7-6d46-4650-8bda-8fbf76756f82	upn	openid-connect	oidc-usermodel-property-mapper	\N	bfa393cf-ce22-4eea-8c37-89d9580b76a0
e6615922-aaa8-4513-9e89-709d54adaafe	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	bfa393cf-ce22-4eea-8c37-89d9580b76a0
187c5295-01af-4aba-bbec-1ba2e17948f9	locale	openid-connect	oidc-usermodel-attribute-mapper	7fb3bb78-3890-4d24-9e1e-77b8c574225b	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
17484a03-9546-43a9-aa9f-6ee569960d29	true	userinfo.token.claim
17484a03-9546-43a9-aa9f-6ee569960d29	locale	user.attribute
17484a03-9546-43a9-aa9f-6ee569960d29	true	id.token.claim
17484a03-9546-43a9-aa9f-6ee569960d29	true	access.token.claim
17484a03-9546-43a9-aa9f-6ee569960d29	locale	claim.name
17484a03-9546-43a9-aa9f-6ee569960d29	String	jsonType.label
0a010eed-c327-4cb2-ade3-180e7bcb93cc	false	single
0a010eed-c327-4cb2-ade3-180e7bcb93cc	Basic	attribute.nameformat
0a010eed-c327-4cb2-ade3-180e7bcb93cc	Role	attribute.name
ce63351e-17b0-4e62-961e-aaed465242b6	true	userinfo.token.claim
ce63351e-17b0-4e62-961e-aaed465242b6	true	id.token.claim
ce63351e-17b0-4e62-961e-aaed465242b6	true	access.token.claim
73185df2-4fe4-4b2a-8ecc-bb56d833092b	true	userinfo.token.claim
73185df2-4fe4-4b2a-8ecc-bb56d833092b	lastName	user.attribute
73185df2-4fe4-4b2a-8ecc-bb56d833092b	true	id.token.claim
73185df2-4fe4-4b2a-8ecc-bb56d833092b	true	access.token.claim
73185df2-4fe4-4b2a-8ecc-bb56d833092b	family_name	claim.name
73185df2-4fe4-4b2a-8ecc-bb56d833092b	String	jsonType.label
35d8b70c-0f9a-4824-9885-37acd04401ce	true	userinfo.token.claim
35d8b70c-0f9a-4824-9885-37acd04401ce	firstName	user.attribute
35d8b70c-0f9a-4824-9885-37acd04401ce	true	id.token.claim
35d8b70c-0f9a-4824-9885-37acd04401ce	true	access.token.claim
35d8b70c-0f9a-4824-9885-37acd04401ce	given_name	claim.name
35d8b70c-0f9a-4824-9885-37acd04401ce	String	jsonType.label
06957abb-41f2-4666-bf5a-58e3602767e3	true	userinfo.token.claim
06957abb-41f2-4666-bf5a-58e3602767e3	middleName	user.attribute
06957abb-41f2-4666-bf5a-58e3602767e3	true	id.token.claim
06957abb-41f2-4666-bf5a-58e3602767e3	true	access.token.claim
06957abb-41f2-4666-bf5a-58e3602767e3	middle_name	claim.name
06957abb-41f2-4666-bf5a-58e3602767e3	String	jsonType.label
7675a8b1-693c-48cc-a880-1af162a8937e	true	userinfo.token.claim
7675a8b1-693c-48cc-a880-1af162a8937e	nickname	user.attribute
7675a8b1-693c-48cc-a880-1af162a8937e	true	id.token.claim
7675a8b1-693c-48cc-a880-1af162a8937e	true	access.token.claim
7675a8b1-693c-48cc-a880-1af162a8937e	nickname	claim.name
7675a8b1-693c-48cc-a880-1af162a8937e	String	jsonType.label
6d3f2b5a-e8d4-40b3-9ef1-e47e9fad9924	true	userinfo.token.claim
6d3f2b5a-e8d4-40b3-9ef1-e47e9fad9924	username	user.attribute
6d3f2b5a-e8d4-40b3-9ef1-e47e9fad9924	true	id.token.claim
6d3f2b5a-e8d4-40b3-9ef1-e47e9fad9924	true	access.token.claim
6d3f2b5a-e8d4-40b3-9ef1-e47e9fad9924	preferred_username	claim.name
6d3f2b5a-e8d4-40b3-9ef1-e47e9fad9924	String	jsonType.label
d8336265-5410-49e1-b686-b802b586fd2d	true	userinfo.token.claim
d8336265-5410-49e1-b686-b802b586fd2d	profile	user.attribute
d8336265-5410-49e1-b686-b802b586fd2d	true	id.token.claim
d8336265-5410-49e1-b686-b802b586fd2d	true	access.token.claim
d8336265-5410-49e1-b686-b802b586fd2d	profile	claim.name
d8336265-5410-49e1-b686-b802b586fd2d	String	jsonType.label
5495e9cb-158e-48f6-a58c-07607a34bf08	true	userinfo.token.claim
5495e9cb-158e-48f6-a58c-07607a34bf08	picture	user.attribute
5495e9cb-158e-48f6-a58c-07607a34bf08	true	id.token.claim
5495e9cb-158e-48f6-a58c-07607a34bf08	true	access.token.claim
5495e9cb-158e-48f6-a58c-07607a34bf08	picture	claim.name
5495e9cb-158e-48f6-a58c-07607a34bf08	String	jsonType.label
8e213ec7-b2bf-4caa-bf76-4d7880444e0d	true	userinfo.token.claim
8e213ec7-b2bf-4caa-bf76-4d7880444e0d	website	user.attribute
8e213ec7-b2bf-4caa-bf76-4d7880444e0d	true	id.token.claim
8e213ec7-b2bf-4caa-bf76-4d7880444e0d	true	access.token.claim
8e213ec7-b2bf-4caa-bf76-4d7880444e0d	website	claim.name
8e213ec7-b2bf-4caa-bf76-4d7880444e0d	String	jsonType.label
d42d291e-ee0a-47bf-b473-7975ed6790a1	true	userinfo.token.claim
d42d291e-ee0a-47bf-b473-7975ed6790a1	gender	user.attribute
d42d291e-ee0a-47bf-b473-7975ed6790a1	true	id.token.claim
d42d291e-ee0a-47bf-b473-7975ed6790a1	true	access.token.claim
d42d291e-ee0a-47bf-b473-7975ed6790a1	gender	claim.name
d42d291e-ee0a-47bf-b473-7975ed6790a1	String	jsonType.label
07041613-ca67-40be-9929-36d61c997da1	true	userinfo.token.claim
07041613-ca67-40be-9929-36d61c997da1	birthdate	user.attribute
07041613-ca67-40be-9929-36d61c997da1	true	id.token.claim
07041613-ca67-40be-9929-36d61c997da1	true	access.token.claim
07041613-ca67-40be-9929-36d61c997da1	birthdate	claim.name
07041613-ca67-40be-9929-36d61c997da1	String	jsonType.label
9fc2bc51-5658-45be-997a-2855a0536371	true	userinfo.token.claim
9fc2bc51-5658-45be-997a-2855a0536371	zoneinfo	user.attribute
9fc2bc51-5658-45be-997a-2855a0536371	true	id.token.claim
9fc2bc51-5658-45be-997a-2855a0536371	true	access.token.claim
9fc2bc51-5658-45be-997a-2855a0536371	zoneinfo	claim.name
9fc2bc51-5658-45be-997a-2855a0536371	String	jsonType.label
09b473cb-0f06-4835-9562-11a110f014bd	true	userinfo.token.claim
09b473cb-0f06-4835-9562-11a110f014bd	locale	user.attribute
09b473cb-0f06-4835-9562-11a110f014bd	true	id.token.claim
09b473cb-0f06-4835-9562-11a110f014bd	true	access.token.claim
09b473cb-0f06-4835-9562-11a110f014bd	locale	claim.name
09b473cb-0f06-4835-9562-11a110f014bd	String	jsonType.label
dc79d921-0675-47c5-9180-045bf024d1c4	true	userinfo.token.claim
dc79d921-0675-47c5-9180-045bf024d1c4	updatedAt	user.attribute
dc79d921-0675-47c5-9180-045bf024d1c4	true	id.token.claim
dc79d921-0675-47c5-9180-045bf024d1c4	true	access.token.claim
dc79d921-0675-47c5-9180-045bf024d1c4	updated_at	claim.name
dc79d921-0675-47c5-9180-045bf024d1c4	String	jsonType.label
7b8e9d61-0642-4d25-8cca-b960e0f9ac77	true	userinfo.token.claim
7b8e9d61-0642-4d25-8cca-b960e0f9ac77	email	user.attribute
7b8e9d61-0642-4d25-8cca-b960e0f9ac77	true	id.token.claim
7b8e9d61-0642-4d25-8cca-b960e0f9ac77	true	access.token.claim
7b8e9d61-0642-4d25-8cca-b960e0f9ac77	email	claim.name
7b8e9d61-0642-4d25-8cca-b960e0f9ac77	String	jsonType.label
b8538134-9211-4458-876d-05ed9e1379bf	true	userinfo.token.claim
b8538134-9211-4458-876d-05ed9e1379bf	emailVerified	user.attribute
b8538134-9211-4458-876d-05ed9e1379bf	true	id.token.claim
b8538134-9211-4458-876d-05ed9e1379bf	true	access.token.claim
b8538134-9211-4458-876d-05ed9e1379bf	email_verified	claim.name
b8538134-9211-4458-876d-05ed9e1379bf	boolean	jsonType.label
a5393216-b8d1-43b7-94a1-5f750f0ade07	formatted	user.attribute.formatted
a5393216-b8d1-43b7-94a1-5f750f0ade07	country	user.attribute.country
a5393216-b8d1-43b7-94a1-5f750f0ade07	postal_code	user.attribute.postal_code
a5393216-b8d1-43b7-94a1-5f750f0ade07	true	userinfo.token.claim
a5393216-b8d1-43b7-94a1-5f750f0ade07	street	user.attribute.street
a5393216-b8d1-43b7-94a1-5f750f0ade07	true	id.token.claim
a5393216-b8d1-43b7-94a1-5f750f0ade07	region	user.attribute.region
a5393216-b8d1-43b7-94a1-5f750f0ade07	true	access.token.claim
a5393216-b8d1-43b7-94a1-5f750f0ade07	locality	user.attribute.locality
33afdd1c-b5ad-4370-bf9b-82eaabbed02e	true	userinfo.token.claim
33afdd1c-b5ad-4370-bf9b-82eaabbed02e	phoneNumber	user.attribute
33afdd1c-b5ad-4370-bf9b-82eaabbed02e	true	id.token.claim
33afdd1c-b5ad-4370-bf9b-82eaabbed02e	true	access.token.claim
33afdd1c-b5ad-4370-bf9b-82eaabbed02e	phone_number	claim.name
33afdd1c-b5ad-4370-bf9b-82eaabbed02e	String	jsonType.label
828f4f19-b190-41e0-8360-9e2f0257643d	true	userinfo.token.claim
828f4f19-b190-41e0-8360-9e2f0257643d	phoneNumberVerified	user.attribute
828f4f19-b190-41e0-8360-9e2f0257643d	true	id.token.claim
828f4f19-b190-41e0-8360-9e2f0257643d	true	access.token.claim
828f4f19-b190-41e0-8360-9e2f0257643d	phone_number_verified	claim.name
828f4f19-b190-41e0-8360-9e2f0257643d	boolean	jsonType.label
17f4f298-016e-4e41-bb04-f4596c357275	true	multivalued
17f4f298-016e-4e41-bb04-f4596c357275	foo	user.attribute
17f4f298-016e-4e41-bb04-f4596c357275	true	access.token.claim
17f4f298-016e-4e41-bb04-f4596c357275	realm_access.roles	claim.name
17f4f298-016e-4e41-bb04-f4596c357275	String	jsonType.label
74026f31-1ae2-4ae7-809b-02d13de5ef38	true	multivalued
74026f31-1ae2-4ae7-809b-02d13de5ef38	foo	user.attribute
74026f31-1ae2-4ae7-809b-02d13de5ef38	true	access.token.claim
74026f31-1ae2-4ae7-809b-02d13de5ef38	resource_access.${client_id}.roles	claim.name
74026f31-1ae2-4ae7-809b-02d13de5ef38	String	jsonType.label
f168f927-b851-4d65-a8e1-cb321c77a745	true	userinfo.token.claim
f168f927-b851-4d65-a8e1-cb321c77a745	username	user.attribute
f168f927-b851-4d65-a8e1-cb321c77a745	true	id.token.claim
f168f927-b851-4d65-a8e1-cb321c77a745	true	access.token.claim
f168f927-b851-4d65-a8e1-cb321c77a745	upn	claim.name
f168f927-b851-4d65-a8e1-cb321c77a745	String	jsonType.label
ef95887d-085e-4620-8ac3-7248d5cf2281	true	multivalued
ef95887d-085e-4620-8ac3-7248d5cf2281	foo	user.attribute
ef95887d-085e-4620-8ac3-7248d5cf2281	true	id.token.claim
ef95887d-085e-4620-8ac3-7248d5cf2281	true	access.token.claim
ef95887d-085e-4620-8ac3-7248d5cf2281	groups	claim.name
ef95887d-085e-4620-8ac3-7248d5cf2281	String	jsonType.label
e3141b5a-25ca-41b0-9ad1-39a077919453	false	single
e3141b5a-25ca-41b0-9ad1-39a077919453	Basic	attribute.nameformat
e3141b5a-25ca-41b0-9ad1-39a077919453	Role	attribute.name
b13e8d05-bc18-4688-8f79-1d4ea6eeed76	true	userinfo.token.claim
b13e8d05-bc18-4688-8f79-1d4ea6eeed76	true	id.token.claim
b13e8d05-bc18-4688-8f79-1d4ea6eeed76	true	access.token.claim
14e4d322-8487-4bca-931c-57f5199e589f	true	userinfo.token.claim
14e4d322-8487-4bca-931c-57f5199e589f	lastName	user.attribute
14e4d322-8487-4bca-931c-57f5199e589f	true	id.token.claim
14e4d322-8487-4bca-931c-57f5199e589f	true	access.token.claim
14e4d322-8487-4bca-931c-57f5199e589f	family_name	claim.name
14e4d322-8487-4bca-931c-57f5199e589f	String	jsonType.label
b63cdff3-404b-415b-ab30-0dcd1aec6fba	true	userinfo.token.claim
b63cdff3-404b-415b-ab30-0dcd1aec6fba	firstName	user.attribute
b63cdff3-404b-415b-ab30-0dcd1aec6fba	true	id.token.claim
b63cdff3-404b-415b-ab30-0dcd1aec6fba	true	access.token.claim
b63cdff3-404b-415b-ab30-0dcd1aec6fba	given_name	claim.name
b63cdff3-404b-415b-ab30-0dcd1aec6fba	String	jsonType.label
54fe7c04-1b95-482f-9f9f-29e4810faf40	true	userinfo.token.claim
54fe7c04-1b95-482f-9f9f-29e4810faf40	middleName	user.attribute
54fe7c04-1b95-482f-9f9f-29e4810faf40	true	id.token.claim
54fe7c04-1b95-482f-9f9f-29e4810faf40	true	access.token.claim
54fe7c04-1b95-482f-9f9f-29e4810faf40	middle_name	claim.name
54fe7c04-1b95-482f-9f9f-29e4810faf40	String	jsonType.label
dd9d8267-84d3-4eca-a92d-efe37dbde4eb	true	userinfo.token.claim
dd9d8267-84d3-4eca-a92d-efe37dbde4eb	nickname	user.attribute
dd9d8267-84d3-4eca-a92d-efe37dbde4eb	true	id.token.claim
dd9d8267-84d3-4eca-a92d-efe37dbde4eb	true	access.token.claim
dd9d8267-84d3-4eca-a92d-efe37dbde4eb	nickname	claim.name
dd9d8267-84d3-4eca-a92d-efe37dbde4eb	String	jsonType.label
3a907933-e3aa-4683-aa7d-95e80fa06d38	true	userinfo.token.claim
3a907933-e3aa-4683-aa7d-95e80fa06d38	username	user.attribute
3a907933-e3aa-4683-aa7d-95e80fa06d38	true	id.token.claim
3a907933-e3aa-4683-aa7d-95e80fa06d38	true	access.token.claim
3a907933-e3aa-4683-aa7d-95e80fa06d38	preferred_username	claim.name
3a907933-e3aa-4683-aa7d-95e80fa06d38	String	jsonType.label
787c52b4-dcfb-4e5d-962d-da75fdf0b79b	true	userinfo.token.claim
787c52b4-dcfb-4e5d-962d-da75fdf0b79b	profile	user.attribute
787c52b4-dcfb-4e5d-962d-da75fdf0b79b	true	id.token.claim
787c52b4-dcfb-4e5d-962d-da75fdf0b79b	true	access.token.claim
787c52b4-dcfb-4e5d-962d-da75fdf0b79b	profile	claim.name
787c52b4-dcfb-4e5d-962d-da75fdf0b79b	String	jsonType.label
4fb838f9-8e21-4d1f-8496-c8aad5d65291	true	userinfo.token.claim
4fb838f9-8e21-4d1f-8496-c8aad5d65291	picture	user.attribute
4fb838f9-8e21-4d1f-8496-c8aad5d65291	true	id.token.claim
4fb838f9-8e21-4d1f-8496-c8aad5d65291	true	access.token.claim
4fb838f9-8e21-4d1f-8496-c8aad5d65291	picture	claim.name
4fb838f9-8e21-4d1f-8496-c8aad5d65291	String	jsonType.label
38bc76e2-237d-44f7-be8f-899f64a2e763	true	userinfo.token.claim
38bc76e2-237d-44f7-be8f-899f64a2e763	website	user.attribute
38bc76e2-237d-44f7-be8f-899f64a2e763	true	id.token.claim
38bc76e2-237d-44f7-be8f-899f64a2e763	true	access.token.claim
38bc76e2-237d-44f7-be8f-899f64a2e763	website	claim.name
38bc76e2-237d-44f7-be8f-899f64a2e763	String	jsonType.label
c0c4ff83-d54b-4115-a28b-fc1f9aa71be2	true	userinfo.token.claim
c0c4ff83-d54b-4115-a28b-fc1f9aa71be2	gender	user.attribute
c0c4ff83-d54b-4115-a28b-fc1f9aa71be2	true	id.token.claim
c0c4ff83-d54b-4115-a28b-fc1f9aa71be2	true	access.token.claim
c0c4ff83-d54b-4115-a28b-fc1f9aa71be2	gender	claim.name
c0c4ff83-d54b-4115-a28b-fc1f9aa71be2	String	jsonType.label
c525a27c-984f-47c8-b2e4-18d97eefc51b	true	userinfo.token.claim
c525a27c-984f-47c8-b2e4-18d97eefc51b	birthdate	user.attribute
c525a27c-984f-47c8-b2e4-18d97eefc51b	true	id.token.claim
c525a27c-984f-47c8-b2e4-18d97eefc51b	true	access.token.claim
c525a27c-984f-47c8-b2e4-18d97eefc51b	birthdate	claim.name
c525a27c-984f-47c8-b2e4-18d97eefc51b	String	jsonType.label
2818bd7f-ec6b-4b41-86ef-703c4ef437af	true	userinfo.token.claim
2818bd7f-ec6b-4b41-86ef-703c4ef437af	zoneinfo	user.attribute
2818bd7f-ec6b-4b41-86ef-703c4ef437af	true	id.token.claim
2818bd7f-ec6b-4b41-86ef-703c4ef437af	true	access.token.claim
2818bd7f-ec6b-4b41-86ef-703c4ef437af	zoneinfo	claim.name
2818bd7f-ec6b-4b41-86ef-703c4ef437af	String	jsonType.label
ba9b9381-a2fb-4861-b9cc-7fc7e58f4281	true	userinfo.token.claim
ba9b9381-a2fb-4861-b9cc-7fc7e58f4281	locale	user.attribute
ba9b9381-a2fb-4861-b9cc-7fc7e58f4281	true	id.token.claim
ba9b9381-a2fb-4861-b9cc-7fc7e58f4281	true	access.token.claim
ba9b9381-a2fb-4861-b9cc-7fc7e58f4281	locale	claim.name
ba9b9381-a2fb-4861-b9cc-7fc7e58f4281	String	jsonType.label
17a7423e-e33c-4559-a661-7d3ce942b86c	true	userinfo.token.claim
17a7423e-e33c-4559-a661-7d3ce942b86c	updatedAt	user.attribute
17a7423e-e33c-4559-a661-7d3ce942b86c	true	id.token.claim
17a7423e-e33c-4559-a661-7d3ce942b86c	true	access.token.claim
17a7423e-e33c-4559-a661-7d3ce942b86c	updated_at	claim.name
17a7423e-e33c-4559-a661-7d3ce942b86c	String	jsonType.label
9864eff5-7580-4a64-af7e-3035197eee6a	true	userinfo.token.claim
9864eff5-7580-4a64-af7e-3035197eee6a	email	user.attribute
9864eff5-7580-4a64-af7e-3035197eee6a	true	id.token.claim
9864eff5-7580-4a64-af7e-3035197eee6a	true	access.token.claim
9864eff5-7580-4a64-af7e-3035197eee6a	email	claim.name
9864eff5-7580-4a64-af7e-3035197eee6a	String	jsonType.label
adbc6b14-a7ac-4330-ace0-55516401c1e0	true	userinfo.token.claim
adbc6b14-a7ac-4330-ace0-55516401c1e0	emailVerified	user.attribute
adbc6b14-a7ac-4330-ace0-55516401c1e0	true	id.token.claim
adbc6b14-a7ac-4330-ace0-55516401c1e0	true	access.token.claim
adbc6b14-a7ac-4330-ace0-55516401c1e0	email_verified	claim.name
adbc6b14-a7ac-4330-ace0-55516401c1e0	boolean	jsonType.label
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	formatted	user.attribute.formatted
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	country	user.attribute.country
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	postal_code	user.attribute.postal_code
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	true	userinfo.token.claim
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	street	user.attribute.street
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	true	id.token.claim
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	region	user.attribute.region
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	true	access.token.claim
d911a4d7-2dd9-4f5b-8caf-b7ea3d08cb55	locality	user.attribute.locality
df76d37f-92de-4c68-aa80-04a822ff0b50	true	userinfo.token.claim
df76d37f-92de-4c68-aa80-04a822ff0b50	phoneNumber	user.attribute
df76d37f-92de-4c68-aa80-04a822ff0b50	true	id.token.claim
df76d37f-92de-4c68-aa80-04a822ff0b50	true	access.token.claim
df76d37f-92de-4c68-aa80-04a822ff0b50	phone_number	claim.name
df76d37f-92de-4c68-aa80-04a822ff0b50	String	jsonType.label
819153f2-a655-47da-855b-08bb449c1618	true	userinfo.token.claim
819153f2-a655-47da-855b-08bb449c1618	phoneNumberVerified	user.attribute
819153f2-a655-47da-855b-08bb449c1618	true	id.token.claim
819153f2-a655-47da-855b-08bb449c1618	true	access.token.claim
819153f2-a655-47da-855b-08bb449c1618	phone_number_verified	claim.name
819153f2-a655-47da-855b-08bb449c1618	boolean	jsonType.label
dae9d27c-ff51-44f9-83cd-55ea371b7d7c	true	multivalued
dae9d27c-ff51-44f9-83cd-55ea371b7d7c	foo	user.attribute
dae9d27c-ff51-44f9-83cd-55ea371b7d7c	true	access.token.claim
dae9d27c-ff51-44f9-83cd-55ea371b7d7c	realm_access.roles	claim.name
dae9d27c-ff51-44f9-83cd-55ea371b7d7c	String	jsonType.label
60ec766b-1a58-48d3-94c9-ee38cb08fa10	true	multivalued
60ec766b-1a58-48d3-94c9-ee38cb08fa10	foo	user.attribute
60ec766b-1a58-48d3-94c9-ee38cb08fa10	true	access.token.claim
60ec766b-1a58-48d3-94c9-ee38cb08fa10	resource_access.${client_id}.roles	claim.name
60ec766b-1a58-48d3-94c9-ee38cb08fa10	String	jsonType.label
062110c7-6d46-4650-8bda-8fbf76756f82	true	userinfo.token.claim
062110c7-6d46-4650-8bda-8fbf76756f82	username	user.attribute
062110c7-6d46-4650-8bda-8fbf76756f82	true	id.token.claim
062110c7-6d46-4650-8bda-8fbf76756f82	true	access.token.claim
062110c7-6d46-4650-8bda-8fbf76756f82	upn	claim.name
062110c7-6d46-4650-8bda-8fbf76756f82	String	jsonType.label
e6615922-aaa8-4513-9e89-709d54adaafe	true	multivalued
e6615922-aaa8-4513-9e89-709d54adaafe	foo	user.attribute
e6615922-aaa8-4513-9e89-709d54adaafe	true	id.token.claim
e6615922-aaa8-4513-9e89-709d54adaafe	true	access.token.claim
e6615922-aaa8-4513-9e89-709d54adaafe	groups	claim.name
e6615922-aaa8-4513-9e89-709d54adaafe	String	jsonType.label
187c5295-01af-4aba-bbec-1ba2e17948f9	true	userinfo.token.claim
187c5295-01af-4aba-bbec-1ba2e17948f9	locale	user.attribute
187c5295-01af-4aba-bbec-1ba2e17948f9	true	id.token.claim
187c5295-01af-4aba-bbec-1ba2e17948f9	true	access.token.claim
187c5295-01af-4aba-bbec-1ba2e17948f9	locale	claim.name
187c5295-01af-4aba-bbec-1ba2e17948f9	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
springbootdemo	60	300	300	\N	\N	\N	t	f	0	\N	springbootdemo	0	\N	t	f	f	f	NONE	1800	36000	f	f	d334a082-af1d-419b-a39a-90211c50e772	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	d6fc056f-b7db-45ed-ac6d-3ad716777462	216c6b7b-8bb4-4667-bd8c-c7c137d74e9e	8d8a02eb-9114-4703-897c-68ce6a0d76c0	5c14f71c-0995-407d-9e9b-d825d557eb17	28d31dd5-456e-4871-90c7-285536e2d3c1	2592000	f	900	t	f	d1fda7f2-958c-427c-9b07-50a2b6ff8494	0	f	0	0
master	60	300	60	keycloak	keycloak	keycloak	t	f	0	keycloak	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	ebc8042a-5d5d-4108-9956-4b79ad9faff8	1800	t	zh-CN	f	f	f	f	0	1	30	6	HmacSHA1	totp	e6251d47-fb79-4981-b93d-0ef1d037ec34	75498bf3-3281-4d6f-94d6-2804621b2cce	f1fc046b-9139-407e-9946-5b9c9e737e03	b0fbae2a-179f-4005-8031-10f87fbaa4e6	8e93e0bb-138a-4630-af97-5379c4be9b64	2592000	f	900	t	f	651e3842-5a42-4126-bfa0-8fa00ebb3398	0	f	0	0
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
actionTokenGeneratedByAdminLifespan	43200	master
actionTokenGeneratedByUserLifespan	300	master
_browser_header.contentSecurityPolicyReportOnly		springbootdemo
_browser_header.xContentTypeOptions	nosniff	springbootdemo
_browser_header.xRobotsTag	none	springbootdemo
_browser_header.xFrameOptions	SAMEORIGIN	springbootdemo
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	springbootdemo
_browser_header.xXSSProtection	1; mode=block	springbootdemo
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	springbootdemo
bruteForceProtected	false	springbootdemo
permanentLockout	false	springbootdemo
maxFailureWaitSeconds	900	springbootdemo
minimumQuickLoginWaitSeconds	60	springbootdemo
waitIncrementSeconds	60	springbootdemo
quickLoginCheckMilliSeconds	1000	springbootdemo
maxDeltaTimeSeconds	43200	springbootdemo
failureFactor	30	springbootdemo
offlineSessionMaxLifespanEnabled	false	springbootdemo
offlineSessionMaxLifespan	5184000	springbootdemo
actionTokenGeneratedByAdminLifespan	43200	springbootdemo
actionTokenGeneratedByUserLifespan	300	springbootdemo
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	c433d664-6c61-46c3-b7fc-cac7d80e82cf
master	6db541db-fdab-46d8-8f50-76ccbafaa5ae
springbootdemo	606e1885-04cc-4be2-b39c-28eec4c12a0a
springbootdemo	ab0cd474-9e39-46ba-81d4-c9826de7b3a3
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
springbootdemo	jboss-logging
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	springbootdemo
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
master	de
master	no
master	ru
master	sv
master	pt-BR
master	lt
master	en
master	it
master	fr
master	zh-CN
master	es
master	ja
master	sk
master	pl
master	ca
master	nl
master	tr
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
b1baf168-38e1-4ed7-b048-c4fb4da6515d	/auth/realms/master/account/*
e7830d6e-6f4d-49e3-83bf-4c36945a7d82	/auth/admin/master/console/*
cd27eb4f-e6f7-4558-9cd3-7bb15a19a20f	/auth/realms/springbootdemo/account/*
7fb3bb78-3890-4d24-9e1e-77b8c574225b	/auth/admin/springbootdemo/console/*
889e8c59-7152-4b68-8e4f-66713ca62719	http://49.234.207.79:8088/*
889e8c59-7152-4b68-8e4f-66713ca62719	http://127.0.0.1:8088/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
53f45ad7-bd24-4bb0-868f-07849a8858f9	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
d0bc83f0-2600-42c7-9a2a-1e51c2f7649b	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
2590beb5-6ad2-4c69-9821-8ec2cd52083c	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
4412f68e-9e13-40ef-9dfe-2e8c9c1c7b0d	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
a85abbf6-06fe-45ae-9976-88ba0cd38f2c	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
3a5c871b-bb1f-4cf8-943a-a2c8a5c2bad7	VERIFY_EMAIL	Verify Email	springbootdemo	t	f	VERIFY_EMAIL	50
45f9bd4b-8eaf-44c7-a9d4-c4ecc5a3d182	UPDATE_PROFILE	Update Profile	springbootdemo	t	f	UPDATE_PROFILE	40
2e79f9f7-d059-4d4f-a466-decf4f5bc955	CONFIGURE_TOTP	Configure OTP	springbootdemo	t	f	CONFIGURE_TOTP	10
73e73ebb-e0f6-49b3-983d-b5bf458fc7b8	UPDATE_PASSWORD	Update Password	springbootdemo	t	f	UPDATE_PASSWORD	30
1f5c9aeb-283c-4c26-b5d9-a9d3cdbf2981	terms_and_conditions	Terms and Conditions	springbootdemo	f	f	terms_and_conditions	20
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
locale	zh-CN	c5eee830-8a39-4ab5-8b86-9b86c42acd13	9128e889-4410-43a9-bf8f-efe08a3e024e
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
c5eee830-8a39-4ab5-8b86-9b86c42acd13	\N	b50bc656-73fe-446b-b9d6-d1f5ad07de01	f	t	\N	\N	\N	master	admin	1574673073329	\N	0
426c9380-2262-4211-977f-0dcb668523d0	522587553@qq.com	522587553@qq.com	f	t	\N	腾笙	傅	springbootdemo	futs	1574677617625	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
d8806b86-b4c5-42ee-9299-dd26373903a1	c5eee830-8a39-4ab5-8b86-9b86c42acd13
c433d664-6c61-46c3-b7fc-cac7d80e82cf	c5eee830-8a39-4ab5-8b86-9b86c42acd13
6db541db-fdab-46d8-8f50-76ccbafaa5ae	c5eee830-8a39-4ab5-8b86-9b86c42acd13
4eceed7b-8038-4ad5-9520-e6d9e1cfd323	c5eee830-8a39-4ab5-8b86-9b86c42acd13
23a6f689-951d-433e-8d1d-83298ef446c7	c5eee830-8a39-4ab5-8b86-9b86c42acd13
a7b934e1-3a7e-482c-97ca-3615b2ac1161	426c9380-2262-4211-977f-0dcb668523d0
7e06319f-247e-4090-990c-7bc06d1309a5	426c9380-2262-4211-977f-0dcb668523d0
ed985f50-76f0-4d60-9d46-242281d3594d	426c9380-2262-4211-977f-0dcb668523d0
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: credential_attribute constraint_credential_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential_attribute
    ADD CONSTRAINT constraint_credential_attr PRIMARY KEY (id);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: fed_credential_attribute constraint_fed_credential_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_credential_attribute
    ADD CONSTRAINT constraint_fed_credential_attr PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_credential_attr_cred; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_credential_attr_cred ON public.credential_attribute USING btree (credential_id);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_fed_cred_attr_cred; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fed_cred_attr_cred ON public.fed_credential_attribute USING btree (credential_id);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: credential_attribute fk_cred_attr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential_attribute
    ADD CONSTRAINT fk_cred_attr FOREIGN KEY (credential_id) REFERENCES public.credential(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: fed_credential_attribute fk_fed_cred_attr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_credential_attribute
    ADD CONSTRAINT fk_fed_cred_attr FOREIGN KEY (credential_id) REFERENCES public.fed_user_credential(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: keycloak_role fk_kjho5le2c0ral09fl8cm9wfw9; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_kjho5le2c0ral09fl8cm9wfw9 FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: realm fk_traf444kk6qrkms7n56aiwq5y; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT fk_traf444kk6qrkms7n56aiwq5y FOREIGN KEY (master_admin_client) REFERENCES public.client(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

