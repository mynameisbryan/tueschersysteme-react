--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Debian 15.8-1.pgdg120+1)
-- Dumped by pg_dump version 15.8 (Debian 15.8-1.pgdg120+1)

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

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO strapi;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO strapi;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO strapi;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_lnk_id_seq OWNER TO strapi;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO strapi;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO strapi;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO strapi;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO strapi;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO strapi;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_lnk_id_seq OWNER TO strapi;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: components_contactaddress_contactaddresses; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.components_contactaddress_contactaddresses (
    id integer NOT NULL,
    street character varying(255),
    city character varying(255),
    postal_code character varying(255),
    phone character varying(255),
    email character varying(255),
    opening_hours character varying(255)
);


ALTER TABLE public.components_contactaddress_contactaddresses OWNER TO strapi;

--
-- Name: components_contactaddress_contactaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.components_contactaddress_contactaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_contactaddress_contactaddresses_id_seq OWNER TO strapi;

--
-- Name: components_contactaddress_contactaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.components_contactaddress_contactaddresses_id_seq OWNED BY public.components_contactaddress_contactaddresses.id;


--
-- Name: components_contactaddress_contactformsettings; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.components_contactaddress_contactformsettings (
    id integer NOT NULL,
    success_message character varying(255),
    error_message character varying(255),
    privacy_text character varying(255),
    newsletter_text character varying(255),
    submit_button_text character varying(255)
);


ALTER TABLE public.components_contactaddress_contactformsettings OWNER TO strapi;

--
-- Name: components_contactaddress_contactformsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.components_contactaddress_contactformsettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_contactaddress_contactformsettings_id_seq OWNER TO strapi;

--
-- Name: components_contactaddress_contactformsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.components_contactaddress_contactformsettings_id_seq OWNED BY public.components_contactaddress_contactformsettings.id;


--
-- Name: components_features_feature_items; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.components_features_feature_items (
    id integer NOT NULL,
    title character varying(255),
    icon character varying(255)
);


ALTER TABLE public.components_features_feature_items OWNER TO strapi;

--
-- Name: components_features_feature_items_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.components_features_feature_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_features_feature_items_id_seq OWNER TO strapi;

--
-- Name: components_features_feature_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.components_features_feature_items_id_seq OWNED BY public.components_features_feature_items.id;


--
-- Name: contact_forms; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.contact_forms (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    message text,
    privacy boolean,
    newsletter boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    company character varying(255),
    want_contact boolean,
    method character varying(255),
    "time" character varying(255)
);


ALTER TABLE public.contact_forms OWNER TO strapi;

--
-- Name: contact_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.contact_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_forms_id_seq OWNER TO strapi;

--
-- Name: contact_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.contact_forms_id_seq OWNED BY public.contact_forms.id;


--
-- Name: contactsections; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.contactsections (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    subtitle character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    cta_text character varying(255)
);


ALTER TABLE public.contactsections OWNER TO strapi;

--
-- Name: contactsections_cmps; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.contactsections_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.contactsections_cmps OWNER TO strapi;

--
-- Name: contactsections_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.contactsections_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contactsections_cmps_id_seq OWNER TO strapi;

--
-- Name: contactsections_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.contactsections_cmps_id_seq OWNED BY public.contactsections_cmps.id;


--
-- Name: contactsections_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.contactsections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contactsections_id_seq OWNER TO strapi;

--
-- Name: contactsections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.contactsections_id_seq OWNED BY public.contactsections.id;


--
-- Name: faqs; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.faqs (
    id integer NOT NULL,
    document_id character varying(255),
    question text,
    answer text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.faqs OWNER TO strapi;

--
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.faqs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faqs_id_seq OWNER TO strapi;

--
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.faqs_id_seq OWNED BY public.faqs.id;


--
-- Name: file_and_resources; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.file_and_resources (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    file_type character varying(255),
    size numeric(10,2),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.file_and_resources OWNER TO strapi;

--
-- Name: file_and_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.file_and_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_and_resources_id_seq OWNER TO strapi;

--
-- Name: file_and_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.file_and_resources_id_seq OWNED BY public.file_and_resources.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO strapi;

--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO strapi;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_lnk_id_seq OWNER TO strapi;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO strapi;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO strapi;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_mph_id_seq OWNER TO strapi;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: hero_sections; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.hero_sections (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    description text,
    call_to_action_text character varying(255),
    call_to_action_link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.hero_sections OWNER TO strapi;

--
-- Name: hero_sections_cmps; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.hero_sections_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.hero_sections_cmps OWNER TO strapi;

--
-- Name: hero_sections_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.hero_sections_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hero_sections_cmps_id_seq OWNER TO strapi;

--
-- Name: hero_sections_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.hero_sections_cmps_id_seq OWNED BY public.hero_sections_cmps.id;


--
-- Name: hero_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.hero_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hero_sections_id_seq OWNER TO strapi;

--
-- Name: hero_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.hero_sections_id_seq OWNED BY public.hero_sections.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO strapi;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO strapi;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: impressums; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.impressums (
    id integer NOT NULL,
    document_id character varying(255),
    company_info jsonb,
    representative jsonb,
    contact jsonb,
    tax_info jsonb,
    content_responsible jsonb,
    liability_disclaimer jsonb,
    copyright_notice jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    data_policy jsonb,
    agb jsonb
);


ALTER TABLE public.impressums OWNER TO strapi;

--
-- Name: impressums_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.impressums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impressums_id_seq OWNER TO strapi;

--
-- Name: impressums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.impressums_id_seq OWNED BY public.impressums.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.product_categories (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    description character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    "order" integer,
    short_description character varying(255)
);


ALTER TABLE public.product_categories OWNER TO strapi;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.product_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO strapi;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.products (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    short_description character varying(255),
    detailed_description text,
    features jsonb,
    cta_link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    "order" integer
);


ALTER TABLE public.products OWNER TO strapi;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO strapi;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_product_category_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.products_product_category_lnk (
    id integer NOT NULL,
    product_id integer,
    product_category_id integer,
    product_ord double precision
);


ALTER TABLE public.products_product_category_lnk OWNER TO strapi;

--
-- Name: products_product_category_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.products_product_category_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_category_lnk_id_seq OWNER TO strapi;

--
-- Name: products_product_category_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.products_product_category_lnk_id_seq OWNED BY public.products_product_category_lnk.id;


--
-- Name: sales_inquiries; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.sales_inquiries (
    id integer NOT NULL,
    document_id character varying(255),
    products jsonb,
    budget character varying(255),
    timeline character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    age character varying(255),
    gender character varying(255),
    location character varying(255),
    household_size character varying(255),
    specific_requirements text,
    customization_needs jsonb,
    pain_points text,
    preferred_features jsonb,
    living_situation character varying(255)
);


ALTER TABLE public.sales_inquiries OWNER TO strapi;

--
-- Name: sales_inquiries_contact_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.sales_inquiries_contact_lnk (
    id integer NOT NULL,
    sales_inquiry_id integer,
    contact_form_id integer
);


ALTER TABLE public.sales_inquiries_contact_lnk OWNER TO strapi;

--
-- Name: sales_inquiries_contact_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.sales_inquiries_contact_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_inquiries_contact_lnk_id_seq OWNER TO strapi;

--
-- Name: sales_inquiries_contact_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.sales_inquiries_contact_lnk_id_seq OWNED BY public.sales_inquiries_contact_lnk.id;


--
-- Name: sales_inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.sales_inquiries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_inquiries_id_seq OWNER TO strapi;

--
-- Name: sales_inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.sales_inquiries_id_seq OWNED BY public.sales_inquiries.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO strapi;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO strapi;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO strapi;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO strapi;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO strapi;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO strapi;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO strapi;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO strapi;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO strapi;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO strapi;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO strapi;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_history_versions_id_seq OWNER TO strapi;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO strapi;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO strapi;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO strapi;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_internal_id_seq OWNER TO strapi;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO strapi;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_release_actions_id_seq OWNER TO strapi;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO strapi;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_release_actions_release_lnk_id_seq OWNER TO strapi;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO strapi;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_releases_id_seq OWNER TO strapi;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO strapi;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_id_seq OWNER TO strapi;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO strapi;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO strapi;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO strapi;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_tokens_id_seq OWNER TO strapi;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO strapi;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_id_seq OWNER TO strapi;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO strapi;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_stages_id_seq OWNER TO strapi;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO strapi;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO strapi;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO strapi;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO strapi;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.tests (
    id integer NOT NULL,
    document_id character varying(255),
    test text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.tests OWNER TO strapi;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tests_id_seq OWNER TO strapi;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: ueber_uns_x; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.ueber_uns_x (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    description text,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.ueber_uns_x OWNER TO strapi;

--
-- Name: ueber_uns_x_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.ueber_uns_x_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ueber_uns_x_id_seq OWNER TO strapi;

--
-- Name: ueber_uns_x_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.ueber_uns_x_id_seq OWNED BY public.ueber_uns_x.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO strapi;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO strapi;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO strapi;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_lnk_id_seq OWNER TO strapi;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO strapi;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO strapi;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO strapi;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO strapi;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO strapi;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_lnk_id_seq OWNER TO strapi;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO strapi;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO strapi;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO strapi;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_lnk_id_seq OWNER TO strapi;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: welcome_sections; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.welcome_sections (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    paragraphs text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    catchtext character varying(255),
    catchheader character varying(255),
    cta_text character varying(255)
);


ALTER TABLE public.welcome_sections OWNER TO strapi;

--
-- Name: welcome_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.welcome_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.welcome_sections_id_seq OWNER TO strapi;

--
-- Name: welcome_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.welcome_sections_id_seq OWNED BY public.welcome_sections.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: components_contactaddress_contactaddresses id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_contactaddress_contactaddresses ALTER COLUMN id SET DEFAULT nextval('public.components_contactaddress_contactaddresses_id_seq'::regclass);


--
-- Name: components_contactaddress_contactformsettings id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_contactaddress_contactformsettings ALTER COLUMN id SET DEFAULT nextval('public.components_contactaddress_contactformsettings_id_seq'::regclass);


--
-- Name: components_features_feature_items id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_features_feature_items ALTER COLUMN id SET DEFAULT nextval('public.components_features_feature_items_id_seq'::regclass);


--
-- Name: contact_forms id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contact_forms ALTER COLUMN id SET DEFAULT nextval('public.contact_forms_id_seq'::regclass);


--
-- Name: contactsections id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections ALTER COLUMN id SET DEFAULT nextval('public.contactsections_id_seq'::regclass);


--
-- Name: contactsections_cmps id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections_cmps ALTER COLUMN id SET DEFAULT nextval('public.contactsections_cmps_id_seq'::regclass);


--
-- Name: faqs id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faqs ALTER COLUMN id SET DEFAULT nextval('public.faqs_id_seq'::regclass);


--
-- Name: file_and_resources id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.file_and_resources ALTER COLUMN id SET DEFAULT nextval('public.file_and_resources_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: hero_sections id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections ALTER COLUMN id SET DEFAULT nextval('public.hero_sections_id_seq'::regclass);


--
-- Name: hero_sections_cmps id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections_cmps ALTER COLUMN id SET DEFAULT nextval('public.hero_sections_cmps_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: impressums id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.impressums ALTER COLUMN id SET DEFAULT nextval('public.impressums_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_product_category_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_category_lnk ALTER COLUMN id SET DEFAULT nextval('public.products_product_category_lnk_id_seq'::regclass);


--
-- Name: sales_inquiries id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries ALTER COLUMN id SET DEFAULT nextval('public.sales_inquiries_id_seq'::regclass);


--
-- Name: sales_inquiries_contact_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries_contact_lnk ALTER COLUMN id SET DEFAULT nextval('public.sales_inquiries_contact_lnk_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Name: ueber_uns_x id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.ueber_uns_x ALTER COLUMN id SET DEFAULT nextval('public.ueber_uns_x_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Name: welcome_sections id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.welcome_sections ALTER COLUMN id SET DEFAULT nextval('public.welcome_sections_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	iue8i1zd81rqgrd2ji6acdjo	plugin::content-manager.explorer.create	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	[]	2024-11-08 22:00:25.593	2024-11-08 22:00:25.593	2024-11-08 22:00:25.593	\N	\N	\N
2	zk98f89mt8o6bqvzez7vmxyx	plugin::content-manager.explorer.create	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	[]	2024-11-08 22:00:25.606	2024-11-08 22:00:25.606	2024-11-08 22:00:25.607	\N	\N	\N
4	g9myf7lbrc1sn4u4hlgf0kq9	plugin::content-manager.explorer.create	{}	api::test.test	{"fields": ["test"]}	[]	2024-11-08 22:00:25.625	2024-11-08 22:00:25.625	2024-11-08 22:00:25.625	\N	\N	\N
5	lwqhqkf40rksnafb2di29zsd	plugin::content-manager.explorer.create	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	[]	2024-11-08 22:00:25.632	2024-11-08 22:00:25.632	2024-11-08 22:00:25.632	\N	\N	\N
6	hfxp2kewedlatw7hbgp6vb9u	plugin::content-manager.explorer.create	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs"]}	[]	2024-11-08 22:00:25.638	2024-11-08 22:00:25.638	2024-11-08 22:00:25.638	\N	\N	\N
7	di8valflqqbb3127dxj2fzbh	plugin::content-manager.explorer.read	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	[]	2024-11-08 22:00:25.644	2024-11-08 22:00:25.644	2024-11-08 22:00:25.645	\N	\N	\N
8	um1i72kjqqsnjw75qnwlakh3	plugin::content-manager.explorer.read	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	[]	2024-11-08 22:00:25.651	2024-11-08 22:00:25.651	2024-11-08 22:00:25.651	\N	\N	\N
10	bb07fvfn7hshte6oaubi9dbm	plugin::content-manager.explorer.read	{}	api::test.test	{"fields": ["test"]}	[]	2024-11-08 22:00:25.664	2024-11-08 22:00:25.664	2024-11-08 22:00:25.664	\N	\N	\N
11	u91bd917c07254bhwni5jv88	plugin::content-manager.explorer.read	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	[]	2024-11-08 22:00:25.67	2024-11-08 22:00:25.67	2024-11-08 22:00:25.671	\N	\N	\N
12	flv420roryqmmg346mdb7mc6	plugin::content-manager.explorer.read	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs"]}	[]	2024-11-08 22:00:25.676	2024-11-08 22:00:25.676	2024-11-08 22:00:25.676	\N	\N	\N
13	opuofn77ggtizc5kioquth6q	plugin::content-manager.explorer.update	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	[]	2024-11-08 22:00:25.683	2024-11-08 22:00:25.683	2024-11-08 22:00:25.683	\N	\N	\N
14	nahkndit83l813ted9qvs20z	plugin::content-manager.explorer.update	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	[]	2024-11-08 22:00:25.69	2024-11-08 22:00:25.69	2024-11-08 22:00:25.69	\N	\N	\N
16	sdqqfadku8yxi8szsi60pbhs	plugin::content-manager.explorer.update	{}	api::test.test	{"fields": ["test"]}	[]	2024-11-08 22:00:25.704	2024-11-08 22:00:25.704	2024-11-08 22:00:25.705	\N	\N	\N
17	uwhrot6nolkzrg3wrin3wsyc	plugin::content-manager.explorer.update	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	[]	2024-11-08 22:00:25.711	2024-11-08 22:00:25.711	2024-11-08 22:00:25.711	\N	\N	\N
18	tmfb4c5fjoxv5xbp76kmsixh	plugin::content-manager.explorer.update	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs"]}	[]	2024-11-08 22:00:25.717	2024-11-08 22:00:25.717	2024-11-08 22:00:25.717	\N	\N	\N
19	zpxe30z7gq3spm6qsgecvozx	plugin::content-manager.explorer.delete	{}	api::faq.faq	{}	[]	2024-11-08 22:00:25.724	2024-11-08 22:00:25.724	2024-11-08 22:00:25.724	\N	\N	\N
20	skv607v5gxs2395be7pf5c62	plugin::content-manager.explorer.delete	{}	api::hero-section.hero-section	{}	[]	2024-11-08 22:00:25.73	2024-11-08 22:00:25.73	2024-11-08 22:00:25.73	\N	\N	\N
21	egfs7lsxiovwhu782xmocb9h	plugin::content-manager.explorer.delete	{}	api::product-category.product-category	{}	[]	2024-11-08 22:00:25.737	2024-11-08 22:00:25.737	2024-11-08 22:00:25.737	\N	\N	\N
22	j2ru25kywzxvvk067b5v8876	plugin::content-manager.explorer.delete	{}	api::test.test	{}	[]	2024-11-08 22:00:25.743	2024-11-08 22:00:25.743	2024-11-08 22:00:25.743	\N	\N	\N
23	jv97nez41a8ga6q4busb3z0t	plugin::content-manager.explorer.delete	{}	api::ueber-uns.ueber-uns	{}	[]	2024-11-08 22:00:25.749	2024-11-08 22:00:25.749	2024-11-08 22:00:25.749	\N	\N	\N
24	j61vtws3q7bg9d9leniqyi03	plugin::content-manager.explorer.delete	{}	api::welcome-section.welcome-section	{}	[]	2024-11-08 22:00:25.755	2024-11-08 22:00:25.755	2024-11-08 22:00:25.756	\N	\N	\N
25	tzf59dibczmiwc5krwnnnl80	plugin::content-manager.explorer.publish	{}	api::faq.faq	{}	[]	2024-11-08 22:00:25.762	2024-11-08 22:00:25.762	2024-11-08 22:00:25.762	\N	\N	\N
26	i7e7agxc0dfmjzcuap5vpoxz	plugin::content-manager.explorer.publish	{}	api::hero-section.hero-section	{}	[]	2024-11-08 22:00:25.772	2024-11-08 22:00:25.772	2024-11-08 22:00:25.772	\N	\N	\N
27	rcp3j7d4ctqr7eucittud8f1	plugin::content-manager.explorer.publish	{}	api::product-category.product-category	{}	[]	2024-11-08 22:00:25.778	2024-11-08 22:00:25.778	2024-11-08 22:00:25.779	\N	\N	\N
28	iqn38ruycqe5q2oivai04o00	plugin::content-manager.explorer.publish	{}	api::test.test	{}	[]	2024-11-08 22:00:25.785	2024-11-08 22:00:25.785	2024-11-08 22:00:25.785	\N	\N	\N
29	tkefe5q7dq3m2m5ootp4wzpa	plugin::content-manager.explorer.publish	{}	api::ueber-uns.ueber-uns	{}	[]	2024-11-08 22:00:25.792	2024-11-08 22:00:25.792	2024-11-08 22:00:25.792	\N	\N	\N
30	jsnbvaexi1adi43awbb9uo15	plugin::content-manager.explorer.publish	{}	api::welcome-section.welcome-section	{}	[]	2024-11-08 22:00:25.799	2024-11-08 22:00:25.799	2024-11-08 22:00:25.8	\N	\N	\N
31	cnli91b1dgtiac5797hzph2y	plugin::upload.read	{}	\N	{}	[]	2024-11-08 22:00:25.811	2024-11-08 22:00:25.811	2024-11-08 22:00:25.811	\N	\N	\N
32	ishddkkh1d843pyunwqy943o	plugin::upload.configure-view	{}	\N	{}	[]	2024-11-08 22:00:25.824	2024-11-08 22:00:25.824	2024-11-08 22:00:25.824	\N	\N	\N
33	kskk8z1pr3qzrf12l0z68un1	plugin::upload.assets.create	{}	\N	{}	[]	2024-11-08 22:00:25.831	2024-11-08 22:00:25.831	2024-11-08 22:00:25.831	\N	\N	\N
34	h6uda8lf5x3kngffeswys9sd	plugin::upload.assets.update	{}	\N	{}	[]	2024-11-08 22:00:25.837	2024-11-08 22:00:25.837	2024-11-08 22:00:25.838	\N	\N	\N
35	tz60uo1afs856qr9o4r4lzp1	plugin::upload.assets.download	{}	\N	{}	[]	2024-11-08 22:00:25.847	2024-11-08 22:00:25.847	2024-11-08 22:00:25.847	\N	\N	\N
36	nqz8o63ku522fpyblijk5gkc	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-11-08 22:00:25.855	2024-11-08 22:00:25.855	2024-11-08 22:00:25.856	\N	\N	\N
37	ymnlf6t4g50bjgzs4f0bnrm4	plugin::content-manager.explorer.create	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	["admin::is-creator"]	2024-11-08 22:00:25.867	2024-11-08 22:00:25.867	2024-11-08 22:00:25.867	\N	\N	\N
38	zho5ciue8bshcqyaes7mkgbj	plugin::content-manager.explorer.create	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	["admin::is-creator"]	2024-11-08 22:00:25.875	2024-11-08 22:00:25.875	2024-11-08 22:00:25.875	\N	\N	\N
9	lke1jolvilwfsnewj7xxn5gk	plugin::content-manager.explorer.read	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "Order"]}	[]	2024-11-08 22:00:25.658	2024-11-22 17:33:50.17	2024-11-08 22:00:25.658	\N	\N	\N
39	f6izpiamapi9x6kwgew3wngl	plugin::content-manager.explorer.create	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "Order"]}	["admin::is-creator"]	2024-11-08 22:00:25.88	2024-11-22 17:33:50.17	2024-11-08 22:00:25.881	\N	\N	\N
40	d4g1qtc5nxlgepus3rmjll3u	plugin::content-manager.explorer.create	{}	api::test.test	{"fields": ["test"]}	["admin::is-creator"]	2024-11-08 22:00:25.887	2024-11-08 22:00:25.887	2024-11-08 22:00:25.887	\N	\N	\N
41	l8qa7m385numcw9bt22shuh4	plugin::content-manager.explorer.create	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	["admin::is-creator"]	2024-11-08 22:00:25.894	2024-11-08 22:00:25.894	2024-11-08 22:00:25.894	\N	\N	\N
42	oboqcn3a4cbyx58f4njjabzu	plugin::content-manager.explorer.create	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs"]}	["admin::is-creator"]	2024-11-08 22:00:25.9	2024-11-08 22:00:25.9	2024-11-08 22:00:25.9	\N	\N	\N
43	f3qdm3h9ygz1fmmbo84z2fdk	plugin::content-manager.explorer.read	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	["admin::is-creator"]	2024-11-08 22:00:25.907	2024-11-08 22:00:25.907	2024-11-08 22:00:25.907	\N	\N	\N
44	w58uisaczsaj3jg46s65qyjk	plugin::content-manager.explorer.read	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	["admin::is-creator"]	2024-11-08 22:00:25.913	2024-11-08 22:00:25.913	2024-11-08 22:00:25.913	\N	\N	\N
46	agd54o5lfhtc8paufvl6nwdh	plugin::content-manager.explorer.read	{}	api::test.test	{"fields": ["test"]}	["admin::is-creator"]	2024-11-08 22:00:25.925	2024-11-08 22:00:25.925	2024-11-08 22:00:25.925	\N	\N	\N
47	e0rm9fixx9mvwl2oyp4x6ig9	plugin::content-manager.explorer.read	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	["admin::is-creator"]	2024-11-08 22:00:25.932	2024-11-08 22:00:25.932	2024-11-08 22:00:25.933	\N	\N	\N
48	c0ssfnju3h0zgbogxvbyibut	plugin::content-manager.explorer.read	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs"]}	["admin::is-creator"]	2024-11-08 22:00:25.94	2024-11-08 22:00:25.94	2024-11-08 22:00:25.94	\N	\N	\N
49	rtua75d395v5vyer0orougjt	plugin::content-manager.explorer.update	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	["admin::is-creator"]	2024-11-08 22:00:25.945	2024-11-08 22:00:25.945	2024-11-08 22:00:25.946	\N	\N	\N
50	eqfy9314q55oa0lvxd7jlg2i	plugin::content-manager.explorer.update	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	["admin::is-creator"]	2024-11-08 22:00:25.952	2024-11-08 22:00:25.952	2024-11-08 22:00:25.952	\N	\N	\N
52	i1tg2ko7pqo0kpqdunwpk03s	plugin::content-manager.explorer.update	{}	api::test.test	{"fields": ["test"]}	["admin::is-creator"]	2024-11-08 22:00:25.966	2024-11-08 22:00:25.966	2024-11-08 22:00:25.966	\N	\N	\N
53	k2p8jhv3dv9uixg2806qzz47	plugin::content-manager.explorer.update	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	["admin::is-creator"]	2024-11-08 22:00:25.972	2024-11-08 22:00:25.972	2024-11-08 22:00:25.972	\N	\N	\N
54	bfn6urn8w5df3tmgyliylr8p	plugin::content-manager.explorer.update	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs"]}	["admin::is-creator"]	2024-11-08 22:00:25.98	2024-11-08 22:00:25.98	2024-11-08 22:00:25.98	\N	\N	\N
55	qividcuh05b4k1caqaykdla9	plugin::content-manager.explorer.delete	{}	api::faq.faq	{}	["admin::is-creator"]	2024-11-08 22:00:25.987	2024-11-08 22:00:25.987	2024-11-08 22:00:25.987	\N	\N	\N
56	tdd88wt5t3awyy3b2hjlgmzr	plugin::content-manager.explorer.delete	{}	api::hero-section.hero-section	{}	["admin::is-creator"]	2024-11-08 22:00:25.993	2024-11-08 22:00:25.993	2024-11-08 22:00:25.993	\N	\N	\N
57	pkm2ma3s2a4g3vkkbaa06vbo	plugin::content-manager.explorer.delete	{}	api::product-category.product-category	{}	["admin::is-creator"]	2024-11-08 22:00:26	2024-11-08 22:00:26	2024-11-08 22:00:26	\N	\N	\N
58	grnx4r4rf4w9hzftiuylt5ed	plugin::content-manager.explorer.delete	{}	api::test.test	{}	["admin::is-creator"]	2024-11-08 22:00:26.006	2024-11-08 22:00:26.006	2024-11-08 22:00:26.006	\N	\N	\N
59	ghm1ghyb9k81a64v9rn2btc1	plugin::content-manager.explorer.delete	{}	api::ueber-uns.ueber-uns	{}	["admin::is-creator"]	2024-11-08 22:00:26.012	2024-11-08 22:00:26.012	2024-11-08 22:00:26.012	\N	\N	\N
60	mh7pqn13xlzs22qlp7gn4hkb	plugin::content-manager.explorer.delete	{}	api::welcome-section.welcome-section	{}	["admin::is-creator"]	2024-11-08 22:00:26.018	2024-11-08 22:00:26.018	2024-11-08 22:00:26.018	\N	\N	\N
61	tky6nsk0asjldth2sb9tuoks	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2024-11-08 22:00:26.023	2024-11-08 22:00:26.023	2024-11-08 22:00:26.023	\N	\N	\N
62	tuoh23gh9hdb1gz7ae5rj8qb	plugin::upload.configure-view	{}	\N	{}	[]	2024-11-08 22:00:26.029	2024-11-08 22:00:26.029	2024-11-08 22:00:26.029	\N	\N	\N
63	gsxc6js0s5ssykkoaoogusiq	plugin::upload.assets.create	{}	\N	{}	[]	2024-11-08 22:00:26.035	2024-11-08 22:00:26.035	2024-11-08 22:00:26.035	\N	\N	\N
64	u92yasfj56hu2ih45zh972tv	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2024-11-08 22:00:26.041	2024-11-08 22:00:26.041	2024-11-08 22:00:26.041	\N	\N	\N
65	iypxhqhflnzd6vgaoz222uv6	plugin::upload.assets.download	{}	\N	{}	[]	2024-11-08 22:00:26.049	2024-11-08 22:00:26.049	2024-11-08 22:00:26.05	\N	\N	\N
66	kj71m41btwra8pa2g0q5pz12	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-11-08 22:00:26.057	2024-11-08 22:00:26.057	2024-11-08 22:00:26.057	\N	\N	\N
67	u04y5krgn9etg6pg9s9r4gye	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-11-08 22:00:26.133	2024-11-08 22:00:26.133	2024-11-08 22:00:26.134	\N	\N	\N
68	mtf2jlt4eryr0jqh9o3nkpyb	plugin::content-manager.explorer.create	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	[]	2024-11-08 22:00:26.144	2024-11-08 22:00:26.144	2024-11-08 22:00:26.145	\N	\N	\N
69	kco2l7vm3pg6seotdms6nemz	plugin::content-manager.explorer.create	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	[]	2024-11-08 22:00:26.157	2024-11-08 22:00:26.157	2024-11-08 22:00:26.158	\N	\N	\N
71	yw72nrhdt7kyvv82750bgvmm	plugin::content-manager.explorer.create	{}	api::test.test	{"fields": ["test"]}	[]	2024-11-08 22:00:26.183	2024-11-08 22:00:26.183	2024-11-08 22:00:26.183	\N	\N	\N
72	qyuevjh0jba1v185sallrul5	plugin::content-manager.explorer.create	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	[]	2024-11-08 22:00:26.201	2024-11-08 22:00:26.201	2024-11-08 22:00:26.201	\N	\N	\N
74	t467n3hi6h029aioxlxh1kyy	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-11-08 22:00:26.218	2024-11-08 22:00:26.218	2024-11-08 22:00:26.218	\N	\N	\N
75	g1lhp5377915v4moz8ukbqgu	plugin::content-manager.explorer.read	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	[]	2024-11-08 22:00:26.226	2024-11-08 22:00:26.226	2024-11-08 22:00:26.226	\N	\N	\N
45	rutn028x3l2xdlwiymjma81f	plugin::content-manager.explorer.read	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "Order"]}	["admin::is-creator"]	2024-11-08 22:00:25.919	2024-11-22 17:33:50.17	2024-11-08 22:00:25.92	\N	\N	\N
51	lw45g5553loniuaaczoe2qwm	plugin::content-manager.explorer.update	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "Order"]}	["admin::is-creator"]	2024-11-08 22:00:25.959	2024-11-22 17:33:50.17	2024-11-08 22:00:25.959	\N	\N	\N
76	qvzogwq7vkzkm53hfk1laenn	plugin::content-manager.explorer.read	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	[]	2024-11-08 22:00:26.234	2024-11-08 22:00:26.234	2024-11-08 22:00:26.234	\N	\N	\N
78	km8wn5pe5ndf4j8ja8o9lrl8	plugin::content-manager.explorer.read	{}	api::test.test	{"fields": ["test"]}	[]	2024-11-08 22:00:26.249	2024-11-08 22:00:26.249	2024-11-08 22:00:26.249	\N	\N	\N
79	p2xdn8l4o7l7c6edhkodszoo	plugin::content-manager.explorer.read	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	[]	2024-11-08 22:00:26.255	2024-11-08 22:00:26.255	2024-11-08 22:00:26.255	\N	\N	\N
81	s8mbn66k8pnpc72j43a7xmmv	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-11-08 22:00:26.27	2024-11-08 22:00:26.27	2024-11-08 22:00:26.27	\N	\N	\N
82	dggqmwsd4yj87qfxdrr6la13	plugin::content-manager.explorer.update	{}	api::faq.faq	{"fields": ["Question", "Answer"]}	[]	2024-11-08 22:00:26.28	2024-11-08 22:00:26.28	2024-11-08 22:00:26.28	\N	\N	\N
83	h5l4xm46p40lu2ac9j027gxw	plugin::content-manager.explorer.update	{}	api::hero-section.hero-section	{"fields": ["Title", "Description", "CallToActionText", "CallToActionLink", "BackgroundImage", "featureitems.title", "featureitems.icon"]}	[]	2024-11-08 22:00:26.291	2024-11-08 22:00:26.291	2024-11-08 22:00:26.292	\N	\N	\N
85	up7wpskznpi6jxf5orier3vn	plugin::content-manager.explorer.update	{}	api::test.test	{"fields": ["test"]}	[]	2024-11-08 22:00:26.306	2024-11-08 22:00:26.306	2024-11-08 22:00:26.306	\N	\N	\N
86	sawku53y6f848vszy2s352ki	plugin::content-manager.explorer.update	{}	api::ueber-uns.ueber-uns	{"fields": ["Title", "Description", "slug", "image"]}	[]	2024-11-08 22:00:26.312	2024-11-08 22:00:26.312	2024-11-08 22:00:26.312	\N	\N	\N
88	ngwg3yjrs03jgqwgand1tvey	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2024-11-08 22:00:26.327	2024-11-08 22:00:26.327	2024-11-08 22:00:26.327	\N	\N	\N
89	c4ly7578qkr24lknx1hcpmtt	plugin::content-manager.explorer.delete	{}	api::faq.faq	{}	[]	2024-11-08 22:00:26.333	2024-11-08 22:00:26.333	2024-11-08 22:00:26.333	\N	\N	\N
90	gx4ufsjbecwi2iwo7jc7hlmb	plugin::content-manager.explorer.delete	{}	api::hero-section.hero-section	{}	[]	2024-11-08 22:00:26.339	2024-11-08 22:00:26.339	2024-11-08 22:00:26.339	\N	\N	\N
91	jckvefndmalnn2v4lqdtqtqh	plugin::content-manager.explorer.delete	{}	api::product-category.product-category	{}	[]	2024-11-08 22:00:26.345	2024-11-08 22:00:26.345	2024-11-08 22:00:26.346	\N	\N	\N
92	bxlsmhfhsu8hhdec0xi09fqw	plugin::content-manager.explorer.delete	{}	api::test.test	{}	[]	2024-11-08 22:00:26.351	2024-11-08 22:00:26.351	2024-11-08 22:00:26.351	\N	\N	\N
93	qdz8tuv3bb3yccyzl0i6nj0u	plugin::content-manager.explorer.delete	{}	api::ueber-uns.ueber-uns	{}	[]	2024-11-08 22:00:26.359	2024-11-08 22:00:26.359	2024-11-08 22:00:26.36	\N	\N	\N
94	qti03npl6ij6f1o392x01z7a	plugin::content-manager.explorer.delete	{}	api::welcome-section.welcome-section	{}	[]	2024-11-08 22:00:26.365	2024-11-08 22:00:26.365	2024-11-08 22:00:26.365	\N	\N	\N
95	eyvaiqn4uj38jigh4qpvptbg	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2024-11-08 22:00:26.372	2024-11-08 22:00:26.372	2024-11-08 22:00:26.372	\N	\N	\N
96	rl891dbhd3sdyd7mrs2r2w6z	plugin::content-manager.explorer.publish	{}	api::faq.faq	{}	[]	2024-11-08 22:00:26.378	2024-11-08 22:00:26.378	2024-11-08 22:00:26.378	\N	\N	\N
97	kazl5vvp4ivbjqxy2ovk8k5c	plugin::content-manager.explorer.publish	{}	api::hero-section.hero-section	{}	[]	2024-11-08 22:00:26.385	2024-11-08 22:00:26.385	2024-11-08 22:00:26.385	\N	\N	\N
98	notbmnnefeur77woxr13feb1	plugin::content-manager.explorer.publish	{}	api::product-category.product-category	{}	[]	2024-11-08 22:00:26.392	2024-11-08 22:00:26.392	2024-11-08 22:00:26.392	\N	\N	\N
99	hw519dkhq485yhyjd44npuho	plugin::content-manager.explorer.publish	{}	api::test.test	{}	[]	2024-11-08 22:00:26.399	2024-11-08 22:00:26.399	2024-11-08 22:00:26.4	\N	\N	\N
100	oml4y01wvzc1mwk315kd0cx7	plugin::content-manager.explorer.publish	{}	api::ueber-uns.ueber-uns	{}	[]	2024-11-08 22:00:26.408	2024-11-08 22:00:26.408	2024-11-08 22:00:26.408	\N	\N	\N
101	f74d9yb1hisaxaobu1mgxgzo	plugin::content-manager.explorer.publish	{}	api::welcome-section.welcome-section	{}	[]	2024-11-08 22:00:26.415	2024-11-08 22:00:26.415	2024-11-08 22:00:26.415	\N	\N	\N
102	g3216uplghci4afp0ep8kk1t	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2024-11-08 22:00:26.424	2024-11-08 22:00:26.424	2024-11-08 22:00:26.424	\N	\N	\N
103	wos6t0uc5by3ru3m32vuthmg	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2024-11-08 22:00:26.43	2024-11-08 22:00:26.43	2024-11-08 22:00:26.431	\N	\N	\N
104	cfkeqdurzzxib1aihhd0rlf4	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2024-11-08 22:00:26.436	2024-11-08 22:00:26.436	2024-11-08 22:00:26.436	\N	\N	\N
105	bsho9s4nx4w5z10aswyuusea	plugin::content-type-builder.read	{}	\N	{}	[]	2024-11-08 22:00:26.442	2024-11-08 22:00:26.442	2024-11-08 22:00:26.443	\N	\N	\N
106	f1ivbvgad1pf7d40zd4yvvu6	plugin::email.settings.read	{}	\N	{}	[]	2024-11-08 22:00:26.449	2024-11-08 22:00:26.449	2024-11-08 22:00:26.449	\N	\N	\N
107	p2gpvvr5jkc1cshnrf4oc7lu	plugin::upload.read	{}	\N	{}	[]	2024-11-08 22:00:26.455	2024-11-08 22:00:26.455	2024-11-08 22:00:26.455	\N	\N	\N
108	eihssip1cz74yo2hvi1ci0b8	plugin::upload.assets.create	{}	\N	{}	[]	2024-11-08 22:00:26.462	2024-11-08 22:00:26.462	2024-11-08 22:00:26.462	\N	\N	\N
109	i5rsey2vijj8uoqvj32iyq9s	plugin::upload.assets.update	{}	\N	{}	[]	2024-11-08 22:00:26.469	2024-11-08 22:00:26.469	2024-11-08 22:00:26.47	\N	\N	\N
110	va8j7bc4nq8uuwq804x84vnt	plugin::upload.assets.download	{}	\N	{}	[]	2024-11-08 22:00:26.477	2024-11-08 22:00:26.477	2024-11-08 22:00:26.477	\N	\N	\N
111	dyp9bnvwpxobxjoohamxw3xe	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-11-08 22:00:26.482	2024-11-08 22:00:26.482	2024-11-08 22:00:26.482	\N	\N	\N
112	mkwf2g1mfpzdx5fs34ib5pb1	plugin::upload.configure-view	{}	\N	{}	[]	2024-11-08 22:00:26.488	2024-11-08 22:00:26.488	2024-11-08 22:00:26.488	\N	\N	\N
113	b5sv18m05pdr46nrmtcqjt8a	plugin::upload.settings.read	{}	\N	{}	[]	2024-11-08 22:00:26.495	2024-11-08 22:00:26.495	2024-11-08 22:00:26.495	\N	\N	\N
114	cqy1gyk76a3zfm1h9r814ylq	plugin::i18n.locale.create	{}	\N	{}	[]	2024-11-08 22:00:26.501	2024-11-08 22:00:26.501	2024-11-08 22:00:26.501	\N	\N	\N
115	zm7fjvtkhcrfuo8dtnsuchec	plugin::i18n.locale.read	{}	\N	{}	[]	2024-11-08 22:00:26.507	2024-11-08 22:00:26.507	2024-11-08 22:00:26.507	\N	\N	\N
116	dij1g40x3j5ax7m0czfzkahd	plugin::i18n.locale.update	{}	\N	{}	[]	2024-11-08 22:00:26.514	2024-11-08 22:00:26.514	2024-11-08 22:00:26.514	\N	\N	\N
117	ejft77uhbnvkrxns96ke4k68	plugin::i18n.locale.delete	{}	\N	{}	[]	2024-11-08 22:00:26.523	2024-11-08 22:00:26.523	2024-11-08 22:00:26.523	\N	\N	\N
118	f94aq746h0jk0nbnx6e550qx	plugin::users-permissions.roles.create	{}	\N	{}	[]	2024-11-08 22:00:26.529	2024-11-08 22:00:26.529	2024-11-08 22:00:26.529	\N	\N	\N
119	wt3chce35blds21eh23h8mef	plugin::users-permissions.roles.read	{}	\N	{}	[]	2024-11-08 22:00:26.535	2024-11-08 22:00:26.535	2024-11-08 22:00:26.535	\N	\N	\N
120	bz7dbrji8kvmusnrrqxefmda	plugin::users-permissions.roles.update	{}	\N	{}	[]	2024-11-08 22:00:26.541	2024-11-08 22:00:26.541	2024-11-08 22:00:26.541	\N	\N	\N
121	hzj7f6dhtjxcvldewcgjxrj9	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2024-11-08 22:00:26.547	2024-11-08 22:00:26.547	2024-11-08 22:00:26.548	\N	\N	\N
122	nltg56fwnoaj5yd9h60o4fd6	plugin::users-permissions.providers.read	{}	\N	{}	[]	2024-11-08 22:00:26.555	2024-11-08 22:00:26.555	2024-11-08 22:00:26.555	\N	\N	\N
123	l1mdaq8wkseai9mi57lbvzo7	plugin::users-permissions.providers.update	{}	\N	{}	[]	2024-11-08 22:00:26.561	2024-11-08 22:00:26.561	2024-11-08 22:00:26.561	\N	\N	\N
124	s2jlt8otu5hiqpzv7l6bc1gz	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2024-11-08 22:00:26.567	2024-11-08 22:00:26.567	2024-11-08 22:00:26.567	\N	\N	\N
125	faka8zewkqhir16cr992ojp5	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2024-11-08 22:00:26.573	2024-11-08 22:00:26.573	2024-11-08 22:00:26.573	\N	\N	\N
126	gddyvusbl9msjyf1viqun0ca	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2024-11-08 22:00:26.58	2024-11-08 22:00:26.58	2024-11-08 22:00:26.58	\N	\N	\N
127	e4azg4omkw9ltl1jj02koefi	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2024-11-08 22:00:26.593	2024-11-08 22:00:26.593	2024-11-08 22:00:26.593	\N	\N	\N
128	ahaum9vt5hf9g8wcqtsdbsv9	admin::marketplace.read	{}	\N	{}	[]	2024-11-08 22:00:26.601	2024-11-08 22:00:26.601	2024-11-08 22:00:26.601	\N	\N	\N
129	bf7llh2l8eqaxlhd4rpg6wka	admin::webhooks.create	{}	\N	{}	[]	2024-11-08 22:00:26.609	2024-11-08 22:00:26.609	2024-11-08 22:00:26.609	\N	\N	\N
130	zeyw8bqzm3bd6f5etckct9ck	admin::webhooks.read	{}	\N	{}	[]	2024-11-08 22:00:26.615	2024-11-08 22:00:26.615	2024-11-08 22:00:26.616	\N	\N	\N
131	q36gqjtlukn8fb8knmht95sl	admin::webhooks.update	{}	\N	{}	[]	2024-11-08 22:00:26.624	2024-11-08 22:00:26.624	2024-11-08 22:00:26.624	\N	\N	\N
132	tp2w7xbua3u6jigzp6rnvl9s	admin::webhooks.delete	{}	\N	{}	[]	2024-11-08 22:00:26.631	2024-11-08 22:00:26.631	2024-11-08 22:00:26.631	\N	\N	\N
133	m1ff9jod60k9zdksikycpsrs	admin::users.create	{}	\N	{}	[]	2024-11-08 22:00:26.637	2024-11-08 22:00:26.637	2024-11-08 22:00:26.637	\N	\N	\N
134	cabgenje66m66f503rckceuc	admin::users.read	{}	\N	{}	[]	2024-11-08 22:00:26.645	2024-11-08 22:00:26.645	2024-11-08 22:00:26.646	\N	\N	\N
135	yqf7imlsswcf1ip784z1rjco	admin::users.update	{}	\N	{}	[]	2024-11-08 22:00:26.654	2024-11-08 22:00:26.654	2024-11-08 22:00:26.655	\N	\N	\N
136	pqi9oed63mqsvybf2n7wqs8k	admin::users.delete	{}	\N	{}	[]	2024-11-08 22:00:26.664	2024-11-08 22:00:26.664	2024-11-08 22:00:26.664	\N	\N	\N
137	l8t969h0xmowvw8xe3tpyoiv	admin::roles.create	{}	\N	{}	[]	2024-11-08 22:00:26.67	2024-11-08 22:00:26.67	2024-11-08 22:00:26.67	\N	\N	\N
138	nq7j7ihagn9bgkpoh31jbvfj	admin::roles.read	{}	\N	{}	[]	2024-11-08 22:00:26.676	2024-11-08 22:00:26.676	2024-11-08 22:00:26.677	\N	\N	\N
139	lhzw0ygqeb0nrnnjmjm10xs6	admin::roles.update	{}	\N	{}	[]	2024-11-08 22:00:26.683	2024-11-08 22:00:26.683	2024-11-08 22:00:26.683	\N	\N	\N
140	oucv85k8vwqgk9mt164mwcdv	admin::roles.delete	{}	\N	{}	[]	2024-11-08 22:00:26.69	2024-11-08 22:00:26.69	2024-11-08 22:00:26.69	\N	\N	\N
141	om60pcxmn4ahp2irzn4ec5ii	admin::api-tokens.access	{}	\N	{}	[]	2024-11-08 22:00:26.697	2024-11-08 22:00:26.697	2024-11-08 22:00:26.698	\N	\N	\N
142	a8pl5ltbwy2z94poevr9tit8	admin::api-tokens.create	{}	\N	{}	[]	2024-11-08 22:00:26.704	2024-11-08 22:00:26.704	2024-11-08 22:00:26.704	\N	\N	\N
143	jdgxnjore69n5c7sen0zztoy	admin::api-tokens.read	{}	\N	{}	[]	2024-11-08 22:00:26.71	2024-11-08 22:00:26.71	2024-11-08 22:00:26.71	\N	\N	\N
144	gi50476qmks5yu281hnuzq2r	admin::api-tokens.update	{}	\N	{}	[]	2024-11-08 22:00:26.715	2024-11-08 22:00:26.715	2024-11-08 22:00:26.715	\N	\N	\N
145	j5twawatudxzrub2dr224b39	admin::api-tokens.regenerate	{}	\N	{}	[]	2024-11-08 22:00:26.721	2024-11-08 22:00:26.721	2024-11-08 22:00:26.721	\N	\N	\N
146	hxxs6rgvca4rqqf5iiow1sh4	admin::api-tokens.delete	{}	\N	{}	[]	2024-11-08 22:00:26.726	2024-11-08 22:00:26.726	2024-11-08 22:00:26.726	\N	\N	\N
147	n758oscfij3egstnfoyw5c8t	admin::project-settings.update	{}	\N	{}	[]	2024-11-08 22:00:26.732	2024-11-08 22:00:26.732	2024-11-08 22:00:26.732	\N	\N	\N
148	q837zda9nqv9ma2slj8mh5zy	admin::project-settings.read	{}	\N	{}	[]	2024-11-08 22:00:26.737	2024-11-08 22:00:26.737	2024-11-08 22:00:26.738	\N	\N	\N
149	yxwh4xh416clrm6apxmlzcdw	admin::transfer.tokens.access	{}	\N	{}	[]	2024-11-08 22:00:26.744	2024-11-08 22:00:26.744	2024-11-08 22:00:26.744	\N	\N	\N
150	rjgf2920c68ef7zt8n3hyrhv	admin::transfer.tokens.create	{}	\N	{}	[]	2024-11-08 22:00:26.754	2024-11-08 22:00:26.754	2024-11-08 22:00:26.754	\N	\N	\N
151	txqjwit5emevtyv344cf313v	admin::transfer.tokens.read	{}	\N	{}	[]	2024-11-08 22:00:26.761	2024-11-08 22:00:26.761	2024-11-08 22:00:26.761	\N	\N	\N
152	elcewjo9oy6zuwnvryffwdjx	admin::transfer.tokens.update	{}	\N	{}	[]	2024-11-08 22:00:26.768	2024-11-08 22:00:26.768	2024-11-08 22:00:26.768	\N	\N	\N
153	rh8oaf9p9fyzhpq2l5icfrzm	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2024-11-08 22:00:26.774	2024-11-08 22:00:26.774	2024-11-08 22:00:26.774	\N	\N	\N
154	dj10dh8q3ga4ajybcye315ll	admin::transfer.tokens.delete	{}	\N	{}	[]	2024-11-08 22:00:26.783	2024-11-08 22:00:26.783	2024-11-08 22:00:26.784	\N	\N	\N
161	zyn984vscud7mmstrzzm5v6y	plugin::content-manager.explorer.delete	{}	api::contactsection.contactsection	{}	[]	2024-11-09 01:15:37.632	2024-11-09 01:15:37.632	2024-11-09 01:15:37.633	\N	\N	\N
162	w5hye4iys5upbtack7702809	plugin::content-manager.explorer.publish	{}	api::contactsection.contactsection	{}	[]	2024-11-09 01:15:37.639	2024-11-09 01:15:37.639	2024-11-09 01:15:37.639	\N	\N	\N
169	f7rhasbvb5h4np3iniak6i2i	plugin::content-manager.explorer.delete	{}	api::contact-form.contact-form	{}	[]	2024-11-09 02:17:47.06	2024-11-09 02:17:47.06	2024-11-09 02:17:47.06	\N	\N	\N
170	llt4ydvolcpj2zcpx8w7us5m	plugin::content-manager.explorer.publish	{}	api::contact-form.contact-form	{}	[]	2024-11-09 02:17:47.069	2024-11-09 02:17:47.069	2024-11-09 02:17:47.07	\N	\N	\N
177	u454628jqbsh1q94c16dnqj2	plugin::content-manager.explorer.delete	{}	api::product.product	{}	[]	2024-11-09 12:06:58.689	2024-11-09 12:06:58.689	2024-11-09 12:06:58.689	\N	\N	\N
178	o7bq2lq6c285stz20w14siyn	plugin::content-manager.explorer.publish	{}	api::product.product	{}	[]	2024-11-09 12:06:58.698	2024-11-09 12:06:58.698	2024-11-09 12:06:58.699	\N	\N	\N
179	mqgs267re9tsh4e6umgbvojh	plugin::content-manager.explorer.create	{}	api::file-and-resource.file-and-resource	{"fields": ["Title", "File", "FileType", "Size"]}	[]	2024-11-09 12:10:54.43	2024-11-09 12:10:54.43	2024-11-09 12:10:54.431	\N	\N	\N
180	kpd6tz0px50iw2obm1jka052	plugin::content-manager.explorer.read	{}	api::file-and-resource.file-and-resource	{"fields": ["Title", "File", "FileType", "Size"]}	[]	2024-11-09 12:10:54.448	2024-11-09 12:10:54.448	2024-11-09 12:10:54.448	\N	\N	\N
181	igdxmtscicnm2mnt4ig29l8n	plugin::content-manager.explorer.update	{}	api::file-and-resource.file-and-resource	{"fields": ["Title", "File", "FileType", "Size"]}	[]	2024-11-09 12:10:54.455	2024-11-09 12:10:54.455	2024-11-09 12:10:54.455	\N	\N	\N
182	gz452mjyxygmwvx4kjj7m79i	plugin::content-manager.explorer.delete	{}	api::file-and-resource.file-and-resource	{}	[]	2024-11-09 12:10:54.463	2024-11-09 12:10:54.463	2024-11-09 12:10:54.463	\N	\N	\N
183	ux93zrae51cf48ixx7dzzsff	plugin::content-manager.explorer.publish	{}	api::file-and-resource.file-and-resource	{}	[]	2024-11-09 12:10:54.469	2024-11-09 12:10:54.469	2024-11-09 12:10:54.469	\N	\N	\N
187	sudo7ax3fezxtec1sa2663yl	plugin::content-manager.explorer.create	{}	api::product.product	{"fields": ["Name", "MainImage", "GalleryImages", "ShortDescription", "DetailedDescription", "Features", "CTALink", "product_category", "Order"]}	[]	2024-11-22 17:29:16.207	2024-11-22 17:29:16.207	2024-11-22 17:29:16.208	\N	\N	\N
188	zaypa2vo7ipkz79rhbosup1p	plugin::content-manager.explorer.read	{}	api::product.product	{"fields": ["Name", "MainImage", "GalleryImages", "ShortDescription", "DetailedDescription", "Features", "CTALink", "product_category", "Order"]}	[]	2024-11-22 17:29:16.219	2024-11-22 17:29:16.219	2024-11-22 17:29:16.219	\N	\N	\N
189	dzco14pnsic7j0h1u6sz33qi	plugin::content-manager.explorer.update	{}	api::product.product	{"fields": ["Name", "MainImage", "GalleryImages", "ShortDescription", "DetailedDescription", "Features", "CTALink", "product_category", "Order"]}	[]	2024-11-22 17:29:16.227	2024-11-22 17:29:16.227	2024-11-22 17:29:16.228	\N	\N	\N
3	hnbyko8e68ew6b86c7yopc46	plugin::content-manager.explorer.create	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "Order"]}	[]	2024-11-08 22:00:25.615	2024-11-22 17:33:50.17	2024-11-08 22:00:25.616	\N	\N	\N
15	jmyholsotiqd20ngc78qmpk3	plugin::content-manager.explorer.update	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "Order"]}	[]	2024-11-08 22:00:25.697	2024-11-22 17:33:50.17	2024-11-08 22:00:25.698	\N	\N	\N
193	g34m9c19qt93ozy4kn2eii6c	plugin::content-manager.explorer.delete	{}	api::sales-inquiry.sales-inquiry	{}	[]	2024-11-24 00:40:09.242	2024-11-24 00:40:09.242	2024-11-24 00:40:09.242	\N	\N	\N
194	b9zzzd8pkif7khg0xjt3cwlp	plugin::content-manager.explorer.publish	{}	api::sales-inquiry.sales-inquiry	{}	[]	2024-11-24 00:40:09.253	2024-11-24 00:40:09.253	2024-11-24 00:40:09.253	\N	\N	\N
195	eaqswgjupsxn7xmn6n1u8e0h	plugin::content-manager.explorer.create	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "products", "Order", "ShortDescription"]}	[]	2024-11-24 00:41:35.34	2024-11-24 00:41:35.34	2024-11-24 00:41:35.342	\N	\N	\N
196	wtm5205fai0d6cfbg4nizv3c	plugin::content-manager.explorer.read	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "products", "Order", "ShortDescription"]}	[]	2024-11-24 00:41:35.352	2024-11-24 00:41:35.352	2024-11-24 00:41:35.352	\N	\N	\N
197	obthr06u4k7cfjq9ym4ib4p7	plugin::content-manager.explorer.update	{}	api::product-category.product-category	{"fields": ["Title", "Description", "Image", "slug", "products", "Order", "ShortDescription"]}	[]	2024-11-24 00:41:35.372	2024-11-24 00:41:35.372	2024-11-24 00:41:35.373	\N	\N	\N
201	tdkk61sr6dhsvbbuemlhbwfm	plugin::content-manager.explorer.create	{}	api::contact-form.contact-form	{"fields": ["name", "email", "phone", "message", "privacy", "newsletter", "company", "wantContact", "method", "time"]}	[]	2024-11-24 02:48:57.567	2024-11-24 02:48:57.567	2024-11-24 02:48:57.569	\N	\N	\N
202	btwq0j7wzhxlb28zxb4fnhm2	plugin::content-manager.explorer.read	{}	api::contact-form.contact-form	{"fields": ["name", "email", "phone", "message", "privacy", "newsletter", "company", "wantContact", "method", "time"]}	[]	2024-11-24 02:48:57.595	2024-11-24 02:48:57.595	2024-11-24 02:48:57.595	\N	\N	\N
203	b5garujyi6fxjc5uejc7j7ry	plugin::content-manager.explorer.update	{}	api::contact-form.contact-form	{"fields": ["name", "email", "phone", "message", "privacy", "newsletter", "company", "wantContact", "method", "time"]}	[]	2024-11-24 02:48:57.606	2024-11-24 02:48:57.606	2024-11-24 02:48:57.606	\N	\N	\N
210	id49cp5yawm2v5iwecnmw158	plugin::content-manager.explorer.create	{}	api::sales-inquiry.sales-inquiry	{"fields": ["products", "budget", "timeline", "age", "gender", "location", "householdSize", "specificRequirements", "customizationNeeds", "painPoints", "preferredFeatures", "contact", "livingSituation"]}	[]	2024-11-24 18:41:16.463	2024-11-24 18:41:16.463	2024-11-24 18:41:16.465	\N	\N	\N
211	edly0rgg2lkt880i2cm8tv8p	plugin::content-manager.explorer.read	{}	api::sales-inquiry.sales-inquiry	{"fields": ["products", "budget", "timeline", "age", "gender", "location", "householdSize", "specificRequirements", "customizationNeeds", "painPoints", "preferredFeatures", "contact", "livingSituation"]}	[]	2024-11-24 18:41:16.5	2024-11-24 18:41:16.5	2024-11-24 18:41:16.501	\N	\N	\N
212	vgujeqvyyzgptvjte5lh9ym3	plugin::content-manager.explorer.update	{}	api::sales-inquiry.sales-inquiry	{"fields": ["products", "budget", "timeline", "age", "gender", "location", "householdSize", "specificRequirements", "customizationNeeds", "painPoints", "preferredFeatures", "contact", "livingSituation"]}	[]	2024-11-24 18:41:16.507	2024-11-24 18:41:16.507	2024-11-24 18:41:16.508	\N	\N	\N
216	rdbqasneykyjdabp70flhkvv	plugin::content-manager.explorer.create	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs", "Catchtext", "Catchimage", "Catchheader", "CTAText", "NeherLogo"]}	[]	2024-11-25 10:06:47.069	2024-11-25 10:06:47.069	2024-11-25 10:06:47.07	\N	\N	\N
217	e0ucv7bx6roqciccjifp9ixi	plugin::content-manager.explorer.read	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs", "Catchtext", "Catchimage", "Catchheader", "CTAText", "NeherLogo"]}	[]	2024-11-25 10:06:47.083	2024-11-25 10:06:47.083	2024-11-25 10:06:47.084	\N	\N	\N
218	x0u6btugco4n2bbz8v74qkjf	plugin::content-manager.explorer.update	{}	api::welcome-section.welcome-section	{"fields": ["Title", "Paragraphs", "Catchtext", "Catchimage", "Catchheader", "CTAText", "NeherLogo"]}	[]	2024-11-25 10:06:47.093	2024-11-25 10:06:47.093	2024-11-25 10:06:47.093	\N	\N	\N
222	zurc4he68b44ek1mq8ugadav	plugin::content-manager.explorer.delete	{}	api::impressum.impressum	{}	[]	2024-11-25 11:13:13.843	2024-11-25 11:13:13.843	2024-11-25 11:13:13.844	\N	\N	\N
223	qnvgrba69j2q0bd85julwjyy	plugin::content-manager.explorer.publish	{}	api::impressum.impressum	{}	[]	2024-11-25 11:13:13.851	2024-11-25 11:13:13.851	2024-11-25 11:13:13.852	\N	\N	\N
227	nx8g251dip0rp2s3ztc8kxr9	plugin::content-manager.explorer.create	{}	api::impressum.impressum	{"fields": ["company_info", "representative", "contact", "tax_info", "content_responsible", "liability_disclaimer", "copyright_notice", "data_policy", "agb"]}	[]	2024-11-25 13:20:44.973	2024-11-25 13:20:44.973	2024-11-25 13:20:44.974	\N	\N	\N
228	ie8157cmobzcqyku6k4sfx1f	plugin::content-manager.explorer.read	{}	api::impressum.impressum	{"fields": ["company_info", "representative", "contact", "tax_info", "content_responsible", "liability_disclaimer", "copyright_notice", "data_policy", "agb"]}	[]	2024-11-25 13:20:45.019	2024-11-25 13:20:45.019	2024-11-25 13:20:45.02	\N	\N	\N
229	qzpk6g0hhtwr32me83oz7gj4	plugin::content-manager.explorer.update	{}	api::impressum.impressum	{"fields": ["company_info", "representative", "contact", "tax_info", "content_responsible", "liability_disclaimer", "copyright_notice", "data_policy", "agb"]}	[]	2024-11-25 13:20:45.038	2024-11-25 13:20:45.038	2024-11-25 13:20:45.041	\N	\N	\N
230	c8syes9pph0x4jeo1zcpe0bq	plugin::content-manager.explorer.create	{}	api::contactsection.contactsection	{"fields": ["title", "subtitle", "address.street", "address.city", "address.postal_code", "address.phone", "address.email", "address.opening_hours", "contact_form.success_message", "contact_form.error_message", "contact_form.privacy_text", "contact_form.newsletter_text", "contact_form.submit_button_text", "CTAText"]}	[]	2024-11-25 14:44:04.492	2024-11-25 14:44:04.492	2024-11-25 14:44:04.493	\N	\N	\N
231	xr28kgxgxenh4o1vmxh5nm5m	plugin::content-manager.explorer.read	{}	api::contactsection.contactsection	{"fields": ["title", "subtitle", "address.street", "address.city", "address.postal_code", "address.phone", "address.email", "address.opening_hours", "contact_form.success_message", "contact_form.error_message", "contact_form.privacy_text", "contact_form.newsletter_text", "contact_form.submit_button_text", "CTAText"]}	[]	2024-11-25 14:44:04.504	2024-11-25 14:44:04.504	2024-11-25 14:44:04.505	\N	\N	\N
232	eh9nbn0rl0nbk7suqvyldvkg	plugin::content-manager.explorer.update	{}	api::contactsection.contactsection	{"fields": ["title", "subtitle", "address.street", "address.city", "address.postal_code", "address.phone", "address.email", "address.opening_hours", "contact_form.success_message", "contact_form.error_message", "contact_form.privacy_text", "contact_form.newsletter_text", "contact_form.submit_button_text", "CTAText"]}	[]	2024-11-25 14:44:04.512	2024-11-25 14:44:04.512	2024-11-25 14:44:04.512	\N	\N	\N
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	2	12
13	13	2	13
14	14	2	14
15	15	2	15
16	16	2	16
17	17	2	17
18	18	2	18
19	19	2	19
20	20	2	20
21	21	2	21
22	22	2	22
23	23	2	23
24	24	2	24
25	25	2	25
26	26	2	26
27	27	2	27
28	28	2	28
29	29	2	29
30	30	2	30
31	31	2	31
32	32	2	32
33	33	2	33
34	34	2	34
35	35	2	35
36	36	2	36
37	37	3	1
38	38	3	2
39	39	3	3
40	40	3	4
41	41	3	5
42	42	3	6
43	43	3	7
44	44	3	8
45	45	3	9
46	46	3	10
47	47	3	11
48	48	3	12
49	49	3	13
50	50	3	14
51	51	3	15
52	52	3	16
53	53	3	17
54	54	3	18
55	55	3	19
56	56	3	20
57	57	3	21
58	58	3	22
59	59	3	23
60	60	3	24
61	61	3	25
62	62	3	26
63	63	3	27
64	64	3	28
65	65	3	29
66	66	3	30
67	67	1	1
68	68	1	2
69	69	1	3
71	71	1	5
72	72	1	6
74	74	1	8
75	75	1	9
76	76	1	10
78	78	1	12
79	79	1	13
81	81	1	15
82	82	1	16
83	83	1	17
85	85	1	19
86	86	1	20
88	88	1	22
89	89	1	23
90	90	1	24
91	91	1	25
92	92	1	26
93	93	1	27
94	94	1	28
95	95	1	29
96	96	1	30
97	97	1	31
98	98	1	32
99	99	1	33
100	100	1	34
101	101	1	35
102	102	1	36
103	103	1	37
104	104	1	38
105	105	1	39
106	106	1	40
107	107	1	41
108	108	1	42
109	109	1	43
110	110	1	44
111	111	1	45
112	112	1	46
113	113	1	47
114	114	1	48
115	115	1	49
116	116	1	50
117	117	1	51
118	118	1	52
119	119	1	53
120	120	1	54
121	121	1	55
122	122	1	56
123	123	1	57
124	124	1	58
125	125	1	59
126	126	1	60
127	127	1	61
128	128	1	62
129	129	1	63
130	130	1	64
131	131	1	65
132	132	1	66
133	133	1	67
134	134	1	68
135	135	1	69
136	136	1	70
137	137	1	71
138	138	1	72
139	139	1	73
140	140	1	74
141	141	1	75
142	142	1	76
143	143	1	77
144	144	1	78
145	145	1	79
146	146	1	80
147	147	1	81
148	148	1	82
149	149	1	83
150	150	1	84
151	151	1	85
152	152	1	86
153	153	1	87
154	154	1	88
161	161	1	95
162	162	1	96
169	169	1	103
170	170	1	104
177	177	1	111
178	178	1	112
179	179	1	113
180	180	1	114
181	181	1	115
182	182	1	116
183	183	1	117
187	187	1	121
188	188	1	122
189	189	1	123
193	193	1	127
194	194	1	128
195	195	1	129
196	196	1	130
197	197	1	131
201	201	1	135
202	202	1	136
203	203	1	137
210	210	1	138
211	211	1	139
212	212	1	140
216	216	1	141
217	217	1	142
218	218	1	143
222	222	1	147
223	223	1	148
227	227	1	149
228	228	1	150
229	229	1	151
230	230	1	152
231	231	1	153
232	232	1	154
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	kqitzr7ei3tizvlm9z6bruqz	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2024-11-08 22:00:25.54	2024-11-08 22:00:25.54	2024-11-08 22:00:25.54	\N	\N	\N
2	q4iv8iknrgbrnnvcnd774c43	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2024-11-08 22:00:25.552	2024-11-08 22:00:25.552	2024-11-08 22:00:25.552	\N	\N	\N
3	xzscdymqs7vk0grthglqxvqq	Author	strapi-author	Authors can manage the content they have created.	2024-11-08 22:00:25.559	2024-11-08 22:00:25.559	2024-11-08 22:00:25.559	\N	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	uljwfzztmoa0tqhf196kow8u	Bryan	Tüscher	\N	me@databryan.com	$2a$10$rb8CNxuSTJD.3ivcC2./jOdB77p7oG6sV/6VId7x/zIcQGbVi75/6	\N	\N	t	f	\N	2024-11-08 22:01:24.825	2024-11-08 22:01:24.825	2024-11-08 22:01:24.827	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: components_contactaddress_contactaddresses; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.components_contactaddress_contactaddresses (id, street, city, postal_code, phone, email, opening_hours) FROM stdin;
1	Am Bollwerk 27	Butzbach	35510	06033 920226	info@tuescher.de	Nach Vereinbarung
4	Am Bollwerk 27	Butzbach	35510	06033 920226	info@tuescher.de	Nach Vereinbarung
\.


--
-- Data for Name: components_contactaddress_contactformsettings; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.components_contactaddress_contactformsettings (id, success_message, error_message, privacy_text, newsletter_text, submit_button_text) FROM stdin;
1	Nachricht erfolgreich versendet!	Die Nachricht konnte nicht versendet werden - probiere es erneut!	Ich stimme der Speicherung meiner Daten gemäß der Datenschutzerklärung zu.	Ich möchte E-Mails über Neuigkeiten und Angebote erhalten.	Nachricht senden
4	Nachricht erfolgreich versendet!	Die Nachricht konnte nicht versendet werden - probiere es erneut!	Ich stimme der Speicherung meiner Daten gemäß der Datenschutzerklärung zu.	Ich möchte E-Mails über Neuigkeiten und Angebote erhalten.	Nachricht senden
\.


--
-- Data for Name: components_features_feature_items; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.components_features_feature_items (id, title, icon) FROM stdin;
1	Individuelle Insektenschutzlösungen vom Marktführer Neher	SHIELD
2	Hochwertige Produkte für Fenster, Türen und Lichtschachtabdeckungen	HOME
3	 Effektiver Schutz vor Insekten für mehr Wohnkomfort	HEART
4	 Maßanfertigungen für perfekte Passform und Qualität 	GEAR
5	Verlässliche Systeme für ruhige und entspannte Stunden zu Hause	CLOCK
21	Individuelle Insektenschutzlösungen vom Marktführer Neher	SHIELD
22	Hochwertige Produkte für Fenster, Türen und Lichtschachtabdeckungen	HOME
23	 Effektiver Schutz vor Insekten für mehr Wohnkomfort	HEART
24	 Maßanfertigungen für perfekte Passform und Qualität 	GEAR
25	Verlässliche Systeme für ruhige und entspannte Stunden zu Hause	CLOCK
\.


--
-- Data for Name: contact_forms; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.contact_forms (id, document_id, name, email, phone, message, privacy, newsletter, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, company, want_contact, method, "time") FROM stdin;
129	eihtnw2xgzmloietr0ef0kr8	Bryan Tüscher	btuescher13@gmail.com	15157639644	Sales Funnel Inquiry - Budget: 7000	t	f	2024-11-25 08:33:08.614	2024-11-25 08:33:08.614	\N	\N	\N	\N	Tüscher	t	phone	18:00
130	eihtnw2xgzmloietr0ef0kr8	Bryan Tüscher	btuescher13@gmail.com	15157639644	Sales Funnel Inquiry - Budget: 7000	t	f	2024-11-25 08:33:08.614	2024-11-25 08:33:08.614	2024-11-25 08:33:08.622	\N	\N	\N	Tüscher	t	phone	18:00
131	qpsj8t38omoy84gf7vxnx2ja	Bryan Tüscher	btuescher13@gmail.com	15157639644	Sales Funnel Inquiry - Budget: 5000	t	f	2024-11-25 09:55:05.666	2024-11-25 09:55:05.666	\N	\N	\N	\N	Hhh	t	phone	12:00
132	qpsj8t38omoy84gf7vxnx2ja	Bryan Tüscher	btuescher13@gmail.com	15157639644	Sales Funnel Inquiry - Budget: 5000	t	f	2024-11-25 09:55:05.666	2024-11-25 09:55:05.666	2024-11-25 09:55:05.699	\N	\N	\N	Hhh	t	phone	12:00
133	n77i4820bo6jl5ykjsspdarz	Peter	Pan@peter.de	1234124	Sales Funnel Inquiry - Budget: 8000	t	f	2024-11-25 17:19:12.254	2024-11-25 17:19:12.254	\N	\N	\N	\N	Peter GmbH	t	phone	09:00
134	n77i4820bo6jl5ykjsspdarz	Peter	Pan@peter.de	1234124	Sales Funnel Inquiry - Budget: 8000	t	f	2024-11-25 17:19:12.254	2024-11-25 17:19:12.254	2024-11-25 17:19:12.368	\N	\N	\N	Peter GmbH	t	phone	09:00
135	fb21xrdpklr2cfe1jryf0g3a	Peter	Pan@peter.de	1234124	Sales Funnel Inquiry - Budget: 8000	t	f	2024-11-25 17:22:05.062	2024-11-25 17:22:05.062	\N	\N	\N	\N	Peter GmbH	t	phone	09:00
136	fb21xrdpklr2cfe1jryf0g3a	Peter	Pan@peter.de	1234124	Sales Funnel Inquiry - Budget: 8000	t	f	2024-11-25 17:22:05.062	2024-11-25 17:22:05.062	2024-11-25 17:22:05.073	\N	\N	\N	Peter GmbH	t	phone	09:00
\.


--
-- Data for Name: contactsections; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.contactsections (id, document_id, title, subtitle, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, cta_text) FROM stdin;
1	dqk6bc8pxf1q2g0debzjx34l	Kontaktieren Sie uns	Bereit für Ihre individuelle Insektenschutzlösung? Nehmen Sie Kontakt zu uns auf und vereinbaren Sie einen Beratungstermin.	2024-11-09 01:53:51.041	2024-11-25 15:42:01.17	\N	1	1	\N	Produktanfrage starten!
4	dqk6bc8pxf1q2g0debzjx34l	Kontaktieren Sie uns	Bereit für Ihre individuelle Insektenschutzlösung? Nehmen Sie Kontakt zu uns auf und vereinbaren Sie einen Beratungstermin.	2024-11-09 01:53:51.041	2024-11-25 15:42:01.17	2024-11-25 15:42:01.207	1	1	\N	Produktanfrage starten!
\.


--
-- Data for Name: contactsections_cmps; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.contactsections_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
1	1	1	contactaddress.contactaddress	address	\N
2	1	1	contactaddress.contactformsettings	contact_form	\N
11	4	4	contactaddress.contactaddress	address	\N
12	4	4	contactaddress.contactformsettings	contact_form	\N
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.faqs (id, document_id, question, answer, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	q92mydkq6cf053kvwvw0zysz	Was bedeutet Maßfertigung bei den Insektenschutz Elementen?\n	Maßfertigung bedeutet, dass die Insektenschutz Elemente exakt auf Ihre Fenster- oder Türmaße angepasst werden. Unser Experte kommt zu einem vereinbarten Ausmaßtermin vor Ort und nimmt die exakten Maße auf, um eine perfekte Passform zu garantieren.	2024-11-08 22:22:22.988	2024-11-08 22:22:22.988	\N	1	1	\N
2	q92mydkq6cf053kvwvw0zysz	Was bedeutet Maßfertigung bei den Insektenschutz Elementen?\n	Maßfertigung bedeutet, dass die Insektenschutz Elemente exakt auf Ihre Fenster- oder Türmaße angepasst werden. Unser Experte kommt zu einem vereinbarten Ausmaßtermin vor Ort und nimmt die exakten Maße auf, um eine perfekte Passform zu garantieren.	2024-11-08 22:22:22.988	2024-11-08 22:22:22.988	2024-11-08 22:22:23.005	1	1	\N
3	sojtss8z59ar3b0x91ewg0dm	Kann ich meinen Insektenschutz selbst montieren?	Die meisten Insektenschutzprodukte können selbst montiert werden, wenn Sie handwerklich geschickt sind und die Anweisungen des Herstellers genau befolgen. Allerdings kann es bei einigen Produkten schwierig sein, die richtige Passform zu erreichen oder die Montage erfordert spezielle Werkzeuge. In jedem Fall bieten wir Ihnen eine fachmännische Montage an, um sicherzustellen, dass der Insektenschutz richtig installiert ist.	2024-11-08 22:22:34.829	2024-11-08 22:22:34.829	\N	1	1	\N
4	sojtss8z59ar3b0x91ewg0dm	Kann ich meinen Insektenschutz selbst montieren?	Die meisten Insektenschutzprodukte können selbst montiert werden, wenn Sie handwerklich geschickt sind und die Anweisungen des Herstellers genau befolgen. Allerdings kann es bei einigen Produkten schwierig sein, die richtige Passform zu erreichen oder die Montage erfordert spezielle Werkzeuge. In jedem Fall bieten wir Ihnen eine fachmännische Montage an, um sicherzustellen, dass der Insektenschutz richtig installiert ist.	2024-11-08 22:22:34.829	2024-11-08 22:22:34.829	2024-11-08 22:22:34.84	1	1	\N
5	eythm04qns864jy4bnzr50em	Was passiert, wenn das Insektenschutz Element beschädigt wird?	Sollte das Insektenschutz Element beschädigt werden, bieten wir einen Reparaturservice an. Kontaktieren Sie uns einfach und wir werden uns um eine schnelle Lösung kümmern.	2024-11-08 22:22:45.609	2024-11-08 22:22:45.609	\N	1	1	\N
6	eythm04qns864jy4bnzr50em	Was passiert, wenn das Insektenschutz Element beschädigt wird?	Sollte das Insektenschutz Element beschädigt werden, bieten wir einen Reparaturservice an. Kontaktieren Sie uns einfach und wir werden uns um eine schnelle Lösung kümmern.	2024-11-08 22:22:45.609	2024-11-08 22:22:45.609	2024-11-08 22:22:45.623	1	1	\N
7	s365j10h1b5th8jnd11fngh0	Was für Gewebearten stehen zur Verfügung	Wir bieten verschiedene Gewebearten an, darunter das fast unsichtbare aber robuste Transpatecgewebe, das klassiche Fiberglasgewebe aber auch Aluminium-, Edelstahl- oder Katzenschutzgewebe. Jede Gewebeart hat ihre eigenen Vorteile, wie z.B. Langlebigkeit oder Transparenz. Lassen Sie sich von uns beraten, welches Gewebe am besten zu Ihren Bedürfnissen passt.	2024-11-08 22:22:55.608	2024-11-08 22:22:55.608	\N	1	1	\N
8	s365j10h1b5th8jnd11fngh0	Was für Gewebearten stehen zur Verfügung	Wir bieten verschiedene Gewebearten an, darunter das fast unsichtbare aber robuste Transpatecgewebe, das klassiche Fiberglasgewebe aber auch Aluminium-, Edelstahl- oder Katzenschutzgewebe. Jede Gewebeart hat ihre eigenen Vorteile, wie z.B. Langlebigkeit oder Transparenz. Lassen Sie sich von uns beraten, welches Gewebe am besten zu Ihren Bedürfnissen passt.	2024-11-08 22:22:55.608	2024-11-08 22:22:55.608	2024-11-08 22:22:55.618	1	1	\N
9	iqpytb10pujrbdnedxcztnmc	Sind die Insektenschutzprodukte auch für Allergiker geeignet?	Ja, unsere Insektenschutzprodukte sind auch für Allergiker geeignet, wir bieten ein spezielles Pollenschutzgewebe an, das eine effektive Barriere gegen Pollen und andere allergene Substanzen bietet.	2024-11-08 22:23:09.556	2024-11-08 22:23:09.556	\N	1	1	\N
10	iqpytb10pujrbdnedxcztnmc	Sind die Insektenschutzprodukte auch für Allergiker geeignet?	Ja, unsere Insektenschutzprodukte sind auch für Allergiker geeignet, wir bieten ein spezielles Pollenschutzgewebe an, das eine effektive Barriere gegen Pollen und andere allergene Substanzen bietet.	2024-11-08 22:23:09.556	2024-11-08 22:23:09.556	2024-11-08 22:23:09.565	1	1	\N
11	vnd26c9hyoj8z43qyfgk5x8a	Wie lange halten die Insektenschutzprodukte?	Unsere Insektenschutz Elemente sind sehr langlebig und können 20 Jahre und länger halten. Darüber hinaus ist es jederzeit möglich, das Gewebe zu erneuern.\n	2024-11-08 22:23:20.22	2024-11-08 22:23:20.22	\N	1	1	\N
12	vnd26c9hyoj8z43qyfgk5x8a	Wie lange halten die Insektenschutzprodukte?	Unsere Insektenschutz Elemente sind sehr langlebig und können 20 Jahre und länger halten. Darüber hinaus ist es jederzeit möglich, das Gewebe zu erneuern.\n	2024-11-08 22:23:20.22	2024-11-08 22:23:20.22	2024-11-08 22:23:20.23	1	1	\N
\.


--
-- Data for Name: file_and_resources; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.file_and_resources (id, document_id, title, file_type, size, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
3	lv432z009gv1q36wx2nrpenv	Neher Gesamtflyer Lichtschachtabdeckungen	pdf	12.00	2024-11-09 12:50:18.686	2024-11-09 12:50:18.686	\N	1	1	\N
4	lv432z009gv1q36wx2nrpenv	Neher Gesamtflyer Lichtschachtabdeckungen	pdf	12.00	2024-11-09 12:50:18.686	2024-11-09 12:50:18.686	2024-11-09 12:50:18.7	1	1	\N
1	a398ic7rm42jwcvg8erx3y6i	Neher Gesamtflyer Insektenschutz	pdf	12.00	2024-11-09 12:49:45.784	2024-11-09 12:50:32.172	\N	1	1	\N
5	a398ic7rm42jwcvg8erx3y6i	Neher Gesamtflyer Insektenschutz	pdf	12.00	2024-11-09 12:49:45.784	2024-11-09 12:50:32.172	2024-11-09 12:50:32.194	1	1	\N
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	ewbp530ssd9z5310q96ovrfx	intro_long.png	\N	\N	1500	500	{"large": {"ext": ".png", "url": "/uploads/large_intro_long_75a330ceff.png", "hash": "large_intro_long_75a330ceff", "mime": "image/png", "name": "large_intro_long.png", "path": null, "size": 790.42, "width": 1000, "height": 333, "sizeInBytes": 790417}, "small": {"ext": ".png", "url": "/uploads/small_intro_long_75a330ceff.png", "hash": "small_intro_long_75a330ceff", "mime": "image/png", "name": "small_intro_long.png", "path": null, "size": 196.92, "width": 500, "height": 167, "sizeInBytes": 196918}, "medium": {"ext": ".png", "url": "/uploads/medium_intro_long_75a330ceff.png", "hash": "medium_intro_long_75a330ceff", "mime": "image/png", "name": "medium_intro_long.png", "path": null, "size": 443.6, "width": 750, "height": 250, "sizeInBytes": 443595}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_intro_long_75a330ceff.png", "hash": "thumbnail_intro_long_75a330ceff", "mime": "image/png", "name": "thumbnail_intro_long.png", "path": null, "size": 49.2, "width": 245, "height": 82, "sizeInBytes": 49196}}	intro_long_75a330ceff	.png	image/png	363.94	/uploads/intro_long_75a330ceff.png	\N	local	\N	/	2024-11-08 22:08:22.177	2024-11-08 22:08:22.177	2024-11-08 22:08:22.179	1	1	\N
2	pzubfwzxhm6xsyoavl21c4u1	fenster.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_fenster_806f3dc3ff.jpg", "hash": "small_fenster_806f3dc3ff", "mime": "image/jpeg", "name": "small_fenster.jpg", "path": null, "size": 24.86, "width": 500, "height": 375, "sizeInBytes": 24858}, "medium": {"ext": ".jpg", "url": "/uploads/medium_fenster_806f3dc3ff.jpg", "hash": "medium_fenster_806f3dc3ff", "mime": "image/jpeg", "name": "medium_fenster.jpg", "path": null, "size": 54.52, "width": 750, "height": 563, "sizeInBytes": 54516}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_fenster_806f3dc3ff.jpg", "hash": "thumbnail_fenster_806f3dc3ff", "mime": "image/jpeg", "name": "thumbnail_fenster.jpg", "path": null, "size": 4.9, "width": 208, "height": 156, "sizeInBytes": 4901}}	fenster_806f3dc3ff	.jpg	image/jpeg	61.83	/uploads/fenster_806f3dc3ff.jpg	\N	local	\N	/	2024-11-08 22:19:44.334	2024-11-08 22:19:44.334	2024-11-08 22:19:44.334	1	1	\N
3	m126nuea6wphg4p114yhz6w4	lisa.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_lisa_3e79897e41.jpg", "hash": "small_lisa_3e79897e41", "mime": "image/jpeg", "name": "small_lisa.jpg", "path": null, "size": 53.3, "width": 500, "height": 375, "sizeInBytes": 53298}, "medium": {"ext": ".jpg", "url": "/uploads/medium_lisa_3e79897e41.jpg", "hash": "medium_lisa_3e79897e41", "mime": "image/jpeg", "name": "medium_lisa.jpg", "path": null, "size": 113.63, "width": 750, "height": 563, "sizeInBytes": 113625}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_lisa_3e79897e41.jpg", "hash": "thumbnail_lisa_3e79897e41", "mime": "image/jpeg", "name": "thumbnail_lisa.jpg", "path": null, "size": 10.7, "width": 208, "height": 156, "sizeInBytes": 10695}}	lisa_3e79897e41	.jpg	image/jpeg	129.81	/uploads/lisa_3e79897e41.jpg	\N	local	\N	/	2024-11-08 22:20:53.12	2024-11-08 22:20:53.12	2024-11-08 22:20:53.12	1	1	\N
4	btlls05t8lajq6nn3bftfvok	schiebetuer.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_schiebetuer_510baf2a10.jpg", "hash": "small_schiebetuer_510baf2a10", "mime": "image/jpeg", "name": "small_schiebetuer.jpg", "path": null, "size": 34.53, "width": 500, "height": 375, "sizeInBytes": 34531}, "medium": {"ext": ".jpg", "url": "/uploads/medium_schiebetuer_510baf2a10.jpg", "hash": "medium_schiebetuer_510baf2a10", "mime": "image/jpeg", "name": "medium_schiebetuer.jpg", "path": null, "size": 70.49, "width": 750, "height": 563, "sizeInBytes": 70485}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_schiebetuer_510baf2a10.jpg", "hash": "thumbnail_schiebetuer_510baf2a10", "mime": "image/jpeg", "name": "thumbnail_schiebetuer.jpg", "path": null, "size": 8.02, "width": 208, "height": 156, "sizeInBytes": 8022}}	schiebetuer_510baf2a10	.jpg	image/jpeg	78.60	/uploads/schiebetuer_510baf2a10.jpg	\N	local	\N	/	2024-11-08 22:21:25.4	2024-11-08 22:21:25.4	2024-11-08 22:21:25.4	1	1	\N
5	wnk2v2rq52tku15a1avujxzk	mhz-plissees.webp	\N	\N	1360	765	{"large": {"ext": ".webp", "url": "/uploads/large_mhz_plissees_a2f34887e7.webp", "hash": "large_mhz_plissees_a2f34887e7", "mime": "image/webp", "name": "large_mhz-plissees.webp", "path": null, "size": 65.99, "width": 1000, "height": 562, "sizeInBytes": 65994}, "small": {"ext": ".webp", "url": "/uploads/small_mhz_plissees_a2f34887e7.webp", "hash": "small_mhz_plissees_a2f34887e7", "mime": "image/webp", "name": "small_mhz-plissees.webp", "path": null, "size": 19.22, "width": 500, "height": 281, "sizeInBytes": 19222}, "medium": {"ext": ".webp", "url": "/uploads/medium_mhz_plissees_a2f34887e7.webp", "hash": "medium_mhz_plissees_a2f34887e7", "mime": "image/webp", "name": "medium_mhz-plissees.webp", "path": null, "size": 39.66, "width": 750, "height": 422, "sizeInBytes": 39662}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_mhz_plissees_a2f34887e7.webp", "hash": "thumbnail_mhz_plissees_a2f34887e7", "mime": "image/webp", "name": "thumbnail_mhz-plissees.webp", "path": null, "size": 5.2, "width": 245, "height": 138, "sizeInBytes": 5202}}	mhz_plissees_a2f34887e7	.webp	image/webp	139.99	/uploads/mhz_plissees_a2f34887e7.webp	\N	local	\N	/	2024-11-08 22:21:57.384	2024-11-08 22:21:57.384	2024-11-08 22:21:57.384	1	1	\N
6	stxgpssr56wdf27xdbn1e2dp	DALL·E 2024-11-08 22.07.33 - A modern animated design of four anthropomorphic insect characters standing side by side looking sad and disappointed. The group includes a bee with y.webp	\N	\N	1792	1024	{"large": {"ext": ".webp", "url": "/uploads/large_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000.webp", "hash": "large_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000", "mime": "image/webp", "name": "large_DALL·E 2024-11-08 22.07.33 - A modern animated design of four anthropomorphic insect characters standing side by side looking sad and disappointed. The group includes a bee with y.webp", "path": null, "size": 60.93, "width": 1000, "height": 571, "sizeInBytes": 60930}, "small": {"ext": ".webp", "url": "/uploads/small_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000.webp", "hash": "small_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000", "mime": "image/webp", "name": "small_DALL·E 2024-11-08 22.07.33 - A modern animated design of four anthropomorphic insect characters standing side by side looking sad and disappointed. The group includes a bee with y.webp", "path": null, "size": 22.46, "width": 500, "height": 286, "sizeInBytes": 22458}, "medium": {"ext": ".webp", "url": "/uploads/medium_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000.webp", "hash": "medium_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000", "mime": "image/webp", "name": "medium_DALL·E 2024-11-08 22.07.33 - A modern animated design of four anthropomorphic insect characters standing side by side looking sad and disappointed. The group includes a bee with y.webp", "path": null, "size": 40.11, "width": 750, "height": 429, "sizeInBytes": 40108}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000.webp", "hash": "thumbnail_DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000", "mime": "image/webp", "name": "thumbnail_DALL·E 2024-11-08 22.07.33 - A modern animated design of four anthropomorphic insect characters standing side by side looking sad and disappointed. The group includes a bee with y.webp", "path": null, "size": 8.13, "width": 245, "height": 140, "sizeInBytes": 8128}}	DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000	.webp	image/webp	158.67	/uploads/DALL_E_2024_11_08_22_07_33_A_modern_animated_design_of_four_anthropomorphic_insect_characters_standing_side_by_side_looking_sad_and_disappointed_The_group_includes_a_bee_with_y_d422da1000.webp	\N	local	\N	/	2024-11-08 22:39:29.332	2024-11-08 22:39:29.332	2024-11-08 22:39:29.333	1	1	\N
7	b5xwnrzc0khxjheofyak1otr	fenster_frame.jpg	\N	\N	1217	697	{"large": {"ext": ".jpg", "url": "/uploads/large_fenster_frame_6897444f69.jpg", "hash": "large_fenster_frame_6897444f69", "mime": "image/jpeg", "name": "large_fenster_frame.jpg", "path": null, "size": 53.36, "width": 1000, "height": 573, "sizeInBytes": 53364}, "small": {"ext": ".jpg", "url": "/uploads/small_fenster_frame_6897444f69.jpg", "hash": "small_fenster_frame_6897444f69", "mime": "image/jpeg", "name": "small_fenster_frame.jpg", "path": null, "size": 17.11, "width": 500, "height": 286, "sizeInBytes": 17112}, "medium": {"ext": ".jpg", "url": "/uploads/medium_fenster_frame_6897444f69.jpg", "hash": "medium_fenster_frame_6897444f69", "mime": "image/jpeg", "name": "medium_fenster_frame.jpg", "path": null, "size": 33, "width": 750, "height": 430, "sizeInBytes": 32997}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_fenster_frame_6897444f69.jpg", "hash": "thumbnail_fenster_frame_6897444f69", "mime": "image/jpeg", "name": "thumbnail_fenster_frame.jpg", "path": null, "size": 5.67, "width": 245, "height": 140, "sizeInBytes": 5667}}	fenster_frame_6897444f69	.jpg	image/jpeg	73.65	/uploads/fenster_frame_6897444f69.jpg	\N	local	\N	/	2024-11-09 12:17:09.494	2024-11-09 12:17:09.494	2024-11-09 12:17:09.498	1	1	\N
8	y5u1ojd4q93a0jyx5dk99sts	frame_fenster.jpg	\N	\N	4000	2000	{"large": {"ext": ".jpg", "url": "/uploads/large_frame_fenster_87e082db37.jpg", "hash": "large_frame_fenster_87e082db37", "mime": "image/jpeg", "name": "large_frame_fenster.jpg", "path": null, "size": 41.19, "width": 1000, "height": 500, "sizeInBytes": 41192}, "small": {"ext": ".jpg", "url": "/uploads/small_frame_fenster_87e082db37.jpg", "hash": "small_frame_fenster_87e082db37", "mime": "image/jpeg", "name": "small_frame_fenster.jpg", "path": null, "size": 13.91, "width": 500, "height": 250, "sizeInBytes": 13910}, "medium": {"ext": ".jpg", "url": "/uploads/medium_frame_fenster_87e082db37.jpg", "hash": "medium_frame_fenster_87e082db37", "mime": "image/jpeg", "name": "medium_frame_fenster.jpg", "path": null, "size": 25.72, "width": 750, "height": 375, "sizeInBytes": 25719}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_frame_fenster_87e082db37.jpg", "hash": "thumbnail_frame_fenster_87e082db37", "mime": "image/jpeg", "name": "thumbnail_frame_fenster.jpg", "path": null, "size": 4.92, "width": 245, "height": 123, "sizeInBytes": 4922}}	frame_fenster_87e082db37	.jpg	image/jpeg	435.81	/uploads/frame_fenster_87e082db37.jpg	\N	local	\N	/	2024-11-09 12:17:13.693	2024-11-09 12:17:13.693	2024-11-09 12:17:13.694	1	1	\N
9	t52quxat837m3rr93dekobj0	fenster2.jpg	\N	\N	3840	3825	{"large": {"ext": ".jpg", "url": "/uploads/large_fenster2_974f5f81ee.jpg", "hash": "large_fenster2_974f5f81ee", "mime": "image/jpeg", "name": "large_fenster2.jpg", "path": null, "size": 127.22, "width": 1000, "height": 996, "sizeInBytes": 127215}, "small": {"ext": ".jpg", "url": "/uploads/small_fenster2_974f5f81ee.jpg", "hash": "small_fenster2_974f5f81ee", "mime": "image/jpeg", "name": "small_fenster2.jpg", "path": null, "size": 34.55, "width": 500, "height": 498, "sizeInBytes": 34548}, "medium": {"ext": ".jpg", "url": "/uploads/medium_fenster2_974f5f81ee.jpg", "hash": "medium_fenster2_974f5f81ee", "mime": "image/jpeg", "name": "medium_fenster2.jpg", "path": null, "size": 71.06, "width": 750, "height": 747, "sizeInBytes": 71056}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_fenster2_974f5f81ee.jpg", "hash": "thumbnail_fenster2_974f5f81ee", "mime": "image/jpeg", "name": "thumbnail_fenster2.jpg", "path": null, "size": 4.93, "width": 157, "height": 156, "sizeInBytes": 4927}}	fenster2_974f5f81ee	.jpg	image/jpeg	1622.63	/uploads/fenster2_974f5f81ee.jpg	\N	local	\N	/	2024-11-09 12:17:13.982	2024-11-09 12:17:13.982	2024-11-09 12:17:13.983	1	1	\N
10	chbjkex2l4o4p3tz1y1jcktt	fenster_auf_schlafen.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_fenster_auf_schlafen_e58933110d.jpeg", "hash": "large_fenster_auf_schlafen_e58933110d", "mime": "image/jpeg", "name": "large_fenster_auf_schlafen.jpeg", "path": null, "size": 64.49, "width": 1000, "height": 667, "sizeInBytes": 64493}, "small": {"ext": ".jpeg", "url": "/uploads/small_fenster_auf_schlafen_e58933110d.jpeg", "hash": "small_fenster_auf_schlafen_e58933110d", "mime": "image/jpeg", "name": "small_fenster_auf_schlafen.jpeg", "path": null, "size": 21.03, "width": 500, "height": 333, "sizeInBytes": 21032}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_fenster_auf_schlafen_e58933110d.jpeg", "hash": "medium_fenster_auf_schlafen_e58933110d", "mime": "image/jpeg", "name": "medium_fenster_auf_schlafen.jpeg", "path": null, "size": 40.24, "width": 750, "height": 500, "sizeInBytes": 40244}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_fenster_auf_schlafen_e58933110d.jpeg", "hash": "thumbnail_fenster_auf_schlafen_e58933110d", "mime": "image/jpeg", "name": "thumbnail_fenster_auf_schlafen.jpeg", "path": null, "size": 6.59, "width": 234, "height": 156, "sizeInBytes": 6590}}	fenster_auf_schlafen_e58933110d	.jpeg	image/jpeg	2877.76	/uploads/fenster_auf_schlafen_e58933110d.jpeg	\N	local	\N	/	2024-11-09 12:17:14.334	2024-11-09 12:17:14.334	2024-11-09 12:17:14.335	1	1	\N
12	c6tc9piwsjjszoxgy6tlaanm	elsa.jpeg	\N	\N	3543	2494	{"large": {"ext": ".jpeg", "url": "/uploads/large_elsa_3e36ba2a70.jpeg", "hash": "large_elsa_3e36ba2a70", "mime": "image/jpeg", "name": "large_elsa.jpeg", "path": null, "size": 102.34, "width": 1000, "height": 704, "sizeInBytes": 102339}, "small": {"ext": ".jpeg", "url": "/uploads/small_elsa_3e36ba2a70.jpeg", "hash": "small_elsa_3e36ba2a70", "mime": "image/jpeg", "name": "small_elsa.jpeg", "path": null, "size": 28.61, "width": 500, "height": 352, "sizeInBytes": 28605}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_elsa_3e36ba2a70.jpeg", "hash": "medium_elsa_3e36ba2a70", "mime": "image/jpeg", "name": "medium_elsa.jpeg", "path": null, "size": 60.92, "width": 750, "height": 528, "sizeInBytes": 60920}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_elsa_3e36ba2a70.jpeg", "hash": "thumbnail_elsa_3e36ba2a70", "mime": "image/jpeg", "name": "thumbnail_elsa.jpeg", "path": null, "size": 6.93, "width": 222, "height": 156, "sizeInBytes": 6926}}	elsa_3e36ba2a70	.jpeg	image/jpeg	1055.13	/uploads/elsa_3e36ba2a70.jpeg	\N	local	\N	/	2024-11-09 12:20:00.822	2024-11-09 12:20:00.822	2024-11-09 12:20:00.823	1	1	\N
13	gq6jt2706mayoafokppf24ca	drehtuer.jpeg	\N	\N	3114	4671	{"large": {"ext": ".jpeg", "url": "/uploads/large_drehtuer_32e8f7d0ad.jpeg", "hash": "large_drehtuer_32e8f7d0ad", "mime": "image/jpeg", "name": "large_drehtuer.jpeg", "path": null, "size": 81.49, "width": 667, "height": 1000, "sizeInBytes": 81490}, "small": {"ext": ".jpeg", "url": "/uploads/small_drehtuer_32e8f7d0ad.jpeg", "hash": "small_drehtuer_32e8f7d0ad", "mime": "image/jpeg", "name": "small_drehtuer.jpeg", "path": null, "size": 24.56, "width": 334, "height": 500, "sizeInBytes": 24563}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_drehtuer_32e8f7d0ad.jpeg", "hash": "medium_drehtuer_32e8f7d0ad", "mime": "image/jpeg", "name": "medium_drehtuer.jpeg", "path": null, "size": 48.32, "width": 500, "height": 750, "sizeInBytes": 48317}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_drehtuer_32e8f7d0ad.jpeg", "hash": "thumbnail_drehtuer_32e8f7d0ad", "mime": "image/jpeg", "name": "thumbnail_drehtuer.jpeg", "path": null, "size": 3.95, "width": 104, "height": 156, "sizeInBytes": 3953}}	drehtuer_32e8f7d0ad	.jpeg	image/jpeg	1385.45	/uploads/drehtuer_32e8f7d0ad.jpeg	\N	local	\N	/	2024-11-09 12:20:01.854	2024-11-09 12:20:01.854	2024-11-09 12:20:01.855	1	1	\N
15	x4vw3yw1ur0zypestxeahht1	pendeltuer.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_pendeltuer_b4b0a81b7c.jpg", "hash": "small_pendeltuer_b4b0a81b7c", "mime": "image/jpeg", "name": "small_pendeltuer.jpg", "path": null, "size": 47.64, "width": 500, "height": 375, "sizeInBytes": 47635}, "medium": {"ext": ".jpg", "url": "/uploads/medium_pendeltuer_b4b0a81b7c.jpg", "hash": "medium_pendeltuer_b4b0a81b7c", "mime": "image/jpeg", "name": "medium_pendeltuer.jpg", "path": null, "size": 93.52, "width": 750, "height": 563, "sizeInBytes": 93519}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_pendeltuer_b4b0a81b7c.jpg", "hash": "thumbnail_pendeltuer_b4b0a81b7c", "mime": "image/jpeg", "name": "thumbnail_pendeltuer.jpg", "path": null, "size": 10.14, "width": 208, "height": 156, "sizeInBytes": 10143}}	pendeltuer_b4b0a81b7c	.jpg	image/jpeg	105.69	/uploads/pendeltuer_b4b0a81b7c.jpg	\N	local	\N	/	2024-11-09 12:20:03.717	2024-11-09 12:20:03.717	2024-11-09 12:20:03.718	1	1	\N
17	i9fazz2ozjit4fr7wss0mce9	rollo_smalltalk.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_rollo_smalltalk_1fca30b369.jpg", "hash": "small_rollo_smalltalk_1fca30b369", "mime": "image/jpeg", "name": "small_rollo_smalltalk.jpg", "path": null, "size": 36.55, "width": 500, "height": 375, "sizeInBytes": 36547}, "medium": {"ext": ".jpg", "url": "/uploads/medium_rollo_smalltalk_1fca30b369.jpg", "hash": "medium_rollo_smalltalk_1fca30b369", "mime": "image/jpeg", "name": "medium_rollo_smalltalk.jpg", "path": null, "size": 79.81, "width": 750, "height": 563, "sizeInBytes": 79810}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_rollo_smalltalk_1fca30b369.jpg", "hash": "thumbnail_rollo_smalltalk_1fca30b369", "mime": "image/jpeg", "name": "thumbnail_rollo_smalltalk.jpg", "path": null, "size": 7.35, "width": 208, "height": 156, "sizeInBytes": 7353}}	rollo_smalltalk_1fca30b369	.jpg	image/jpeg	90.38	/uploads/rollo_smalltalk_1fca30b369.jpg	\N	local	\N	/	2024-11-09 12:20:05.426	2024-11-09 12:20:05.426	2024-11-09 12:20:05.427	1	1	\N
19	poo0iyxkoqjueco4y7scez6t	schiebetuer_happy.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_schiebetuer_happy_9503c5eea9.jpg", "hash": "small_schiebetuer_happy_9503c5eea9", "mime": "image/jpeg", "name": "small_schiebetuer_happy.jpg", "path": null, "size": 34.81, "width": 500, "height": 375, "sizeInBytes": 34814}, "medium": {"ext": ".jpg", "url": "/uploads/medium_schiebetuer_happy_9503c5eea9.jpg", "hash": "medium_schiebetuer_happy_9503c5eea9", "mime": "image/jpeg", "name": "medium_schiebetuer_happy.jpg", "path": null, "size": 67.22, "width": 750, "height": 563, "sizeInBytes": 67223}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_schiebetuer_happy_9503c5eea9.jpg", "hash": "thumbnail_schiebetuer_happy_9503c5eea9", "mime": "image/jpeg", "name": "thumbnail_schiebetuer_happy.jpg", "path": null, "size": 8.15, "width": 208, "height": 156, "sizeInBytes": 8146}}	schiebetuer_happy_9503c5eea9	.jpg	image/jpeg	74.26	/uploads/schiebetuer_happy_9503c5eea9.jpg	\N	local	\N	/	2024-11-09 12:20:07.371	2024-11-09 12:20:07.371	2024-11-09 12:20:07.372	1	1	\N
20	o545vro8pn9r1bckciynfng9	rollotuer.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_rollotuer_e46313f7b1.jpg", "hash": "small_rollotuer_e46313f7b1", "mime": "image/jpeg", "name": "small_rollotuer.jpg", "path": null, "size": 35.28, "width": 500, "height": 375, "sizeInBytes": 35279}, "medium": {"ext": ".jpg", "url": "/uploads/medium_rollotuer_e46313f7b1.jpg", "hash": "medium_rollotuer_e46313f7b1", "mime": "image/jpeg", "name": "medium_rollotuer.jpg", "path": null, "size": 73.07, "width": 750, "height": 563, "sizeInBytes": 73068}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_rollotuer_e46313f7b1.jpg", "hash": "thumbnail_rollotuer_e46313f7b1", "mime": "image/jpeg", "name": "thumbnail_rollotuer.jpg", "path": null, "size": 7.83, "width": 208, "height": 156, "sizeInBytes": 7825}}	rollotuer_e46313f7b1	.jpg	image/jpeg	82.04	/uploads/rollotuer_e46313f7b1.jpg	\N	local	\N	/	2024-11-09 12:20:07.476	2024-11-09 12:20:07.476	2024-11-09 12:20:07.476	1	1	\N
14	wn1nutlgc2t27gn578l50qqn	drehtuer_cut.jpg	\N	\N	5572	3715	{"large": {"ext": ".jpg", "url": "/uploads/large_drehtuer_cut_ccc843b962.jpg", "hash": "large_drehtuer_cut_ccc843b962", "mime": "image/jpeg", "name": "large_drehtuer_cut.jpg", "path": null, "size": 86.5, "width": 1000, "height": 666, "sizeInBytes": 86500}, "small": {"ext": ".jpg", "url": "/uploads/small_drehtuer_cut_ccc843b962.jpg", "hash": "small_drehtuer_cut_ccc843b962", "mime": "image/jpeg", "name": "small_drehtuer_cut.jpg", "path": null, "size": 26.36, "width": 500, "height": 333, "sizeInBytes": 26355}, "medium": {"ext": ".jpg", "url": "/uploads/medium_drehtuer_cut_ccc843b962.jpg", "hash": "medium_drehtuer_cut_ccc843b962", "mime": "image/jpeg", "name": "medium_drehtuer_cut.jpg", "path": null, "size": 52.91, "width": 750, "height": 500, "sizeInBytes": 52910}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_drehtuer_cut_ccc843b962.jpg", "hash": "thumbnail_drehtuer_cut_ccc843b962", "mime": "image/jpeg", "name": "thumbnail_drehtuer_cut.jpg", "path": null, "size": 7.94, "width": 234, "height": 156, "sizeInBytes": 7941}}	drehtuer_cut_ccc843b962	.jpg	image/jpeg	1421.20	/uploads/drehtuer_cut_ccc843b962.jpg	\N	local	\N	/	2024-11-09 12:20:01.859	2024-11-09 12:20:01.859	2024-11-09 12:20:01.861	1	1	\N
16	cnqhzsoe0skiirh4ouxbsunk	plissee_tuer.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_plissee_tuer_79097bbbc4.jpg", "hash": "small_plissee_tuer_79097bbbc4", "mime": "image/jpeg", "name": "small_plissee_tuer.jpg", "path": null, "size": 39.07, "width": 500, "height": 375, "sizeInBytes": 39072}, "medium": {"ext": ".jpg", "url": "/uploads/medium_plissee_tuer_79097bbbc4.jpg", "hash": "medium_plissee_tuer_79097bbbc4", "mime": "image/jpeg", "name": "medium_plissee_tuer.jpg", "path": null, "size": 78.54, "width": 750, "height": 563, "sizeInBytes": 78544}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_plissee_tuer_79097bbbc4.jpg", "hash": "thumbnail_plissee_tuer_79097bbbc4", "mime": "image/jpeg", "name": "thumbnail_plissee_tuer.jpg", "path": null, "size": 8.65, "width": 208, "height": 156, "sizeInBytes": 8655}}	plissee_tuer_79097bbbc4	.jpg	image/jpeg	89.25	/uploads/plissee_tuer_79097bbbc4.jpg	\N	local	\N	/	2024-11-09 12:20:03.86	2024-11-09 12:20:03.86	2024-11-09 12:20:03.861	1	1	\N
18	y8ncwboxzj3be6f78pr9yopt	resi.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_resi_c69704e465.jpg", "hash": "small_resi_c69704e465", "mime": "image/jpeg", "name": "small_resi.jpg", "path": null, "size": 27.05, "width": 500, "height": 375, "sizeInBytes": 27050}, "medium": {"ext": ".jpg", "url": "/uploads/medium_resi_c69704e465.jpg", "hash": "medium_resi_c69704e465", "mime": "image/jpeg", "name": "medium_resi.jpg", "path": null, "size": 72.39, "width": 750, "height": 563, "sizeInBytes": 72386}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_resi_c69704e465.jpg", "hash": "thumbnail_resi_c69704e465", "mime": "image/jpeg", "name": "thumbnail_resi.jpg", "path": null, "size": 3.89, "width": 208, "height": 156, "sizeInBytes": 3886}}	resi_c69704e465	.jpg	image/jpeg	83.23	/uploads/resi_c69704e465.jpg	\N	local	\N	/	2024-11-09 12:20:05.532	2024-11-09 12:20:05.532	2024-11-09 12:20:05.546	1	1	\N
21	p1ke26azm0f5tdd4h9h33qif	dachfenster_rollo_2.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_dachfenster_rollo_2_69d7acbcac.jpeg", "hash": "large_dachfenster_rollo_2_69d7acbcac", "mime": "image/jpeg", "name": "large_dachfenster_rollo_2.jpeg", "path": null, "size": 55.93, "width": 1000, "height": 667, "sizeInBytes": 55928}, "small": {"ext": ".jpeg", "url": "/uploads/small_dachfenster_rollo_2_69d7acbcac.jpeg", "hash": "small_dachfenster_rollo_2_69d7acbcac", "mime": "image/jpeg", "name": "small_dachfenster_rollo_2.jpeg", "path": null, "size": 19.23, "width": 500, "height": 333, "sizeInBytes": 19227}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_dachfenster_rollo_2_69d7acbcac.jpeg", "hash": "medium_dachfenster_rollo_2_69d7acbcac", "mime": "image/jpeg", "name": "medium_dachfenster_rollo_2.jpeg", "path": null, "size": 35.52, "width": 750, "height": 500, "sizeInBytes": 35518}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_dachfenster_rollo_2_69d7acbcac.jpeg", "hash": "thumbnail_dachfenster_rollo_2_69d7acbcac", "mime": "image/jpeg", "name": "thumbnail_dachfenster_rollo_2.jpeg", "path": null, "size": 6.41, "width": 234, "height": 156, "sizeInBytes": 6412}}	dachfenster_rollo_2_69d7acbcac	.jpeg	image/jpeg	1647.77	/uploads/dachfenster_rollo_2_69d7acbcac.jpeg	\N	local	\N	/	2024-11-09 12:20:07.92	2024-11-09 12:20:07.92	2024-11-09 12:20:07.921	1	1	\N
23	w02vbrnrnqbp8lkgn7j0p7wh	schlafen.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_schlafen_d46e17bb58.jpg", "hash": "small_schlafen_d46e17bb58", "mime": "image/jpeg", "name": "small_schlafen.jpg", "path": null, "size": 26.57, "width": 500, "height": 375, "sizeInBytes": 26570}, "medium": {"ext": ".jpg", "url": "/uploads/medium_schlafen_d46e17bb58.jpg", "hash": "medium_schlafen_d46e17bb58", "mime": "image/jpeg", "name": "medium_schlafen.jpg", "path": null, "size": 54.91, "width": 750, "height": 563, "sizeInBytes": 54910}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_schlafen_d46e17bb58.jpg", "hash": "thumbnail_schlafen_d46e17bb58", "mime": "image/jpeg", "name": "thumbnail_schlafen.jpg", "path": null, "size": 6.13, "width": 208, "height": 156, "sizeInBytes": 6132}}	schlafen_d46e17bb58	.jpg	image/jpeg	62.68	/uploads/schlafen_d46e17bb58.jpg	\N	local	\N	/	2024-11-09 12:20:08.66	2024-11-09 12:20:08.66	2024-11-09 12:20:08.661	1	1	\N
24	symuyp5f3obqc1olgrssr3zx	dachfenster_rollo.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_dachfenster_rollo_aec13fc61d.jpeg", "hash": "large_dachfenster_rollo_aec13fc61d", "mime": "image/jpeg", "name": "large_dachfenster_rollo.jpeg", "path": null, "size": 62.54, "width": 1000, "height": 667, "sizeInBytes": 62539}, "small": {"ext": ".jpeg", "url": "/uploads/small_dachfenster_rollo_aec13fc61d.jpeg", "hash": "small_dachfenster_rollo_aec13fc61d", "mime": "image/jpeg", "name": "small_dachfenster_rollo.jpeg", "path": null, "size": 20.81, "width": 500, "height": 333, "sizeInBytes": 20806}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_dachfenster_rollo_aec13fc61d.jpeg", "hash": "medium_dachfenster_rollo_aec13fc61d", "mime": "image/jpeg", "name": "medium_dachfenster_rollo.jpeg", "path": null, "size": 39.62, "width": 750, "height": 500, "sizeInBytes": 39620}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_dachfenster_rollo_aec13fc61d.jpeg", "hash": "thumbnail_dachfenster_rollo_aec13fc61d", "mime": "image/jpeg", "name": "thumbnail_dachfenster_rollo.jpeg", "path": null, "size": 6.6, "width": 234, "height": 156, "sizeInBytes": 6596}}	dachfenster_rollo_aec13fc61d	.jpeg	image/jpeg	2089.03	/uploads/dachfenster_rollo_aec13fc61d.jpeg	\N	local	\N	/	2024-11-09 12:20:09.547	2024-11-09 12:20:09.547	2024-11-09 12:20:09.547	1	1	\N
22	x87jrivdajvwed1ufwsvc9hh	schiebetuer.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_schiebetuer_c97ef375a3.jpg", "hash": "small_schiebetuer_c97ef375a3", "mime": "image/jpeg", "name": "small_schiebetuer.jpg", "path": null, "size": 34.53, "width": 500, "height": 375, "sizeInBytes": 34531}, "medium": {"ext": ".jpg", "url": "/uploads/medium_schiebetuer_c97ef375a3.jpg", "hash": "medium_schiebetuer_c97ef375a3", "mime": "image/jpeg", "name": "medium_schiebetuer.jpg", "path": null, "size": 70.49, "width": 750, "height": 563, "sizeInBytes": 70485}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_schiebetuer_c97ef375a3.jpg", "hash": "thumbnail_schiebetuer_c97ef375a3", "mime": "image/jpeg", "name": "thumbnail_schiebetuer.jpg", "path": null, "size": 8.02, "width": 208, "height": 156, "sizeInBytes": 8022}}	schiebetuer_c97ef375a3	.jpg	image/jpeg	78.60	/uploads/schiebetuer_c97ef375a3.jpg	\N	local	\N	/	2024-11-09 12:20:08.654	2024-11-09 12:20:08.654	2024-11-09 12:20:08.654	1	1	\N
27	llho4cut5konndotvubodeu4	beratung2.jpeg	\N	\N	5572	3715	{"large": {"ext": ".jpeg", "url": "/uploads/large_beratung2_ad45dae469.jpeg", "hash": "large_beratung2_ad45dae469", "mime": "image/jpeg", "name": "large_beratung2.jpeg", "path": null, "size": 95.02, "width": 1000, "height": 666, "sizeInBytes": 95016}, "small": {"ext": ".jpeg", "url": "/uploads/small_beratung2_ad45dae469.jpeg", "hash": "small_beratung2_ad45dae469", "mime": "image/jpeg", "name": "small_beratung2.jpeg", "path": null, "size": 33.39, "width": 500, "height": 333, "sizeInBytes": 33390}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_beratung2_ad45dae469.jpeg", "hash": "medium_beratung2_ad45dae469", "mime": "image/jpeg", "name": "medium_beratung2.jpeg", "path": null, "size": 61.9, "width": 750, "height": 500, "sizeInBytes": 61904}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_beratung2_ad45dae469.jpeg", "hash": "thumbnail_beratung2_ad45dae469", "mime": "image/jpeg", "name": "thumbnail_beratung2.jpeg", "path": null, "size": 10.54, "width": 234, "height": 156, "sizeInBytes": 10542}}	beratung2_ad45dae469	.jpeg	image/jpeg	1457.52	/uploads/beratung2_ad45dae469.jpeg	\N	local	\N	/	2024-11-09 12:20:17.6	2024-11-09 12:20:17.6	2024-11-09 12:20:17.601	1	1	\N
28	nq1evkrhll847h02o8lwdkg2	dachfenster_rollo_2.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_dachfenster_rollo_2_81c235fc3a.jpeg", "hash": "large_dachfenster_rollo_2_81c235fc3a", "mime": "image/jpeg", "name": "large_dachfenster_rollo_2.jpeg", "path": null, "size": 55.93, "width": 1000, "height": 667, "sizeInBytes": 55928}, "small": {"ext": ".jpeg", "url": "/uploads/small_dachfenster_rollo_2_81c235fc3a.jpeg", "hash": "small_dachfenster_rollo_2_81c235fc3a", "mime": "image/jpeg", "name": "small_dachfenster_rollo_2.jpeg", "path": null, "size": 19.23, "width": 500, "height": 333, "sizeInBytes": 19227}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_dachfenster_rollo_2_81c235fc3a.jpeg", "hash": "medium_dachfenster_rollo_2_81c235fc3a", "mime": "image/jpeg", "name": "medium_dachfenster_rollo_2.jpeg", "path": null, "size": 35.52, "width": 750, "height": 500, "sizeInBytes": 35518}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_dachfenster_rollo_2_81c235fc3a.jpeg", "hash": "thumbnail_dachfenster_rollo_2_81c235fc3a", "mime": "image/jpeg", "name": "thumbnail_dachfenster_rollo_2.jpeg", "path": null, "size": 6.41, "width": 234, "height": 156, "sizeInBytes": 6412}}	dachfenster_rollo_2_81c235fc3a	.jpeg	image/jpeg	1647.77	/uploads/dachfenster_rollo_2_81c235fc3a.jpeg	\N	local	\N	/	2024-11-09 12:20:17.804	2024-11-09 12:20:17.804	2024-11-09 12:20:17.806	1	1	\N
29	y72xecmz711cnaph1ji6kfwc	fenster_frame.jpg	\N	\N	1217	697	{"large": {"ext": ".jpg", "url": "/uploads/large_fenster_frame_035b61c6ab.jpg", "hash": "large_fenster_frame_035b61c6ab", "mime": "image/jpeg", "name": "large_fenster_frame.jpg", "path": null, "size": 53.36, "width": 1000, "height": 573, "sizeInBytes": 53364}, "small": {"ext": ".jpg", "url": "/uploads/small_fenster_frame_035b61c6ab.jpg", "hash": "small_fenster_frame_035b61c6ab", "mime": "image/jpeg", "name": "small_fenster_frame.jpg", "path": null, "size": 17.11, "width": 500, "height": 286, "sizeInBytes": 17112}, "medium": {"ext": ".jpg", "url": "/uploads/medium_fenster_frame_035b61c6ab.jpg", "hash": "medium_fenster_frame_035b61c6ab", "mime": "image/jpeg", "name": "medium_fenster_frame.jpg", "path": null, "size": 33, "width": 750, "height": 430, "sizeInBytes": 32997}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_fenster_frame_035b61c6ab.jpg", "hash": "thumbnail_fenster_frame_035b61c6ab", "mime": "image/jpeg", "name": "thumbnail_fenster_frame.jpg", "path": null, "size": 5.67, "width": 245, "height": 140, "sizeInBytes": 5667}}	fenster_frame_035b61c6ab	.jpg	image/jpeg	73.65	/uploads/fenster_frame_035b61c6ab.jpg	\N	local	\N	/	2024-11-09 12:20:21.3	2024-11-09 12:20:21.3	2024-11-09 12:20:21.301	1	1	\N
31	gw5jmxpg6k3t26fer85fbleo	drehtuer.jpeg	\N	\N	3114	4671	{"large": {"ext": ".jpeg", "url": "/uploads/large_drehtuer_db5ec19bbf.jpeg", "hash": "large_drehtuer_db5ec19bbf", "mime": "image/jpeg", "name": "large_drehtuer.jpeg", "path": null, "size": 81.49, "width": 667, "height": 1000, "sizeInBytes": 81490}, "small": {"ext": ".jpeg", "url": "/uploads/small_drehtuer_db5ec19bbf.jpeg", "hash": "small_drehtuer_db5ec19bbf", "mime": "image/jpeg", "name": "small_drehtuer.jpeg", "path": null, "size": 24.56, "width": 334, "height": 500, "sizeInBytes": 24563}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_drehtuer_db5ec19bbf.jpeg", "hash": "medium_drehtuer_db5ec19bbf", "mime": "image/jpeg", "name": "medium_drehtuer.jpeg", "path": null, "size": 48.32, "width": 500, "height": 750, "sizeInBytes": 48317}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_drehtuer_db5ec19bbf.jpeg", "hash": "thumbnail_drehtuer_db5ec19bbf", "mime": "image/jpeg", "name": "thumbnail_drehtuer.jpeg", "path": null, "size": 3.95, "width": 104, "height": 156, "sizeInBytes": 3953}}	drehtuer_db5ec19bbf	.jpeg	image/jpeg	1385.45	/uploads/drehtuer_db5ec19bbf.jpeg	\N	local	\N	/	2024-11-09 12:20:24.981	2024-11-09 12:20:24.981	2024-11-09 12:20:24.982	1	1	\N
25	f930uvqx962ogzm9whjsioo5	drehtuer_cut.jpg	\N	\N	5572	3715	{"large": {"ext": ".jpg", "url": "/uploads/large_drehtuer_cut_df54c9a5ab.jpg", "hash": "large_drehtuer_cut_df54c9a5ab", "mime": "image/jpeg", "name": "large_drehtuer_cut.jpg", "path": null, "size": 86.5, "width": 1000, "height": 666, "sizeInBytes": 86500}, "small": {"ext": ".jpg", "url": "/uploads/small_drehtuer_cut_df54c9a5ab.jpg", "hash": "small_drehtuer_cut_df54c9a5ab", "mime": "image/jpeg", "name": "small_drehtuer_cut.jpg", "path": null, "size": 26.36, "width": 500, "height": 333, "sizeInBytes": 26355}, "medium": {"ext": ".jpg", "url": "/uploads/medium_drehtuer_cut_df54c9a5ab.jpg", "hash": "medium_drehtuer_cut_df54c9a5ab", "mime": "image/jpeg", "name": "medium_drehtuer_cut.jpg", "path": null, "size": 52.91, "width": 750, "height": 500, "sizeInBytes": 52910}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_drehtuer_cut_df54c9a5ab.jpg", "hash": "thumbnail_drehtuer_cut_df54c9a5ab", "mime": "image/jpeg", "name": "thumbnail_drehtuer_cut.jpg", "path": null, "size": 7.94, "width": 234, "height": 156, "sizeInBytes": 7941}}	drehtuer_cut_df54c9a5ab	.jpg	image/jpeg	1421.20	/uploads/drehtuer_cut_df54c9a5ab.jpg	\N	local	\N	/	2024-11-09 12:20:17.251	2024-11-09 12:20:17.251	2024-11-09 12:20:17.252	1	1	\N
26	b6skmlrj6g5w2eymom2y39ta	beratung.jpeg	\N	\N	5572	3715	{"large": {"ext": ".jpeg", "url": "/uploads/large_beratung_616d71d4aa.jpeg", "hash": "large_beratung_616d71d4aa", "mime": "image/jpeg", "name": "large_beratung.jpeg", "path": null, "size": 89.86, "width": 1000, "height": 666, "sizeInBytes": 89864}, "small": {"ext": ".jpeg", "url": "/uploads/small_beratung_616d71d4aa.jpeg", "hash": "small_beratung_616d71d4aa", "mime": "image/jpeg", "name": "small_beratung.jpeg", "path": null, "size": 31.57, "width": 500, "height": 333, "sizeInBytes": 31568}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_beratung_616d71d4aa.jpeg", "hash": "medium_beratung_616d71d4aa", "mime": "image/jpeg", "name": "medium_beratung.jpeg", "path": null, "size": 58.91, "width": 750, "height": 500, "sizeInBytes": 58912}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_beratung_616d71d4aa.jpeg", "hash": "thumbnail_beratung_616d71d4aa", "mime": "image/jpeg", "name": "thumbnail_beratung.jpeg", "path": null, "size": 10, "width": 234, "height": 156, "sizeInBytes": 9997}}	beratung_616d71d4aa	.jpeg	image/jpeg	1351.74	/uploads/beratung_616d71d4aa.jpeg	\N	local	\N	/	2024-11-09 12:20:17.571	2024-11-09 12:20:17.571	2024-11-09 12:20:17.571	1	1	\N
33	l424a4wf8ftrcyaq954ijpwn	elsa.jpeg	\N	\N	3543	2494	{"large": {"ext": ".jpeg", "url": "/uploads/large_elsa_704af9d775.jpeg", "hash": "large_elsa_704af9d775", "mime": "image/jpeg", "name": "large_elsa.jpeg", "path": null, "size": 102.34, "width": 1000, "height": 704, "sizeInBytes": 102339}, "small": {"ext": ".jpeg", "url": "/uploads/small_elsa_704af9d775.jpeg", "hash": "small_elsa_704af9d775", "mime": "image/jpeg", "name": "small_elsa.jpeg", "path": null, "size": 28.61, "width": 500, "height": 352, "sizeInBytes": 28605}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_elsa_704af9d775.jpeg", "hash": "medium_elsa_704af9d775", "mime": "image/jpeg", "name": "medium_elsa.jpeg", "path": null, "size": 60.92, "width": 750, "height": 528, "sizeInBytes": 60920}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_elsa_704af9d775.jpeg", "hash": "thumbnail_elsa_704af9d775", "mime": "image/jpeg", "name": "thumbnail_elsa.jpeg", "path": null, "size": 6.93, "width": 222, "height": 156, "sizeInBytes": 6926}}	elsa_704af9d775	.jpeg	image/jpeg	1055.13	/uploads/elsa_704af9d775.jpeg	\N	local	\N	/	2024-11-09 12:20:25.5	2024-11-09 12:20:25.5	2024-11-09 12:20:25.501	1	1	\N
34	o04xy28hjso41h80n9q7jo10	frame_fenster.jpg	\N	\N	4000	2000	{"large": {"ext": ".jpg", "url": "/uploads/large_frame_fenster_123719ba8d.jpg", "hash": "large_frame_fenster_123719ba8d", "mime": "image/jpeg", "name": "large_frame_fenster.jpg", "path": null, "size": 41.19, "width": 1000, "height": 500, "sizeInBytes": 41192}, "small": {"ext": ".jpg", "url": "/uploads/small_frame_fenster_123719ba8d.jpg", "hash": "small_frame_fenster_123719ba8d", "mime": "image/jpeg", "name": "small_frame_fenster.jpg", "path": null, "size": 13.91, "width": 500, "height": 250, "sizeInBytes": 13910}, "medium": {"ext": ".jpg", "url": "/uploads/medium_frame_fenster_123719ba8d.jpg", "hash": "medium_frame_fenster_123719ba8d", "mime": "image/jpeg", "name": "medium_frame_fenster.jpg", "path": null, "size": 25.72, "width": 750, "height": 375, "sizeInBytes": 25719}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_frame_fenster_123719ba8d.jpg", "hash": "thumbnail_frame_fenster_123719ba8d", "mime": "image/jpeg", "name": "thumbnail_frame_fenster.jpg", "path": null, "size": 4.92, "width": 245, "height": 123, "sizeInBytes": 4922}}	frame_fenster_123719ba8d	.jpg	image/jpeg	435.81	/uploads/frame_fenster_123719ba8d.jpg	\N	local	\N	/	2024-11-09 12:20:30.594	2024-11-09 12:20:30.594	2024-11-09 12:20:30.595	1	1	\N
32	ey5rd53cv57hzw04v1i30qyy	dachfenster_rollo.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_dachfenster_rollo_26a8769e6c.jpeg", "hash": "large_dachfenster_rollo_26a8769e6c", "mime": "image/jpeg", "name": "large_dachfenster_rollo.jpeg", "path": null, "size": 62.54, "width": 1000, "height": 667, "sizeInBytes": 62539}, "small": {"ext": ".jpeg", "url": "/uploads/small_dachfenster_rollo_26a8769e6c.jpeg", "hash": "small_dachfenster_rollo_26a8769e6c", "mime": "image/jpeg", "name": "small_dachfenster_rollo.jpeg", "path": null, "size": 20.81, "width": 500, "height": 333, "sizeInBytes": 20806}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_dachfenster_rollo_26a8769e6c.jpeg", "hash": "medium_dachfenster_rollo_26a8769e6c", "mime": "image/jpeg", "name": "medium_dachfenster_rollo.jpeg", "path": null, "size": 39.62, "width": 750, "height": 500, "sizeInBytes": 39620}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_dachfenster_rollo_26a8769e6c.jpeg", "hash": "thumbnail_dachfenster_rollo_26a8769e6c", "mime": "image/jpeg", "name": "thumbnail_dachfenster_rollo.jpeg", "path": null, "size": 6.6, "width": 234, "height": 156, "sizeInBytes": 6596}}	dachfenster_rollo_26a8769e6c	.jpeg	image/jpeg	2089.03	/uploads/dachfenster_rollo_26a8769e6c.jpeg	\N	local	\N	/	2024-11-09 12:20:25.149	2024-11-09 12:20:25.149	2024-11-09 12:20:25.151	1	1	\N
36	eh16m2yjzlfwo1ii330zq3f5	frame_lisa.jpg	\N	\N	4000	2000	{"large": {"ext": ".jpg", "url": "/uploads/large_frame_lisa_b1f554377b.jpg", "hash": "large_frame_lisa_b1f554377b", "mime": "image/jpeg", "name": "large_frame_lisa.jpg", "path": null, "size": 75.8, "width": 1000, "height": 500, "sizeInBytes": 75800}, "small": {"ext": ".jpg", "url": "/uploads/small_frame_lisa_b1f554377b.jpg", "hash": "small_frame_lisa_b1f554377b", "mime": "image/jpeg", "name": "small_frame_lisa.jpg", "path": null, "size": 16.3, "width": 500, "height": 250, "sizeInBytes": 16298}, "medium": {"ext": ".jpg", "url": "/uploads/medium_frame_lisa_b1f554377b.jpg", "hash": "medium_frame_lisa_b1f554377b", "mime": "image/jpeg", "name": "medium_frame_lisa.jpg", "path": null, "size": 38.07, "width": 750, "height": 375, "sizeInBytes": 38069}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_frame_lisa_b1f554377b.jpg", "hash": "thumbnail_frame_lisa_b1f554377b", "mime": "image/jpeg", "name": "thumbnail_frame_lisa.jpg", "path": null, "size": 4.23, "width": 245, "height": 123, "sizeInBytes": 4234}}	frame_lisa_b1f554377b	.jpg	image/jpeg	1280.54	/uploads/frame_lisa_b1f554377b.jpg	\N	local	\N	/	2024-11-09 12:20:35.866	2024-11-09 12:20:35.866	2024-11-09 12:20:35.867	1	1	\N
37	f0eg3lko8vsewyhx2vdqmqpi	fenster2.jpg	\N	\N	3840	3825	{"large": {"ext": ".jpg", "url": "/uploads/large_fenster2_3eaa6e4617.jpg", "hash": "large_fenster2_3eaa6e4617", "mime": "image/jpeg", "name": "large_fenster2.jpg", "path": null, "size": 127.22, "width": 1000, "height": 996, "sizeInBytes": 127215}, "small": {"ext": ".jpg", "url": "/uploads/small_fenster2_3eaa6e4617.jpg", "hash": "small_fenster2_3eaa6e4617", "mime": "image/jpeg", "name": "small_fenster2.jpg", "path": null, "size": 34.55, "width": 500, "height": 498, "sizeInBytes": 34548}, "medium": {"ext": ".jpg", "url": "/uploads/medium_fenster2_3eaa6e4617.jpg", "hash": "medium_fenster2_3eaa6e4617", "mime": "image/jpeg", "name": "medium_fenster2.jpg", "path": null, "size": 71.06, "width": 750, "height": 747, "sizeInBytes": 71056}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_fenster2_3eaa6e4617.jpg", "hash": "thumbnail_fenster2_3eaa6e4617", "mime": "image/jpeg", "name": "thumbnail_fenster2.jpg", "path": null, "size": 4.93, "width": 157, "height": 156, "sizeInBytes": 4927}}	fenster2_3eaa6e4617	.jpg	image/jpeg	1622.63	/uploads/fenster2_3eaa6e4617.jpg	\N	local	\N	/	2024-11-09 12:20:36.018	2024-11-09 12:20:36.018	2024-11-09 12:20:36.02	1	1	\N
38	rzwy27ypvnegpjl3dw4n1ubt	fenster_auf_schlafen.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_fenster_auf_schlafen_c778b3edad.jpeg", "hash": "large_fenster_auf_schlafen_c778b3edad", "mime": "image/jpeg", "name": "large_fenster_auf_schlafen.jpeg", "path": null, "size": 64.49, "width": 1000, "height": 667, "sizeInBytes": 64493}, "small": {"ext": ".jpeg", "url": "/uploads/small_fenster_auf_schlafen_c778b3edad.jpeg", "hash": "small_fenster_auf_schlafen_c778b3edad", "mime": "image/jpeg", "name": "small_fenster_auf_schlafen.jpeg", "path": null, "size": 21.03, "width": 500, "height": 333, "sizeInBytes": 21032}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_fenster_auf_schlafen_c778b3edad.jpeg", "hash": "medium_fenster_auf_schlafen_c778b3edad", "mime": "image/jpeg", "name": "medium_fenster_auf_schlafen.jpeg", "path": null, "size": 40.24, "width": 750, "height": 500, "sizeInBytes": 40244}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_fenster_auf_schlafen_c778b3edad.jpeg", "hash": "thumbnail_fenster_auf_schlafen_c778b3edad", "mime": "image/jpeg", "name": "thumbnail_fenster_auf_schlafen.jpeg", "path": null, "size": 6.59, "width": 234, "height": 156, "sizeInBytes": 6590}}	fenster_auf_schlafen_c778b3edad	.jpeg	image/jpeg	2877.76	/uploads/fenster_auf_schlafen_c778b3edad.jpeg	\N	local	\N	/	2024-11-09 12:20:36.165	2024-11-09 12:20:36.165	2024-11-09 12:20:36.165	1	1	\N
40	o2ts3f5l5c6joypx3h3jqs8g	intro-picture.jpeg	\N	\N	5682	2467	{"large": {"ext": ".jpeg", "url": "/uploads/large_intro_picture_7acef1a217.jpeg", "hash": "large_intro_picture_7acef1a217", "mime": "image/jpeg", "name": "large_intro-picture.jpeg", "path": null, "size": 59.2, "width": 1000, "height": 434, "sizeInBytes": 59199}, "small": {"ext": ".jpeg", "url": "/uploads/small_intro_picture_7acef1a217.jpeg", "hash": "small_intro_picture_7acef1a217", "mime": "image/jpeg", "name": "small_intro-picture.jpeg", "path": null, "size": 17.69, "width": 500, "height": 217, "sizeInBytes": 17691}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_intro_picture_7acef1a217.jpeg", "hash": "medium_intro_picture_7acef1a217", "mime": "image/jpeg", "name": "medium_intro-picture.jpeg", "path": null, "size": 35.47, "width": 750, "height": 325, "sizeInBytes": 35474}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_intro_picture_7acef1a217.jpeg", "hash": "thumbnail_intro_picture_7acef1a217", "mime": "image/jpeg", "name": "thumbnail_intro-picture.jpeg", "path": null, "size": 5.52, "width": 245, "height": 106, "sizeInBytes": 5518}}	intro_picture_7acef1a217	.jpeg	image/jpeg	1900.96	/uploads/intro_picture_7acef1a217.jpeg	\N	local	\N	/	2024-11-09 12:20:49.517	2024-11-09 12:20:49.517	2024-11-09 12:20:49.518	1	1	\N
35	p0723s7vd3dvebru8nt3hplr	frame_tür.jpg	\N	\N	4000	2000	{"large": {"ext": ".jpg", "url": "/uploads/large_frame_tuer_cfa4f2d226.jpg", "hash": "large_frame_tuer_cfa4f2d226", "mime": "image/jpeg", "name": "large_frame_tür.jpg", "path": null, "size": 91.28, "width": 1000, "height": 500, "sizeInBytes": 91278}, "small": {"ext": ".jpg", "url": "/uploads/small_frame_tuer_cfa4f2d226.jpg", "hash": "small_frame_tuer_cfa4f2d226", "mime": "image/jpeg", "name": "small_frame_tür.jpg", "path": null, "size": 30.04, "width": 500, "height": 250, "sizeInBytes": 30042}, "medium": {"ext": ".jpg", "url": "/uploads/medium_frame_tuer_cfa4f2d226.jpg", "hash": "medium_frame_tuer_cfa4f2d226", "mime": "image/jpeg", "name": "medium_frame_tür.jpg", "path": null, "size": 57.42, "width": 750, "height": 375, "sizeInBytes": 57415}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_frame_tuer_cfa4f2d226.jpg", "hash": "thumbnail_frame_tuer_cfa4f2d226", "mime": "image/jpeg", "name": "thumbnail_frame_tür.jpg", "path": null, "size": 9.36, "width": 245, "height": 123, "sizeInBytes": 9355}}	frame_tuer_cfa4f2d226	.jpg	image/jpeg	1175.43	/uploads/frame_tuer_cfa4f2d226.jpg	\N	local	\N	/	2024-11-09 12:20:35.779	2024-11-09 12:20:35.779	2024-11-09 12:20:35.779	1	1	\N
39	m0r7fm8hs4frkic4bq9n66ty	gewebe2.jpg	\N	\N	4258	4305	{"large": {"ext": ".jpg", "url": "/uploads/large_gewebe2_1e15f1cbb4.jpg", "hash": "large_gewebe2_1e15f1cbb4", "mime": "image/jpeg", "name": "large_gewebe2.jpg", "path": null, "size": 116.92, "width": 989, "height": 1000, "sizeInBytes": 116923}, "small": {"ext": ".jpg", "url": "/uploads/small_gewebe2_1e15f1cbb4.jpg", "hash": "small_gewebe2_1e15f1cbb4", "mime": "image/jpeg", "name": "small_gewebe2.jpg", "path": null, "size": 36.11, "width": 494, "height": 500, "sizeInBytes": 36109}, "medium": {"ext": ".jpg", "url": "/uploads/medium_gewebe2_1e15f1cbb4.jpg", "hash": "medium_gewebe2_1e15f1cbb4", "mime": "image/jpeg", "name": "medium_gewebe2.jpg", "path": null, "size": 71.29, "width": 742, "height": 750, "sizeInBytes": 71290}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_gewebe2_1e15f1cbb4.jpg", "hash": "thumbnail_gewebe2_1e15f1cbb4", "mime": "image/jpeg", "name": "thumbnail_gewebe2.jpg", "path": null, "size": 5.56, "width": 154, "height": 156, "sizeInBytes": 5555}}	gewebe2_1e15f1cbb4	.jpg	image/jpeg	1392.16	/uploads/gewebe2_1e15f1cbb4.jpg	\N	local	\N	/	2024-11-09 12:20:49.469	2024-11-09 12:20:49.469	2024-11-09 12:20:49.469	1	1	\N
42	xirwc8q1e151rav0lplnusl1	happy.jpg	\N	\N	5350	3567	{"large": {"ext": ".jpg", "url": "/uploads/large_happy_a679331e45.jpg", "hash": "large_happy_a679331e45", "mime": "image/jpeg", "name": "large_happy.jpg", "path": null, "size": 129.13, "width": 1000, "height": 666, "sizeInBytes": 129134}, "small": {"ext": ".jpg", "url": "/uploads/small_happy_a679331e45.jpg", "hash": "small_happy_a679331e45", "mime": "image/jpeg", "name": "small_happy.jpg", "path": null, "size": 37.55, "width": 500, "height": 333, "sizeInBytes": 37551}, "medium": {"ext": ".jpg", "url": "/uploads/medium_happy_a679331e45.jpg", "hash": "medium_happy_a679331e45", "mime": "image/jpeg", "name": "medium_happy.jpg", "path": null, "size": 77.44, "width": 750, "height": 500, "sizeInBytes": 77445}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_happy_a679331e45.jpg", "hash": "thumbnail_happy_a679331e45", "mime": "image/jpeg", "name": "thumbnail_happy.jpg", "path": null, "size": 10.58, "width": 234, "height": 156, "sizeInBytes": 10575}}	happy_a679331e45	.jpg	image/jpeg	3131.67	/uploads/happy_a679331e45.jpg	\N	local	\N	/	2024-11-09 12:20:49.791	2024-11-09 12:20:49.791	2024-11-09 12:20:49.792	1	1	\N
43	fthd3ytpz35k7d0el8q0y3ev	gewebe.jpg	\N	\N	5760	3840	{"large": {"ext": ".jpg", "url": "/uploads/large_gewebe_132a6218f1.jpg", "hash": "large_gewebe_132a6218f1", "mime": "image/jpeg", "name": "large_gewebe.jpg", "path": null, "size": 88.73, "width": 1000, "height": 667, "sizeInBytes": 88732}, "small": {"ext": ".jpg", "url": "/uploads/small_gewebe_132a6218f1.jpg", "hash": "small_gewebe_132a6218f1", "mime": "image/jpeg", "name": "small_gewebe.jpg", "path": null, "size": 24.91, "width": 500, "height": 333, "sizeInBytes": 24906}, "medium": {"ext": ".jpg", "url": "/uploads/medium_gewebe_132a6218f1.jpg", "hash": "medium_gewebe_132a6218f1", "mime": "image/jpeg", "name": "medium_gewebe.jpg", "path": null, "size": 42.35, "width": 750, "height": 500, "sizeInBytes": 42353}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_gewebe_132a6218f1.jpg", "hash": "thumbnail_gewebe_132a6218f1", "mime": "image/jpeg", "name": "thumbnail_gewebe.jpg", "path": null, "size": 7.24, "width": 234, "height": 156, "sizeInBytes": 7241}}	gewebe_132a6218f1	.jpg	image/jpeg	3617.11	/uploads/gewebe_132a6218f1.jpg	\N	local	\N	/	2024-11-09 12:20:49.797	2024-11-09 12:20:49.797	2024-11-09 12:20:49.797	1	1	\N
50	lx4ftjj7k2kj1tfss0j0bbr7	lisa_frame.jpg	\N	\N	1217	697	{"large": {"ext": ".jpg", "url": "/uploads/large_lisa_frame_c1c77f66d3.jpg", "hash": "large_lisa_frame_c1c77f66d3", "mime": "image/jpeg", "name": "large_lisa_frame.jpg", "path": null, "size": 101.22, "width": 1000, "height": 573, "sizeInBytes": 101221}, "small": {"ext": ".jpg", "url": "/uploads/small_lisa_frame_c1c77f66d3.jpg", "hash": "small_lisa_frame_c1c77f66d3", "mime": "image/jpeg", "name": "small_lisa_frame.jpg", "path": null, "size": 20.3, "width": 500, "height": 286, "sizeInBytes": 20301}, "medium": {"ext": ".jpg", "url": "/uploads/medium_lisa_frame_c1c77f66d3.jpg", "hash": "medium_lisa_frame_c1c77f66d3", "mime": "image/jpeg", "name": "medium_lisa_frame.jpg", "path": null, "size": 52.19, "width": 750, "height": 430, "sizeInBytes": 52193}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_lisa_frame_c1c77f66d3.jpg", "hash": "thumbnail_lisa_frame_c1c77f66d3", "mime": "image/jpeg", "name": "thumbnail_lisa_frame.jpg", "path": null, "size": 4.96, "width": 245, "height": 140, "sizeInBytes": 4960}}	lisa_frame_c1c77f66d3	.jpg	image/jpeg	155.20	/uploads/lisa_frame_c1c77f66d3.jpg	\N	local	\N	/	2024-11-09 12:21:00.624	2024-11-09 12:21:00.624	2024-11-09 12:21:00.625	1	1	\N
51	psrqx5v9s7pog2zrtzf4ziuu	logo.jpg	\N	\N	1537	402	{"large": {"ext": ".jpg", "url": "/uploads/large_logo_99472f2edc.jpg", "hash": "large_logo_99472f2edc", "mime": "image/jpeg", "name": "large_logo.jpg", "path": null, "size": 27.52, "width": 1000, "height": 262, "sizeInBytes": 27522}, "small": {"ext": ".jpg", "url": "/uploads/small_logo_99472f2edc.jpg", "hash": "small_logo_99472f2edc", "mime": "image/jpeg", "name": "small_logo.jpg", "path": null, "size": 13.05, "width": 500, "height": 131, "sizeInBytes": 13052}, "medium": {"ext": ".jpg", "url": "/uploads/medium_logo_99472f2edc.jpg", "hash": "medium_logo_99472f2edc", "mime": "image/jpeg", "name": "medium_logo.jpg", "path": null, "size": 20.45, "width": 750, "height": 196, "sizeInBytes": 20454}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_logo_99472f2edc.jpg", "hash": "thumbnail_logo_99472f2edc", "mime": "image/jpeg", "name": "thumbnail_logo.jpg", "path": null, "size": 5.7, "width": 245, "height": 64, "sizeInBytes": 5700}}	logo_99472f2edc	.jpg	image/jpeg	42.61	/uploads/logo_99472f2edc.jpg	\N	local	\N	/	2024-11-09 12:21:01.151	2024-11-09 12:21:01.151	2024-11-09 12:21:01.152	1	1	\N
41	l3lunl44kqut6ffiwlfsp9a7	katzentür.jpeg	\N	\N	5623	3749	{"large": {"ext": ".jpeg", "url": "/uploads/large_katzentuer_b1592939ea.jpeg", "hash": "large_katzentuer_b1592939ea", "mime": "image/jpeg", "name": "large_katzentür.jpeg", "path": null, "size": 77.59, "width": 1000, "height": 667, "sizeInBytes": 77587}, "small": {"ext": ".jpeg", "url": "/uploads/small_katzentuer_b1592939ea.jpeg", "hash": "small_katzentuer_b1592939ea", "mime": "image/jpeg", "name": "small_katzentür.jpeg", "path": null, "size": 23.61, "width": 500, "height": 333, "sizeInBytes": 23609}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_katzentuer_b1592939ea.jpeg", "hash": "medium_katzentuer_b1592939ea", "mime": "image/jpeg", "name": "medium_katzentür.jpeg", "path": null, "size": 45.71, "width": 750, "height": 500, "sizeInBytes": 45706}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_katzentuer_b1592939ea.jpeg", "hash": "thumbnail_katzentuer_b1592939ea", "mime": "image/jpeg", "name": "thumbnail_katzentür.jpeg", "path": null, "size": 7.24, "width": 234, "height": 156, "sizeInBytes": 7244}}	katzentuer_b1592939ea	.jpeg	image/jpeg	2433.04	/uploads/katzentuer_b1592939ea.jpeg	\N	local	\N	/	2024-11-09 12:20:49.779	2024-11-09 12:20:49.779	2024-11-09 12:20:49.78	1	1	\N
44	jkyrxomvr5dbdjrc5o9cjnht	grillfeier.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_grillfeier_4c1f086d8a.jpeg", "hash": "large_grillfeier_4c1f086d8a", "mime": "image/jpeg", "name": "large_grillfeier.jpeg", "path": null, "size": 111.99, "width": 1000, "height": 667, "sizeInBytes": 111988}, "small": {"ext": ".jpeg", "url": "/uploads/small_grillfeier_4c1f086d8a.jpeg", "hash": "small_grillfeier_4c1f086d8a", "mime": "image/jpeg", "name": "small_grillfeier.jpeg", "path": null, "size": 32.55, "width": 500, "height": 333, "sizeInBytes": 32553}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_grillfeier_4c1f086d8a.jpeg", "hash": "medium_grillfeier_4c1f086d8a", "mime": "image/jpeg", "name": "medium_grillfeier.jpeg", "path": null, "size": 67.53, "width": 750, "height": 500, "sizeInBytes": 67529}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_grillfeier_4c1f086d8a.jpeg", "hash": "thumbnail_grillfeier_4c1f086d8a", "mime": "image/jpeg", "name": "thumbnail_grillfeier.jpeg", "path": null, "size": 9.44, "width": 234, "height": 156, "sizeInBytes": 9444}}	grillfeier_4c1f086d8a	.jpeg	image/jpeg	3119.37	/uploads/grillfeier_4c1f086d8a.jpeg	\N	local	\N	/	2024-11-09 12:20:49.946	2024-11-09 12:20:49.946	2024-11-09 12:20:49.947	1	1	\N
45	imjqdf8o8t21zpis91pybj6m	klappfenster_kräuter.jpeg	\N	\N	4883	3255	{"large": {"ext": ".jpeg", "url": "/uploads/large_klappfenster_kraeuter_e80e8dfdd1.jpeg", "hash": "large_klappfenster_kraeuter_e80e8dfdd1", "mime": "image/jpeg", "name": "large_klappfenster_kräuter.jpeg", "path": null, "size": 81.81, "width": 1000, "height": 667, "sizeInBytes": 81811}, "small": {"ext": ".jpeg", "url": "/uploads/small_klappfenster_kraeuter_e80e8dfdd1.jpeg", "hash": "small_klappfenster_kraeuter_e80e8dfdd1", "mime": "image/jpeg", "name": "small_klappfenster_kräuter.jpeg", "path": null, "size": 23.7, "width": 500, "height": 333, "sizeInBytes": 23696}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_klappfenster_kraeuter_e80e8dfdd1.jpeg", "hash": "medium_klappfenster_kraeuter_e80e8dfdd1", "mime": "image/jpeg", "name": "medium_klappfenster_kräuter.jpeg", "path": null, "size": 48.47, "width": 750, "height": 500, "sizeInBytes": 48473}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_klappfenster_kraeuter_e80e8dfdd1.jpeg", "hash": "thumbnail_klappfenster_kraeuter_e80e8dfdd1", "mime": "image/jpeg", "name": "thumbnail_klappfenster_kräuter.jpeg", "path": null, "size": 6.89, "width": 234, "height": 156, "sizeInBytes": 6890}}	klappfenster_kraeuter_e80e8dfdd1	.jpeg	image/jpeg	1501.11	/uploads/klappfenster_kraeuter_e80e8dfdd1.jpeg	\N	local	\N	/	2024-11-09 12:20:58.383	2024-11-09 12:20:58.383	2024-11-09 12:20:58.384	1	1	\N
46	tcn609otpni9ghmnvj90evnu	klapptuer.jpg	\N	\N	3479	5218	{"large": {"ext": ".jpg", "url": "/uploads/large_klapptuer_b0df1c0246.jpg", "hash": "large_klapptuer_b0df1c0246", "mime": "image/jpeg", "name": "large_klapptuer.jpg", "path": null, "size": 91.63, "width": 666, "height": 1000, "sizeInBytes": 91630}, "small": {"ext": ".jpg", "url": "/uploads/small_klapptuer_b0df1c0246.jpg", "hash": "small_klapptuer_b0df1c0246", "mime": "image/jpeg", "name": "small_klapptuer.jpg", "path": null, "size": 28.34, "width": 333, "height": 500, "sizeInBytes": 28343}, "medium": {"ext": ".jpg", "url": "/uploads/medium_klapptuer_b0df1c0246.jpg", "hash": "medium_klapptuer_b0df1c0246", "mime": "image/jpeg", "name": "medium_klapptuer.jpg", "path": null, "size": 56.37, "width": 500, "height": 750, "sizeInBytes": 56369}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_klapptuer_b0df1c0246.jpg", "hash": "thumbnail_klapptuer_b0df1c0246", "mime": "image/jpeg", "name": "thumbnail_klapptuer.jpg", "path": null, "size": 4.38, "width": 104, "height": 156, "sizeInBytes": 4384}}	klapptuer_b0df1c0246	.jpg	image/jpeg	1951.96	/uploads/klapptuer_b0df1c0246.jpg	\N	local	\N	/	2024-11-09 12:20:58.433	2024-11-09 12:20:58.433	2024-11-09 12:20:58.434	1	1	\N
47	bb2qib3tp81ca437fkv7sh7w	klappfenster_kaffee.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_klappfenster_kaffee_fcc19d50e0.jpeg", "hash": "large_klappfenster_kaffee_fcc19d50e0", "mime": "image/jpeg", "name": "large_klappfenster_kaffee.jpeg", "path": null, "size": 93.96, "width": 1000, "height": 667, "sizeInBytes": 93964}, "small": {"ext": ".jpeg", "url": "/uploads/small_klappfenster_kaffee_fcc19d50e0.jpeg", "hash": "small_klappfenster_kaffee_fcc19d50e0", "mime": "image/jpeg", "name": "small_klappfenster_kaffee.jpeg", "path": null, "size": 26.54, "width": 500, "height": 333, "sizeInBytes": 26543}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_klappfenster_kaffee_fcc19d50e0.jpeg", "hash": "medium_klappfenster_kaffee_fcc19d50e0", "mime": "image/jpeg", "name": "medium_klappfenster_kaffee.jpeg", "path": null, "size": 55.06, "width": 750, "height": 500, "sizeInBytes": 55058}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_klappfenster_kaffee_fcc19d50e0.jpeg", "hash": "thumbnail_klappfenster_kaffee_fcc19d50e0", "mime": "image/jpeg", "name": "thumbnail_klappfenster_kaffee.jpeg", "path": null, "size": 7.55, "width": 234, "height": 156, "sizeInBytes": 7547}}	klappfenster_kaffee_fcc19d50e0	.jpeg	image/jpeg	2653.44	/uploads/klappfenster_kaffee_fcc19d50e0.jpeg	\N	local	\N	/	2024-11-09 12:20:58.576	2024-11-09 12:20:58.576	2024-11-09 12:20:58.577	1	1	\N
48	skinhph03s2xvxk1lhsg41li	lisa_dg.jpeg	\N	\N	4128	2951	{"large": {"ext": ".jpeg", "url": "/uploads/large_lisa_dg_3526615580.jpeg", "hash": "large_lisa_dg_3526615580", "mime": "image/jpeg", "name": "large_lisa_dg.jpeg", "path": null, "size": 171.53, "width": 1000, "height": 715, "sizeInBytes": 171527}, "small": {"ext": ".jpeg", "url": "/uploads/small_lisa_dg_3526615580.jpeg", "hash": "small_lisa_dg_3526615580", "mime": "image/jpeg", "name": "small_lisa_dg.jpeg", "path": null, "size": 40.04, "width": 500, "height": 357, "sizeInBytes": 40038}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_lisa_dg_3526615580.jpeg", "hash": "medium_lisa_dg_3526615580", "mime": "image/jpeg", "name": "medium_lisa_dg.jpeg", "path": null, "size": 91.19, "width": 750, "height": 536, "sizeInBytes": 91188}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_lisa_dg_3526615580.jpeg", "hash": "thumbnail_lisa_dg_3526615580", "mime": "image/jpeg", "name": "thumbnail_lisa_dg.jpeg", "path": null, "size": 7.85, "width": 219, "height": 156, "sizeInBytes": 7846}}	lisa_dg_3526615580	.jpeg	image/jpeg	2912.25	/uploads/lisa_dg_3526615580.jpeg	\N	local	\N	/	2024-11-09 12:20:58.577	2024-11-09 12:20:58.577	2024-11-09 12:20:58.578	1	1	\N
57	this5b96rhi61gy3q2ug6ffq	pendeltuer_hund.jpg	\N	\N	5572	3715	{"large": {"ext": ".jpg", "url": "/uploads/large_pendeltuer_hund_c5d8fef3b1.jpg", "hash": "large_pendeltuer_hund_c5d8fef3b1", "mime": "image/jpeg", "name": "large_pendeltuer_hund.jpg", "path": null, "size": 120.92, "width": 1000, "height": 666, "sizeInBytes": 120924}, "small": {"ext": ".jpg", "url": "/uploads/small_pendeltuer_hund_c5d8fef3b1.jpg", "hash": "small_pendeltuer_hund_c5d8fef3b1", "mime": "image/jpeg", "name": "small_pendeltuer_hund.jpg", "path": null, "size": 39.61, "width": 500, "height": 333, "sizeInBytes": 39610}, "medium": {"ext": ".jpg", "url": "/uploads/medium_pendeltuer_hund_c5d8fef3b1.jpg", "hash": "medium_pendeltuer_hund_c5d8fef3b1", "mime": "image/jpeg", "name": "medium_pendeltuer_hund.jpg", "path": null, "size": 75.8, "width": 750, "height": 500, "sizeInBytes": 75804}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_pendeltuer_hund_c5d8fef3b1.jpg", "hash": "thumbnail_pendeltuer_hund_c5d8fef3b1", "mime": "image/jpeg", "name": "thumbnail_pendeltuer_hund.jpg", "path": null, "size": 11.22, "width": 234, "height": 156, "sizeInBytes": 11218}}	pendeltuer_hund_c5d8fef3b1	.jpg	image/jpeg	2030.75	/uploads/pendeltuer_hund_c5d8fef3b1.jpg	\N	local	\N	/	2024-11-09 12:21:09.382	2024-11-09 12:21:09.382	2024-11-09 12:21:09.383	1	1	\N
58	ipq4zko60mrp2bc7htdnijv6	Pendeltür_Pendel.jpeg	\N	\N	5763	3822	{"large": {"ext": ".jpeg", "url": "/uploads/large_Pendeltuer_Pendel_a33323e97a.jpeg", "hash": "large_Pendeltuer_Pendel_a33323e97a", "mime": "image/jpeg", "name": "large_Pendeltür_Pendel.jpeg", "path": null, "size": 80.31, "width": 1000, "height": 663, "sizeInBytes": 80311}, "small": {"ext": ".jpeg", "url": "/uploads/small_Pendeltuer_Pendel_a33323e97a.jpeg", "hash": "small_Pendeltuer_Pendel_a33323e97a", "mime": "image/jpeg", "name": "small_Pendeltür_Pendel.jpeg", "path": null, "size": 20.21, "width": 500, "height": 331, "sizeInBytes": 20211}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_Pendeltuer_Pendel_a33323e97a.jpeg", "hash": "medium_Pendeltuer_Pendel_a33323e97a", "mime": "image/jpeg", "name": "medium_Pendeltür_Pendel.jpeg", "path": null, "size": 46.21, "width": 750, "height": 497, "sizeInBytes": 46209}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_Pendeltuer_Pendel_a33323e97a.jpeg", "hash": "thumbnail_Pendeltuer_Pendel_a33323e97a", "mime": "image/jpeg", "name": "thumbnail_Pendeltür_Pendel.jpeg", "path": null, "size": 5.52, "width": 235, "height": 156, "sizeInBytes": 5523}}	Pendeltuer_Pendel_a33323e97a	.jpeg	image/jpeg	2109.53	/uploads/Pendeltuer_Pendel_a33323e97a.jpeg	\N	local	\N	/	2024-11-09 12:21:10.156	2024-11-09 12:21:10.156	2024-11-09 12:21:10.156	1	1	\N
59	jgser9suekd8ah8kyedvlvyg	montage_tuer.jpg	\N	\N	3785	5677	{"large": {"ext": ".jpg", "url": "/uploads/large_montage_tuer_83a06b6b9f.jpg", "hash": "large_montage_tuer_83a06b6b9f", "mime": "image/jpeg", "name": "large_montage_tuer.jpg", "path": null, "size": 84.32, "width": 667, "height": 1000, "sizeInBytes": 84324}, "small": {"ext": ".jpg", "url": "/uploads/small_montage_tuer_83a06b6b9f.jpg", "hash": "small_montage_tuer_83a06b6b9f", "mime": "image/jpeg", "name": "small_montage_tuer.jpg", "path": null, "size": 27.89, "width": 334, "height": 500, "sizeInBytes": 27885}, "medium": {"ext": ".jpg", "url": "/uploads/medium_montage_tuer_83a06b6b9f.jpg", "hash": "medium_montage_tuer_83a06b6b9f", "mime": "image/jpeg", "name": "medium_montage_tuer.jpg", "path": null, "size": 53.76, "width": 500, "height": 750, "sizeInBytes": 53763}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_montage_tuer_83a06b6b9f.jpg", "hash": "thumbnail_montage_tuer_83a06b6b9f", "mime": "image/jpeg", "name": "thumbnail_montage_tuer.jpg", "path": null, "size": 4.37, "width": 104, "height": 156, "sizeInBytes": 4373}}	montage_tuer_83a06b6b9f	.jpg	image/jpeg	1528.21	/uploads/montage_tuer_83a06b6b9f.jpg	\N	local	\N	/	2024-11-09 12:21:10.775	2024-11-09 12:21:10.775	2024-11-09 12:21:10.775	1	1	\N
49	mes6c035rctkdue5lgbdckeq	kinderzimmer_schlafen.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_kinderzimmer_schlafen_ac66ac9bd4.jpeg", "hash": "large_kinderzimmer_schlafen_ac66ac9bd4", "mime": "image/jpeg", "name": "large_kinderzimmer_schlafen.jpeg", "path": null, "size": 81.56, "width": 1000, "height": 667, "sizeInBytes": 81559}, "small": {"ext": ".jpeg", "url": "/uploads/small_kinderzimmer_schlafen_ac66ac9bd4.jpeg", "hash": "small_kinderzimmer_schlafen_ac66ac9bd4", "mime": "image/jpeg", "name": "small_kinderzimmer_schlafen.jpeg", "path": null, "size": 23.79, "width": 500, "height": 333, "sizeInBytes": 23785}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_kinderzimmer_schlafen_ac66ac9bd4.jpeg", "hash": "medium_kinderzimmer_schlafen_ac66ac9bd4", "mime": "image/jpeg", "name": "medium_kinderzimmer_schlafen.jpeg", "path": null, "size": 48.94, "width": 750, "height": 500, "sizeInBytes": 48940}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_kinderzimmer_schlafen_ac66ac9bd4.jpeg", "hash": "thumbnail_kinderzimmer_schlafen_ac66ac9bd4", "mime": "image/jpeg", "name": "thumbnail_kinderzimmer_schlafen.jpeg", "path": null, "size": 7.33, "width": 234, "height": 156, "sizeInBytes": 7331}}	kinderzimmer_schlafen_ac66ac9bd4	.jpeg	image/jpeg	3640.90	/uploads/kinderzimmer_schlafen_ac66ac9bd4.jpeg	\N	local	\N	/	2024-11-09 12:20:58.933	2024-11-09 12:20:58.933	2024-11-09 12:20:58.933	1	1	\N
64	y1lxyni4zwe4wudofqezlxgp	schiebetuer_hund.jpeg	\N	\N	3697	5546	{"large": {"ext": ".jpeg", "url": "/uploads/large_schiebetuer_hund_40236ce33e.jpeg", "hash": "large_schiebetuer_hund_40236ce33e", "mime": "image/jpeg", "name": "large_schiebetuer_hund.jpeg", "path": null, "size": 111.85, "width": 667, "height": 1000, "sizeInBytes": 111850}, "small": {"ext": ".jpeg", "url": "/uploads/small_schiebetuer_hund_40236ce33e.jpeg", "hash": "small_schiebetuer_hund_40236ce33e", "mime": "image/jpeg", "name": "small_schiebetuer_hund.jpeg", "path": null, "size": 35.8, "width": 333, "height": 500, "sizeInBytes": 35804}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_schiebetuer_hund_40236ce33e.jpeg", "hash": "medium_schiebetuer_hund_40236ce33e", "mime": "image/jpeg", "name": "medium_schiebetuer_hund.jpeg", "path": null, "size": 70.78, "width": 500, "height": 750, "sizeInBytes": 70775}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_schiebetuer_hund_40236ce33e.jpeg", "hash": "thumbnail_schiebetuer_hund_40236ce33e", "mime": "image/jpeg", "name": "thumbnail_schiebetuer_hund.jpeg", "path": null, "size": 4.85, "width": 104, "height": 156, "sizeInBytes": 4846}}	schiebetuer_hund_40236ce33e	.jpeg	image/jpeg	2348.18	/uploads/schiebetuer_hund_40236ce33e.jpeg	\N	local	\N	/	2024-11-09 12:21:17.847	2024-11-09 12:21:17.847	2024-11-09 12:21:17.847	1	1	\N
66	splhup383l5fa7xibry8ocru	tuer_frame.jpg	\N	\N	1217	697	{"large": {"ext": ".jpg", "url": "/uploads/large_tuer_frame_304277aeed.jpg", "hash": "large_tuer_frame_304277aeed", "mime": "image/jpeg", "name": "large_tuer_frame.jpg", "path": null, "size": 116.89, "width": 1000, "height": 573, "sizeInBytes": 116892}, "small": {"ext": ".jpg", "url": "/uploads/small_tuer_frame_304277aeed.jpg", "hash": "small_tuer_frame_304277aeed", "mime": "image/jpeg", "name": "small_tuer_frame.jpg", "path": null, "size": 37.14, "width": 500, "height": 286, "sizeInBytes": 37143}, "medium": {"ext": ".jpg", "url": "/uploads/medium_tuer_frame_304277aeed.jpg", "hash": "medium_tuer_frame_304277aeed", "mime": "image/jpeg", "name": "medium_tuer_frame.jpg", "path": null, "size": 71.84, "width": 750, "height": 430, "sizeInBytes": 71839}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_tuer_frame_304277aeed.jpg", "hash": "thumbnail_tuer_frame_304277aeed", "mime": "image/jpeg", "name": "thumbnail_tuer_frame.jpg", "path": null, "size": 11.07, "width": 245, "height": 140, "sizeInBytes": 11069}}	tuer_frame_304277aeed	.jpg	image/jpeg	165.63	/uploads/tuer_frame_304277aeed.jpg	\N	local	\N	/	2024-11-09 12:21:20.786	2024-11-09 12:21:20.786	2024-11-09 12:21:20.786	1	1	\N
67	atexa0f3dgwdgbu0683d41qt	terressa.jpeg	\N	\N	4064	2012	{"large": {"ext": ".jpeg", "url": "/uploads/large_terressa_c62e8dbb0e.jpeg", "hash": "large_terressa_c62e8dbb0e", "mime": "image/jpeg", "name": "large_terressa.jpeg", "path": null, "size": 114.68, "width": 1000, "height": 495, "sizeInBytes": 114677}, "small": {"ext": ".jpeg", "url": "/uploads/small_terressa_c62e8dbb0e.jpeg", "hash": "small_terressa_c62e8dbb0e", "mime": "image/jpeg", "name": "small_terressa.jpeg", "path": null, "size": 28.75, "width": 500, "height": 248, "sizeInBytes": 28752}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_terressa_c62e8dbb0e.jpeg", "hash": "medium_terressa_c62e8dbb0e", "mime": "image/jpeg", "name": "medium_terressa.jpeg", "path": null, "size": 64.77, "width": 750, "height": 371, "sizeInBytes": 64771}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_terressa_c62e8dbb0e.jpeg", "hash": "thumbnail_terressa_c62e8dbb0e", "mime": "image/jpeg", "name": "thumbnail_terressa.jpeg", "path": null, "size": 7.28, "width": 245, "height": 121, "sizeInBytes": 7277}}	terressa_c62e8dbb0e	.jpeg	image/jpeg	1451.48	/uploads/terressa_c62e8dbb0e.jpeg	\N	local	\N	/	2024-11-09 12:21:22.746	2024-11-09 12:21:22.746	2024-11-09 12:21:22.746	1	1	\N
68	kmfhd4iava3l7ydudjfgzjxj	schiebetuer_people.jpeg	\N	\N	5592	3728	{"large": {"ext": ".jpeg", "url": "/uploads/large_schiebetuer_people_d9d4ecd893.jpeg", "hash": "large_schiebetuer_people_d9d4ecd893", "mime": "image/jpeg", "name": "large_schiebetuer_people.jpeg", "path": null, "size": 94.28, "width": 1000, "height": 667, "sizeInBytes": 94283}, "small": {"ext": ".jpeg", "url": "/uploads/small_schiebetuer_people_d9d4ecd893.jpeg", "hash": "small_schiebetuer_people_d9d4ecd893", "mime": "image/jpeg", "name": "small_schiebetuer_people.jpeg", "path": null, "size": 30.83, "width": 500, "height": 333, "sizeInBytes": 30826}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_schiebetuer_people_d9d4ecd893.jpeg", "hash": "medium_schiebetuer_people_d9d4ecd893", "mime": "image/jpeg", "name": "medium_schiebetuer_people.jpeg", "path": null, "size": 59.06, "width": 750, "height": 500, "sizeInBytes": 59062}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_schiebetuer_people_d9d4ecd893.jpeg", "hash": "thumbnail_schiebetuer_people_d9d4ecd893", "mime": "image/jpeg", "name": "thumbnail_schiebetuer_people.jpeg", "path": null, "size": 9.61, "width": 234, "height": 156, "sizeInBytes": 9613}}	schiebetuer_people_d9d4ecd893	.jpeg	image/jpeg	2804.86	/uploads/schiebetuer_people_d9d4ecd893.jpeg	\N	local	\N	/	2024-11-09 12:21:23.104	2024-11-09 12:21:23.104	2024-11-09 12:21:23.104	1	1	\N
52	h2pz1xqkmcthlnk23diiel5n	montage_horizontal.jpg	\N	\N	5572	3715	{"large": {"ext": ".jpg", "url": "/uploads/large_montage_horizontal_a4cd01296b.jpg", "hash": "large_montage_horizontal_a4cd01296b", "mime": "image/jpeg", "name": "large_montage_horizontal.jpg", "path": null, "size": 90.67, "width": 1000, "height": 666, "sizeInBytes": 90672}, "small": {"ext": ".jpg", "url": "/uploads/small_montage_horizontal_a4cd01296b.jpg", "hash": "small_montage_horizontal_a4cd01296b", "mime": "image/jpeg", "name": "small_montage_horizontal.jpg", "path": null, "size": 30.84, "width": 500, "height": 333, "sizeInBytes": 30836}, "medium": {"ext": ".jpg", "url": "/uploads/medium_montage_horizontal_a4cd01296b.jpg", "hash": "medium_montage_horizontal_a4cd01296b", "mime": "image/jpeg", "name": "medium_montage_horizontal.jpg", "path": null, "size": 58.4, "width": 750, "height": 500, "sizeInBytes": 58402}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_montage_horizontal_a4cd01296b.jpg", "hash": "thumbnail_montage_horizontal_a4cd01296b", "mime": "image/jpeg", "name": "thumbnail_montage_horizontal.jpg", "path": null, "size": 9.31, "width": 234, "height": 156, "sizeInBytes": 9311}}	montage_horizontal_a4cd01296b	.jpg	image/jpeg	1163.13	/uploads/montage_horizontal_a4cd01296b.jpg	\N	local	\N	/	2024-11-09 12:21:04.583	2024-11-09 12:21:04.583	2024-11-09 12:21:04.583	1	1	\N
53	iyh479fj1alwzflaf94hhrt5	lisa.jpg	\N	\N	3543	2660	{"large": {"ext": ".jpg", "url": "/uploads/large_lisa_93cc561e6b.jpg", "hash": "large_lisa_93cc561e6b", "mime": "image/jpeg", "name": "large_lisa.jpg", "path": null, "size": 157.68, "width": 1000, "height": 751, "sizeInBytes": 157680}, "small": {"ext": ".jpg", "url": "/uploads/small_lisa_93cc561e6b.jpg", "hash": "small_lisa_93cc561e6b", "mime": "image/jpeg", "name": "small_lisa.jpg", "path": null, "size": 43.52, "width": 500, "height": 376, "sizeInBytes": 43522}, "medium": {"ext": ".jpg", "url": "/uploads/medium_lisa_93cc561e6b.jpg", "hash": "medium_lisa_93cc561e6b", "mime": "image/jpeg", "name": "medium_lisa.jpg", "path": null, "size": 90.82, "width": 750, "height": 563, "sizeInBytes": 90815}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_lisa_93cc561e6b.jpg", "hash": "thumbnail_lisa_93cc561e6b", "mime": "image/jpeg", "name": "thumbnail_lisa.jpg", "path": null, "size": 9.85, "width": 208, "height": 156, "sizeInBytes": 9850}}	lisa_93cc561e6b	.jpg	image/jpeg	1786.35	/uploads/lisa_93cc561e6b.jpg	\N	local	\N	/	2024-11-09 12:21:05.089	2024-11-09 12:21:05.089	2024-11-09 12:21:05.09	1	1	\N
54	ljzob946rtxgr68xv013gzf1	neher_logo.jpeg	\N	\N	1746	1746	{"large": {"ext": ".jpeg", "url": "/uploads/large_neher_logo_5c1ff4573b.jpeg", "hash": "large_neher_logo_5c1ff4573b", "mime": "image/jpeg", "name": "large_neher_logo.jpeg", "path": null, "size": 61.69, "width": 1000, "height": 1000, "sizeInBytes": 61692}, "small": {"ext": ".jpeg", "url": "/uploads/small_neher_logo_5c1ff4573b.jpeg", "hash": "small_neher_logo_5c1ff4573b", "mime": "image/jpeg", "name": "small_neher_logo.jpeg", "path": null, "size": 28.45, "width": 500, "height": 500, "sizeInBytes": 28445}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_neher_logo_5c1ff4573b.jpeg", "hash": "medium_neher_logo_5c1ff4573b", "mime": "image/jpeg", "name": "medium_neher_logo.jpeg", "path": null, "size": 45.29, "width": 750, "height": 750, "sizeInBytes": 45286}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_neher_logo_5c1ff4573b.jpeg", "hash": "thumbnail_neher_logo_5c1ff4573b", "mime": "image/jpeg", "name": "thumbnail_neher_logo.jpeg", "path": null, "size": 7.01, "width": 156, "height": 156, "sizeInBytes": 7014}}	neher_logo_5c1ff4573b	.jpeg	image/jpeg	114.48	/uploads/neher_logo_5c1ff4573b.jpeg	\N	local	\N	/	2024-11-09 12:21:05.285	2024-11-09 12:21:05.285	2024-11-09 12:21:05.285	1	1	\N
56	c6fclovgr19wrsau3w7qlcrh	kinderzimmer1.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_kinderzimmer1_ef16b4904c.jpeg", "hash": "large_kinderzimmer1_ef16b4904c", "mime": "image/jpeg", "name": "large_kinderzimmer1.jpeg", "path": null, "size": 91.2, "width": 1000, "height": 667, "sizeInBytes": 91203}, "small": {"ext": ".jpeg", "url": "/uploads/small_kinderzimmer1_ef16b4904c.jpeg", "hash": "small_kinderzimmer1_ef16b4904c", "mime": "image/jpeg", "name": "small_kinderzimmer1.jpeg", "path": null, "size": 28.64, "width": 500, "height": 333, "sizeInBytes": 28638}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_kinderzimmer1_ef16b4904c.jpeg", "hash": "medium_kinderzimmer1_ef16b4904c", "mime": "image/jpeg", "name": "medium_kinderzimmer1.jpeg", "path": null, "size": 55.69, "width": 750, "height": 500, "sizeInBytes": 55689}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_kinderzimmer1_ef16b4904c.jpeg", "hash": "thumbnail_kinderzimmer1_ef16b4904c", "mime": "image/jpeg", "name": "thumbnail_kinderzimmer1.jpeg", "path": null, "size": 8.86, "width": 234, "height": 156, "sizeInBytes": 8859}}	kinderzimmer1_ef16b4904c	.jpeg	image/jpeg	6575.37	/uploads/kinderzimmer1_ef16b4904c.jpeg	\N	local	\N	/	2024-11-09 12:21:05.924	2024-11-09 12:21:05.924	2024-11-09 12:21:05.924	1	1	\N
61	zs023sbmgskcjy5dnt02iqm5	rollo_gartenarbeit.jpeg	\N	\N	3377	5065	{"large": {"ext": ".jpeg", "url": "/uploads/large_rollo_gartenarbeit_fa1d662bed.jpeg", "hash": "large_rollo_gartenarbeit_fa1d662bed", "mime": "image/jpeg", "name": "large_rollo_gartenarbeit.jpeg", "path": null, "size": 85.39, "width": 667, "height": 1000, "sizeInBytes": 85387}, "small": {"ext": ".jpeg", "url": "/uploads/small_rollo_gartenarbeit_fa1d662bed.jpeg", "hash": "small_rollo_gartenarbeit_fa1d662bed", "mime": "image/jpeg", "name": "small_rollo_gartenarbeit.jpeg", "path": null, "size": 22.69, "width": 333, "height": 500, "sizeInBytes": 22689}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_rollo_gartenarbeit_fa1d662bed.jpeg", "hash": "medium_rollo_gartenarbeit_fa1d662bed", "mime": "image/jpeg", "name": "medium_rollo_gartenarbeit.jpeg", "path": null, "size": 48.96, "width": 500, "height": 750, "sizeInBytes": 48955}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_rollo_gartenarbeit_fa1d662bed.jpeg", "hash": "thumbnail_rollo_gartenarbeit_fa1d662bed", "mime": "image/jpeg", "name": "thumbnail_rollo_gartenarbeit.jpeg", "path": null, "size": 3.62, "width": 104, "height": 156, "sizeInBytes": 3624}}	rollo_gartenarbeit_fa1d662bed	.jpeg	image/jpeg	2022.36	/uploads/rollo_gartenarbeit_fa1d662bed.jpeg	\N	local	\N	/	2024-11-09 12:21:17.65	2024-11-09 12:21:17.65	2024-11-09 12:21:17.651	1	1	\N
65	mn5qc0t9pgeqd1914o0xzhfy	resi.jpeg	\N	\N	5678	3785	{"large": {"ext": ".jpeg", "url": "/uploads/large_resi_34d9fe43fa.jpeg", "hash": "large_resi_34d9fe43fa", "mime": "image/jpeg", "name": "large_resi.jpeg", "path": null, "size": 118.09, "width": 1000, "height": 667, "sizeInBytes": 118090}, "small": {"ext": ".jpeg", "url": "/uploads/small_resi_34d9fe43fa.jpeg", "hash": "small_resi_34d9fe43fa", "mime": "image/jpeg", "name": "small_resi.jpeg", "path": null, "size": 22.92, "width": 500, "height": 334, "sizeInBytes": 22918}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_resi_34d9fe43fa.jpeg", "hash": "medium_resi_34d9fe43fa", "mime": "image/jpeg", "name": "medium_resi.jpeg", "path": null, "size": 59.84, "width": 750, "height": 500, "sizeInBytes": 59837}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_resi_34d9fe43fa.jpeg", "hash": "thumbnail_resi_34d9fe43fa", "mime": "image/jpeg", "name": "thumbnail_resi.jpeg", "path": null, "size": 4.56, "width": 234, "height": 156, "sizeInBytes": 4563}}	resi_34d9fe43fa	.jpeg	image/jpeg	4496.93	/uploads/resi_34d9fe43fa.jpeg	\N	local	\N	/	2024-11-09 12:21:17.978	2024-11-09 12:21:17.978	2024-11-09 12:21:17.979	1	1	\N
70	afq2fd25x1jofivfzsxcnift	tuer_home.jpg	\N	\N	5704	3803	{"large": {"ext": ".jpg", "url": "/uploads/large_tuer_home_74ae82d526.jpg", "hash": "large_tuer_home_74ae82d526", "mime": "image/jpeg", "name": "large_tuer_home.jpg", "path": null, "size": 76.06, "width": 1000, "height": 666, "sizeInBytes": 76055}, "small": {"ext": ".jpg", "url": "/uploads/small_tuer_home_74ae82d526.jpg", "hash": "small_tuer_home_74ae82d526", "mime": "image/jpeg", "name": "small_tuer_home.jpg", "path": null, "size": 25.5, "width": 500, "height": 333, "sizeInBytes": 25495}, "medium": {"ext": ".jpg", "url": "/uploads/medium_tuer_home_74ae82d526.jpg", "hash": "medium_tuer_home_74ae82d526", "mime": "image/jpeg", "name": "medium_tuer_home.jpg", "path": null, "size": 48.88, "width": 750, "height": 500, "sizeInBytes": 48875}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_tuer_home_74ae82d526.jpg", "hash": "thumbnail_tuer_home_74ae82d526", "mime": "image/jpeg", "name": "thumbnail_tuer_home.jpg", "path": null, "size": 7.86, "width": 234, "height": 156, "sizeInBytes": 7856}}	tuer_home_74ae82d526	.jpg	image/jpeg	2136.04	/uploads/tuer_home_74ae82d526.jpg	\N	local	\N	/	2024-11-09 12:21:23.218	2024-11-09 12:21:23.218	2024-11-09 12:21:23.218	1	1	\N
71	syeye8bw5vrhxxzux28dusuk	tuer_sicht.jpg	\N	\N	5704	3803	{"large": {"ext": ".jpg", "url": "/uploads/large_tuer_sicht_33a2344e23.jpg", "hash": "large_tuer_sicht_33a2344e23", "mime": "image/jpeg", "name": "large_tuer_sicht.jpg", "path": null, "size": 76.06, "width": 1000, "height": 666, "sizeInBytes": 76055}, "small": {"ext": ".jpg", "url": "/uploads/small_tuer_sicht_33a2344e23.jpg", "hash": "small_tuer_sicht_33a2344e23", "mime": "image/jpeg", "name": "small_tuer_sicht.jpg", "path": null, "size": 25.5, "width": 500, "height": 333, "sizeInBytes": 25495}, "medium": {"ext": ".jpg", "url": "/uploads/medium_tuer_sicht_33a2344e23.jpg", "hash": "medium_tuer_sicht_33a2344e23", "mime": "image/jpeg", "name": "medium_tuer_sicht.jpg", "path": null, "size": 48.88, "width": 750, "height": 500, "sizeInBytes": 48875}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_tuer_sicht_33a2344e23.jpg", "hash": "thumbnail_tuer_sicht_33a2344e23", "mime": "image/jpeg", "name": "thumbnail_tuer_sicht.jpg", "path": null, "size": 7.86, "width": 234, "height": 156, "sizeInBytes": 7856}}	tuer_sicht_33a2344e23	.jpg	image/jpeg	2136.04	/uploads/tuer_sicht_33a2344e23.jpg	\N	local	\N	/	2024-11-09 12:21:29.296	2024-11-09 12:21:29.296	2024-11-09 12:21:29.296	1	1	\N
62	w6ywqjdhlgpdibhm2fdhu4cm	rollo_smalltalk.jpeg	\N	\N	5760	3840	{"large": {"ext": ".jpeg", "url": "/uploads/large_rollo_smalltalk_68c4b9cbe1.jpeg", "hash": "large_rollo_smalltalk_68c4b9cbe1", "mime": "image/jpeg", "name": "large_rollo_smalltalk.jpeg", "path": null, "size": 96.88, "width": 1000, "height": 667, "sizeInBytes": 96882}, "small": {"ext": ".jpeg", "url": "/uploads/small_rollo_smalltalk_68c4b9cbe1.jpeg", "hash": "small_rollo_smalltalk_68c4b9cbe1", "mime": "image/jpeg", "name": "small_rollo_smalltalk.jpeg", "path": null, "size": 26.23, "width": 500, "height": 333, "sizeInBytes": 26233}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_rollo_smalltalk_68c4b9cbe1.jpeg", "hash": "medium_rollo_smalltalk_68c4b9cbe1", "mime": "image/jpeg", "name": "medium_rollo_smalltalk.jpeg", "path": null, "size": 56.31, "width": 750, "height": 500, "sizeInBytes": 56308}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_rollo_smalltalk_68c4b9cbe1.jpeg", "hash": "thumbnail_rollo_smalltalk_68c4b9cbe1", "mime": "image/jpeg", "name": "thumbnail_rollo_smalltalk.jpeg", "path": null, "size": 7.43, "width": 234, "height": 156, "sizeInBytes": 7430}}	rollo_smalltalk_68c4b9cbe1	.jpeg	image/jpeg	2864.08	/uploads/rollo_smalltalk_68c4b9cbe1.jpeg	\N	local	\N	/	2024-11-09 12:21:17.659	2024-11-09 12:21:17.659	2024-11-09 12:21:17.659	1	1	\N
63	r2de4et51hg16f24x1llrv8c	resi_cover.jpeg	\N	\N	5678	3785	{"large": {"ext": ".jpeg", "url": "/uploads/large_resi_cover_2950a2e3d7.jpeg", "hash": "large_resi_cover_2950a2e3d7", "mime": "image/jpeg", "name": "large_resi_cover.jpeg", "path": null, "size": 108.48, "width": 1000, "height": 667, "sizeInBytes": 108476}, "small": {"ext": ".jpeg", "url": "/uploads/small_resi_cover_2950a2e3d7.jpeg", "hash": "small_resi_cover_2950a2e3d7", "mime": "image/jpeg", "name": "small_resi_cover.jpeg", "path": null, "size": 25.09, "width": 500, "height": 334, "sizeInBytes": 25091}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_resi_cover_2950a2e3d7.jpeg", "hash": "medium_resi_cover_2950a2e3d7", "mime": "image/jpeg", "name": "medium_resi_cover.jpeg", "path": null, "size": 58.62, "width": 750, "height": 500, "sizeInBytes": 58622}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_resi_cover_2950a2e3d7.jpeg", "hash": "thumbnail_resi_cover_2950a2e3d7", "mime": "image/jpeg", "name": "thumbnail_resi_cover.jpeg", "path": null, "size": 6.3, "width": 234, "height": 156, "sizeInBytes": 6297}}	resi_cover_2950a2e3d7	.jpeg	image/jpeg	3793.94	/uploads/resi_cover_2950a2e3d7.jpeg	\N	local	\N	/	2024-11-09 12:21:17.776	2024-11-09 12:21:17.776	2024-11-09 12:21:17.777	1	1	\N
69	ejxx9p8prqd2gpgkjt5ntgzq	schiebetuer.jpg	\N	\N	5686	3791	{"large": {"ext": ".jpg", "url": "/uploads/large_schiebetuer_11d0a358d3.jpg", "hash": "large_schiebetuer_11d0a358d3", "mime": "image/jpeg", "name": "large_schiebetuer.jpg", "path": null, "size": 89.57, "width": 1000, "height": 666, "sizeInBytes": 89565}, "small": {"ext": ".jpg", "url": "/uploads/small_schiebetuer_11d0a358d3.jpg", "hash": "small_schiebetuer_11d0a358d3", "mime": "image/jpeg", "name": "small_schiebetuer.jpg", "path": null, "size": 27.23, "width": 500, "height": 333, "sizeInBytes": 27227}, "medium": {"ext": ".jpg", "url": "/uploads/medium_schiebetuer_11d0a358d3.jpg", "hash": "medium_schiebetuer_11d0a358d3", "mime": "image/jpeg", "name": "medium_schiebetuer.jpg", "path": null, "size": 54.15, "width": 750, "height": 500, "sizeInBytes": 54153}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_schiebetuer_11d0a358d3.jpg", "hash": "thumbnail_schiebetuer_11d0a358d3", "mime": "image/jpeg", "name": "thumbnail_schiebetuer.jpg", "path": null, "size": 8.17, "width": 234, "height": 156, "sizeInBytes": 8168}}	schiebetuer_11d0a358d3	.jpg	image/jpeg	2613.51	/uploads/schiebetuer_11d0a358d3.jpg	\N	local	\N	/	2024-11-09 12:21:23.118	2024-11-09 12:21:23.118	2024-11-09 12:21:23.118	1	1	\N
73	d6tunt98d5gjx5414aqbd2jc	tuer2.jpg	\N	\N	3840	3825	{"large": {"ext": ".jpg", "url": "/uploads/large_tuer2_1d3a10d120.jpg", "hash": "large_tuer2_1d3a10d120", "mime": "image/jpeg", "name": "large_tuer2.jpg", "path": null, "size": 190.92, "width": 1000, "height": 996, "sizeInBytes": 190919}, "small": {"ext": ".jpg", "url": "/uploads/small_tuer2_1d3a10d120.jpg", "hash": "small_tuer2_1d3a10d120", "mime": "image/jpeg", "name": "small_tuer2.jpg", "path": null, "size": 58.92, "width": 500, "height": 498, "sizeInBytes": 58924}, "medium": {"ext": ".jpg", "url": "/uploads/medium_tuer2_1d3a10d120.jpg", "hash": "medium_tuer2_1d3a10d120", "mime": "image/jpeg", "name": "medium_tuer2.jpg", "path": null, "size": 115.58, "width": 750, "height": 747, "sizeInBytes": 115581}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_tuer2_1d3a10d120.jpg", "hash": "thumbnail_tuer2_1d3a10d120", "mime": "image/jpeg", "name": "thumbnail_tuer2.jpg", "path": null, "size": 7.65, "width": 157, "height": 156, "sizeInBytes": 7653}}	tuer2_1d3a10d120	.jpg	image/jpeg	1976.95	/uploads/tuer2_1d3a10d120.jpg	\N	local	\N	/	2024-11-09 12:21:29.301	2024-11-09 12:21:29.301	2024-11-09 12:21:29.301	1	1	\N
74	pgd3f0o59dxuteqagz52l6xz	tueren_card.jpeg	\N	\N	5704	3303	{"large": {"ext": ".jpeg", "url": "/uploads/large_tueren_card_d780bc950e.jpeg", "hash": "large_tueren_card_d780bc950e", "mime": "image/jpeg", "name": "large_tueren_card.jpeg", "path": null, "size": 78.25, "width": 1000, "height": 579, "sizeInBytes": 78251}, "small": {"ext": ".jpeg", "url": "/uploads/small_tueren_card_d780bc950e.jpeg", "hash": "small_tueren_card_d780bc950e", "mime": "image/jpeg", "name": "small_tueren_card.jpeg", "path": null, "size": 24.68, "width": 500, "height": 289, "sizeInBytes": 24681}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_tueren_card_d780bc950e.jpeg", "hash": "medium_tueren_card_d780bc950e", "mime": "image/jpeg", "name": "medium_tueren_card.jpeg", "path": null, "size": 48.44, "width": 750, "height": 434, "sizeInBytes": 48436}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_tueren_card_d780bc950e.jpeg", "hash": "thumbnail_tueren_card_d780bc950e", "mime": "image/jpeg", "name": "thumbnail_tueren_card.jpeg", "path": null, "size": 7.76, "width": 245, "height": 142, "sizeInBytes": 7760}}	tueren_card_d780bc950e	.jpeg	image/jpeg	2062.21	/uploads/tueren_card_d780bc950e.jpeg	\N	local	\N	/	2024-11-09 12:21:29.304	2024-11-09 12:21:29.304	2024-11-09 12:21:29.304	1	1	\N
72	qydk1pkj6jsiimd0my8qvsno	tueren_cover2.jpeg	\N	\N	5590	3727	{"large": {"ext": ".jpeg", "url": "/uploads/large_tueren_cover2_8f659a403a.jpeg", "hash": "large_tueren_cover2_8f659a403a", "mime": "image/jpeg", "name": "large_tueren_cover2.jpeg", "path": null, "size": 97.4, "width": 1000, "height": 666, "sizeInBytes": 97395}, "small": {"ext": ".jpeg", "url": "/uploads/small_tueren_cover2_8f659a403a.jpeg", "hash": "small_tueren_cover2_8f659a403a", "mime": "image/jpeg", "name": "small_tueren_cover2.jpeg", "path": null, "size": 30.9, "width": 500, "height": 333, "sizeInBytes": 30896}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_tueren_cover2_8f659a403a.jpeg", "hash": "medium_tueren_cover2_8f659a403a", "mime": "image/jpeg", "name": "medium_tueren_cover2.jpeg", "path": null, "size": 60.31, "width": 750, "height": 500, "sizeInBytes": 60305}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_tueren_cover2_8f659a403a.jpeg", "hash": "thumbnail_tueren_cover2_8f659a403a", "mime": "image/jpeg", "name": "thumbnail_tueren_cover2.jpeg", "path": null, "size": 9.29, "width": 234, "height": 156, "sizeInBytes": 9294}}	tueren_cover2_8f659a403a	.jpeg	image/jpeg	2294.88	/uploads/tueren_cover2_8f659a403a.jpeg	\N	local	\N	/	2024-11-09 12:21:29.299	2024-11-09 12:21:29.299	2024-11-09 12:21:29.299	1	1	\N
75	o8mxtlblrbtzkq0559e6g7ro	tuer_rollo_terasse.jpeg	\N	\N	5621	3747	{"large": {"ext": ".jpeg", "url": "/uploads/large_tuer_rollo_terasse_53bef5fe12.jpeg", "hash": "large_tuer_rollo_terasse_53bef5fe12", "mime": "image/jpeg", "name": "large_tuer_rollo_terasse.jpeg", "path": null, "size": 115.06, "width": 1000, "height": 666, "sizeInBytes": 115058}, "small": {"ext": ".jpeg", "url": "/uploads/small_tuer_rollo_terasse_53bef5fe12.jpeg", "hash": "small_tuer_rollo_terasse_53bef5fe12", "mime": "image/jpeg", "name": "small_tuer_rollo_terasse.jpeg", "path": null, "size": 31.46, "width": 500, "height": 333, "sizeInBytes": 31456}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_tuer_rollo_terasse_53bef5fe12.jpeg", "hash": "medium_tuer_rollo_terasse_53bef5fe12", "mime": "image/jpeg", "name": "medium_tuer_rollo_terasse.jpeg", "path": null, "size": 66.35, "width": 750, "height": 500, "sizeInBytes": 66352}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_tuer_rollo_terasse_53bef5fe12.jpeg", "hash": "thumbnail_tuer_rollo_terasse_53bef5fe12", "mime": "image/jpeg", "name": "thumbnail_tuer_rollo_terasse.jpeg", "path": null, "size": 8.93, "width": 234, "height": 156, "sizeInBytes": 8931}}	tuer_rollo_terasse_53bef5fe12	.jpeg	image/jpeg	3262.67	/uploads/tuer_rollo_terasse_53bef5fe12.jpeg	\N	local	\N	/	2024-11-09 12:21:29.437	2024-11-09 12:21:29.437	2024-11-09 12:21:29.438	1	1	\N
77	awtldk0r8emb1e34ac44gvt1	tür_sicht.jpg	\N	\N	5704	3803	{"large": {"ext": ".jpg", "url": "/uploads/large_tuer_sicht_c19d1c1cac.jpg", "hash": "large_tuer_sicht_c19d1c1cac", "mime": "image/jpeg", "name": "large_tür_sicht.jpg", "path": null, "size": 76.06, "width": 1000, "height": 666, "sizeInBytes": 76055}, "small": {"ext": ".jpg", "url": "/uploads/small_tuer_sicht_c19d1c1cac.jpg", "hash": "small_tuer_sicht_c19d1c1cac", "mime": "image/jpeg", "name": "small_tür_sicht.jpg", "path": null, "size": 25.5, "width": 500, "height": 333, "sizeInBytes": 25495}, "medium": {"ext": ".jpg", "url": "/uploads/medium_tuer_sicht_c19d1c1cac.jpg", "hash": "medium_tuer_sicht_c19d1c1cac", "mime": "image/jpeg", "name": "medium_tür_sicht.jpg", "path": null, "size": 48.88, "width": 750, "height": 500, "sizeInBytes": 48875}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_tuer_sicht_c19d1c1cac.jpg", "hash": "thumbnail_tuer_sicht_c19d1c1cac", "mime": "image/jpeg", "name": "thumbnail_tür_sicht.jpg", "path": null, "size": 7.86, "width": 234, "height": 156, "sizeInBytes": 7856}}	tuer_sicht_c19d1c1cac	.jpg	image/jpeg	2136.04	/uploads/tuer_sicht_c19d1c1cac.jpg	\N	local	\N	/	2024-11-09 12:21:31.175	2024-11-09 12:21:31.175	2024-11-09 12:21:31.175	1	1	\N
76	h3l1odw3elsnytfcnp61oz26	tuerrollo.jpeg	\N	\N	5645	3687	{"large": {"ext": ".jpeg", "url": "/uploads/large_tuerrollo_1d4f31715c.jpeg", "hash": "large_tuerrollo_1d4f31715c", "mime": "image/jpeg", "name": "large_tuerrollo.jpeg", "path": null, "size": 89.12, "width": 1000, "height": 653, "sizeInBytes": 89119}, "small": {"ext": ".jpeg", "url": "/uploads/small_tuerrollo_1d4f31715c.jpeg", "hash": "small_tuerrollo_1d4f31715c", "mime": "image/jpeg", "name": "small_tuerrollo.jpeg", "path": null, "size": 27.64, "width": 500, "height": 326, "sizeInBytes": 27644}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_tuerrollo_1d4f31715c.jpeg", "hash": "medium_tuerrollo_1d4f31715c", "mime": "image/jpeg", "name": "medium_tuerrollo.jpeg", "path": null, "size": 54.96, "width": 750, "height": 490, "sizeInBytes": 54955}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_tuerrollo_1d4f31715c.jpeg", "hash": "thumbnail_tuerrollo_1d4f31715c", "mime": "image/jpeg", "name": "thumbnail_tuerrollo.jpeg", "path": null, "size": 8.77, "width": 239, "height": 156, "sizeInBytes": 8766}}	tuerrollo_1d4f31715c	.jpeg	image/jpeg	1976.94	/uploads/tuerrollo_1d4f31715c.jpeg	\N	local	\N	/	2024-11-09 12:21:29.441	2024-11-09 12:21:29.441	2024-11-09 12:21:29.441	1	1	\N
78	hesrx3yc44wom8jy5f6s4106	asset_id_c9d548890efd9a7dd78c109f9a680b25.pdf	\N	\N	\N	\N	\N	asset_id_c9d548890efd9a7dd78c109f9a680b25_89db8e4697	.pdf	application/pdf	1224.33	/uploads/asset_id_c9d548890efd9a7dd78c109f9a680b25_89db8e4697.pdf	\N	local	\N	/	2024-11-09 12:48:52.835	2024-11-09 12:48:52.835	2024-11-09 12:48:52.835	1	1	\N
79	hcux0y76km7ysb7ekfcl6coi	asset_id_fe8d66e1d36621b9d2629e4b43ab718b.pdf	\N	\N	\N	\N	\N	asset_id_fe8d66e1d36621b9d2629e4b43ab718b_419767e777	.pdf	application/pdf	1193.50	/uploads/asset_id_fe8d66e1d36621b9d2629e4b43ab718b_419767e777.pdf	\N	local	\N	/	2024-11-09 12:50:07.977	2024-11-09 12:50:07.977	2024-11-09 12:50:07.977	1	1	\N
80	plj3he2lwvn0dw6gsz7qy6z2	csm_mhz-plissee-sirius_6653cc5cf4.webp	\N	\N	438	247	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_csm_mhz_plissee_sirius_6653cc5cf4_80f54bf52c.webp", "hash": "thumbnail_csm_mhz_plissee_sirius_6653cc5cf4_80f54bf52c", "mime": "image/webp", "name": "thumbnail_csm_mhz-plissee-sirius_6653cc5cf4.webp", "path": null, "size": 6.74, "width": 245, "height": 138, "sizeInBytes": 6736}}	csm_mhz_plissee_sirius_6653cc5cf4_80f54bf52c	.webp	image/webp	22.56	/uploads/csm_mhz_plissee_sirius_6653cc5cf4_80f54bf52c.webp	\N	local	\N	/	2024-11-09 16:07:17.953	2024-11-09 16:07:17.953	2024-11-09 16:07:17.957	1	1	\N
81	vswqec4vd8z8x4l9sil65jz0	csm_mhz-plissee-4073-varo-4797-willow_37bea6b4ab.webp	\N	\N	1320	743	{"large": {"ext": ".webp", "url": "/uploads/large_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d.webp", "hash": "large_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d", "mime": "image/webp", "name": "large_csm_mhz-plissee-4073-varo-4797-willow_37bea6b4ab.webp", "path": null, "size": 73.57, "width": 1000, "height": 563, "sizeInBytes": 73568}, "small": {"ext": ".webp", "url": "/uploads/small_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d.webp", "hash": "small_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d", "mime": "image/webp", "name": "small_csm_mhz-plissee-4073-varo-4797-willow_37bea6b4ab.webp", "path": null, "size": 20.98, "width": 500, "height": 281, "sizeInBytes": 20980}, "medium": {"ext": ".webp", "url": "/uploads/medium_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d.webp", "hash": "medium_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d", "mime": "image/webp", "name": "medium_csm_mhz-plissee-4073-varo-4797-willow_37bea6b4ab.webp", "path": null, "size": 43.95, "width": 750, "height": 422, "sizeInBytes": 43952}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d.webp", "hash": "thumbnail_csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d", "mime": "image/webp", "name": "thumbnail_csm_mhz-plissee-4073-varo-4797-willow_37bea6b4ab.webp", "path": null, "size": 5.98, "width": 245, "height": 138, "sizeInBytes": 5980}}	csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d	.webp	image/webp	156.68	/uploads/csm_mhz_plissee_4073_varo_4797_willow_37bea6b4ab_baa0f3066d.webp	\N	local	\N	/	2024-11-09 16:07:18.392	2024-11-09 16:07:18.392	2024-11-09 16:07:18.393	1	1	\N
60	sg83xh2uyia3d6l1iitgclym	pendeltür_schloss2.jpeg	\N	\N	5043	3014	{"large": {"ext": ".jpeg", "url": "/uploads/large_pendeltuer_schloss2_adafde734e.jpeg", "hash": "large_pendeltuer_schloss2_adafde734e", "mime": "image/jpeg", "name": "large_pendeltür_schloss2.jpeg", "path": null, "size": 103.02, "width": 1000, "height": 598, "sizeInBytes": 103017}, "small": {"ext": ".jpeg", "url": "/uploads/small_pendeltuer_schloss2_adafde734e.jpeg", "hash": "small_pendeltuer_schloss2_adafde734e", "mime": "image/jpeg", "name": "small_pendeltür_schloss2.jpeg", "path": null, "size": 21.63, "width": 500, "height": 298, "sizeInBytes": 21632}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_pendeltuer_schloss2_adafde734e.jpeg", "hash": "medium_pendeltuer_schloss2_adafde734e", "mime": "image/jpeg", "name": "medium_pendeltür_schloss2.jpeg", "path": null, "size": 54.79, "width": 750, "height": 448, "sizeInBytes": 54792}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_pendeltuer_schloss2_adafde734e.jpeg", "hash": "thumbnail_pendeltuer_schloss2_adafde734e", "mime": "image/jpeg", "name": "thumbnail_pendeltür_schloss2.jpeg", "path": null, "size": 5.83, "width": 245, "height": 146, "sizeInBytes": 5827}}	pendeltuer_schloss2_adafde734e	.jpeg	image/jpeg	2528.67	/uploads/pendeltuer_schloss2_adafde734e.jpeg	\N	local	\N	/	2024-11-09 12:21:11.254	2024-11-20 21:17:31.568	2024-11-09 12:21:11.264	1	1	\N
82	gbye3clovfuoicve8aewnyho	csm_mhz-plissee-4723-scarlett-detail-02_ee1abdfeab.webp	\N	\N	2048	1152	{"large": {"ext": ".webp", "url": "/uploads/large_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7.webp", "hash": "large_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7", "mime": "image/webp", "name": "large_csm_mhz-plissee-4723-scarlett-detail-02_ee1abdfeab.webp", "path": null, "size": 44.31, "width": 1000, "height": 562, "sizeInBytes": 44312}, "small": {"ext": ".webp", "url": "/uploads/small_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7.webp", "hash": "small_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7", "mime": "image/webp", "name": "small_csm_mhz-plissee-4723-scarlett-detail-02_ee1abdfeab.webp", "path": null, "size": 13.92, "width": 500, "height": 281, "sizeInBytes": 13920}, "medium": {"ext": ".webp", "url": "/uploads/medium_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7.webp", "hash": "medium_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7", "mime": "image/webp", "name": "medium_csm_mhz-plissee-4723-scarlett-detail-02_ee1abdfeab.webp", "path": null, "size": 27.4, "width": 750, "height": 422, "sizeInBytes": 27400}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7.webp", "hash": "thumbnail_csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7", "mime": "image/webp", "name": "thumbnail_csm_mhz-plissee-4723-scarlett-detail-02_ee1abdfeab.webp", "path": null, "size": 4.3, "width": 245, "height": 138, "sizeInBytes": 4298}}	csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7	.webp	image/webp	202.89	/uploads/csm_mhz_plissee_4723_scarlett_detail_02_ee1abdfeab_dc50be0ab7.webp	\N	local	\N	/	2024-11-20 21:34:02.684	2024-11-20 21:34:02.684	2024-11-20 21:34:02.685	1	1	\N
83	dywqwkvrdl0zwnrlj4ion4mp	neher_logo.jpeg	\N	\N	1746	1746	{"large": {"ext": ".jpeg", "url": "/uploads/large_neher_logo_bb36e05f1a.jpeg", "hash": "large_neher_logo_bb36e05f1a", "mime": "image/jpeg", "name": "large_neher_logo.jpeg", "path": null, "size": 61.69, "width": 1000, "height": 1000, "sizeInBytes": 61692}, "small": {"ext": ".jpeg", "url": "/uploads/small_neher_logo_bb36e05f1a.jpeg", "hash": "small_neher_logo_bb36e05f1a", "mime": "image/jpeg", "name": "small_neher_logo.jpeg", "path": null, "size": 28.45, "width": 500, "height": 500, "sizeInBytes": 28445}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_neher_logo_bb36e05f1a.jpeg", "hash": "medium_neher_logo_bb36e05f1a", "mime": "image/jpeg", "name": "medium_neher_logo.jpeg", "path": null, "size": 45.29, "width": 750, "height": 750, "sizeInBytes": 45286}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_neher_logo_bb36e05f1a.jpeg", "hash": "thumbnail_neher_logo_bb36e05f1a", "mime": "image/jpeg", "name": "thumbnail_neher_logo.jpeg", "path": null, "size": 7.01, "width": 156, "height": 156, "sizeInBytes": 7014}}	neher_logo_bb36e05f1a	.jpeg	image/jpeg	114.48	/uploads/neher_logo_bb36e05f1a.jpeg	\N	local	\N	/	2024-11-25 10:21:32.62	2024-11-25 10:21:32.62	2024-11-25 10:21:32.623	1	1	\N
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
161	53	12	api::product.product	MainImage	1
162	48	12	api::product.product	GalleryImages	1
163	53	38	api::product.product	MainImage	1
164	48	38	api::product.product	GalleryImages	1
165	63	27	api::product.product	MainImage	1
166	18	27	api::product.product	GalleryImages	1
167	65	27	api::product.product	GalleryImages	2
168	63	39	api::product.product	MainImage	1
169	18	39	api::product.product	GalleryImages	1
170	65	39	api::product.product	GalleryImages	2
175	14	7	api::product.product	MainImage	1
176	31	7	api::product.product	GalleryImages	1
177	14	41	api::product.product	MainImage	1
178	31	41	api::product.product	GalleryImages	1
185	15	19	api::product.product	MainImage	1
186	60	19	api::product.product	GalleryImages	1
187	58	19	api::product.product	GalleryImages	2
188	15	43	api::product.product	MainImage	1
189	60	43	api::product.product	GalleryImages	1
190	58	43	api::product.product	GalleryImages	2
195	80	14	api::product.product	MainImage	1
196	82	14	api::product.product	GalleryImages	1
197	81	14	api::product.product	GalleryImages	2
198	80	14	api::product.product	GalleryImages	3
199	80	45	api::product.product	MainImage	1
200	82	45	api::product.product	GalleryImages	1
201	81	45	api::product.product	GalleryImages	2
202	80	45	api::product.product	GalleryImages	3
211	4	4	api::product-category.product-category	Image	1
212	4	18	api::product-category.product-category	Image	1
239	6	1	api::welcome-section.welcome-section	Catchimage	1
240	83	1	api::welcome-section.welcome-section	NeherLogo	1
215	5	9	api::product-category.product-category	Image	1
216	5	20	api::product-category.product-category	Image	1
219	1	1	api::hero-section.hero-section	BackgroundImage	1
220	1	5	api::hero-section.hero-section	BackgroundImage	1
241	6	16	api::welcome-section.welcome-section	Catchimage	1
242	83	16	api::welcome-section.welcome-section	NeherLogo	1
59	79	3	api::file-and-resource.file-and-resource	File	1
60	79	4	api::file-and-resource.file-and-resource	File	1
61	78	1	api::file-and-resource.file-and-resource	File	1
62	78	5	api::file-and-resource.file-and-resource	File	1
89	76	23	api::product.product	MainImage	1
90	75	23	api::product.product	GalleryImages	1
91	76	24	api::product.product	MainImage	1
92	75	24	api::product.product	GalleryImages	1
171	33	29	api::product.product	MainImage	1
172	12	29	api::product.product	GalleryImages	1
141	2	1	api::product.product	MainImage	1
142	7	1	api::product.product	GalleryImages	1
143	9	1	api::product.product	GalleryImages	2
144	10	1	api::product.product	GalleryImages	3
145	2	35	api::product.product	MainImage	1
146	7	35	api::product.product	GalleryImages	1
147	9	35	api::product.product	GalleryImages	2
148	10	35	api::product.product	GalleryImages	3
173	33	40	api::product.product	MainImage	1
174	12	40	api::product.product	GalleryImages	1
179	69	16	api::product.product	MainImage	1
180	68	16	api::product.product	GalleryImages	1
181	19	16	api::product.product	GalleryImages	2
182	69	42	api::product.product	MainImage	1
155	32	25	api::product.product	MainImage	1
156	62	25	api::product.product	GalleryImages	1
157	61	25	api::product.product	GalleryImages	2
158	32	37	api::product.product	MainImage	1
159	62	37	api::product.product	GalleryImages	1
160	61	37	api::product.product	GalleryImages	2
183	68	42	api::product.product	GalleryImages	1
184	19	42	api::product.product	GalleryImages	2
191	72	21	api::product.product	MainImage	1
192	74	21	api::product.product	GalleryImages	1
193	72	44	api::product.product	MainImage	1
194	74	44	api::product.product	GalleryImages	1
203	47	3	api::product.product	MainImage	1
204	45	3	api::product.product	GalleryImages	1
205	47	46	api::product.product	MainImage	1
206	45	46	api::product.product	GalleryImages	1
209	2	1	api::product-category.product-category	Image	1
210	2	17	api::product-category.product-category	Image	1
213	3	6	api::product-category.product-category	Image	1
214	3	19	api::product-category.product-category	Image	1
\.


--
-- Data for Name: hero_sections; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.hero_sections (id, document_id, title, description, call_to_action_text, call_to_action_link, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	lp9nqi8ccb9k6nqkhuiobtas	Frische Luft genießen – Ohne lästige Störenfriede	Wählen Sie den perfekten Insektenschutz für Fenster, Türen und Lichtschächte. Schnell, individuell und ganz nach Ihren Bedürfnissen – vom Fachbetrieb in Butzbach.	Passende Lösung finden	salesfunnel	2024-11-08 22:12:10.399	2024-11-24 19:26:05.646	\N	1	1	\N
5	lp9nqi8ccb9k6nqkhuiobtas	Frische Luft genießen – Ohne lästige Störenfriede	Wählen Sie den perfekten Insektenschutz für Fenster, Türen und Lichtschächte. Schnell, individuell und ganz nach Ihren Bedürfnissen – vom Fachbetrieb in Butzbach.	Passende Lösung finden	salesfunnel	2024-11-08 22:12:10.399	2024-11-24 19:26:05.646	2024-11-24 19:26:05.682	1	1	\N
\.


--
-- Data for Name: hero_sections_cmps; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.hero_sections_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
1	1	1	features.feature-item	featureitems	1
2	1	2	features.feature-item	featureitems	2
3	1	3	features.feature-item	featureitems	3
4	1	4	features.feature-item	featureitems	4
5	1	5	features.feature-item	featureitems	5
36	5	21	features.feature-item	featureitems	1
37	5	22	features.feature-item	featureitems	2
38	5	23	features.feature-item	featureitems	3
39	5	24	features.feature-item	featureitems	4
40	5	25	features.feature-item	featureitems	5
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	dznsa5g7oneh7l9koqnsdvqv	English (en)	en	2024-11-08 22:00:25.26	2024-11-08 22:00:25.26	2024-11-08 22:00:25.261	\N	\N	\N
\.


--
-- Data for Name: impressums; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.impressums (id, document_id, company_info, representative, contact, tax_info, content_responsible, liability_disclaimer, copyright_notice, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, data_policy, agb) FROM stdin;
1	adpap32wmcivbrecklccfoq0	[{"type": "paragraph", "children": [{"text": "Tüscher Systeme  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Achim Tüscher", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "Telefon: +49 6033 920226  \\nE-Mail: info@tuescher.de\\n", "type": "link", "children": [{"text": "Telefon: +49 6033 920226  \\nE-Mail: info@tuescher.de", "type": "text"}]}, {"text": "", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Umsatzsteuer-Identifikationsnummer gemäß §27a Umsatzsteuergesetz: DE123456789", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Achim Tüscher  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Die Inhalte unserer Seiten wurden mit größter Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte können wir jedoch keine Gewähr übernehmen. Wir sind als Dienstanbieter gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Dienstanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Die auf dieser Website verwendeten Produktfotos wurden mit Genehmigung des Herstellers Neher verwendet. Alle Rechte an diesen Bildern liegen bei Neher. Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet.", "type": "text"}]}]	2024-11-25 11:19:22.591	2024-11-25 13:21:42.978	\N	1	1	\N	[{"type": "paragraph", "children": [{"text": "# Datenschutzerklärung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Einführung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir freuen uns über Ihr Interesse an unserer Website. Der Schutz Ihrer persönlichen Daten ist uns wichtig. In dieser Datenschutzerklärung informieren wir Sie über die Verarbeitung personenbezogener Daten bei der Nutzung unserer Website gemäß der Datenschutz-Grundverordnung (DSGVO).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Verantwortliche Stelle", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Verantwortlich für die Verarbeitung Ihrer personenbezogenen Daten auf dieser Website ist:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "**Tüscher Systeme**  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Telefon: +49 6033 920226  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "E-Mail: [info@tuescher.de](mailto:info@tuescher.de)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Erhebung und Speicherung personenbezogener Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Freiwillig mitgeteilte Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir erheben personenbezogene Daten nur, wenn Sie uns diese im Rahmen einer Anfrage (z. B. über das Kontaktformular) oder bei der Nutzung unserer Dienste freiwillig mitteilen. Zu den erhobenen Daten können gehören:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Name, Vorname", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Adresse", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Telefonnummer", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- E-Mail-Adresse", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Nachrichtentext", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Automatisch erfasste Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Beim Besuch unserer Website werden automatisch folgende Daten gespeichert:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- IP-Adresse", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Datum und Uhrzeit des Zugriffs", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Browsertyp und Betriebssystem", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Referrer-URL", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Aufgerufene Seiten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Diese Daten werden ausschließlich für statistische Auswertungen und zur Verbesserung der Website genutzt.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Verwendungszwecke der erhobenen Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir verwenden Ihre Daten für folgende Zwecke:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Bearbeitung und Beantwortung Ihrer Anfragen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Vertragsabwicklung und Erfüllung unserer Leistungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Optimierung unserer Website und Services", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Erfüllung rechtlicher Verpflichtungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Rechtsgrundlage der Verarbeitung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Die Verarbeitung Ihrer Daten erfolgt auf Grundlage der DSGVO:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. b DSGVO**: Erforderlich zur Erfüllung eines Vertrags", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. f DSGVO**: Wahrung unserer berechtigten Interessen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. a DSGVO**: Einwilligung durch den Nutzer", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. c DSGVO**: Erfüllung rechtlicher Verpflichtungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Verwendung von Cookies", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Unsere Website verwendet Cookies, um die Benutzerfreundlichkeit zu verbessern und bestimmte Funktionen bereitzustellen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Arten von Cookies", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Notwendige Cookies**: Erforderlich für den Betrieb der Website.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Statistik-Cookies**: Helfen uns, die Nutzung der Website zu analysieren.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Die Verwendung von Cookies erfolgt auf Grundlage Ihrer Einwilligung gemäß **Art. 6 Abs. 1 lit. a DSGVO**. Sie können Ihre Cookie-Einstellungen jederzeit über den Cookie-Manager ändern.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Weitergabe an Dritte", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Eine Weitergabe Ihrer personenbezogenen Daten an Dritte erfolgt nur, wenn:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Dies zur Vertragsabwicklung erforderlich ist (z. B. Lieferdienstleister).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Sie ausdrücklich eingewilligt haben.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Wir gesetzlich dazu verpflichtet sind.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Drittanbieter-Tools auf unserer Website", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Google Analytics**: Analyse der Website-Nutzung.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Google Maps**: Darstellung von Karten.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Speicherdauer der Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir speichern Ihre personenbezogenen Daten nur so lange, wie dies zur Erfüllung der Zwecke erforderlich ist oder wir gesetzlich dazu verpflichtet sind:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Kontaktanfragen**: Bis zur Erledigung Ihrer Anfrage.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Vertragsdaten**: 10 Jahre (gemäß steuer- und handelsrechtlicher Aufbewahrungspflichten).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Analysedaten**: 26 Monate (Google Analytics).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Rechte der Nutzer", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Sie haben folgende Rechte gemäß DSGVO:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Auskunft** (Art. 15 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Berichtigung** (Art. 16 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Löschung** (Art. 17 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Einschränkung der Verarbeitung** (Art. 18 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Datenübertragbarkeit** (Art. 20 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Widerspruchsrecht gegen die Verarbeitung** (Art. 21 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Widerruf Ihrer Einwilligung** (Art. 7 Abs. 3 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Bitte wenden Sie sich hierfür an: [info@tuescher.de](mailto:info@tuescher.de)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Datensicherheit", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Zum Schutz Ihrer Daten setzen wir technische und organisatorische Maßnahmen ein:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- SSL-/TLS-Verschlüsselung für die Übertragung von Daten.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Zugriffsbeschränkungen auf personenbezogene Daten.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Regelmäßige Sicherheitsupdates.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Schutz vor unbefugtem Zugriff durch Firewalls und Antivirensoftware.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Kontaktmöglichkeiten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Bei Fragen zur Verarbeitung Ihrer personenbezogenen Daten oder zur Ausübung Ihrer Rechte wenden Sie sich bitte an:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "**Tüscher Systeme**  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "E-Mail: [info@tuescher.de](mailto:info@tuescher.de)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Änderungen der Datenschutzerklärung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir behalten uns vor, diese Datenschutzerklärung bei Bedarf anzupassen, z. B. bei gesetzlichen Änderungen oder neuen Dienstleistungen. Die aktuelle Version finden Sie jederzeit auf unserer Website.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "# Allgemeine Geschäftsbedingungen (AGB)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 1. Geltungsbereich", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Diese Allgemeinen Geschäftsbedingungen (AGB) gelten für alle Verträge, die über unsere Website zwischen **Tüscher Systeme**, Am Bollwerk 27, 35510 Butzbach (nachfolgend \\"wir\\" oder \\"uns\\") und unseren Kunden (nachfolgend \\"Kunde\\") abgeschlossen werden. Abweichende Bedingungen des Kunden erkennen wir nur an, wenn wir ihrer Geltung ausdrücklich schriftlich zugestimmt haben.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 2. Vertragsschluss", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Die Präsentation unserer Produkte auf der Website stellt kein rechtlich bindendes Angebot dar, sondern eine unverbindliche Aufforderung zur Bestellung.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Durch das Absenden der Bestellung über unsere Website gibt der Kunde ein verbindliches Angebot zum Abschluss eines Kaufvertrags ab.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. Der Vertrag kommt zustande, wenn wir die Bestellung durch eine Auftragsbestätigung per E-Mail annehmen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 3. Preise und Zahlungsbedingungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Alle Preise verstehen sich in Euro und beinhalten die gesetzliche Mehrwertsteuer.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Gegebenenfalls anfallende Versandkosten werden im Bestellprozess gesondert ausgewiesen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. Die Zahlung erfolgt per Vorkasse, PayPal oder einer anderen angebotenen Zahlungsmethode. Wir behalten uns vor, bestimmte Zahlungsmethoden auszuschließen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 4. Lieferung und Versand", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Die Lieferung erfolgt an die vom Kunden angegebene Adresse innerhalb Deutschlands.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Die Lieferzeit wird im Bestellprozess angegeben. Sollte ein Produkt nicht rechtzeitig lieferbar sein, informieren wir den Kunden unverzüglich.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. Der Versand erfolgt auf Gefahr des Kunden, sobald die Ware an den Transportdienstleister übergeben wurde.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 5. Widerrufsrecht", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. **Widerrufsrecht für Verbraucher:** Kunden, die Verbraucher im Sinne des § 13 BGB sind, haben das Recht, den Vertrag innerhalb von 14 Tagen ohne Angabe von Gründen zu widerrufen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. **Widerrufsfrist:** Die Widerrufsfrist beträgt 14 Tage ab dem Tag, an dem der Kunde die Ware erhalten hat.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. **Widerrufsbelehrung und Rückgabe:** Zur Ausübung des Widerrufsrechts muss der Kunde uns eine eindeutige Erklärung (z. B. per E-Mail oder Brief) zukommen lassen. Die Rücksendekosten trägt der Kunde.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "4. **Ausschluss des Widerrufsrechts:** Das Widerrufsrecht gilt nicht für Produkte, die nach Kundenspezifikation angefertigt wurden oder eindeutig auf persönliche Bedürfnisse zugeschnitten sind.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 6. Eigentumsvorbehalt", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Die Ware bleibt bis zur vollständigen Zahlung des Kaufpreises unser Eigentum.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 7. Gewährleistung und Haftung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. **Gewährleistung:** Es gelten die gesetzlichen Gewährleistungsrechte.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. **Haftung:** Wir haften uneingeschränkt bei Vorsatz und grober Fahrlässigkeit. Bei leichter Fahrlässigkeit haften wir nur bei Verletzung wesentlicher Vertragspflichten (Kardinalpflichten) und beschränkt auf den vorhersehbaren Schaden.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 8. Datenschutz", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Informationen zur Erhebung, Verarbeitung und Nutzung personenbezogener Daten finden Sie in unserer [Datenschutzerklärung](https://www.tuescher.de/datenschutz).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 9. Anwendbares Recht und Gerichtsstand", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Es gilt deutsches Recht unter Ausschluss des UN-Kaufrechts.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Ist der Kunde Kaufmann, juristische Person des öffentlichen Rechts oder ein öffentlich-rechtliches Sondervermögen, ist der Gerichtsstand Butzbach.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 10. Schlussbestimmungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Sollte eine Bestimmung dieser AGB unwirksam sein, bleibt die Wirksamkeit der übrigen Bestimmungen unberührt. Anstelle der unwirksamen Bestimmung gelten die gesetzlichen Vorschriften.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "**Tüscher Systeme**  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "E-Mail: [info@tuescher.de](mailto:info@tuescher.de)  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Telefon: +49 6033 920226", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]
5	adpap32wmcivbrecklccfoq0	[{"type": "paragraph", "children": [{"text": "Tüscher Systeme  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Achim Tüscher", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "Telefon: +49 6033 920226  \\nE-Mail: info@tuescher.de\\n", "type": "link", "children": [{"text": "Telefon: +49 6033 920226  \\nE-Mail: info@tuescher.de", "type": "text"}]}, {"text": "", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Umsatzsteuer-Identifikationsnummer gemäß §27a Umsatzsteuergesetz: DE123456789", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Achim Tüscher  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Die Inhalte unserer Seiten wurden mit größter Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte können wir jedoch keine Gewähr übernehmen. Wir sind als Dienstanbieter gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Dienstanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "Die auf dieser Website verwendeten Produktfotos wurden mit Genehmigung des Herstellers Neher verwendet. Alle Rechte an diesen Bildern liegen bei Neher. Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet.", "type": "text"}]}]	2024-11-25 11:19:22.591	2024-11-25 13:21:42.978	2024-11-25 13:21:43.003	1	1	\N	[{"type": "paragraph", "children": [{"text": "# Datenschutzerklärung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Einführung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir freuen uns über Ihr Interesse an unserer Website. Der Schutz Ihrer persönlichen Daten ist uns wichtig. In dieser Datenschutzerklärung informieren wir Sie über die Verarbeitung personenbezogener Daten bei der Nutzung unserer Website gemäß der Datenschutz-Grundverordnung (DSGVO).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Verantwortliche Stelle", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Verantwortlich für die Verarbeitung Ihrer personenbezogenen Daten auf dieser Website ist:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "**Tüscher Systeme**  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Telefon: +49 6033 920226  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "E-Mail: [info@tuescher.de](mailto:info@tuescher.de)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Erhebung und Speicherung personenbezogener Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Freiwillig mitgeteilte Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir erheben personenbezogene Daten nur, wenn Sie uns diese im Rahmen einer Anfrage (z. B. über das Kontaktformular) oder bei der Nutzung unserer Dienste freiwillig mitteilen. Zu den erhobenen Daten können gehören:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Name, Vorname", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Adresse", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Telefonnummer", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- E-Mail-Adresse", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Nachrichtentext", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Automatisch erfasste Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Beim Besuch unserer Website werden automatisch folgende Daten gespeichert:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- IP-Adresse", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Datum und Uhrzeit des Zugriffs", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Browsertyp und Betriebssystem", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Referrer-URL", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Aufgerufene Seiten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Diese Daten werden ausschließlich für statistische Auswertungen und zur Verbesserung der Website genutzt.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Verwendungszwecke der erhobenen Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir verwenden Ihre Daten für folgende Zwecke:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Bearbeitung und Beantwortung Ihrer Anfragen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Vertragsabwicklung und Erfüllung unserer Leistungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Optimierung unserer Website und Services", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Erfüllung rechtlicher Verpflichtungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Rechtsgrundlage der Verarbeitung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Die Verarbeitung Ihrer Daten erfolgt auf Grundlage der DSGVO:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. b DSGVO**: Erforderlich zur Erfüllung eines Vertrags", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. f DSGVO**: Wahrung unserer berechtigten Interessen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. a DSGVO**: Einwilligung durch den Nutzer", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Art. 6 Abs. 1 lit. c DSGVO**: Erfüllung rechtlicher Verpflichtungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Verwendung von Cookies", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Unsere Website verwendet Cookies, um die Benutzerfreundlichkeit zu verbessern und bestimmte Funktionen bereitzustellen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Arten von Cookies", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Notwendige Cookies**: Erforderlich für den Betrieb der Website.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Statistik-Cookies**: Helfen uns, die Nutzung der Website zu analysieren.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Die Verwendung von Cookies erfolgt auf Grundlage Ihrer Einwilligung gemäß **Art. 6 Abs. 1 lit. a DSGVO**. Sie können Ihre Cookie-Einstellungen jederzeit über den Cookie-Manager ändern.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Weitergabe an Dritte", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Eine Weitergabe Ihrer personenbezogenen Daten an Dritte erfolgt nur, wenn:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Dies zur Vertragsabwicklung erforderlich ist (z. B. Lieferdienstleister).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Sie ausdrücklich eingewilligt haben.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Wir gesetzlich dazu verpflichtet sind.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "### Drittanbieter-Tools auf unserer Website", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Google Analytics**: Analyse der Website-Nutzung.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Google Maps**: Darstellung von Karten.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Speicherdauer der Daten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir speichern Ihre personenbezogenen Daten nur so lange, wie dies zur Erfüllung der Zwecke erforderlich ist oder wir gesetzlich dazu verpflichtet sind:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Kontaktanfragen**: Bis zur Erledigung Ihrer Anfrage.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Vertragsdaten**: 10 Jahre (gemäß steuer- und handelsrechtlicher Aufbewahrungspflichten).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Analysedaten**: 26 Monate (Google Analytics).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Rechte der Nutzer", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Sie haben folgende Rechte gemäß DSGVO:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Auskunft** (Art. 15 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Berichtigung** (Art. 16 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Löschung** (Art. 17 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Einschränkung der Verarbeitung** (Art. 18 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Datenübertragbarkeit** (Art. 20 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Widerspruchsrecht gegen die Verarbeitung** (Art. 21 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- **Recht auf Widerruf Ihrer Einwilligung** (Art. 7 Abs. 3 DSGVO)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Bitte wenden Sie sich hierfür an: [info@tuescher.de](mailto:info@tuescher.de)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Datensicherheit", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Zum Schutz Ihrer Daten setzen wir technische und organisatorische Maßnahmen ein:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- SSL-/TLS-Verschlüsselung für die Übertragung von Daten.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Zugriffsbeschränkungen auf personenbezogene Daten.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Regelmäßige Sicherheitsupdates.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "- Schutz vor unbefugtem Zugriff durch Firewalls und Antivirensoftware.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Kontaktmöglichkeiten", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Bei Fragen zur Verarbeitung Ihrer personenbezogenen Daten oder zur Ausübung Ihrer Rechte wenden Sie sich bitte an:", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "**Tüscher Systeme**  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "E-Mail: [info@tuescher.de](mailto:info@tuescher.de)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## Änderungen der Datenschutzerklärung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Wir behalten uns vor, diese Datenschutzerklärung bei Bedarf anzupassen, z. B. bei gesetzlichen Änderungen oder neuen Dienstleistungen. Die aktuelle Version finden Sie jederzeit auf unserer Website.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]	[{"type": "paragraph", "children": [{"text": "# Allgemeine Geschäftsbedingungen (AGB)", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 1. Geltungsbereich", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Diese Allgemeinen Geschäftsbedingungen (AGB) gelten für alle Verträge, die über unsere Website zwischen **Tüscher Systeme**, Am Bollwerk 27, 35510 Butzbach (nachfolgend \\"wir\\" oder \\"uns\\") und unseren Kunden (nachfolgend \\"Kunde\\") abgeschlossen werden. Abweichende Bedingungen des Kunden erkennen wir nur an, wenn wir ihrer Geltung ausdrücklich schriftlich zugestimmt haben.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 2. Vertragsschluss", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Die Präsentation unserer Produkte auf der Website stellt kein rechtlich bindendes Angebot dar, sondern eine unverbindliche Aufforderung zur Bestellung.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Durch das Absenden der Bestellung über unsere Website gibt der Kunde ein verbindliches Angebot zum Abschluss eines Kaufvertrags ab.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. Der Vertrag kommt zustande, wenn wir die Bestellung durch eine Auftragsbestätigung per E-Mail annehmen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 3. Preise und Zahlungsbedingungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Alle Preise verstehen sich in Euro und beinhalten die gesetzliche Mehrwertsteuer.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Gegebenenfalls anfallende Versandkosten werden im Bestellprozess gesondert ausgewiesen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. Die Zahlung erfolgt per Vorkasse, PayPal oder einer anderen angebotenen Zahlungsmethode. Wir behalten uns vor, bestimmte Zahlungsmethoden auszuschließen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 4. Lieferung und Versand", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Die Lieferung erfolgt an die vom Kunden angegebene Adresse innerhalb Deutschlands.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Die Lieferzeit wird im Bestellprozess angegeben. Sollte ein Produkt nicht rechtzeitig lieferbar sein, informieren wir den Kunden unverzüglich.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. Der Versand erfolgt auf Gefahr des Kunden, sobald die Ware an den Transportdienstleister übergeben wurde.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 5. Widerrufsrecht", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. **Widerrufsrecht für Verbraucher:** Kunden, die Verbraucher im Sinne des § 13 BGB sind, haben das Recht, den Vertrag innerhalb von 14 Tagen ohne Angabe von Gründen zu widerrufen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. **Widerrufsfrist:** Die Widerrufsfrist beträgt 14 Tage ab dem Tag, an dem der Kunde die Ware erhalten hat.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "3. **Widerrufsbelehrung und Rückgabe:** Zur Ausübung des Widerrufsrechts muss der Kunde uns eine eindeutige Erklärung (z. B. per E-Mail oder Brief) zukommen lassen. Die Rücksendekosten trägt der Kunde.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "4. **Ausschluss des Widerrufsrechts:** Das Widerrufsrecht gilt nicht für Produkte, die nach Kundenspezifikation angefertigt wurden oder eindeutig auf persönliche Bedürfnisse zugeschnitten sind.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 6. Eigentumsvorbehalt", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Die Ware bleibt bis zur vollständigen Zahlung des Kaufpreises unser Eigentum.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 7. Gewährleistung und Haftung", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. **Gewährleistung:** Es gelten die gesetzlichen Gewährleistungsrechte.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. **Haftung:** Wir haften uneingeschränkt bei Vorsatz und grober Fahrlässigkeit. Bei leichter Fahrlässigkeit haften wir nur bei Verletzung wesentlicher Vertragspflichten (Kardinalpflichten) und beschränkt auf den vorhersehbaren Schaden.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 8. Datenschutz", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Informationen zur Erhebung, Verarbeitung und Nutzung personenbezogener Daten finden Sie in unserer [Datenschutzerklärung](https://www.tuescher.de/datenschutz).", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 9. Anwendbares Recht und Gerichtsstand", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "1. Es gilt deutsches Recht unter Ausschluss des UN-Kaufrechts.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "2. Ist der Kunde Kaufmann, juristische Person des öffentlichen Rechts oder ein öffentlich-rechtliches Sondervermögen, ist der Gerichtsstand Butzbach.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "## 10. Schlussbestimmungen", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Sollte eine Bestimmung dieser AGB unwirksam sein, bleibt die Wirksamkeit der übrigen Bestimmungen unberührt. Anstelle der unwirksamen Bestimmung gelten die gesetzlichen Vorschriften.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "---", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "**Tüscher Systeme**  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Am Bollwerk 27  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "35510 Butzbach  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "E-Mail: [info@tuescher.de](mailto:info@tuescher.de)  ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Telefon: +49 6033 920226", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.product_categories (id, document_id, title, description, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, "order", short_description) FROM stdin;
19	jd1aw60eduykm8w590fheqsw	Lichtschachtabdeckungen	Halte deinen Lichtschacht sauber und insektenfrei mit den robusten und bruchfesten Lichtschachtabdeckungen von Neher. Erfahre mehr über die verschiedenen Varianten und schaffe eine saubere Umgebung rund um dein Haus!	insektenschutz-fuer-lichtschachtabdeckungen	2024-11-08 22:20:56.12	2024-11-24 00:50:48.121	2024-11-24 00:50:48.156	1	1	\N	3	Hochwertiger Schutz vor Schmutz, Laub und Kleintieren für Ihren Lichtschacht.
9	djd5cjssbwf4eakx37y6p0gl	 Sicht- und Sonnenschutz	Plissees nach Maß von MHZ – Entdecke hochwertige Plissees nach Maß, die perfekte Lösung zur Lichtregulierung und zum Schutz deiner Privatsphäre.	sicht-und-sonnenschutz	2024-11-08 22:22:00.025	2024-11-24 00:51:45.537	\N	1	1	\N	4	Stilvolle und funktionale Plissees für optimalen Sonnen- und Sichtschutz – maßgeschneidert für jeden Wohnraum.
20	djd5cjssbwf4eakx37y6p0gl	 Sicht- und Sonnenschutz	Plissees nach Maß von MHZ – Entdecke hochwertige Plissees nach Maß, die perfekte Lösung zur Lichtregulierung und zum Schutz deiner Privatsphäre.	sicht-und-sonnenschutz	2024-11-08 22:22:00.025	2024-11-24 00:51:45.537	2024-11-24 00:51:45.568	1	1	\N	4	Stilvolle und funktionale Plissees für optimalen Sonnen- und Sichtschutz – maßgeschneidert für jeden Wohnraum.
1	c53epip4t8kb6dts1lpkybzq	 Insektenschutz für Fenster	Mit unseren Lösungen für den Insektenschutz von Fenstern bist du flexibel und effektiv geschützt. Entdecke jetzt unsere innovativen und technisch ausgereiften Lösungen für einen insektenfreien Sommer!	insektenschutz-fuer-fenster	2024-11-08 22:19:45.832	2024-11-24 00:50:21.423	\N	1	1	\N	1	Effektive und flexible Schutzlösungen für Fenster jeder Art und Größe.
17	c53epip4t8kb6dts1lpkybzq	 Insektenschutz für Fenster	Mit unseren Lösungen für den Insektenschutz von Fenstern bist du flexibel und effektiv geschützt. Entdecke jetzt unsere innovativen und technisch ausgereiften Lösungen für einen insektenfreien Sommer!	insektenschutz-fuer-fenster	2024-11-08 22:19:45.832	2024-11-24 00:50:21.423	2024-11-24 00:50:21.616	1	1	\N	1	Effektive und flexible Schutzlösungen für Fenster jeder Art und Größe.
4	o091etkco7vn29dba1s2cou5	Insektenschutz für Türen	Genieße das Leben in den eigenen vier Wänden ohne Insekten. Erfahre mehr über unsere maßgefertigten Insektenschutzgitter für Balkon- und Terrassentüren und finde die perfekte Lösung für deine Bedürfnisse!	insektenschutz-fuer-tueren	2024-11-08 22:20:09.088	2024-11-24 00:50:33.135	\N	1	1	\N	2	Innovative und praktische Systeme für Türen – funktional und stilvoll.
18	o091etkco7vn29dba1s2cou5	Insektenschutz für Türen	Genieße das Leben in den eigenen vier Wänden ohne Insekten. Erfahre mehr über unsere maßgefertigten Insektenschutzgitter für Balkon- und Terrassentüren und finde die perfekte Lösung für deine Bedürfnisse!	insektenschutz-fuer-tueren	2024-11-08 22:20:09.088	2024-11-24 00:50:33.135	2024-11-24 00:50:33.176	1	1	\N	2	Innovative und praktische Systeme für Türen – funktional und stilvoll.
6	jd1aw60eduykm8w590fheqsw	Lichtschachtabdeckungen	Halte deinen Lichtschacht sauber und insektenfrei mit den robusten und bruchfesten Lichtschachtabdeckungen von Neher. Erfahre mehr über die verschiedenen Varianten und schaffe eine saubere Umgebung rund um dein Haus!	insektenschutz-fuer-lichtschachtabdeckungen	2024-11-08 22:20:56.12	2024-11-24 00:50:48.121	\N	1	1	\N	3	Hochwertiger Schutz vor Schmutz, Laub und Kleintieren für Ihren Lichtschacht.
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.products (id, document_id, name, short_description, detailed_description, features, cta_link, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, "order") FROM stdin;
1	dtkbg0jutn9lm8fajav2gyz5	Spannrahmen	Die einfache und perfekte Lösung für alle Fensterarten	Unsere Spannrahmen bieten eine flexible und effektive Möglichkeit, um Insekten fernzuhalten. Mit über 100 verschiedenen Einbauvarianten können sie an fast allen Fenstern angebracht werden, unabhängig von Material und Art. Das Millimeter-Raster sorgt für einen perfekten Sitz, während die einfache Bedienung und hohe Ausfallsicherheit durch Federung für zusätzlichen Komfort sorgen.	["Über 100 Einbauvarianten", "Perfekter Sitz durch Millimeter-Raster", "Einfache Bedienung und hohe Ausfallsicherheit"]	Angebot anfragen!	2024-11-09 12:18:24.727	2024-11-22 17:31:02.343	\N	1	1	\N	1
12	w470u29f9aezg6sllsp3lstb	LiSA	Lückenloser Schutz für jeden Lichtschacht mit stabiler Konstruktion und perfekter Passform.	 LiSA ist die ideale Lösung für einen lückenlosen Schutz Ihres Lichtschachts. Die Konstruktion aus hochwertigen Aluminiumprofilen und formstabilem Edelstahlgewebe bietet höchste Stabilität und Sicherheit. Die flache Bauweise mit umlaufender Bürstendichtung sorgt für eine perfekte Passform und schützt effektiv vor Schmutz, Laub und kleinen Tieren.	["Höchste Stabilität durch Aluminiumprofile und formstabiles Edelstahlgewebe", "Flache Konstruktion mit umlaufender Bürstendichtung", "Perfekte Passform für höchste Sicherheit"]	Mehr erfahren	2024-11-09 12:46:58.414	2024-11-22 17:32:37.589	\N	1	1	\N	3
7	wr4ls3mcjcg6igbhrw4nmql1	Drehtüren	Klassischer Insektenschutz für Türen mit einfachem Öffnungsmechanismus und hoher Zuverlässigkeit.	Unsere Drehtüren sind die klassische Lösung für den Insektenschutz an Türen. Sie bieten eine einfache Handhabung und eine stabile Konstruktion. Erhältlich in verschiedenen Größen und Ausführungen, passen sie sich optimal an Ihre individuellen Anforderungen an.	["Hohe Stabilität trotz geringer Einbautiefe", "Flexible Montageoptionen", "Speziell entwickelte Bogenkonturprofile"]	Mehr erfahren	2024-11-09 12:32:01.639	2024-11-22 17:33:19.56	\N	1	1	\N	6
3	zfemffkpzbh33exczjzmh0nx	Drehrahmen	Ideal für Fenster, die häufig geöffnet und geschlossen werden. Stabiler Insektenschutz mit flexiblen Einbaumöglichkeiten.	Unsere Drehrahmen bieten einen stabilen und bequemen Schutz vor Insekten. Sie sind die perfekte Lösung für Fenster, die häufig genutzt werden. Die Installation ist flexibel und kann sowohl nach innen als auch nach außen erfolgen. Robuste Bogenkonturprofile und einstellbare 2-Punkt-Scharniere aus Metall sorgen für hohe Stabilität bei geringer Einbautiefe.	["Hohe Stabilität trotz geringer Einbautiefe", "Flexible Montageoptionen", "Speziell entwickelte Bogenkonturprofile"]	Mehr erfahren	2024-11-09 12:28:58.274	2024-11-22 17:48:21.673	\N	1	1	\N	11
23	wjv0p9gem5jd0kqe9iasx38m	Elektrorollos	Einfache Steuerung per Knopfdruck	Einfache Steuerung per Knopfdruck\nKein manuelles Öffnen oder Schließen notwendig\nElegantes und unauffälliges Design\nVerschiedene Farben und Materialien erhältlich	["Kein manuelles Öffnen oder Schließen notwendig", "Elegantes und unauffälliges Design", "Verschiedene Farben und Materialien erhältlich"]	Mehr erfahren!	2024-11-20 21:23:09.276	2024-11-20 21:23:09.276	\N	1	1	\N	\N
24	wjv0p9gem5jd0kqe9iasx38m	Elektrorollos	Einfache Steuerung per Knopfdruck	Einfache Steuerung per Knopfdruck\nKein manuelles Öffnen oder Schließen notwendig\nElegantes und unauffälliges Design\nVerschiedene Farben und Materialien erhältlich	["Kein manuelles Öffnen oder Schließen notwendig", "Elegantes und unauffälliges Design", "Verschiedene Farben und Materialien erhältlich"]	Mehr erfahren!	2024-11-20 21:23:09.276	2024-11-20 21:23:09.276	2024-11-20 21:23:09.302	1	1	\N	\N
16	r3tl28moa7xapjf1kuyy38sd	Schiebeanlagen	Perfekte Lösung für große Türöffnungen und den nahtlosen Übergang zwischen Innen- und Außenbereich	Einfache Handhabung und geräuscharme Laufrollen für höchsten Bedienkomfort.\nMaßgesfertigte Anfertigung für perfekte Passform und optimalen Insektenschutz.\nHochwertige Materialien und Verarbeitung für eine lange Lebensdauer.	\N	Mehr erfahren!	2024-11-20 21:14:35.34	2024-11-22 17:47:12.093	\N	1	1	\N	7
19	evprezu9nj7rnr1x8v0v7bwx	Pendeltüren	Innovative Lösung für eine bequeme und barrierefreie Durchgangsmöglichkeit	Innovative Lösung für eine bequeme und barrierefreie Durchgangsmöglichkeit\nEinfach zu öffnen und zu schließen dank automatischer Rückstellfunktion\nIndividuelle Anfertigung für eine perfekte Passform und maximalen Insektenschutz\nHochwertige Materialien und Verarbeitung für eine lange Lebensdauer	["Einfach zu öffnen und zu schließen dank automatischer Rückstellfunktion", "Individuelle Anfertigung für eine perfekte Passform und maximalen Insektenschutz", "Hochwertige Materialien und Verarbeitung für eine lange Lebensdauer"]	\N	2024-11-20 21:18:22.234	2024-11-22 17:47:25.294	\N	1	1	\N	8
14	hhk0j6a16s7b8we5n7xnrknq	Plissees	Die einfache und perfekte Lösung für den Sicht- und Sonnenschutz	Die einfache und perfekte Lösung für den Sicht- und Sonnenschutz\nDie einfache und perfekte Lösung für den Sicht- und Sonnenschutz\nDie einfache und perfekte Lösung für den Sicht- und Sonnenschutz	["Sichtschutz für jedes Fenster", "Sonnenschutz, zum  abdunkeln", "Top Qualität und Stoffe"]	Mehr erfahren	2024-11-09 16:08:38.401	2024-11-22 17:47:59.126	\N	1	1	\N	10
21	cqfxhsglryaonze0857grwop	Insektenschutz-Plissee	Maßgeschneiderter Plissees Insektenschutz für Durchgänge jeder Größe und Form	Maßgeschneidert für Durchgänge jeder Größe und Form\nEinfache Montage und Bedienung\nPlatzsparend und unauffällig durch filigrane Konstruktion\nIndividuelle Farbauswahl für harmonische Integration in jede Wohnsituation	["Einfache Montage und Bedienung", "Platzsparend und unauffällig durch filigrane Konstruktion", "Individuelle Farbauswahl für harmonische Integration in jede Wohnsituation"]	Mehr erfahren!	2024-11-20 21:21:27.061	2024-11-22 17:47:38.587	\N	1	1	\N	9
29	yt8hinzy0gix1m7r9qxlib5u	ELSA	Der perfekte fast bodenbündige Schutz für den Lichtschacht ohne Stolpergefahr!	Zuverlässiger Schutz vor Laub, Schmutz und Kleintieren\nGeeignet für alle Lichtschächte aus Kunststoff oder Beton\nHöchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl oder Streckmetall	["Zuverlässiger Schutz vor Laub, Schmutz und Kleintieren", "Geeignet für alle Lichtschächte aus Kunststoff oder Beton", "Höchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl oder Streckmetall"]	Mehr erfahren!	2024-11-20 21:29:33.243	2024-11-22 17:33:00.854	\N	1	1	\N	5
35	dtkbg0jutn9lm8fajav2gyz5	Spannrahmen	Die einfache und perfekte Lösung für alle Fensterarten	Unsere Spannrahmen bieten eine flexible und effektive Möglichkeit, um Insekten fernzuhalten. Mit über 100 verschiedenen Einbauvarianten können sie an fast allen Fenstern angebracht werden, unabhängig von Material und Art. Das Millimeter-Raster sorgt für einen perfekten Sitz, während die einfache Bedienung und hohe Ausfallsicherheit durch Federung für zusätzlichen Komfort sorgen.	["Über 100 Einbauvarianten", "Perfekter Sitz durch Millimeter-Raster", "Einfache Bedienung und hohe Ausfallsicherheit"]	Angebot anfragen!	2024-11-09 12:18:24.727	2024-11-22 17:31:02.343	2024-11-22 17:31:02.372	1	1	\N	1
38	w470u29f9aezg6sllsp3lstb	LiSA	Lückenloser Schutz für jeden Lichtschacht mit stabiler Konstruktion und perfekter Passform.	 LiSA ist die ideale Lösung für einen lückenlosen Schutz Ihres Lichtschachts. Die Konstruktion aus hochwertigen Aluminiumprofilen und formstabilem Edelstahlgewebe bietet höchste Stabilität und Sicherheit. Die flache Bauweise mit umlaufender Bürstendichtung sorgt für eine perfekte Passform und schützt effektiv vor Schmutz, Laub und kleinen Tieren.	["Höchste Stabilität durch Aluminiumprofile und formstabiles Edelstahlgewebe", "Flache Konstruktion mit umlaufender Bürstendichtung", "Perfekte Passform für höchste Sicherheit"]	Mehr erfahren	2024-11-09 12:46:58.414	2024-11-22 17:32:37.589	2024-11-22 17:32:37.612	1	1	\N	3
25	k7fjg8oqx42qcod122qu139c	 Fliegengitter Rollo	Das Fliegengitter Rollo ist die perfekte platzsparende Variante - ideal für Dachfenster oder Fenster die häufig genutzt werden.	Unsere Rollos sind die perfekte Wahl für flexiblen Insektenschutz, der bei Bedarf genutzt werden kann. Sie verfügen über seitliche Bürstenführungen, die selbst bei starkem Wind für sicheren Halt sorgen. Die höhenverstellbare Welle und die Abrollkante gewährleisten ein permanent straffes Gewebe. Eine integrierte Bremse sorgt für eine einfache und sichere Bedienung.	["Elegantes Auf- und Zurollen des Fliegengitters", "Flexible Montageoptionen", "Stabile FÜhrung des Gitters"]	Mehr erfahren!	2024-11-20 21:26:37.202	2024-11-22 17:32:14.398	\N	1	1	\N	2
37	k7fjg8oqx42qcod122qu139c	 Fliegengitter Rollo	Das Fliegengitter Rollo ist die perfekte platzsparende Variante - ideal für Dachfenster oder Fenster die häufig genutzt werden.	Unsere Rollos sind die perfekte Wahl für flexiblen Insektenschutz, der bei Bedarf genutzt werden kann. Sie verfügen über seitliche Bürstenführungen, die selbst bei starkem Wind für sicheren Halt sorgen. Die höhenverstellbare Welle und die Abrollkante gewährleisten ein permanent straffes Gewebe. Eine integrierte Bremse sorgt für eine einfache und sichere Bedienung.	["Elegantes Auf- und Zurollen des Fliegengitters", "Flexible Montageoptionen", "Stabile FÜhrung des Gitters"]	Mehr erfahren!	2024-11-20 21:26:37.202	2024-11-22 17:32:14.398	2024-11-22 17:32:14.427	1	1	\N	2
27	xnclh9kkf51ilxod81oif0dg	RESI	Optimaler Regenschutz durch hochtransparente Polycarbonatplatte	Optimaler Regenschutz durch hochtransparente Polycarbonatplatte\nEinfache Reinigung durch auswechselbares Edelstahlgewebe\nHöchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl	["Optimaler Regenschutz durch hochtransparente Polycarbonatplatte", "Einfache Reinigung durch auswechselbares Edelstahlgewebe", "Höchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl"]	Mehr erfahren!	2024-11-20 21:27:42.928	2024-11-22 17:32:51.135	\N	1	1	\N	4
39	xnclh9kkf51ilxod81oif0dg	RESI	Optimaler Regenschutz durch hochtransparente Polycarbonatplatte	Optimaler Regenschutz durch hochtransparente Polycarbonatplatte\nEinfache Reinigung durch auswechselbares Edelstahlgewebe\nHöchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl	["Optimaler Regenschutz durch hochtransparente Polycarbonatplatte", "Einfache Reinigung durch auswechselbares Edelstahlgewebe", "Höchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl"]	Mehr erfahren!	2024-11-20 21:27:42.928	2024-11-22 17:32:51.135	2024-11-22 17:32:51.163	1	1	\N	4
40	yt8hinzy0gix1m7r9qxlib5u	ELSA	Der perfekte fast bodenbündige Schutz für den Lichtschacht ohne Stolpergefahr!	Zuverlässiger Schutz vor Laub, Schmutz und Kleintieren\nGeeignet für alle Lichtschächte aus Kunststoff oder Beton\nHöchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl oder Streckmetall	["Zuverlässiger Schutz vor Laub, Schmutz und Kleintieren", "Geeignet für alle Lichtschächte aus Kunststoff oder Beton", "Höchste Stabilität durch Aluminiumprofile und formstabiles Gewebe aus Edelstahl oder Streckmetall"]	Mehr erfahren!	2024-11-20 21:29:33.243	2024-11-22 17:33:00.854	2024-11-22 17:33:00.879	1	1	\N	5
41	wr4ls3mcjcg6igbhrw4nmql1	Drehtüren	Klassischer Insektenschutz für Türen mit einfachem Öffnungsmechanismus und hoher Zuverlässigkeit.	Unsere Drehtüren sind die klassische Lösung für den Insektenschutz an Türen. Sie bieten eine einfache Handhabung und eine stabile Konstruktion. Erhältlich in verschiedenen Größen und Ausführungen, passen sie sich optimal an Ihre individuellen Anforderungen an.	["Hohe Stabilität trotz geringer Einbautiefe", "Flexible Montageoptionen", "Speziell entwickelte Bogenkonturprofile"]	Mehr erfahren	2024-11-09 12:32:01.639	2024-11-22 17:33:19.56	2024-11-22 17:33:19.585	1	1	\N	6
42	r3tl28moa7xapjf1kuyy38sd	Schiebeanlagen	Perfekte Lösung für große Türöffnungen und den nahtlosen Übergang zwischen Innen- und Außenbereich	Einfache Handhabung und geräuscharme Laufrollen für höchsten Bedienkomfort.\nMaßgesfertigte Anfertigung für perfekte Passform und optimalen Insektenschutz.\nHochwertige Materialien und Verarbeitung für eine lange Lebensdauer.	\N	Mehr erfahren!	2024-11-20 21:14:35.34	2024-11-22 17:47:12.093	2024-11-22 17:47:12.137	1	1	\N	7
43	evprezu9nj7rnr1x8v0v7bwx	Pendeltüren	Innovative Lösung für eine bequeme und barrierefreie Durchgangsmöglichkeit	Innovative Lösung für eine bequeme und barrierefreie Durchgangsmöglichkeit\nEinfach zu öffnen und zu schließen dank automatischer Rückstellfunktion\nIndividuelle Anfertigung für eine perfekte Passform und maximalen Insektenschutz\nHochwertige Materialien und Verarbeitung für eine lange Lebensdauer	["Einfach zu öffnen und zu schließen dank automatischer Rückstellfunktion", "Individuelle Anfertigung für eine perfekte Passform und maximalen Insektenschutz", "Hochwertige Materialien und Verarbeitung für eine lange Lebensdauer"]	\N	2024-11-20 21:18:22.234	2024-11-22 17:47:25.294	2024-11-22 17:47:25.324	1	1	\N	8
44	cqfxhsglryaonze0857grwop	Insektenschutz-Plissee	Maßgeschneiderter Plissees Insektenschutz für Durchgänge jeder Größe und Form	Maßgeschneidert für Durchgänge jeder Größe und Form\nEinfache Montage und Bedienung\nPlatzsparend und unauffällig durch filigrane Konstruktion\nIndividuelle Farbauswahl für harmonische Integration in jede Wohnsituation	["Einfache Montage und Bedienung", "Platzsparend und unauffällig durch filigrane Konstruktion", "Individuelle Farbauswahl für harmonische Integration in jede Wohnsituation"]	Mehr erfahren!	2024-11-20 21:21:27.061	2024-11-22 17:47:38.587	2024-11-22 17:47:38.613	1	1	\N	9
45	hhk0j6a16s7b8we5n7xnrknq	Plissees	Die einfache und perfekte Lösung für den Sicht- und Sonnenschutz	Die einfache und perfekte Lösung für den Sicht- und Sonnenschutz\nDie einfache und perfekte Lösung für den Sicht- und Sonnenschutz\nDie einfache und perfekte Lösung für den Sicht- und Sonnenschutz	["Sichtschutz für jedes Fenster", "Sonnenschutz, zum  abdunkeln", "Top Qualität und Stoffe"]	Mehr erfahren	2024-11-09 16:08:38.401	2024-11-22 17:47:59.126	2024-11-22 17:47:59.158	1	1	\N	10
46	zfemffkpzbh33exczjzmh0nx	Drehrahmen	Ideal für Fenster, die häufig geöffnet und geschlossen werden. Stabiler Insektenschutz mit flexiblen Einbaumöglichkeiten.	Unsere Drehrahmen bieten einen stabilen und bequemen Schutz vor Insekten. Sie sind die perfekte Lösung für Fenster, die häufig genutzt werden. Die Installation ist flexibel und kann sowohl nach innen als auch nach außen erfolgen. Robuste Bogenkonturprofile und einstellbare 2-Punkt-Scharniere aus Metall sorgen für hohe Stabilität bei geringer Einbautiefe.	["Hohe Stabilität trotz geringer Einbautiefe", "Flexible Montageoptionen", "Speziell entwickelte Bogenkonturprofile"]	Mehr erfahren	2024-11-09 12:28:58.274	2024-11-22 17:48:21.673	2024-11-22 17:48:21.704	1	1	\N	11
\.


--
-- Data for Name: products_product_category_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.products_product_category_lnk (id, product_id, product_category_id, product_ord) FROM stdin;
1	1	1	1
5	7	4	1
8	12	6	1
10	14	9	1
12	16	4	2
14	19	4	3
16	21	4	4
18	23	4	5
20	25	1	3
22	29	6	2
24	27	6	3
56	3	1	4
61	35	17	1
62	37	17	2
63	46	17	3
64	41	18	1
65	42	18	2
66	43	18	3
67	44	18	4
68	24	18	5
69	38	19	1
70	40	19	2
71	39	19	3
72	45	20	1
\.


--
-- Data for Name: sales_inquiries; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.sales_inquiries (id, document_id, products, budget, timeline, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, age, gender, location, household_size, specific_requirements, customization_needs, pain_points, preferred_features, living_situation) FROM stdin;
111	u6uvk3y90syfmry643f0gnxa	[{"name": "Spannrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}, {"name": "Pendeltüren", "category": "Insektenschutz für Türen", "quantity": 2}, {"name": "RESI", "category": "Lichtschachtabdeckungen", "quantity": 2}, {"name": "Plissees", "category": " Sicht- und Sonnenschutz", "quantity": 1}]	7000	one_month	2024-11-25 08:33:08.658	2024-11-25 08:33:08.658	\N	\N	\N	\N	\N	\N	Butzbach	4	Katzenschutz	["Maßgeschneiderte Lösungen", "Individuelle Farben"]	Rolladen sehr nah 	["Nachhaltigkeit", "Langlebigkeit", "Energieeffizienz"]	Mietwohnung
112	u6uvk3y90syfmry643f0gnxa	[{"name": "Spannrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}, {"name": "Pendeltüren", "category": "Insektenschutz für Türen", "quantity": 2}, {"name": "RESI", "category": "Lichtschachtabdeckungen", "quantity": 2}, {"name": "Plissees", "category": " Sicht- und Sonnenschutz", "quantity": 1}]	7000	one_month	2024-11-25 08:33:08.658	2024-11-25 08:33:08.658	2024-11-25 08:33:08.665	\N	\N	\N	\N	\N	Butzbach	4	Katzenschutz	["Maßgeschneiderte Lösungen", "Individuelle Farben"]	Rolladen sehr nah 	["Nachhaltigkeit", "Langlebigkeit", "Energieeffizienz"]	Mietwohnung
113	te8g85u2urggl0oma4fs4e1b	[{"name": "Drehrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}, {"name": "Elektrorollos", "category": "Insektenschutz für Türen", "quantity": 1}, {"name": "LiSA", "category": "Lichtschachtabdeckungen", "quantity": 1}]	5000	one_month	2024-11-25 09:55:05.732	2024-11-25 09:55:05.732	\N	\N	\N	\N	\N	\N	Butzbach	4	\N	["Spezielle Größen"]	\N	["Langlebigkeit"]	Gewerbe
114	te8g85u2urggl0oma4fs4e1b	[{"name": "Drehrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}, {"name": "Elektrorollos", "category": "Insektenschutz für Türen", "quantity": 1}, {"name": "LiSA", "category": "Lichtschachtabdeckungen", "quantity": 1}]	5000	one_month	2024-11-25 09:55:05.732	2024-11-25 09:55:05.732	2024-11-25 09:55:05.76	\N	\N	\N	\N	\N	Butzbach	4	\N	["Spezielle Größen"]	\N	["Langlebigkeit"]	Gewerbe
115	l8bb3og0o7054swddlrmfws5	[{"name": "Spannrahmen", "category": " Insektenschutz für Fenster", "quantity": 2}, {"name": "Drehrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}]	8000	one_month	2024-11-25 17:19:12.432	2024-11-25 17:19:12.432	\N	\N	\N	\N	\N	\N	\N	4	nichts	["Sonderanfertigungen", "Individuelle Farben"]	nichts	["Langlebigkeit", "Energieeffizienz"]	Mietwohnung
116	l8bb3og0o7054swddlrmfws5	[{"name": "Spannrahmen", "category": " Insektenschutz für Fenster", "quantity": 2}, {"name": "Drehrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}]	8000	one_month	2024-11-25 17:19:12.432	2024-11-25 17:19:12.432	2024-11-25 17:19:12.476	\N	\N	\N	\N	\N	\N	4	nichts	["Sonderanfertigungen", "Individuelle Farben"]	nichts	["Langlebigkeit", "Energieeffizienz"]	Mietwohnung
117	kf0qjbknr7mwppmfj0qfpsjv	[{"name": "Spannrahmen", "category": " Insektenschutz für Fenster", "quantity": 2}, {"name": "Drehrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}]	8000	one_month	2024-11-25 17:22:05.127	2024-11-25 17:22:05.127	\N	\N	\N	\N	\N	\N	35510 Butzbach	4	nichts	["Sonderanfertigungen", "Individuelle Farben"]	nichts	["Langlebigkeit", "Energieeffizienz"]	Mietwohnung
118	kf0qjbknr7mwppmfj0qfpsjv	[{"name": "Spannrahmen", "category": " Insektenschutz für Fenster", "quantity": 2}, {"name": "Drehrahmen", "category": " Insektenschutz für Fenster", "quantity": 1}]	8000	one_month	2024-11-25 17:22:05.127	2024-11-25 17:22:05.127	2024-11-25 17:22:05.142	\N	\N	\N	\N	\N	35510 Butzbach	4	nichts	["Sonderanfertigungen", "Individuelle Farben"]	nichts	["Langlebigkeit", "Energieeffizienz"]	Mietwohnung
\.


--
-- Data for Name: sales_inquiries_contact_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.sales_inquiries_contact_lnk (id, sales_inquiry_id, contact_form_id) FROM stdin;
115	111	130
116	112	130
117	113	132
118	114	132
119	115	134
120	116	134
121	117	136
122	118	136
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	jnit1ypq4rttnd0lm0fpbrf2	STRAPI_API_TOKEN		full-access	873fb491e229d4a6ff66da27729fe8125c1c007667f8c3c45b78092b9faffc96bb574d04269dab69404dc38821af65d5b6ed6112879676e85b1267ede572b316	\N	\N	\N	2024-11-08 22:13:17.013	2024-11-08 22:13:20.38	2024-11-08 22:13:17.014	\N	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
3	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","createdAt"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
1	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::contact-form.contact-form":{"kind":"collectionType","collectionName":"contact_forms","info":{"singularName":"contact-form","pluralName":"contact-forms","displayName":"Contact Form","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"email":{"type":"email"},"phone":{"type":"string"},"message":{"type":"text"},"privacy":{"type":"boolean"},"newsletter":{"type":"boolean"},"company":{"type":"string"},"wantContact":{"type":"boolean"},"method":{"type":"enumeration","enum":["phone","email"]},"time":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::contact-form.contact-form","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"contact_forms"}}},"apiName":"contact-form","globalId":"ContactForm","uid":"api::contact-form.contact-form","modelType":"contentType","__schema__":{"collectionName":"contact_forms","info":{"singularName":"contact-form","pluralName":"contact-forms","displayName":"Contact Form","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"email":{"type":"email"},"phone":{"type":"string"},"message":{"type":"text"},"privacy":{"type":"boolean"},"newsletter":{"type":"boolean"},"company":{"type":"string"},"wantContact":{"type":"boolean"},"method":{"type":"enumeration","enum":["phone","email"]},"time":{"type":"string"}},"kind":"collectionType"},"modelName":"contact-form","actions":{},"lifecycles":{}},"api::contactsection.contactsection":{"kind":"singleType","collectionName":"contactsections","info":{"singularName":"contactsection","pluralName":"contactsections","displayName":"contactsection","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"subtitle":{"type":"string"},"address":{"type":"component","repeatable":false,"component":"contactaddress.contactaddress"},"contact_form":{"type":"component","repeatable":false,"component":"contactaddress.contactformsettings"},"CTAText":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::contactsection.contactsection","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"contactsections"}}},"apiName":"contactsection","globalId":"Contactsection","uid":"api::contactsection.contactsection","modelType":"contentType","__schema__":{"collectionName":"contactsections","info":{"singularName":"contactsection","pluralName":"contactsections","displayName":"contactsection","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"subtitle":{"type":"string"},"address":{"type":"component","repeatable":false,"component":"contactaddress.contactaddress"},"contact_form":{"type":"component","repeatable":false,"component":"contactaddress.contactformsettings"},"CTAText":{"type":"string"}},"kind":"singleType"},"modelName":"contactsection","actions":{},"lifecycles":{}},"api::faq.faq":{"kind":"collectionType","collectionName":"faqs","info":{"singularName":"faq","pluralName":"faqs","displayName":"FAQ","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Question":{"type":"text"},"Answer":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::faq.faq","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"faqs"}}},"apiName":"faq","globalId":"Faq","uid":"api::faq.faq","modelType":"contentType","__schema__":{"collectionName":"faqs","info":{"singularName":"faq","pluralName":"faqs","displayName":"FAQ","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Question":{"type":"text"},"Answer":{"type":"text"}},"kind":"collectionType"},"modelName":"faq","actions":{},"lifecycles":{}},"api::file-and-resource.file-and-resource":{"kind":"collectionType","collectionName":"file_and_resources","info":{"singularName":"file-and-resource","pluralName":"file-and-resources","displayName":"File & Resource"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"File":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"FileType":{"type":"string"},"Size":{"type":"decimal"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::file-and-resource.file-and-resource","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"file_and_resources"}}},"apiName":"file-and-resource","globalId":"FileAndResource","uid":"api::file-and-resource.file-and-resource","modelType":"contentType","__schema__":{"collectionName":"file_and_resources","info":{"singularName":"file-and-resource","pluralName":"file-and-resources","displayName":"File & Resource"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"File":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"FileType":{"type":"string"},"Size":{"type":"decimal"}},"kind":"collectionType"},"modelName":"file-and-resource","actions":{},"lifecycles":{}},"api::hero-section.hero-section":{"kind":"singleType","collectionName":"hero_sections","info":{"singularName":"hero-section","pluralName":"hero-sections","displayName":"Hero Section","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Description":{"type":"text"},"CallToActionText":{"type":"string"},"CallToActionLink":{"type":"string"},"BackgroundImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"featureitems":{"type":"component","repeatable":true,"component":"features.feature-item"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::hero-section.hero-section","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"hero_sections"}}},"apiName":"hero-section","globalId":"HeroSection","uid":"api::hero-section.hero-section","modelType":"contentType","__schema__":{"collectionName":"hero_sections","info":{"singularName":"hero-section","pluralName":"hero-sections","displayName":"Hero Section","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Description":{"type":"text"},"CallToActionText":{"type":"string"},"CallToActionLink":{"type":"string"},"BackgroundImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"featureitems":{"type":"component","repeatable":true,"component":"features.feature-item"}},"kind":"singleType"},"modelName":"hero-section","actions":{},"lifecycles":{}},"api::impressum.impressum":{"kind":"singleType","collectionName":"impressums","info":{"singularName":"impressum","pluralName":"impressums","displayName":"Impressum","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"company_info":{"type":"blocks"},"representative":{"type":"blocks"},"contact":{"type":"blocks"},"tax_info":{"type":"blocks"},"content_responsible":{"type":"blocks"},"liability_disclaimer":{"type":"blocks"},"copyright_notice":{"type":"blocks"},"data_policy":{"type":"blocks"},"agb":{"type":"blocks"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::impressum.impressum","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"impressums"}}},"apiName":"impressum","globalId":"Impressum","uid":"api::impressum.impressum","modelType":"contentType","__schema__":{"collectionName":"impressums","info":{"singularName":"impressum","pluralName":"impressums","displayName":"Impressum","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"company_info":{"type":"blocks"},"representative":{"type":"blocks"},"contact":{"type":"blocks"},"tax_info":{"type":"blocks"},"content_responsible":{"type":"blocks"},"liability_disclaimer":{"type":"blocks"},"copyright_notice":{"type":"blocks"},"data_policy":{"type":"blocks"},"agb":{"type":"blocks"}},"kind":"singleType"},"modelName":"impressum","actions":{},"lifecycles":{}},"api::product.product":{"kind":"collectionType","collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Name":{"type":"string"},"MainImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"GalleryImages":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"ShortDescription":{"type":"string"},"DetailedDescription":{"type":"richtext"},"Features":{"type":"json"},"CTALink":{"type":"string"},"product_category":{"type":"relation","relation":"manyToOne","target":"api::product-category.product-category","inversedBy":"products"},"Order":{"type":"integer","required":true,"unique":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::product.product","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"products"}}},"apiName":"product","globalId":"Product","uid":"api::product.product","modelType":"contentType","__schema__":{"collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Name":{"type":"string"},"MainImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"GalleryImages":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"ShortDescription":{"type":"string"},"DetailedDescription":{"type":"richtext"},"Features":{"type":"json"},"CTALink":{"type":"string"},"product_category":{"type":"relation","relation":"manyToOne","target":"api::product-category.product-category","inversedBy":"products"},"Order":{"type":"integer","required":true,"unique":true}},"kind":"collectionType"},"modelName":"product","actions":{},"lifecycles":{}},"api::product-category.product-category":{"kind":"collectionType","collectionName":"product_categories","info":{"singularName":"product-category","pluralName":"product-categories","displayName":"Product Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Description":{"type":"string"},"Image":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"slug":{"type":"uid","targetField":"Title"},"products":{"type":"relation","relation":"oneToMany","target":"api::product.product","mappedBy":"product_category"},"Order":{"type":"integer","required":true,"unique":true},"ShortDescription":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::product-category.product-category","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"product_categories"}}},"apiName":"product-category","globalId":"ProductCategory","uid":"api::product-category.product-category","modelType":"contentType","__schema__":{"collectionName":"product_categories","info":{"singularName":"product-category","pluralName":"product-categories","displayName":"Product Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Description":{"type":"string"},"Image":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"slug":{"type":"uid","targetField":"Title"},"products":{"type":"relation","relation":"oneToMany","target":"api::product.product","mappedBy":"product_category"},"Order":{"type":"integer","required":true,"unique":true},"ShortDescription":{"type":"string"}},"kind":"collectionType"},"modelName":"product-category","actions":{},"lifecycles":{}},"api::sales-inquiry.sales-inquiry":{"kind":"collectionType","collectionName":"sales_inquiries","info":{"singularName":"sales-inquiry","pluralName":"sales-inquiries","displayName":"Sales Inquiry","description":""},"options":{"draftAndPublish":true},"attributes":{"products":{"type":"json","required":true},"budget":{"type":"string","required":true},"timeline":{"type":"enumeration","enum":["one_month","three_months","six_months","flexible"]},"age":{"type":"string"},"gender":{"type":"enumeration","enum":["male","female","diverse","prefer_not_to_say"]},"location":{"type":"string"},"householdSize":{"type":"string"},"specificRequirements":{"type":"text"},"customizationNeeds":{"type":"json"},"painPoints":{"type":"text"},"preferredFeatures":{"type":"json"},"contact":{"type":"relation","relation":"oneToOne","target":"api::contact-form.contact-form"},"livingSituation":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::sales-inquiry.sales-inquiry","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"sales_inquiries"}}},"apiName":"sales-inquiry","globalId":"SalesInquiry","uid":"api::sales-inquiry.sales-inquiry","modelType":"contentType","__schema__":{"collectionName":"sales_inquiries","info":{"singularName":"sales-inquiry","pluralName":"sales-inquiries","displayName":"Sales Inquiry","description":""},"options":{"draftAndPublish":true},"attributes":{"products":{"type":"json","required":true},"budget":{"type":"string","required":true},"timeline":{"type":"enumeration","enum":["one_month","three_months","six_months","flexible"]},"age":{"type":"string"},"gender":{"type":"enumeration","enum":["male","female","diverse","prefer_not_to_say"]},"location":{"type":"string"},"householdSize":{"type":"string"},"specificRequirements":{"type":"text"},"customizationNeeds":{"type":"json"},"painPoints":{"type":"text"},"preferredFeatures":{"type":"json"},"contact":{"type":"relation","relation":"oneToOne","target":"api::contact-form.contact-form"},"livingSituation":{"type":"string"}},"kind":"collectionType"},"modelName":"sales-inquiry","actions":{},"lifecycles":{}},"api::test.test":{"kind":"collectionType","collectionName":"tests","info":{"singularName":"test","pluralName":"tests","displayName":"test"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"test":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::test.test","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"tests"}}},"apiName":"test","globalId":"Test","uid":"api::test.test","modelType":"contentType","__schema__":{"collectionName":"tests","info":{"singularName":"test","pluralName":"tests","displayName":"test"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"test":{"type":"text"}},"kind":"collectionType"},"modelName":"test","actions":{},"lifecycles":{}},"api::ueber-uns.ueber-uns":{"kind":"collectionType","collectionName":"ueber_uns_x","info":{"singularName":"ueber-uns","pluralName":"ueber-uns-x","displayName":"Über Uns","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Description":{"type":"text"},"slug":{"type":"uid","targetField":"Title"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::ueber-uns.ueber-uns","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"ueber_uns_x"}}},"apiName":"ueber-uns","globalId":"UeberUns","uid":"api::ueber-uns.ueber-uns","modelType":"contentType","__schema__":{"collectionName":"ueber_uns_x","info":{"singularName":"ueber-uns","pluralName":"ueber-uns-x","displayName":"Über Uns","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Description":{"type":"text"},"slug":{"type":"uid","targetField":"Title"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]}},"kind":"collectionType"},"modelName":"ueber-uns","actions":{},"lifecycles":{}},"api::welcome-section.welcome-section":{"kind":"singleType","collectionName":"welcome_sections","info":{"singularName":"welcome-section","pluralName":"welcome-sections","displayName":"Welcome Section","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Paragraphs":{"type":"richtext"},"Catchtext":{"type":"string"},"Catchimage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Catchheader":{"type":"string"},"CTAText":{"type":"string"},"NeherLogo":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::welcome-section.welcome-section","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"welcome_sections"}}},"apiName":"welcome-section","globalId":"WelcomeSection","uid":"api::welcome-section.welcome-section","modelType":"contentType","__schema__":{"collectionName":"welcome_sections","info":{"singularName":"welcome-section","pluralName":"welcome-sections","displayName":"Welcome Section","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"Title":{"type":"string"},"Paragraphs":{"type":"richtext"},"Catchtext":{"type":"string"},"Catchimage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Catchheader":{"type":"string"},"CTAText":{"type":"string"},"NeherLogo":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false}},"kind":"singleType"},"modelName":"welcome-section","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
25	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
18	plugin_content_manager_configuration_content_types::api::welcome-section.welcome-section	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"Paragraphs":{"edit":{"label":"Paragraphs","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Paragraphs","searchable":false,"sortable":false}},"Catchtext":{"edit":{"label":"Catchtext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Catchtext","searchable":true,"sortable":true}},"Catchimage":{"edit":{"label":"Catchimage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Catchimage","searchable":false,"sortable":false}},"Catchheader":{"edit":{"label":"Catchheader","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Catchheader","searchable":true,"sortable":true}},"CTAText":{"edit":{"label":"CTAText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CTAText","searchable":true,"sortable":true}},"NeherLogo":{"edit":{"label":"NeherLogo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"NeherLogo","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","createdAt","updatedAt"],"edit":[[{"name":"Title","size":6}],[{"name":"Paragraphs","size":12}],[{"name":"Catchtext","size":6},{"name":"Catchimage","size":6}],[{"name":"Catchheader","size":6},{"name":"CTAText","size":6}],[{"name":"NeherLogo","size":6}]]},"uid":"api::welcome-section.welcome-section"}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::api::faq.faq	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Question":{"edit":{"label":"Question","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Question","searchable":true,"sortable":true}},"Answer":{"edit":{"label":"Answer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Answer","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Question","Answer","createdAt"],"edit":[[{"name":"Question","size":6},{"name":"Answer","size":6}]]},"uid":"api::faq.faq"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::api::hero-section.hero-section	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"CallToActionText":{"edit":{"label":"CallToActionText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CallToActionText","searchable":true,"sortable":true}},"CallToActionLink":{"edit":{"label":"CallToActionLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CallToActionLink","searchable":true,"sortable":true}},"BackgroundImage":{"edit":{"label":"BackgroundImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"BackgroundImage","searchable":false,"sortable":false}},"featureitems":{"edit":{"label":"featureitems","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"featureitems","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","Description","CallToActionText"],"edit":[[{"name":"Title","size":6},{"name":"Description","size":6}],[{"name":"CallToActionText","size":6},{"name":"CallToActionLink","size":6}],[{"name":"BackgroundImage","size":6}],[{"name":"featureitems","size":12}]]},"uid":"api::hero-section.hero-section"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
21	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
29	plugin_i18n_default_locale	"en"	string	\N	\N
16	plugin_content_manager_configuration_content_types::api::test.test	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"test":{"edit":{"label":"test","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"test","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","test","createdAt","updatedAt"],"edit":[[{"name":"test","size":6}]]},"uid":"api::test.test"}	object	\N	\N
23	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::api::ueber-uns.ueber-uns	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","Description","slug"],"edit":[[{"name":"Title","size":6},{"name":"Description","size":6}],[{"name":"slug","size":6},{"name":"image","size":6}]]},"uid":"api::ueber-uns.ueber-uns"}	object	\N	\N
24	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
20	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
22	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
26	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
27	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
33	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
28	plugin_upload_metrics	{"weeklySchedule":"55 9 22 * * 5","lastWeeklyUpdate":1732314274890}	object	\N	\N
30	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
31	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
32	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
2	plugin_content_manager_configuration_components::features.feature-item	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","icon"],"edit":[[{"name":"title","size":6},{"name":"icon","size":6}]]},"uid":"features.feature-item","isComponent":true}	object	\N	\N
34	plugin_content_manager_configuration_components::contactaddress.contactaddress	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"street","defaultSortBy":"street","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"street":{"edit":{"label":"street","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"street","searchable":true,"sortable":true}},"city":{"edit":{"label":"city","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"city","searchable":true,"sortable":true}},"postal_code":{"edit":{"label":"postal_code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"postal_code","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"opening_hours":{"edit":{"label":"opening_hours","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"opening_hours","searchable":true,"sortable":true}}},"layouts":{"list":["id","street","city","postal_code"],"edit":[[{"name":"street","size":6},{"name":"city","size":6}],[{"name":"postal_code","size":6},{"name":"phone","size":6}],[{"name":"email","size":6},{"name":"opening_hours","size":6}]]},"uid":"contactaddress.contactaddress","isComponent":true}	object	\N	\N
15	plugin_content_manager_configuration_content_types::api::product-category.product-category	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"Image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"products","searchable":false,"sortable":false}},"Order":{"edit":{"label":"Order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Order","searchable":true,"sortable":true}},"ShortDescription":{"edit":{"label":"ShortDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ShortDescription","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","Description","Image"],"edit":[[{"name":"Title","size":6},{"name":"Description","size":6}],[{"name":"Image","size":6},{"name":"slug","size":6}],[{"name":"products","size":6},{"name":"Order","size":4}],[{"name":"ShortDescription","size":6}]]},"uid":"api::product-category.product-category"}	object	\N	\N
35	plugin_content_manager_configuration_components::contactaddress.contactformsettings	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"success_message","defaultSortBy":"success_message","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"success_message":{"edit":{"label":"success_message","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"success_message","searchable":true,"sortable":true}},"error_message":{"edit":{"label":"error_message","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"error_message","searchable":true,"sortable":true}},"privacy_text":{"edit":{"label":"privacy_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"privacy_text","searchable":true,"sortable":true}},"newsletter_text":{"edit":{"label":"newsletter_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"newsletter_text","searchable":true,"sortable":true}},"submit_button_text":{"edit":{"label":"submit_button_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"submit_button_text","searchable":true,"sortable":true}}},"layouts":{"list":["id","success_message","error_message","privacy_text"],"edit":[[{"name":"success_message","size":6},{"name":"error_message","size":6}],[{"name":"privacy_text","size":6},{"name":"newsletter_text","size":6}],[{"name":"submit_button_text","size":6}]]},"uid":"contactaddress.contactformsettings","isComponent":true}	object	\N	\N
39	plugin_content_manager_configuration_content_types::api::file-and-resource.file-and-resource	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"File":{"edit":{"label":"File","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"File","searchable":false,"sortable":false}},"FileType":{"edit":{"label":"FileType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"FileType","searchable":true,"sortable":true}},"Size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","File","FileType"],"edit":[[{"name":"Title","size":6},{"name":"File","size":6}],[{"name":"FileType","size":6},{"name":"Size","size":4}]]},"uid":"api::file-and-resource.file-and-resource"}	object	\N	\N
38	plugin_content_manager_configuration_content_types::api::product.product	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"MainImage":{"edit":{"label":"MainImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"MainImage","searchable":false,"sortable":false}},"GalleryImages":{"edit":{"label":"GalleryImages","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"GalleryImages","searchable":false,"sortable":false}},"ShortDescription":{"edit":{"label":"ShortDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ShortDescription","searchable":true,"sortable":true}},"DetailedDescription":{"edit":{"label":"DetailedDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"DetailedDescription","searchable":false,"sortable":false}},"Features":{"edit":{"label":"Features","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Features","searchable":false,"sortable":false}},"CTALink":{"edit":{"label":"CTALink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CTALink","searchable":true,"sortable":true}},"product_category":{"edit":{"label":"product_category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"product_category","searchable":true,"sortable":true}},"Order":{"edit":{"label":"Order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Order","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","MainImage","GalleryImages"],"edit":[[{"name":"Name","size":6},{"name":"MainImage","size":6}],[{"name":"GalleryImages","size":6},{"name":"ShortDescription","size":6}],[{"name":"DetailedDescription","size":12}],[{"name":"Features","size":12}],[{"name":"CTALink","size":6},{"name":"product_category","size":6}],[{"name":"Order","size":4}]]},"uid":"api::product.product"}	object	\N	\N
37	plugin_content_manager_configuration_content_types::api::contact-form.contact-form	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"message":{"edit":{"label":"message","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"message","searchable":true,"sortable":true}},"privacy":{"edit":{"label":"privacy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"privacy","searchable":true,"sortable":true}},"newsletter":{"edit":{"label":"newsletter","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"newsletter","searchable":true,"sortable":true}},"company":{"edit":{"label":"company","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"company","searchable":true,"sortable":true}},"wantContact":{"edit":{"label":"wantContact","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"wantContact","searchable":true,"sortable":true}},"method":{"edit":{"label":"method","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"method","searchable":true,"sortable":true}},"time":{"edit":{"label":"time","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"time","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","email","phone"],"edit":[[{"name":"name","size":6},{"name":"email","size":6}],[{"name":"phone","size":6},{"name":"message","size":6}],[{"name":"privacy","size":4},{"name":"newsletter","size":4}],[{"name":"company","size":6},{"name":"wantContact","size":4}],[{"name":"method","size":6},{"name":"time","size":6}]]},"uid":"api::contact-form.contact-form"}	object	\N	\N
36	plugin_content_manager_configuration_content_types::api::contactsection.contactsection	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"subtitle":{"edit":{"label":"subtitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subtitle","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":false,"sortable":false}},"contact_form":{"edit":{"label":"contact_form","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contact_form","searchable":false,"sortable":false}},"CTAText":{"edit":{"label":"CTAText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"CTAText","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","subtitle","address"],"edit":[[{"name":"title","size":6},{"name":"subtitle","size":6}],[{"name":"address","size":12}],[{"name":"contact_form","size":12}],[{"name":"CTAText","size":6}]]},"uid":"api::contactsection.contactsection"}	object	\N	\N
41	plugin_content_manager_configuration_content_types::api::impressum.impressum	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"company_info":{"edit":{"label":"company_info","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"company_info","searchable":false,"sortable":false}},"representative":{"edit":{"label":"representative","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"representative","searchable":false,"sortable":false}},"contact":{"edit":{"label":"contact","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contact","searchable":false,"sortable":false}},"tax_info":{"edit":{"label":"tax_info","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tax_info","searchable":false,"sortable":false}},"content_responsible":{"edit":{"label":"content_responsible","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content_responsible","searchable":false,"sortable":false}},"liability_disclaimer":{"edit":{"label":"liability_disclaimer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"liability_disclaimer","searchable":false,"sortable":false}},"copyright_notice":{"edit":{"label":"copyright_notice","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"copyright_notice","searchable":false,"sortable":false}},"data_policy":{"edit":{"label":"data_policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"data_policy","searchable":false,"sortable":false}},"agb":{"edit":{"label":"agb","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"agb","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id"],"edit":[[{"name":"company_info","size":12}],[{"name":"representative","size":12}],[{"name":"contact","size":12}],[{"name":"tax_info","size":12}],[{"name":"content_responsible","size":12}],[{"name":"liability_disclaimer","size":12}],[{"name":"copyright_notice","size":12}],[{"name":"data_policy","size":12}],[{"name":"agb","size":12}]]},"uid":"api::impressum.impressum"}	object	\N	\N
40	plugin_content_manager_configuration_content_types::api::sales-inquiry.sales-inquiry	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"products","searchable":false,"sortable":false}},"budget":{"edit":{"label":"budget","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"budget","searchable":true,"sortable":true}},"timeline":{"edit":{"label":"timeline","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timeline","searchable":true,"sortable":true}},"age":{"edit":{"label":"age","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"age","searchable":true,"sortable":true}},"gender":{"edit":{"label":"gender","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gender","searchable":true,"sortable":true}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"householdSize":{"edit":{"label":"householdSize","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"householdSize","searchable":true,"sortable":true}},"specificRequirements":{"edit":{"label":"specificRequirements","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"specificRequirements","searchable":true,"sortable":true}},"customizationNeeds":{"edit":{"label":"customizationNeeds","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customizationNeeds","searchable":false,"sortable":false}},"painPoints":{"edit":{"label":"painPoints","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"painPoints","searchable":true,"sortable":true}},"preferredFeatures":{"edit":{"label":"preferredFeatures","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferredFeatures","searchable":false,"sortable":false}},"contact":{"edit":{"label":"contact","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"contact","searchable":false,"sortable":false}},"livingSituation":{"edit":{"label":"livingSituation","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"livingSituation","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","budget","timeline","createdAt"],"edit":[[{"name":"products","size":12}],[{"name":"budget","size":4},{"name":"timeline","size":6}],[{"name":"contact","size":12}],[{"name":"age","size":6},{"name":"gender","size":6}],[{"name":"location","size":6},{"name":"householdSize","size":6}],[{"name":"specificRequirements","size":6}],[{"name":"customizationNeeds","size":12}],[{"name":"painPoints","size":6}],[{"name":"preferredFeatures","size":12}],[{"name":"livingSituation","size":6}]]},"uid":"api::sales-inquiry.sales-inquiry"}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
37	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"contact_forms","indexes":[{"name":"contact_forms_documents_idx","columns":["document_id","locale","published_at"]},{"name":"contact_forms_created_by_id_fk","columns":["created_by_id"]},{"name":"contact_forms_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"contact_forms_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"contact_forms_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"message","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"privacy","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"newsletter","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"company","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"want_contact","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"method","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"time","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"contactsections_cmps","indexes":[{"name":"contactsections_field_idx","columns":["field"]},{"name":"contactsections_component_type_idx","columns":["component_type"]},{"name":"contactsections_entity_fk","columns":["entity_id"]},{"name":"contactsections_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"contactsections_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"contactsections","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"contactsections","indexes":[{"name":"contactsections_documents_idx","columns":["document_id","locale","published_at"]},{"name":"contactsections_created_by_id_fk","columns":["created_by_id"]},{"name":"contactsections_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"contactsections_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"contactsections_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subtitle","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cta_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"faqs","indexes":[{"name":"faqs_documents_idx","columns":["document_id","locale","published_at"]},{"name":"faqs_created_by_id_fk","columns":["created_by_id"]},{"name":"faqs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"faqs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"faqs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"question","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"answer","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"file_and_resources","indexes":[{"name":"file_and_resources_documents_idx","columns":["document_id","locale","published_at"]},{"name":"file_and_resources_created_by_id_fk","columns":["created_by_id"]},{"name":"file_and_resources_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"file_and_resources_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"file_and_resources_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"file_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"hero_sections_cmps","indexes":[{"name":"hero_sections_field_idx","columns":["field"]},{"name":"hero_sections_component_type_idx","columns":["component_type"]},{"name":"hero_sections_entity_fk","columns":["entity_id"]},{"name":"hero_sections_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"hero_sections_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"hero_sections","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"hero_sections","indexes":[{"name":"hero_sections_documents_idx","columns":["document_id","locale","published_at"]},{"name":"hero_sections_created_by_id_fk","columns":["created_by_id"]},{"name":"hero_sections_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"hero_sections_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"hero_sections_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"call_to_action_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"call_to_action_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"impressums","indexes":[{"name":"impressums_documents_idx","columns":["document_id","locale","published_at"]},{"name":"impressums_created_by_id_fk","columns":["created_by_id"]},{"name":"impressums_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"impressums_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"impressums_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"company_info","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"representative","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"contact","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tax_info","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_responsible","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"liability_disclaimer","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"copyright_notice","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data_policy","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"agb","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"products","indexes":[{"name":"products_documents_idx","columns":["document_id","locale","published_at"]},{"name":"products_created_by_id_fk","columns":["created_by_id"]},{"name":"products_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"products_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"products_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"short_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"detailed_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"features","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cta_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"product_categories","indexes":[{"name":"product_categories_documents_idx","columns":["document_id","locale","published_at"]},{"name":"product_categories_created_by_id_fk","columns":["created_by_id"]},{"name":"product_categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"product_categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"product_categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"short_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"sales_inquiries","indexes":[{"name":"sales_inquiries_documents_idx","columns":["document_id","locale","published_at"]},{"name":"sales_inquiries_created_by_id_fk","columns":["created_by_id"]},{"name":"sales_inquiries_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"sales_inquiries_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"sales_inquiries_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"products","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"budget","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timeline","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"age","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"gender","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"household_size","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"specific_requirements","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customization_needs","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"pain_points","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preferred_features","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"living_situation","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"tests","indexes":[{"name":"tests_documents_idx","columns":["document_id","locale","published_at"]},{"name":"tests_created_by_id_fk","columns":["created_by_id"]},{"name":"tests_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tests_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tests_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"test","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"ueber_uns_x","indexes":[{"name":"ueber_uns_x_documents_idx","columns":["document_id","locale","published_at"]},{"name":"ueber_uns_x_created_by_id_fk","columns":["created_by_id"]},{"name":"ueber_uns_x_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"ueber_uns_x_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"ueber_uns_x_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"welcome_sections","indexes":[{"name":"welcome_sections_documents_idx","columns":["document_id","locale","published_at"]},{"name":"welcome_sections_created_by_id_fk","columns":["created_by_id"]},{"name":"welcome_sections_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"welcome_sections_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"welcome_sections_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"paragraphs","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"catchtext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"catchheader","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cta_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_features_feature_items","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"icon","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_contactaddress_contactformsettings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"success_message","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"error_message","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"privacy_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"newsletter_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"submit_button_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_contactaddress_contactaddresses","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"street","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"city","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"postal_code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"opening_hours","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_product_category_lnk","indexes":[{"name":"products_product_category_lnk_fk","columns":["product_id"]},{"name":"products_product_category_lnk_ifk","columns":["product_category_id"]},{"name":"products_product_category_lnk_uq","columns":["product_id","product_category_id"],"type":"unique"},{"name":"products_product_category_lnk_oifk","columns":["product_ord"]}],"foreignKeys":[{"name":"products_product_category_lnk_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_product_category_lnk_ifk","columns":["product_category_id"],"referencedColumns":["id"],"referencedTable":"product_categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"sales_inquiries_contact_lnk","indexes":[{"name":"sales_inquiries_contact_lnk_fk","columns":["sales_inquiry_id"]},{"name":"sales_inquiries_contact_lnk_ifk","columns":["contact_form_id"]},{"name":"sales_inquiries_contact_lnk_uq","columns":["sales_inquiry_id","contact_form_id"],"type":"unique"}],"foreignKeys":[{"name":"sales_inquiries_contact_lnk_fk","columns":["sales_inquiry_id"],"referencedColumns":["id"],"referencedTable":"sales_inquiries","onDelete":"CASCADE"},{"name":"sales_inquiries_contact_lnk_ifk","columns":["contact_form_id"],"referencedColumns":["id"],"referencedTable":"contact_forms","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"sales_inquiry_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"contact_form_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2024-11-26 18:48:48.113	31589e2ef7ec638ba3cbf2fa2dc9ca32
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2024-11-08 22:00:23.418
2	5.0.0-02-created-document-id	2024-11-08 22:00:23.475
3	5.0.0-03-created-locale	2024-11-08 22:00:23.534
4	5.0.0-04-created-published-at	2024-11-08 22:00:23.58
5	5.0.0-05-drop-slug-fields-index	2024-11-08 22:00:23.634
6	core::5.0.0-discard-drafts	2024-11-08 22:00:23.694
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.tests (id, document_id, test, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: ueber_uns_x; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.ueber_uns_x (id, document_id, title, description, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	e2nxg2fvkomgwtpn12nk4kx0	Maßgefertigte Qualitätsware	Wir bieten maßgegefertigte Insektenschutzprodukte und Fliegengitter in höchster Qualität, bezogen vom renommierten Hersteller Neher und passend für jede Einbausituation. Vertrauen Sie auf unsere hochwertigen Materialien und lange Haltbarkeit.	massgefertigte-qualitaetsware	2024-11-08 22:17:38.589	2024-11-08 22:17:38.589	\N	1	1	\N
2	e2nxg2fvkomgwtpn12nk4kx0	Maßgefertigte Qualitätsware	Wir bieten maßgegefertigte Insektenschutzprodukte und Fliegengitter in höchster Qualität, bezogen vom renommierten Hersteller Neher und passend für jede Einbausituation. Vertrauen Sie auf unsere hochwertigen Materialien und lange Haltbarkeit.	massgefertigte-qualitaetsware	2024-11-08 22:17:38.589	2024-11-08 22:17:38.589	2024-11-08 22:17:38.602	1	1	\N
3	x696vrm5yqda4z3diwl59fyl	Effektiver Schutz vor Insekten	Mit unseren Insektenschutzlösungen können Sie sich effektiv vor lästigen Insekten schützen. Unsere Produkte sind speziell entwickelt, um eine zuverlässige Abwehr gegen Fliegen, Mücken und andere Insekten zu bieten. So können Sie die warmen Sommerabende ungestört genießen.	effektiver-schutz-vor-insekten	2024-11-08 22:18:01.064	2024-11-08 22:18:01.064	\N	1	1	\N
4	x696vrm5yqda4z3diwl59fyl	Effektiver Schutz vor Insekten	Mit unseren Insektenschutzlösungen können Sie sich effektiv vor lästigen Insekten schützen. Unsere Produkte sind speziell entwickelt, um eine zuverlässige Abwehr gegen Fliegen, Mücken und andere Insekten zu bieten. So können Sie die warmen Sommerabende ungestört genießen.	effektiver-schutz-vor-insekten	2024-11-08 22:18:01.064	2024-11-08 22:18:01.064	2024-11-08 22:18:01.08	1	1	\N
5	r1xpvrre33klnfd123gkg5qt	Einfache und schnelle Montage	Unsere Produkte sind einfach und schnell zu montieren. Wir bieten Ihnen professionelle Montage an. So können Sie sicher sein, dass Ihre Insektenschutzlösung perfekt installiert wird und zuverlässigen Schutz bietet.	einfache-und-schnelle-montage	2024-11-08 22:18:16.164	2024-11-08 22:18:16.164	\N	1	1	\N
6	r1xpvrre33klnfd123gkg5qt	Einfache und schnelle Montage	Unsere Produkte sind einfach und schnell zu montieren. Wir bieten Ihnen professionelle Montage an. So können Sie sicher sein, dass Ihre Insektenschutzlösung perfekt installiert wird und zuverlässigen Schutz bietet.	einfache-und-schnelle-montage	2024-11-08 22:18:16.164	2024-11-08 22:18:16.164	2024-11-08 22:18:16.181	1	1	\N
7	fbs9bd23czhvtrl2s9nu3dl4	Große Auswahl und Beratung	Unsere Ausstellung in Butzbach bietet Ihnen eine große Auswahl an Insektenschutz- und Fliegengitterprodukten. Lassen Sie sich von Uns persönlich beraten und finden Sie die perfekte Lösung für Ihr Zuhause. Wir nehmen uns Zeit für Sie und Ihre individuellen Anforderungen.	grosse-auswahl-und-beratung	2024-11-08 22:18:29.027	2024-11-08 22:18:29.027	\N	1	1	\N
8	fbs9bd23czhvtrl2s9nu3dl4	Große Auswahl und Beratung	Unsere Ausstellung in Butzbach bietet Ihnen eine große Auswahl an Insektenschutz- und Fliegengitterprodukten. Lassen Sie sich von Uns persönlich beraten und finden Sie die perfekte Lösung für Ihr Zuhause. Wir nehmen uns Zeit für Sie und Ihre individuellen Anforderungen.	grosse-auswahl-und-beratung	2024-11-08 22:18:29.027	2024-11-08 22:18:29.027	2024-11-08 22:18:29.051	1	1	\N
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	kowesqsok9szk8m3m6yk172m	plugin::users-permissions.user.me	2024-11-08 22:00:25.415	2024-11-08 22:00:25.415	2024-11-08 22:00:25.415	\N	\N	\N
2	qbpnr7imsrx2o1w4hvq16gyf	plugin::users-permissions.auth.changePassword	2024-11-08 22:00:25.415	2024-11-08 22:00:25.415	2024-11-08 22:00:25.415	\N	\N	\N
3	vvd7540c3s3zxf7jrhq7s04l	plugin::users-permissions.auth.callback	2024-11-08 22:00:25.46	2024-11-08 22:00:25.46	2024-11-08 22:00:25.461	\N	\N	\N
4	i6eh211p4wjxjf1oc1q51r3e	plugin::users-permissions.auth.connect	2024-11-08 22:00:25.46	2024-11-08 22:00:25.46	2024-11-08 22:00:25.461	\N	\N	\N
5	x74gohbr8e49bpbnw3a1ihk4	plugin::users-permissions.auth.forgotPassword	2024-11-08 22:00:25.46	2024-11-08 22:00:25.46	2024-11-08 22:00:25.461	\N	\N	\N
6	ep1sexrcexymff2iutce18i7	plugin::users-permissions.auth.resetPassword	2024-11-08 22:00:25.46	2024-11-08 22:00:25.46	2024-11-08 22:00:25.461	\N	\N	\N
7	zdo76cobd14ptxzwt59bbrca	plugin::users-permissions.auth.register	2024-11-08 22:00:25.46	2024-11-08 22:00:25.46	2024-11-08 22:00:25.462	\N	\N	\N
8	j55ngl47u2z8vup5f130dtb2	plugin::users-permissions.auth.emailConfirmation	2024-11-08 22:00:25.46	2024-11-08 22:00:25.46	2024-11-08 22:00:25.462	\N	\N	\N
9	twseeyhypjr3gu49l9m4l315	plugin::users-permissions.auth.sendEmailConfirmation	2024-11-08 22:00:25.46	2024-11-08 22:00:25.46	2024-11-08 22:00:25.462	\N	\N	\N
11	hk86mhp4k1i83ephpgn5ci9e	api::faq.faq.find	2024-11-08 22:15:34.462	2024-11-08 22:15:34.462	2024-11-08 22:15:34.486	\N	\N	\N
10	y0sh8dcct1mdr5xmx9dv9wux	api::faq.faq.create	2024-11-08 22:15:34.464	2024-11-08 22:15:34.464	2024-11-08 22:15:34.487	\N	\N	\N
12	gio7qrpdyvjldxghzkkmkg6q	api::faq.faq.findOne	2024-11-08 22:15:34.464	2024-11-08 22:15:34.464	2024-11-08 22:15:34.487	\N	\N	\N
13	dgi01pypsd8jwqoxipnw7mu2	api::faq.faq.update	2024-11-08 22:15:34.464	2024-11-08 22:15:34.464	2024-11-08 22:15:34.487	\N	\N	\N
14	aoz5kwr6umqilptvzmrvporg	api::faq.faq.delete	2024-11-08 22:15:34.464	2024-11-08 22:15:34.464	2024-11-08 22:15:34.487	\N	\N	\N
15	v0ww6208samav4sb3xjl4jwh	api::hero-section.hero-section.find	2024-11-08 22:15:34.464	2024-11-08 22:15:34.464	2024-11-08 22:15:34.489	\N	\N	\N
16	hsky7ye48g6eyqpvab3qcqji	api::hero-section.hero-section.update	2024-11-08 22:15:34.464	2024-11-08 22:15:34.464	2024-11-08 22:15:34.489	\N	\N	\N
17	afblrl0ecvk055j5o5zlj0eq	api::hero-section.hero-section.delete	2024-11-08 22:15:34.473	2024-11-08 22:15:34.473	2024-11-08 22:15:34.49	\N	\N	\N
18	xne3q8frxd1a2hj3m3jk8xxc	api::product-category.product-category.find	2024-11-08 22:15:34.473	2024-11-08 22:15:34.473	2024-11-08 22:15:34.49	\N	\N	\N
19	c0b7k5ieec0x976hnd9cw4q1	api::product-category.product-category.findOne	2024-11-08 22:15:34.474	2024-11-08 22:15:34.474	2024-11-08 22:15:34.49	\N	\N	\N
20	x1z7ipbzn0kuqmtoxad8zjt4	api::product-category.product-category.create	2024-11-08 22:15:34.474	2024-11-08 22:15:34.474	2024-11-08 22:15:34.491	\N	\N	\N
21	hr6wuw77xfywkc9pchh3hm9o	api::product-category.product-category.update	2024-11-08 22:15:34.474	2024-11-08 22:15:34.474	2024-11-08 22:15:34.491	\N	\N	\N
22	sfk1xud81af8rqipe8ywx1pi	api::product-category.product-category.delete	2024-11-08 22:15:34.475	2024-11-08 22:15:34.475	2024-11-08 22:15:34.491	\N	\N	\N
23	dtdgjteqrpqsi09aks3237re	api::test.test.find	2024-11-08 22:15:34.475	2024-11-08 22:15:34.475	2024-11-08 22:15:34.491	\N	\N	\N
24	jg0ctdb8azvxu5rhxvvuxuzz	api::test.test.findOne	2024-11-08 22:15:34.475	2024-11-08 22:15:34.475	2024-11-08 22:15:34.491	\N	\N	\N
25	uwuj0urdt0merlamjhv7n39k	api::test.test.create	2024-11-08 22:15:34.475	2024-11-08 22:15:34.475	2024-11-08 22:15:34.491	\N	\N	\N
26	z7ra0xnay7ootve8tetz1s4w	api::test.test.update	2024-11-08 22:15:34.476	2024-11-08 22:15:34.476	2024-11-08 22:15:34.492	\N	\N	\N
27	kwjej4zr6s0ptlrtbiw0lg9z	api::test.test.delete	2024-11-08 22:15:34.476	2024-11-08 22:15:34.476	2024-11-08 22:15:34.492	\N	\N	\N
28	becntvl7lutwqe8jzv3xkw5u	api::ueber-uns.ueber-uns.find	2024-11-08 22:15:34.476	2024-11-08 22:15:34.476	2024-11-08 22:15:34.492	\N	\N	\N
29	lw1hx6cww7v2qmujp6veq4k3	api::ueber-uns.ueber-uns.findOne	2024-11-08 22:15:34.476	2024-11-08 22:15:34.476	2024-11-08 22:15:34.492	\N	\N	\N
30	cqp2nraxbuvjjr75x8l8plkr	api::ueber-uns.ueber-uns.create	2024-11-08 22:15:34.476	2024-11-08 22:15:34.476	2024-11-08 22:15:34.492	\N	\N	\N
31	t09szr981xg8o4mggzmq77zy	api::ueber-uns.ueber-uns.update	2024-11-08 22:15:34.476	2024-11-08 22:15:34.476	2024-11-08 22:15:34.492	\N	\N	\N
32	t4kfc08n6w0i9k8wej114bc8	api::ueber-uns.ueber-uns.delete	2024-11-08 22:15:34.476	2024-11-08 22:15:34.476	2024-11-08 22:15:34.492	\N	\N	\N
33	qd0xbowmjpn1aj97h3wg541s	api::welcome-section.welcome-section.find	2024-11-08 22:15:34.477	2024-11-08 22:15:34.477	2024-11-08 22:15:34.492	\N	\N	\N
34	p5mpajzfgcu4yn05u4jvgrpc	api::welcome-section.welcome-section.update	2024-11-08 22:15:34.477	2024-11-08 22:15:34.477	2024-11-08 22:15:34.493	\N	\N	\N
35	c841m3ahj74vfhioux8hbak6	api::welcome-section.welcome-section.delete	2024-11-08 22:15:34.477	2024-11-08 22:15:34.477	2024-11-08 22:15:34.493	\N	\N	\N
36	ddw7lewapvm4hat1oirw19te	plugin::content-type-builder.components.getComponents	2024-11-08 22:15:34.478	2024-11-08 22:15:34.478	2024-11-08 22:15:34.493	\N	\N	\N
37	nm3n2zxrqxdc81kpv305gxqd	plugin::content-type-builder.components.getComponent	2024-11-08 22:15:34.478	2024-11-08 22:15:34.478	2024-11-08 22:15:34.493	\N	\N	\N
38	cpn1c00m8c6owtjstqu9zvmn	plugin::content-type-builder.content-types.getContentTypes	2024-11-08 22:15:34.479	2024-11-08 22:15:34.479	2024-11-08 22:15:34.493	\N	\N	\N
39	nwqrq9h2nxncr0bb1nz8mzpo	plugin::content-type-builder.content-types.getContentType	2024-11-08 22:15:34.479	2024-11-08 22:15:34.479	2024-11-08 22:15:34.493	\N	\N	\N
40	trkvhf9ajq6eoj6ef5m1o23b	plugin::email.email.send	2024-11-08 22:15:34.48	2024-11-08 22:15:34.48	2024-11-08 22:15:34.493	\N	\N	\N
41	poyu48d7lci4kqnf8nai05dm	plugin::upload.content-api.find	2024-11-08 22:15:34.48	2024-11-08 22:15:34.48	2024-11-08 22:15:34.497	\N	\N	\N
42	r9gwdmcoaq2ovwt8ggrr3lhu	plugin::upload.content-api.findOne	2024-11-08 22:15:34.48	2024-11-08 22:15:34.48	2024-11-08 22:15:34.497	\N	\N	\N
43	i7d9bus4v9mp4x59kxzk9970	plugin::upload.content-api.destroy	2024-11-08 22:15:34.48	2024-11-08 22:15:34.48	2024-11-08 22:15:34.497	\N	\N	\N
44	mccjk3nyosu0ca30gr1cbt5q	plugin::upload.content-api.upload	2024-11-08 22:15:34.481	2024-11-08 22:15:34.481	2024-11-08 22:15:34.498	\N	\N	\N
45	fdfhd38bqyu5jvkhws9wsn81	plugin::i18n.locales.listLocales	2024-11-08 22:15:34.481	2024-11-08 22:15:34.481	2024-11-08 22:15:34.498	\N	\N	\N
46	qu19ep1cfkawz9bggu2tziya	api::contactsection.contactsection.find	2024-11-09 01:54:17.307	2024-11-09 01:54:17.307	2024-11-09 01:54:17.309	\N	\N	\N
48	pi0k2w26dit1x6tlun34yznw	api::contactsection.contactsection.delete	2024-11-09 01:54:17.307	2024-11-09 01:54:17.307	2024-11-09 01:54:17.31	\N	\N	\N
47	keisws27xlg251k6y0bggc6s	api::contactsection.contactsection.update	2024-11-09 01:54:17.307	2024-11-09 01:54:17.307	2024-11-09 01:54:17.309	\N	\N	\N
49	kie5drbd7t5j6yt9v4v8yz13	api::contact-form.contact-form.find	2024-11-09 02:23:52.459	2024-11-09 02:23:52.459	2024-11-09 02:23:52.46	\N	\N	\N
50	utko8zjkmzgos22g1b7h5356	api::contact-form.contact-form.findOne	2024-11-09 02:23:52.459	2024-11-09 02:23:52.459	2024-11-09 02:23:52.46	\N	\N	\N
51	k4082q4xux3ofvrh8r8pdgdd	api::contact-form.contact-form.create	2024-11-09 02:23:52.459	2024-11-09 02:23:52.459	2024-11-09 02:23:52.46	\N	\N	\N
52	hkmd8u6sjfbosjdr2s37npn1	api::contact-form.contact-form.update	2024-11-09 02:23:52.459	2024-11-09 02:23:52.459	2024-11-09 02:23:52.461	\N	\N	\N
53	dboybj2ahutj05dqhrvplczd	api::contact-form.contact-form.delete	2024-11-09 02:23:52.459	2024-11-09 02:23:52.459	2024-11-09 02:23:52.461	\N	\N	\N
54	rmniktqxje2zdna72cd1nq7c	api::file-and-resource.file-and-resource.find	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.231	\N	\N	\N
55	ftvizqeu08zucdq2myyamtxg	api::file-and-resource.file-and-resource.findOne	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.231	\N	\N	\N
56	np8ho6n6n2e3otccm0iyujc6	api::file-and-resource.file-and-resource.create	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.231	\N	\N	\N
57	rgx2uog89785wyef5b5k2zwz	api::file-and-resource.file-and-resource.update	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.231	\N	\N	\N
58	lzupl89zidpi2aoz3tyoan97	api::file-and-resource.file-and-resource.delete	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.232	\N	\N	\N
59	yoodvxffb7m1zf4rzqrggi84	api::product.product.find	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.232	\N	\N	\N
60	opghx9fvvutbmgrik7ktabm6	api::product.product.findOne	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.232	\N	\N	\N
61	bqfh3c2e8ffgzarij9ziau7o	api::product.product.create	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.232	\N	\N	\N
62	o6bdmqatv73h35bwezjrso2w	api::product.product.update	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.232	\N	\N	\N
63	ep18jebufyekjqrhgy2r3ah1	api::product.product.delete	2024-11-09 12:54:49.23	2024-11-09 12:54:49.23	2024-11-09 12:54:49.232	\N	\N	\N
66	bnz2doog7ew6sofxwvdubxqq	api::sales-inquiry.sales-inquiry.find	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	\N	\N	\N
64	fnv965o71o3zp5hl36fr2uqx	api::sales-inquiry.sales-inquiry.findOne	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	\N	\N	\N
65	etnvjud5wpadvoahg2w8rocy	api::sales-inquiry.sales-inquiry.create	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	\N	\N	\N
67	oxb66ye8hnp9obwp24lz2s57	api::sales-inquiry.sales-inquiry.update	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	2024-11-24 15:58:13.366	\N	\N	\N
68	ejasu5pvepzawgykmcxpf1ib	api::sales-inquiry.sales-inquiry.delete	2024-11-24 15:58:13.365	2024-11-24 15:58:13.365	2024-11-24 15:58:13.366	\N	\N	\N
70	ut86016l3ywxkliufs9dklb2	api::impressum.impressum.update	2024-11-25 11:36:33.098	2024-11-25 11:36:33.098	2024-11-25 11:36:33.1	\N	\N	\N
71	wno8rsnrvethip3vzvaotlx4	api::impressum.impressum.find	2024-11-25 11:36:33.098	2024-11-25 11:36:33.098	2024-11-25 11:36:33.099	\N	\N	\N
69	y8e5bewmoe49igmupdp0xkii	api::impressum.impressum.delete	2024-11-25 11:36:33.098	2024-11-25 11:36:33.098	2024-11-25 11:36:33.101	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	2	1	1
2	1	1	1
3	3	2	1
4	4	2	1
5	5	2	1
6	7	2	1
7	6	2	1
8	9	2	1
9	8	2	2
11	11	2	3
10	10	2	3
12	13	2	3
13	14	2	4
14	12	2	4
15	15	2	4
16	16	2	4
17	18	2	4
18	17	2	4
19	20	2	4
20	19	2	5
21	24	2	5
22	23	2	5
23	26	2	5
24	25	2	5
25	22	2	5
26	28	2	5
27	27	2	5
28	21	2	5
29	30	2	6
30	29	2	6
31	32	2	6
32	31	2	6
33	34	2	6
34	33	2	6
35	36	2	6
36	35	2	6
37	40	2	7
38	39	2	7
39	42	2	7
40	41	2	7
41	44	2	7
42	38	2	7
43	43	2	7
44	45	2	7
45	37	2	7
46	46	2	8
47	47	2	8
48	48	2	8
49	51	2	9
50	50	2	9
51	49	2	9
52	53	2	10
53	52	2	11
54	54	2	12
55	55	2	12
56	56	2	12
57	58	2	13
58	57	2	14
59	59	2	14
60	60	2	14
61	62	2	15
62	61	2	15
63	63	2	15
64	64	2	16
65	66	2	16
66	65	2	16
67	68	2	17
68	67	2	17
70	70	2	18
71	71	2	18
69	69	2	18
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	d1s7t6is4x0evf0q3yenop3y	Authenticated	Default role given to authenticated user.	authenticated	2024-11-08 22:00:25.381	2024-11-08 22:00:25.381	2024-11-08 22:00:25.382	\N	\N	\N
2	cushekyz678lm1vqzhlpmnso	Public	Default role given to unauthenticated user.	public	2024-11-08 22:00:25.406	2024-11-25 11:44:10.796	2024-11-08 22:00:25.406	\N	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- Data for Name: welcome_sections; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.welcome_sections (id, document_id, title, paragraphs, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, catchtext, catchheader, cta_text) FROM stdin;
1	muqoj6711ppj1kqnm0zd2uam	Herzlich Willkommen bei Tüscher Systeme!	**Seit über 25 Jahren bieten wir maßgeschneiderte Insektenschutzlösungen, die Komfort und Ruhe in jedes Zuhause bringen.**  \n<br>\n\nWir setzen auf *Präzision*, *hochwertige Materialien* und unsere langjährige Erfahrung, um Lösungen zu schaffen, die sich nahtlos in dein Zuhause einfügen. Dabei stehen Stil, Funktionalität und Zuverlässigkeit stets im Mittelpunkt.  \n<br>\n\nUnsere Produkte werden in Zusammenarbeit mit dem renommierten deutschen Hersteller **Neher** gefertigt, der für höchste Qualität und Innovation steht. So garantieren wir dir langlebige Insektenschutzlösungen, auf die du dich verlassen kannst.  	2024-11-08 22:16:58.623	2024-11-25 15:42:23.239	\N	1	1	\N	Insekten hassen diesen Trick – unsere maßgefertigten Insektenschutzlösungen sorgen dafür, dass deine Abende in Ruhe und ohne ungebetene Gäste verlaufen.	Die müssen draußen bleiben! 🐝🦟	Produktanfrage starten!
16	muqoj6711ppj1kqnm0zd2uam	Herzlich Willkommen bei Tüscher Systeme!	**Seit über 25 Jahren bieten wir maßgeschneiderte Insektenschutzlösungen, die Komfort und Ruhe in jedes Zuhause bringen.**  \n<br>\n\nWir setzen auf *Präzision*, *hochwertige Materialien* und unsere langjährige Erfahrung, um Lösungen zu schaffen, die sich nahtlos in dein Zuhause einfügen. Dabei stehen Stil, Funktionalität und Zuverlässigkeit stets im Mittelpunkt.  \n<br>\n\nUnsere Produkte werden in Zusammenarbeit mit dem renommierten deutschen Hersteller **Neher** gefertigt, der für höchste Qualität und Innovation steht. So garantieren wir dir langlebige Insektenschutzlösungen, auf die du dich verlassen kannst.  	2024-11-08 22:16:58.623	2024-11-25 15:42:23.239	2024-11-25 15:42:23.32	1	1	\N	Insekten hassen diesen Trick – unsere maßgefertigten Insektenschutzlösungen sorgen dafür, dass deine Abende in Ruhe und ohne ungebetene Gäste verlaufen.	Die müssen draußen bleiben! 🐝🦟	Produktanfrage starten!
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 232, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 232, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 1, true);


--
-- Name: components_contactaddress_contactaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.components_contactaddress_contactaddresses_id_seq', 4, true);


--
-- Name: components_contactaddress_contactformsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.components_contactaddress_contactformsettings_id_seq', 4, true);


--
-- Name: components_features_feature_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.components_features_feature_items_id_seq', 25, true);


--
-- Name: contact_forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.contact_forms_id_seq', 136, true);


--
-- Name: contactsections_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.contactsections_cmps_id_seq', 12, true);


--
-- Name: contactsections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.contactsections_id_seq', 4, true);


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.faqs_id_seq', 12, true);


--
-- Name: file_and_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.file_and_resources_id_seq', 5, true);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.files_id_seq', 83, true);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 242, true);


--
-- Name: hero_sections_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.hero_sections_cmps_id_seq', 40, true);


--
-- Name: hero_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.hero_sections_id_seq', 5, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: impressums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.impressums_id_seq', 5, true);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 20, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.products_id_seq', 46, true);


--
-- Name: products_product_category_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.products_product_category_lnk_id_seq', 72, true);


--
-- Name: sales_inquiries_contact_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.sales_inquiries_contact_lnk_id_seq', 122, true);


--
-- Name: sales_inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.sales_inquiries_id_seq', 118, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 41, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 37, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.tests_id_seq', 1, false);


--
-- Name: ueber_uns_x_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.ueber_uns_x_id_seq', 8, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 71, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 71, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: welcome_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.welcome_sections_id_seq', 16, true);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: components_contactaddress_contactaddresses components_contactaddress_contactaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_contactaddress_contactaddresses
    ADD CONSTRAINT components_contactaddress_contactaddresses_pkey PRIMARY KEY (id);


--
-- Name: components_contactaddress_contactformsettings components_contactaddress_contactformsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_contactaddress_contactformsettings
    ADD CONSTRAINT components_contactaddress_contactformsettings_pkey PRIMARY KEY (id);


--
-- Name: components_features_feature_items components_features_feature_items_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_features_feature_items
    ADD CONSTRAINT components_features_feature_items_pkey PRIMARY KEY (id);


--
-- Name: contact_forms contact_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contact_forms
    ADD CONSTRAINT contact_forms_pkey PRIMARY KEY (id);


--
-- Name: contactsections_cmps contactsections_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections_cmps
    ADD CONSTRAINT contactsections_cmps_pkey PRIMARY KEY (id);


--
-- Name: contactsections contactsections_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections
    ADD CONSTRAINT contactsections_pkey PRIMARY KEY (id);


--
-- Name: contactsections_cmps contactsections_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections_cmps
    ADD CONSTRAINT contactsections_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: faqs faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: file_and_resources file_and_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.file_and_resources
    ADD CONSTRAINT file_and_resources_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: hero_sections_cmps hero_sections_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections_cmps
    ADD CONSTRAINT hero_sections_cmps_pkey PRIMARY KEY (id);


--
-- Name: hero_sections hero_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections
    ADD CONSTRAINT hero_sections_pkey PRIMARY KEY (id);


--
-- Name: hero_sections_cmps hero_sections_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections_cmps
    ADD CONSTRAINT hero_sections_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: impressums impressums_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.impressums
    ADD CONSTRAINT impressums_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_product_category_lnk products_product_category_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_category_lnk
    ADD CONSTRAINT products_product_category_lnk_pkey PRIMARY KEY (id);


--
-- Name: products_product_category_lnk products_product_category_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_category_lnk
    ADD CONSTRAINT products_product_category_lnk_uq UNIQUE (product_id, product_category_id);


--
-- Name: sales_inquiries_contact_lnk sales_inquiries_contact_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries_contact_lnk
    ADD CONSTRAINT sales_inquiries_contact_lnk_pkey PRIMARY KEY (id);


--
-- Name: sales_inquiries_contact_lnk sales_inquiries_contact_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries_contact_lnk
    ADD CONSTRAINT sales_inquiries_contact_lnk_uq UNIQUE (sales_inquiry_id, contact_form_id);


--
-- Name: sales_inquiries sales_inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries
    ADD CONSTRAINT sales_inquiries_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: ueber_uns_x ueber_uns_x_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.ueber_uns_x
    ADD CONSTRAINT ueber_uns_x_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: welcome_sections welcome_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.welcome_sections
    ADD CONSTRAINT welcome_sections_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: contact_forms_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contact_forms_created_by_id_fk ON public.contact_forms USING btree (created_by_id);


--
-- Name: contact_forms_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contact_forms_documents_idx ON public.contact_forms USING btree (document_id, locale, published_at);


--
-- Name: contact_forms_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contact_forms_updated_by_id_fk ON public.contact_forms USING btree (updated_by_id);


--
-- Name: contactsections_component_type_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contactsections_component_type_idx ON public.contactsections_cmps USING btree (component_type);


--
-- Name: contactsections_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contactsections_created_by_id_fk ON public.contactsections USING btree (created_by_id);


--
-- Name: contactsections_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contactsections_documents_idx ON public.contactsections USING btree (document_id, locale, published_at);


--
-- Name: contactsections_entity_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contactsections_entity_fk ON public.contactsections_cmps USING btree (entity_id);


--
-- Name: contactsections_field_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contactsections_field_idx ON public.contactsections_cmps USING btree (field);


--
-- Name: contactsections_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX contactsections_updated_by_id_fk ON public.contactsections USING btree (updated_by_id);


--
-- Name: faqs_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX faqs_created_by_id_fk ON public.faqs USING btree (created_by_id);


--
-- Name: faqs_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX faqs_documents_idx ON public.faqs USING btree (document_id, locale, published_at);


--
-- Name: faqs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX faqs_updated_by_id_fk ON public.faqs USING btree (updated_by_id);


--
-- Name: file_and_resources_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX file_and_resources_created_by_id_fk ON public.file_and_resources USING btree (created_by_id);


--
-- Name: file_and_resources_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX file_and_resources_documents_idx ON public.file_and_resources USING btree (document_id, locale, published_at);


--
-- Name: file_and_resources_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX file_and_resources_updated_by_id_fk ON public.file_and_resources USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: hero_sections_component_type_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX hero_sections_component_type_idx ON public.hero_sections_cmps USING btree (component_type);


--
-- Name: hero_sections_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX hero_sections_created_by_id_fk ON public.hero_sections USING btree (created_by_id);


--
-- Name: hero_sections_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX hero_sections_documents_idx ON public.hero_sections USING btree (document_id, locale, published_at);


--
-- Name: hero_sections_entity_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX hero_sections_entity_fk ON public.hero_sections_cmps USING btree (entity_id);


--
-- Name: hero_sections_field_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX hero_sections_field_idx ON public.hero_sections_cmps USING btree (field);


--
-- Name: hero_sections_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX hero_sections_updated_by_id_fk ON public.hero_sections USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: impressums_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX impressums_created_by_id_fk ON public.impressums USING btree (created_by_id);


--
-- Name: impressums_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX impressums_documents_idx ON public.impressums USING btree (document_id, locale, published_at);


--
-- Name: impressums_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX impressums_updated_by_id_fk ON public.impressums USING btree (updated_by_id);


--
-- Name: product_categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX product_categories_created_by_id_fk ON public.product_categories USING btree (created_by_id);


--
-- Name: product_categories_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX product_categories_documents_idx ON public.product_categories USING btree (document_id, locale, published_at);


--
-- Name: product_categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX product_categories_updated_by_id_fk ON public.product_categories USING btree (updated_by_id);


--
-- Name: products_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX products_created_by_id_fk ON public.products USING btree (created_by_id);


--
-- Name: products_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX products_documents_idx ON public.products USING btree (document_id, locale, published_at);


--
-- Name: products_product_category_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX products_product_category_lnk_fk ON public.products_product_category_lnk USING btree (product_id);


--
-- Name: products_product_category_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX products_product_category_lnk_ifk ON public.products_product_category_lnk USING btree (product_category_id);


--
-- Name: products_product_category_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX products_product_category_lnk_oifk ON public.products_product_category_lnk USING btree (product_ord);


--
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX products_updated_by_id_fk ON public.products USING btree (updated_by_id);


--
-- Name: sales_inquiries_contact_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX sales_inquiries_contact_lnk_fk ON public.sales_inquiries_contact_lnk USING btree (sales_inquiry_id);


--
-- Name: sales_inquiries_contact_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX sales_inquiries_contact_lnk_ifk ON public.sales_inquiries_contact_lnk USING btree (contact_form_id);


--
-- Name: sales_inquiries_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX sales_inquiries_created_by_id_fk ON public.sales_inquiries USING btree (created_by_id);


--
-- Name: sales_inquiries_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX sales_inquiries_documents_idx ON public.sales_inquiries USING btree (document_id, locale, published_at);


--
-- Name: sales_inquiries_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX sales_inquiries_updated_by_id_fk ON public.sales_inquiries USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: tests_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX tests_created_by_id_fk ON public.tests USING btree (created_by_id);


--
-- Name: tests_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX tests_documents_idx ON public.tests USING btree (document_id, locale, published_at);


--
-- Name: tests_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX tests_updated_by_id_fk ON public.tests USING btree (updated_by_id);


--
-- Name: ueber_uns_x_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX ueber_uns_x_created_by_id_fk ON public.ueber_uns_x USING btree (created_by_id);


--
-- Name: ueber_uns_x_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX ueber_uns_x_documents_idx ON public.ueber_uns_x USING btree (document_id, locale, published_at);


--
-- Name: ueber_uns_x_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX ueber_uns_x_updated_by_id_fk ON public.ueber_uns_x USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: welcome_sections_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX welcome_sections_created_by_id_fk ON public.welcome_sections USING btree (created_by_id);


--
-- Name: welcome_sections_documents_idx; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX welcome_sections_documents_idx ON public.welcome_sections USING btree (document_id, locale, published_at);


--
-- Name: welcome_sections_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX welcome_sections_updated_by_id_fk ON public.welcome_sections USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: contact_forms contact_forms_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contact_forms
    ADD CONSTRAINT contact_forms_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: contact_forms contact_forms_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contact_forms
    ADD CONSTRAINT contact_forms_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: contactsections contactsections_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections
    ADD CONSTRAINT contactsections_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: contactsections_cmps contactsections_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections_cmps
    ADD CONSTRAINT contactsections_entity_fk FOREIGN KEY (entity_id) REFERENCES public.contactsections(id) ON DELETE CASCADE;


--
-- Name: contactsections contactsections_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contactsections
    ADD CONSTRAINT contactsections_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: faqs faqs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: faqs faqs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faqs
    ADD CONSTRAINT faqs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: file_and_resources file_and_resources_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.file_and_resources
    ADD CONSTRAINT file_and_resources_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: file_and_resources file_and_resources_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.file_and_resources
    ADD CONSTRAINT file_and_resources_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: hero_sections hero_sections_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections
    ADD CONSTRAINT hero_sections_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: hero_sections_cmps hero_sections_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections_cmps
    ADD CONSTRAINT hero_sections_entity_fk FOREIGN KEY (entity_id) REFERENCES public.hero_sections(id) ON DELETE CASCADE;


--
-- Name: hero_sections hero_sections_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.hero_sections
    ADD CONSTRAINT hero_sections_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: impressums impressums_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.impressums
    ADD CONSTRAINT impressums_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: impressums impressums_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.impressums
    ADD CONSTRAINT impressums_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: product_categories product_categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: product_categories product_categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products_product_category_lnk products_product_category_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_category_lnk
    ADD CONSTRAINT products_product_category_lnk_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_product_category_lnk products_product_category_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_category_lnk
    ADD CONSTRAINT products_product_category_lnk_ifk FOREIGN KEY (product_category_id) REFERENCES public.product_categories(id) ON DELETE CASCADE;


--
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: sales_inquiries_contact_lnk sales_inquiries_contact_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries_contact_lnk
    ADD CONSTRAINT sales_inquiries_contact_lnk_fk FOREIGN KEY (sales_inquiry_id) REFERENCES public.sales_inquiries(id) ON DELETE CASCADE;


--
-- Name: sales_inquiries_contact_lnk sales_inquiries_contact_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries_contact_lnk
    ADD CONSTRAINT sales_inquiries_contact_lnk_ifk FOREIGN KEY (contact_form_id) REFERENCES public.contact_forms(id) ON DELETE CASCADE;


--
-- Name: sales_inquiries sales_inquiries_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries
    ADD CONSTRAINT sales_inquiries_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: sales_inquiries sales_inquiries_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.sales_inquiries
    ADD CONSTRAINT sales_inquiries_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tests tests_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tests tests_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: ueber_uns_x ueber_uns_x_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.ueber_uns_x
    ADD CONSTRAINT ueber_uns_x_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: ueber_uns_x ueber_uns_x_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.ueber_uns_x
    ADD CONSTRAINT ueber_uns_x_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: welcome_sections welcome_sections_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.welcome_sections
    ADD CONSTRAINT welcome_sections_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: welcome_sections welcome_sections_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.welcome_sections
    ADD CONSTRAINT welcome_sections_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

