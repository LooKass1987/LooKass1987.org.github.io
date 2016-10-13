--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_type character varying,
    author_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE active_admin_comments OWNER TO exp;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_admin_comments_id_seq OWNER TO exp;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: agents; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE agents (
    id integer NOT NULL,
    active boolean DEFAULT false,
    role smallint DEFAULT 0,
    name character varying NOT NULL,
    email character varying,
    phone character varying,
    address character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE agents OWNER TO exp;

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agents_id_seq OWNER TO exp;

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE agents_id_seq OWNED BY agents.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO exp;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    published boolean DEFAULT false,
    published_at timestamp without time zone,
    banner character varying,
    header character varying NOT NULL,
    annotation text,
    content text NOT NULL,
    title character varying,
    keywords character varying(80),
    description character varying(80),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE articles OWNER TO exp;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO exp;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: attestats; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE attestats (
    id integer NOT NULL,
    active boolean DEFAULT false,
    status smallint DEFAULT 0,
    number character varying(32) NOT NULL,
    object text NOT NULL,
    issued_at date,
    closed_at date,
    customer_id integer,
    agent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE attestats OWNER TO exp;

--
-- Name: attestats_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE attestats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attestats_id_seq OWNER TO exp;

--
-- Name: attestats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE attestats_id_seq OWNED BY attestats.id;


--
-- Name: certificates; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE certificates (
    id integer NOT NULL,
    active boolean DEFAULT false,
    status smallint DEFAULT 0,
    number character varying(32) NOT NULL,
    object text NOT NULL,
    classifier character varying(32),
    classifier_code character varying(32),
    grouping character varying(32),
    issued_at date,
    closed_at date,
    customer_id integer,
    agent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE certificates OWNER TO exp;

--
-- Name: certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE certificates_id_seq OWNER TO exp;

--
-- Name: certificates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE certificates_id_seq OWNED BY certificates.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    active boolean DEFAULT false,
    name character varying NOT NULL,
    email character varying,
    phone character varying,
    address character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE customers OWNER TO exp;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO exp;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE partners (
    id integer NOT NULL,
    published boolean DEFAULT false,
    index integer DEFAULT 0,
    logotype character varying,
    name character varying NOT NULL,
    content text,
    phone character varying,
    email character varying,
    address character varying,
    website character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE partners OWNER TO exp;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partners_id_seq OWNER TO exp;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE partners_id_seq OWNED BY partners.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO exp;

--
-- Name: stages; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE stages (
    id integer NOT NULL,
    operate character varying(2),
    operate_at date NOT NULL,
    operation character varying,
    passed_at date,
    resource_type character varying,
    resource_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE stages OWNER TO exp;

--
-- Name: stages_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE stages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stages_id_seq OWNER TO exp;

--
-- Name: stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE stages_id_seq OWNED BY stages.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: exp; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_admin boolean DEFAULT false,
    in_staff boolean DEFAULT false,
    name character varying,
    phone character varying,
    address character varying
);


ALTER TABLE users OWNER TO exp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: exp
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO exp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: exp
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY agents ALTER COLUMN id SET DEFAULT nextval('agents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY attestats ALTER COLUMN id SET DEFAULT nextval('attestats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY certificates ALTER COLUMN id SET DEFAULT nextval('certificates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY partners ALTER COLUMN id SET DEFAULT nextval('partners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY stages ALTER COLUMN id SET DEFAULT nextval('stages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: exp
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: exp
--



--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 20, true);


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO agents VALUES (5, true, 1, 'Орган по аккредитации «НЦСС»', '', '', '', NULL, '2016-06-07 09:08:18.256565', '2016-06-15 10:50:42.489547');
INSERT INTO agents VALUES (4, true, 0, 'ОС «Современные Стандарты Качества - СМК»', '', '', '', NULL, '2016-06-07 09:08:18.249149', '2016-06-17 08:40:41.865909');
INSERT INTO agents VALUES (3, true, 0, 'ОС «НТЦ Система менеджмента качества»', '', '', '', NULL, '2016-06-07 09:08:18.241134', '2016-06-17 08:41:00.626646');
INSERT INTO agents VALUES (2, true, 0, 'ОС «ССК-сертификация»', '', '', '', NULL, '2016-06-07 09:08:18.23259', '2016-06-17 08:41:08.881042');
INSERT INTO agents VALUES (1, true, 0, 'ОС «Строительная экспертиза»', '', '', '', NULL, '2016-06-07 09:08:18.223353', '2016-06-17 08:41:19.408387');


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('agents_id_seq', 5, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO ar_internal_metadata VALUES ('environment', 'production', '2016-06-07 09:08:05.605291', '2016-06-07 09:08:05.605291');


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO articles VALUES (1, true, '2014-12-04 21:00:00', NULL, 'Сертифицированы тарельчатые дюбели от компании Tech-KREP (Тех-КРЕП)', NULL, '<p>Компанией Tech-KREP (Тех-КРЕП) в <em>Системе «НЦСС»</em> <b>получен сертификат соответствия</b> на дюбели тарельчатые марки LIR для крепления теплоизоляционных материалов производства ООО «ФОРМАПЛАСТ» (г. Чебоксары). Дюбели используются с полипропиленовыми и металлическими распорными элементами.</p>

<p><b>Сертификация</b> проведена органом по сертификации <em>«Строительная экспертиза»</em> в составе <em>ЗАО НИЦ «Строительная экспертиза»</em>.</p>

<p>Технические условия на дюбели тарельчатые марки LIR разработаны <em>ЗАО «Национальный центр сертификации и стандартизации»</em>.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.263187', '2016-06-07 09:08:15.263187');
INSERT INTO articles VALUES (2, true, '2014-12-09 21:00:00', NULL, 'ООО «ИНТРЕЙ Полимерные Системы» получило сертификат на сухие напольные смеси', '<p>ООО «ИНТРЕЙ Полимерные Системы» <b>получило сертификат</b> на сухие напольные смеси</p>', '<p>Орган по сертификации «Строительная экспертиза» в составе ЗАО НИЦ «Строительная экспертиза» (Система «НЦСС») провел <b>сертификацию смесей сухих напольных</b> Densitop Primer, Densitop MT, Densiphait производства ООО «ИНТРЕЙ Полимерные Системы».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.271669', '2016-06-07 09:08:15.271669');
INSERT INTO articles VALUES (3, true, '2014-12-24 21:00:00', NULL, 'Сертифицированы сухие смеси производства ООО «Сен-Гобен Строительная Продукция Рус»', NULL, '<p>ООО «Сен-Гобен Строительная Продукция Рус» <b>получило сертификаты соответствия</b> на следующие сухие смеси:
- клеевая вебер.ветонит оптима (weber.vetonit optima);
- клеевая вебер.ветонит изи фикс (weber.vetonit easy fix);
- клеевая вебер.ветонит абсолют (weber.vetonit absolut);
- напольная вебер.ветонит 4350 (weber.vetonit 4350);
- штукатурные вебер.ветонит ТТ (weber.vetonit ТТ),  вебер.ветонит ТТТ (weber.vetonit ТТ);
- шпаклевочная вебер.ветонит  ВХ Серая (weber.vetonit VH Grey);
- клеевая вебер.ветонит  блок (weber.vetonit block).
<b>Сертификация</b> проведена органом по сертификации <em>«Строительная экспертиза»</em> (<em>Система «НЦСС»</em>).</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.282129', '2016-06-07 09:08:15.282129');
INSERT INTO articles VALUES (4, true, '2015-01-11 21:00:00', NULL, 'Утвержден новый стандарт на стальные бесшовные горячедеформированные трубы', '<p>Утвержден <b>новый стандарт</b> на стальные бесшовные горячедеформированные трубы</p>', '<p>1 января 2016 года в Российской Федерации вводится в действие для добровольного применения в качестве национального стандарта ГОСТ 32528-2013 «Трубы стальные бесшовные горячедеформированные. Технические условия». Действие стандарта ГОСТ Р 53383-2009 «Трубы стальные бесшовные горячедеформированные. Технические условия» отменяется.</p>

<p>Новый стандарт будет способствовать выполнению целей межгосударственной стандартизации и единообразному пониманию требований к качеству и к условиям эксплуатации данного вида труб.</p>

<p>Стандарт разработан РосНИТИ.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.289547', '2016-06-07 09:08:15.289547');
INSERT INTO articles VALUES (5, true, '2015-01-13 21:00:00', NULL, 'Квоты на привлечение иностранной рабочей силы в строительстве больше выдаваться не будут', NULL, '<p>В отношении иностранных работников в Российской Федерации с 2015 года вводится практика получения патентов, дающих право на осуществление трудовой деятельности, самими иностранными работниками. Изменения коснутся граждан бывших советских республик, с которыми у РФ заключено соглашение о безвизовом въезде.</p>

<p>Для оформления трудовых патентов Правительством Москвы открыто ГБУ "Многофункциональный миграционный центр", являющееся единым специализированным учреждением региона, предоставляющим полный комплекс услуг по получению патента: тестирование на знание языка, оформление медицинской страховки, оплата пошлины в расположенном здесь же отделении банка.</p>

<p>С 2015 года въезд в Российскую Федерацию по внутренним паспортам и иным удостоверениям личности, прекращен. Теперь в пределы России можно въехать только по заграничным паспортам иностранных государств.</p>

<p>Выдача квот строительным организациям, работающим в Москве, прекращена в связи с изменением федерального законодательства. </p>

<p>Субъектам Российской Федерации предоставлено право приостановки выдачи патентов с учетом воздействия социальных и иных факторов, определяющих потребность в иностранной рабочей силе на территории региона.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.296877', '2016-06-07 09:08:15.296877');
INSERT INTO articles VALUES (6, true, '2015-01-13 21:00:00', NULL, 'Заработал сайт программы «Жилье для российской семьи»', NULL, '<p>Появился собственный сайт у программы «Жилье для российской семьи».</p>

<p>Сайт <a href="http://xn----7sbaks7aamikcgn.xn--p1ai/">http://программа-жрс.рф</a> - единая информационная площадка для органов государственной власти, застройщиков и граждан, желающих приобрести жилье в рамках программы.</p>

<p>На сайте расположена информация о стадиях реализации программы в том или ином субъекте РФ, здесь можно ознакомиться с информацией по каждому проекту жилищного строительства в регионах, представлены контактные данные отдельных застройщиков и организаций, ответственных за ведение сводных реестров граждан-участников программы. Информация будет регулярно актуализироваться.</p>

<p>Предусмотрена возможность обратной связи, позволяющей направить уточняющий вопрос, связанный с реализацией программы. Ответы на наиболее часто задаваемые вопросы будут размещены на сайте.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.303796', '2016-06-07 09:08:15.303796');
INSERT INTO articles VALUES (7, true, '2015-01-14 21:00:00', NULL, 'Использование 3-D проектирования в промышленном и гражданском строительстве', NULL, '<p>Министерство строительства и жилищно-коммунального хозяйства РФ начало выполнение Плана внедрения технологий информационного моделирования зданий (BIM – BuildingInformationModeling) в области промышленного и гражданского строительства.</p>

<p>Выполнение данного Плана внедрения технологии BIM позволит повысить конкурентоспособность отечественного строительного комплекса на мировом рынке, повысить качество изысканий, проектирования и строительства объектов, снизить себестоимость на этапах проектирования и экспертизы проектной документации, снизить риски возникновения чрезвычайных ситуаций.</p>

<p>План внедрения технологии BIM разработан Экспертным советом при Правительстве Российской Федерации совместно с Росстандартом, утвержден приказом Минстроя России № 926/пр от 29 декабря 2014 года.</p>

<p>Экспертный совет при Правительстве РФ завершит отбор «пилотных» проектов к марту 2015 года.</p>

<p>Проведение экспертизы отобранных «пилотных» проектов с целью установления требований, необходимых для применения технологий BIM, намечено на ноябрь 2015 года.</p>

<p>По итогам проведенного анализа Минстрой России в конце 2015 года подготовит и направит в Правительство РФ перечень образовательных стандартов, нормативно-технических и правовых актов, подлежащих изменению и разработке.</p>

<p>К концу 2017 года планируется подготовить специалистов по использованию технологий информационного моделирования и экспертов органов экспертизы.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.310601', '2016-06-07 09:08:15.310601');
INSERT INTO articles VALUES (8, true, '2015-01-15 21:00:00', NULL, 'Новый стандарт устанавливает требования к оценке воздействия шума на работников', NULL, '<p>1 ноября 2015 года в Российской Федерации вводится в действие для добровольного применения в качестве национального стандарта ГОСТ 12.1.003–2014 «Система стандартов безопасности труда. Шум. Общие требования безопасности». С вводом в действие указанного стандарта отменяется действие стандартов ГОСТ 12.1.003–83 «Шум. Общие требования безопасности» (с Изм. N 1), действовавшего с 1988 года и ГОСТ 12.1.023–80 «Шум. Методы установления значений шумовых характеристик стационарных машин» (с Изм. N 1, 2)</p>

<p>Стандарт устанавливает принципы обеспечения безопасности и сохранения здоровья работников при воздействии на них шума в нормальных условиях рабочего процесса и общие требования к оценке этого воздействия.</p>

<p>Стандарт рекомендован к применению национальными органами, отвечающими за гигиеническое нормирование шума, при установлении гигиенических нормативов и методов, подтверждающих их соблюдение, надзорными органами и контролирующими организациями, работодателями, производителями машин и оборудования производственного назначения, а также производителями средств коллективной и индивидуальной защиты от шума.</p>

<p>Проект стандарта был разработан ОАО «НИЦ КД».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.318001', '2016-06-07 09:08:15.318001');
INSERT INTO articles VALUES (9, true, '2015-01-16 21:00:00', NULL, 'Утвержден новый ГОСТ на правила оформления национальных стандартов', NULL, '<p>1 июля 2015 года в Российской Федерации вводится в действие для добровольного применения в качестве национального стандартаГОСТ Р 1.7 – 2014 «Стандартизация в Российской Федерации. Стандарты национальные. Правила оформления и обозначения при разработке на основе применения международных стандартов». С вводом в действие указанного стандарта отменяется действие национального стандарта Российской Федерации ГОСТ Р 1.7 – 2008 «Стандартизация в Российской Федерации. Стандарты национальные Российской Федерации. Правила оформления и обозначения при разработке на основе применения международных стандартов».</p>

<p>Отдельные правила нового стандарта могут быть применены при разработке стандартов организаций.</p>

<p>Стандарт разработан ФГУП «ВНИИНМАШ».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.325576', '2016-06-07 09:08:15.325576');
INSERT INTO articles VALUES (10, true, '2015-01-17 21:00:00', NULL, 'Утвержден новый перечень национальных стандартов и сводов правил', NULL, '<p>Взамен ранее действовавшему Постановлению Правительства РФ от 21.06.2010 № 1047-р утвержден Постановлением Правительства РФ от 26.12.2014№ 1521 новый перечень национальных стандартов и сводов правил. В перечне определены положения национальных стандартов и сводов правил, содержащие минимально необходимые требования для обеспечения безопасности зданий и сооружений.</p>

<p>Новый перечень вступает в силу с 1 июля 2015 года. До этого времени проектная документация, представленная на экспертизу, будет проверяться на соответствие национальным стандартам и сводам правил, включенным в перечень, утвержденный распоряжением Правительства РФ от 21.06.2010 № 1047-р.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.334867', '2016-06-07 09:08:15.334867');
INSERT INTO articles VALUES (11, true, '2015-01-18 21:00:00', NULL, 'Новый горнолыжный парк будет построен на берегу реки Сходня', NULL, '<p>На берегу реки Сходня, в деревне Верескино Молжаниновского района Северного округа Москвы, будет построен горнолыжный парк площадью 1 тысяча кв. метров. Площадь участка 38,7 га. Одновременно здесь смогут отдыхать до 400 человек.</p>

<p>На территории парка разместятся сервис-центр, административный корпус и ангар. Въезд на территорию спортивного комплекса будет располагаться с южной стороны от Новосходненского шоссе, на прилегающей территории будет организована парковка на 500 машиномест.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.341968', '2016-06-07 09:08:15.341968');
INSERT INTO articles VALUES (12, true, '2015-01-19 21:00:00', NULL, 'Весной 2015 года возле Кремля начнется Строительство парка «Зарядье»', NULL, '<h1>Весной этого года на месте снесенной гостиницы «Россия» начнется строительство парка «Зарядье».</h1>

<h1>На территории парка будут размещены медиапавильоны «Заповедное посольство», «Ледяная пещера», выставочный комплекс, рестораны и кафе, магазины сувениров, смотровая площадка с выходом к Моске-реке.</h1>

<h1>Парк будет состоять из четырех ландшафтно-климатических зон, спускающихся террасами от северо-восточной части парка к юго-западной.</h1>

<h1>Завершение строительства парка планируется в 2017 году.</h1>

<p><b>несколько микрорайонов на Юго-востоке Москвы.</b></p>', NULL, NULL, NULL, '2016-06-07 09:08:15.349356', '2016-06-07 09:08:15.349356');
INSERT INTO articles VALUES (13, true, '2015-01-20 21:00:00', NULL, 'Весной 2015 года возле Кремля начнется Строительство парка «Зарядье»', NULL, '<h1>Весной этого года на месте снесенной гостиницы «Россия» начнется строительство парка «Зарядье».</h1>

<h1>На территории парка будут размещены медиапавильоны «Заповедное посольство», «Ледяная пещера», выставочный комплекс, рестораны и кафе, магазины сувениров, смотровая площадка с выходом к Моске-реке.</h1>

<h1>Парк будет состоять из четырех ландшафтно-климатических зон, спускающихся террасами от северо-восточной части парка к юго-западной.</h1>

<h1>Завершение строительства парка планируется в 2017 году.</h1>', NULL, NULL, NULL, '2016-06-07 09:08:15.35681', '2016-06-07 09:08:15.35681');
INSERT INTO articles VALUES (14, true, '2015-01-21 21:00:00', NULL, 'Весной 2015 года возле Кремля начнется Строительство парка «Зарядье»', NULL, '<p>Весной этого года на месте снесенной гостиницы «Россия» начнется строительство парка «Зарядье».</p>

<h1>На территории парка будут размещены медиапавильоны «Заповедное посольство», «Ледяная пещера», выставочный комплекс, рестораны и кафе, магазины сувениров, смотровая площадка с выходом к Моске-реке.</h1>

<h1>Парк будет состоять из четырех ландшафтно-климатических зон, спускающихся террасами от северо-восточной части парка к юго-западной.</h1>

<h1>Завершение строительства парка планируется в 2017 году.</h1>', NULL, NULL, NULL, '2016-06-07 09:08:15.36416', '2016-06-07 09:08:15.36416');
INSERT INTO articles VALUES (15, true, '2015-01-22 21:00:00', NULL, 'Строительство Алабяно-Балтийского тоннеля завершено', NULL, '<p>Строительство Алабяно-балтийского тоннеля, начатое в 2007 году от станции метро «Сокол», завершено. Сейчас оформляется документация для его ввода в эксплуатацию.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.38327', '2016-06-07 09:08:15.38327');
INSERT INTO articles VALUES (16, true, '2015-01-23 21:00:00', NULL, 'Утверждены новые стандарты в сфере оборудования для дуговой сварки', NULL, '<p>1 января 2016 года в Российской Федерации вводятся в действие для добровольного применения в качестве национальный стандартов:</p>

<p>- <b>ГОСТ IEC 60974-2–2014 «Оборудование для дуговой сварки. Часть 2. Системы жидкостного охлаждения»</b>, идентичный международному стандарту IEC 60974-2:2013 «Оборудование для дуговой сварки. Часть 2. Системы жидкостного охлаждения» - устанавливает требования к системам жидкостного охлаждения, используемых в промышленной и профессиональной дуговой сварке и родственных процессах для охлаждения частей оборудования, в т.ч. сварочных горелок и определяет требования к конструкции и требования безопасности;</p>

<p>- <b>ГОСТ IEC 60974-3–2014 «Оборудование для дуговой сварки. Часть 3. Устройства зажигания и стабилизации дуги»</b>, идентичный международному стандарту IEC 60974-3:2013 «Оборудование для дуговой сварки. Часть 3. Средства зажигания дуги и стабилизаторы» - определяет требования безопасности для промышленных и профессиональных устройств зажигания и стабилизации дуги, используемых в дуговой сварке и родственных процессах;</p>

<p>- <b>ГОСТ IEC 60974-5–2014 «Оборудование для дуговой сварки. Часть 5. Механизм подачи проволоки»</b>, идентичный международному стандарту IEC 60974-5:2013 «Оборудование для дуговой сварки. Часть 5. Механизмы подачи проволоки» - устанавливает требования к эксплуатационным характеристикам и к безопасности промышленного и профессионального оборудования, предназначенного для подачи сварочной проволоки и используемого при дуговой сварке и родственных процессах;</p>

<p>- <b>ГОСТ IEC 60974-8–2014 «Оборудование для дуговой сварки. Часть 8. Пульты подачи газа для сварочных систем и систем плазменной резки»</b>, идентичный международному стандарту IEC 60974-8:2009 «Оборудование для дуговой сварки. Часть 8. Пульты подачи газа для сварочных систем и систем плазменной резки» - устанавливает требования к безопасности и эксплуатационным характеристикам устройств (пультов) подачи газов предназначенных для использования горючих газов или кислорода;</p>

<p><b>- </b><b>ГОСТ IEC 60974-11–2014 «Оборудование для дуговой сварки. Часть 11. Электрододержатели»</b>, идентичный международному стандарту IEC 60974-11:2010 «Оборудование для дуговой сварки. Часть 11. Электрододержатели» - определяет требования к безопасности и к рабочим характеристикам электрододержателей.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.390821', '2016-06-07 09:08:15.390821');
INSERT INTO articles VALUES (17, true, '2015-01-24 21:00:00', NULL, 'Новые сертификаты ООО «Сен-Гобен Строительная Продукция Рус»', NULL, '<p>Расширена номенклатура сертифицированной продукции производства ООО «Сен-Гобен Строительная Продукция Рус»:</p>

<p>- смесь сухая ремонтная вебер.ветонит С06 (weber.vetonit S06);</p>

<p>- смесь сухая напольная вебер.ветонит 5700 (weber.vetonit 5700);</p>

<p>- смесь сухая шпаклевочная вебер.ренд фасад зима белый (weber.rend facade winter white).</p>

<p>Сертификация проведена в Системе «НЦСС» органом по сертификации «Строительная экспертиза» в составе ЗАО НИЦ «Строительная экспертиза».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.398373', '2016-06-07 09:08:15.398373');
INSERT INTO articles VALUES (18, true, '2015-01-25 21:00:00', NULL, 'Для управляющих компаний введены жесткие требования', NULL, '<p>20 января 2015 года Правительство Москвы приняло решение создать комиссию по лицензированию деятельности управляющих компаний. Комиссия начинает свою работу с 1 мая 2015 года.</p>

<p>В соответствии с постановлением Правительства Москвы комиссия наделяется рядом полномочий, в числе которых принятие квалификационного экзамена у физических лиц, принятие решения о выдаче лицензии на осуществление деятельности, принятие решения об обращении в суд с заявлением об ее аннулировании, участие в мероприятиях по лицензионному контролю. Организационно-техническое обеспечение деятельности комиссии будет осуществлять жилищная инспекция.</p>

<p>Первым этапом работы комиссии будет проведение экзамена у руководителей управляющих компаний. Наличие квалификационного аттестата является обязательным условием для получения лицензии на право управления домами. График проведения экзаменов утвержден, подготовлена материальная база для приема экзаменов и работы, связанной с заключением контрактов.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.40518', '2016-06-07 09:08:15.40518');
INSERT INTO articles VALUES (34, true, '2015-02-17 21:00:00', NULL, 'Жилищное строительство из бюджета Москвы', NULL, '<p>За счет бюджета города планируется построить 140 жилых домов в период с 2015 по 2017 годы.</p>

<p>Планируемый объем: в 2015 году – 64 объекта, в 2016 году – 47 объектов, в 2017 году – 29 объектов. Общая площадь составит более 2-х миллионов квадратных метров.</p>

<p>В муниципальных домах будут предусмотрены квартиры для маломобильных групп граждан и многодетных семей. Строительство подобных домов и формирование безбарьерной среды в городе являются одной из приоритетных задач Правительства Москвы.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.529942', '2016-06-07 09:08:15.529942');
INSERT INTO articles VALUES (19, true, '2015-01-26 21:00:00', NULL, 'Новый микрорайон будет построен в Митино', NULL, '<p>Правительством Москвы утвержден проект планировки части территории 2-го микрорайона района Митино. Площадь территории проектирования составляет 26,36 гектара</p>

<p>На данном участке появится комплексная жилая застройка, школа на 550 мест, детский сад на 300 мест, физкультурно-оздоровительный комплекс многоуровневый гараж-стоянка на 2657 машиномест. Будут сохранены два много квартирных дома и нежилая застройка, завершится строительство трех многоквартирных домов с подземным паркингом и многофункционального общественно-делового центра с подземным паркингом на 1370 машиномест.</p>

<p>Новое строительство на проектируемой территории будет вестись на внебюджетные средства.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.413953', '2016-06-07 09:08:15.413953');
INSERT INTO articles VALUES (20, true, '2015-01-27 21:00:00', NULL, 'Реконструкция здания Политехнического музея', NULL, '<p>Работы по реконструкции и реставрации здания Политехнического музея с сохранением исторического облика здания начаты в декабре 2013 года. Проект называется «Классический музей» и включает в себя Большую аудиторию на 700 мест, «Галерею материи», «Галерею энергии», «Галерею информации», химическую лабораторию и ряд других музейных отделов.</p>

<p>К началу 2015 года завершен демонтаж конструкций и противоаварийные мероприятия. Укрепление фундамента и реставрация фасадов и интерьеров завершатся в 2016 году. В 2018 году планируется завершить все работы по реконструкции и реставрации здания.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.420965', '2016-06-07 09:08:15.420965');
INSERT INTO articles VALUES (21, true, '2015-01-28 21:00:00', NULL, 'Комплексная застройка в промзоне «Верхние Котлы»', NULL, '<p>На юге Москвы на территории ЗАО «Котельский завод» планируется строительство жилого микрорайона на 3162 жителя с объектами социальной инфраструктуры – ДОУ на 35 мест и на 165 мест, амбулаторно-поликлинический кабинет на 56 посещений в смену, начальная школа на 350 мест.</p>

<p>Сейчас ведется строительство 2 жилых домов общей площадью около 97 тыс. кв. м, один дом общей площадью 32 тыс. кв. м уже введен в эксплуатацию.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.427829', '2016-06-07 09:08:15.427829');
INSERT INTO articles VALUES (22, true, '2015-01-29 21:00:00', NULL, 'Завершена проходка перегонного тоннеля от электродепо «Лихоборы» до станции «Окружная»', NULL, '<p>За 14 месяцев ОАО «Метрострой» с помощью тоннелепроходческого комплекса (ТПМК) фирмы «Herrenknecht» (Германия) построил перегонный тоннель длиной 3025 метров от строящегося электродепо «Лихоборы» до станции «Окружная».</p>

<p>ТПМК работал на глубине 65 метров в грунтах разной крепости, водонасыщенности и пластичности. ТПМК имеет внешний диаметр 6 метров, оснащен грунтопригрузом и наиболее приспособлен для проходки тоннелей в сложных гидрогеологических условиях.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.437025', '2016-06-07 09:08:15.437025');
INSERT INTO articles VALUES (23, true, '2015-02-01 21:00:00', NULL, 'Новые жилые корпуса для студентов Московской консерватории', NULL, '<p>На Малой Грузинской улице началось строительство студенческого городка Московской консерватории им. П.И. Чайковского.</p>

<p>В состав студенческого городка будут входить три высотных корпуса с общежитием на 900 мест, репетитории, актовый зал на 200 мест, киноконцертный зал на 250 мест, бассейн, спортивный комплекс, баня, медицинский блок, столовая, кафе. Предусмотрен подземный паркинг на 90 автомобилей и 150 велосипедов.</p>

<p>Оформление окон жилых блоков будет напоминать клавиатуру аккордеона, фасад стилобатной части – клавиатуру рояля.</p>

<p>В 2017 году планируется закончить строительство.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.44393', '2016-06-07 09:08:15.44393');
INSERT INTO articles VALUES (24, true, '2015-02-02 21:00:00', NULL, 'Одной пятиэтажкой стало меньше', NULL, '<p>В соответствии с программой сноса пятиэтажных домов первого периода индустриального строения по адресу ул. Стандартная, д. 29 снесена очередная пятиэтажка серии II-32.</p>

<p>Ожидают сноса еще 218 домов. Всего в рамках программы снесено 1504 дома общей площадью 5554,0 кв. м.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.450931', '2016-06-07 09:08:15.450931');
INSERT INTO articles VALUES (25, true, '2015-02-03 21:00:00', NULL, '«Лужники» и Воробьевы горы соединит канатная дорога', NULL, '<p>Спортивный комплекс «Лужники» и смотровую площадку на Воробьевых горах соединит канатная дорога. Проект реализуется в рамках подготовки к Чемпионату мира по футболу 2018 года. В настоящее время установлены опоры канатной дороги на Воробьевых горах.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.460458', '2016-06-07 09:08:15.460458');
INSERT INTO articles VALUES (35, true, '2015-02-19 21:00:00', NULL, 'Сокращение количества несчастных случаев', NULL, '<p>На коллегии Стройкомплекса  заместитель мэра Москвы в Правительстве Москвы Марат Хуснуллин сообщил, что количество несчастных случаев на стройках Москвы ежегодно сокращается.</p>

<p>Травматизм на стройплощадках сократился за последние два года на 13,5 %, смертельные случаи – на 33%.</p>

<p>В результате усиления контроля при постоянном увеличении объемов строительства количество несчастных случаев снижается.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.538894', '2016-06-07 09:08:15.538894');
INSERT INTO articles VALUES (26, true, '2015-02-04 21:00:00', NULL, 'Введены в действие межгосударственные стандарты на автомобильные дороги', NULL, '<p>1 июля 2015 года в Российской Федерации вводятся в действие (с правом досрочного применения) для добровольного применения в качестве национальных стандартов:</p>

<p>- <b>ГОСТ 32820-2014</b> «Дороги автомобильные общего пользования. Щебень и песок шлаковые. Определение активности шлаков»;</p>

<p>- <b>ГОСТ 32824-2014</b> «Дороги автомобильные общего пользования. Песок природный. Технические требования»;</p>

<p>- <b>ГОСТ 32825-2014</b> «Дороги автомобильные общего пользования. Дорожные покрытия. Методы измерения геометрических размеров повреждений».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.469593', '2016-06-07 09:08:15.469593');
INSERT INTO articles VALUES (27, true, '2015-02-05 21:00:00', NULL, 'Метро в Солнцево', NULL, '<p>В 2017 году закончится прокладка линии метро в Солнцево и Новопеределкино. Строительство западного участка Калининско-Солнцевской линии метро началось в 2012 году. В начале 2014 года открыт первый участок линии, второй участок будет завершен в 2016 году, третий – в 2017 году. В перспективе линия метро может протянуться до аэропорта Внуково.</p>

<p>Открытие Калининско-Солнцевской повысит комфорт транспортного обслуживания жителей районов Раменки, Очаково-Матвеевске, Проспекта Вернадского, Тропарево-Никулино, Новопеределкино, Солнцево, поселений Московское и Внуково.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.476674', '2016-06-07 09:08:15.476674');
INSERT INTO articles VALUES (28, true, '2015-02-06 21:00:00', NULL, 'Бетонирование эстакады на пересечении МКАД и Ленинского проспекта завершено', NULL, '<p>Завершено бетонирование эстакады  путепровода на дублере МКАД с внешней стороны. Работы проводятся ОАО «Московская инженерно-строительная компания» (ОАО «МИСК»). В настоящее время продолжаются работы по устройству съезда с эстакады.</p>

<p>Реализация данного проекта улучшит движение транспорта в районе 44 – 45-го километров МКАД и создаст благоприятные условия движения транспорта по Киевскому шоссе в сторону аэропорта Внуково.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.48376', '2016-06-07 09:08:15.48376');
INSERT INTO articles VALUES (29, true, '2015-02-08 21:00:00', NULL, 'Реконструкция трамплина на Воробьевых горах', NULL, '<p>Построенный в 1953 году по проекту инженера Галли, трамплин на Воробьевых горах будет реконструирован в 2018 году.</p>

<p>Трамплин находится в удовлетворительном состоянии, но морально устарел. В процессе реконструкции будет подправлена гора разгона, увеличен участок приземления и установлен лифт.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.491226', '2016-06-07 09:08:15.491226');
INSERT INTO articles VALUES (30, true, '2015-02-09 21:00:00', NULL, 'Выполнение программы сноса пятиэтажек', NULL, '<p>Снести все пятиэтажки в Северном административном округе в рамках программы сноса пятиэтажных, ветхих и аварийных жилых домов планирует Департамент строительства города Москвы. По программе планировалось снести в САО 338 домов. В настоящее время план выполнен на 94%.</p>

<p>Полностью программа сноса выполнена в Зеленоградском, Центральном и Южном административных округах.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.498062', '2016-06-07 09:08:15.498062');
INSERT INTO articles VALUES (31, true, '2015-02-10 21:00:00', NULL, 'Введена в эксплуатацию тепловая станция «Некрасовка»', NULL, '<p>Заработала на полную мощность тепловая станция «Некрасовка», расположенная по адресу 2-я Вольская улица, владение 17. Станция будет обеспечивать теплом поселок Некрасовка и несколько микрорайонов на Юго-востоке Москвы.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.504923', '2016-06-07 09:08:15.504923');
INSERT INTO articles VALUES (32, true, '2015-02-12 21:00:00', NULL, 'Снос пятиэтажки в ЮЗАО', NULL, '<p>Начался снос пятиэтажки по адресу: ул. Марии Ульяновой, 29, в Юго-Западном округе. Пятиэтажка серии II-07, возводившейся в 1958-1961 годах.</p>

<h1>Жители получили квартиры в том же районе. Территория после сноса будет благоустроена.</h1>

<p>Программа сноса ветхого жилья в ЮЗАО выполнена на 90%.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.51584', '2016-06-07 09:08:15.51584');
INSERT INTO articles VALUES (33, true, '2015-02-15 21:00:00', NULL, 'Центр для мигрантов в Царицыно закроют', NULL, '<p>Жители Царицыно недовольны криминальной обстановкой в районе. Это связано с Центром тестирования мигрантов, расположенным в Царицыно. По многочисленным обращениям жителей района Мэр Москвы поручил закрыть Центр.</p>

<p>Центр начал свою работу в январе 2015 года. Рядом с ним находится школа, во дворе которой в большом количестве собираются мигранты. Жители жалуются на не соблюдение мигрантами элементарных санитарных норм.</p>

<p>Учитывая тот факт, что численность мигрантов в данном месте очень высока, Сергей Собянин дал поручение до конца марта закрыть центр тестирования в качестве меры по устранению различных неудобств, которые испытывают местные жители.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.522893', '2016-06-07 09:08:15.522893');
INSERT INTO articles VALUES (36, true, '2015-02-20 21:00:00', NULL, 'Статус жилых помещений для апартаментов', NULL, '<p>Заместитель мэра Москвы по градостроительной политике и строительству Марат Хуснуллин по итогам коллегии Стройкомплекса сообщил, что властями Москвы рассматривается возможность приравнять апартаменты к жилью. </p>

<p>Приравнивание позволит получить прозрачных механизм реализации таких объектов – люди будут понимать, что они приобретают полноценное жилье, а не покупают только право аренды в каком-то объекте.</p>

<p>Необходимые поправки в федеральное законодательство представлены в Минстрой России.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.546065', '2016-06-07 09:08:15.546065');
INSERT INTO articles VALUES (37, true, '2015-02-23 21:00:00', NULL, 'Доступность зданий и сооружений для маломобильных граждан', NULL, '<p>Свод правил «Доступность зданий и сооружений для маломобильных групп населения» с 1 июля 2015 года станет обязательным к применению при проектировании и строительстве капитальных сооружений.</p>

<p>Документ обсуждался с общественными организациями инвалидов, учитывались их предложения и замечания.</p>

<p>Минстрой совместно с Минобрнауки России прорабатывает вопрос подготовки кадров для проектирования и строительства зданий с учетом требований доступности для инвалидов.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.556073', '2016-06-07 09:08:15.556073');
INSERT INTO articles VALUES (38, true, '2015-02-25 21:00:00', NULL, 'Строительство кабельного коллектора «Бабушкин» завершено', NULL, '<p>На территории Северо-восточного административного округа Москвы завершено строительство кабельного коллектора «Бабушкин». Коллектор проложен от подстанции «Бабушкин» по Енисейской улице и далее проходит в двух направлениях – в сторону ул. Менжинского и в сторону ул. Широкой, после ул. Широкой – до перекрестка с ул. Грекова.</p>

<p>Глубина заложения коллектора колеблется от 2,6 метра до 17,3 метра. Проходка проводилась с помощью мини-щита. В сутки щит прокладывал до 10 метров.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.567446', '2016-06-07 09:08:15.567446');
INSERT INTO articles VALUES (39, true, '2015-02-26 21:00:00', NULL, 'Строительство магазина отменено', NULL, '<p>Мэр Москвы на заседании Градостроительно-земельной комиссии Москвы принял решение отменить строительство в Керамическом проезде района Восточное Дегунино магазина «Пятерочка» по причине возражения жителей.</p>

<p>В 11-м и 12-м микрорайонах Куркино также прекращена реализация инвестиционных проектов. На месте предполагаемого многофункционального комплекса, магазина и других объектов Мэр Москвы поручил префектурам округов провести озеленение и благоустройство территорий.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.577748', '2016-06-07 09:08:15.577748');
INSERT INTO articles VALUES (40, true, '2015-02-27 21:00:00', NULL, 'Строительство опор Коптевского путепровода', NULL, '<p>Начато возведение опор эстакады Коптевского автотранспортного путепровода. Проводятся работы по сооружению промежуточных опор и возведению подпорных стен. Завершается переустройство сетей связи. В близлежащих домах окна заменены на шумозащитные оконные блоки.</p>

<p>В соответствии с проектом проводится переустройство существующих инженерных сетей: дождевой канализации, уличного освещения, электропитания, водопровода, газопровода, теплосети.</p>

<p>В конце 2015 года будет закончено строительство нового путепровода и демонтирован существующий.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.585515', '2016-06-07 09:08:15.585515');
INSERT INTO articles VALUES (41, true, '2015-03-02 21:00:00', NULL, 'Новые стандарты на стекло', NULL, '<p>1 января 2016 года в Российской Федерации вводятся в действие для добровольного применения межгосударственные стандарты на стекло строительного, технического и бытового назначения:</p>

<p>- <b>ГОСТ 111-2014 «Стекло листовое бесцветное. Технические условия»</b> разработан взамен ГОСТ 111–2001 «Стекло листовое. Технические условия»;</p>

<p>- <b>ГОСТ 32997–2014 «Стекло листовое, окрашенное в массе. Общие технические условия»</b>;</p>

<p>- <b>ГОСТ ISO 16932–2014 «Стекло и изделия из него. Защитное остекление, стойкое к воздействию бурь. Метод испытания и классификация»</b>. Стандарт идентичен международному стандарту ISO 16932:2007 «Стекло в строительстве. Защитное остекление, стойкое к воздействию бурь. Испытание и классификация».</p>

<p>- <b>ГОСТ EN 675–2014 «Стекло и изделия из него. Методы определения тепловых характеристик. Определение сопротивления теплопередаче методом измерения теплового потока»</b>. ГОСТ идентичен европейскому региональному стандарту EN 675:2011 «Стекло в строительстве. Определение коэффициента теплопередачи (величины U). Метод измерения теплового потока».</p>

<p>Стандарты разработаны ОАО «Институт стекла» с целью обеспечения содействия соблюдению требований технического регламента (ТР ТС) «О безопасности зданий и сооружений, строительных материалов и изделий».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.597069', '2016-06-07 09:08:15.597069');
INSERT INTO articles VALUES (42, true, '2015-03-04 21:00:00', NULL, 'Стандартизация энергоэффективного жилья', NULL, '<p>Комитет Государственной думы РФ по жилищной политике и жилищно-коммунальному хозяйству предложил разработать стандарты по возведению энергоэффективного жилья.</p> <p>Стандарты коснутся в первую очередь домов, строящихся в рамках государственных и региональных программ.</p> <p>Практика показывает, что увеличение затрат на проведение энергосберегающих мероприятий при проектировании и строительстве здания компенсируется в начальный период его эксплуатации. Эксплуатационные расходы, оплачиваемые жителями, включая стоимость жилищно-коммунальных услуг, в энергоэффективных домах ниже, чем в обычных.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.6044', '2016-06-07 09:08:15.6044');
INSERT INTO articles VALUES (43, true, '2015-03-06 21:00:00', NULL, 'Стандарты на аппаратуру ГЛОНАСС', NULL, '<p>1 июля 2015 года в Российской Федерации вводятся в действие для добровольного применения стандарты, относящиеся к сфере применения ГЛОНАСС:</p>

<p>- <b>ГОСТ «Глобальная навигационная спутниковая система. Аппаратура спутниковой навигации для оснащения колесных транспортных средств категории М, используемых для коммерческих перевозок пассажиров. Общие технические требования»</b> устанавливает общие технические требования к аппаратуре спутниковой навигации, устанавливаемой на транспортные средства категории M;</p>

<p>- <b>ГОСТ «Глобальная навигационная спутниковая система. Аппаратура спутниковой навигации для оснащения колесных транспортных средств. Методы функционального тестирования»</b> устанавливает методы функционального тестирования аппаратуре спутниковой навигации, устанавливаемой на транспортные средства категории M;</p>

<p>- <b>ГОСТ «Глобальная навигационная спутниковая система. Аппаратура спутниковой навигации для оснащения колесных транспортных средств. Методы испытаний на соответствие требованиям к электробезопасности, климатическим и механическим воздействиям»</b> устанавливает методы испытаний на соответствие требованиям по электробезопасности, климатическим и механическим испытаниям;</p>

<p>- <b>ГОСТ «Глобальная навигационная спутниковая система. Аппаратура спутниковой навигации для оснащения колесных транспортных средств категории N, используемых для перевозки опасных, специальных, тяжеловесных и (или) крупногабаритных грузов, твердых бытовых отходов и мусора.  Общие технические требования»</b> устанавливает общие технические требования к аппаратуре спутниковой навигации, устанавливаемой на транспортные средства категории N.</p>

<p>Разработчик стандартов - ООО «НИИ Прикладной Телематики».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.614386', '2016-06-07 09:08:15.614386');
INSERT INTO articles VALUES (44, true, '2015-03-10 21:00:00', NULL, 'Строительство футбольных полей', NULL, '<p>До конца 2016 года в Москве будет построено 11 футбольных полей.</p> <p>Начато строительство двух полей – на ул. Суздальской, вл. 40 и на Сумском проезде, вл. 26.</p> <p>Завершается строительство двух объектов – центра образования «Самбо-70» на ул. Паустовского, вл. 6 и детско-юношеской спортивной школы № 112 в Зеленограде в микрорайоне 9.</p> <p>В стадии проектирования находятся остальные семь футбольных полей.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.621844', '2016-06-07 09:08:15.621844');
INSERT INTO articles VALUES (45, true, '2015-03-12 21:00:00', NULL, 'X Всероссийский съезд НОСТРОЙ', NULL, '<p>В Москве состоялся Х Всероссийский съезд НОСТРОЙ.</p> <p>Президент НОСТРОЙ Николий Кутьин доложил о ситуации в сфере саморегулирования в строительстве, рассказал о работе Национального объединения за последний период, обозначил направления развития отрасли.</p> <p>Александр Ишин, вице-президент НОСТРОЙ, рассказал об инициативе создать Академию профессионального образования НОСТРОЙ, которая обеспечит создание, внедрение и мониторинг образовательных программ с учетом утвержденных профессиональных стандартов и современных технологий.</p> <p>По итогам съезда принято решение о создании Академии профессионального образования НОСТРОЙ, приняты изменения в Устав НОСТРОЙ и регламентирующие документы. Основополагающим решением съезда стало принятие Приоритетных направлений деятельности НОСТРОЙ на 2016-2017 годы.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.631075', '2016-06-07 09:08:15.631075');
INSERT INTO articles VALUES (46, true, '2015-03-15 21:00:00', NULL, 'Стандарт на традиционные русские напитки на натуральном сырье', NULL, '<p>1 января 2016 года в Российской Федерации вводятся в действие для добровольного применения стандарт «Напитки русские традиционные на натуральном сырье».</p> <p>Стандарт разработан с целью возрождения рецептов и технологии приготовления русских традиционных напитков, расширения ассортимента выпускаемой продукции.</p> <p>Объектом стандартизации являются русские традиционные спиртные напитки из натурального сырья. Спиртные напитки производятся по оригинальным рецептурам из отечественного сырья. Все стадии производства, включая бутилирование, выполняются на территории Российской Федерации.</p> <p>В стандарте приводится перечень сырья, показатели безопасности, органолептические, физико-химические показатели, требования к правилам приемки, методам контроля, упаковке, маркировке, хранению и транспортированию продукции.</p> <p>Стандарт разработан ФГБНУ «ВНИИПБТ».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.638417', '2016-06-07 09:08:15.638417');
INSERT INTO articles VALUES (47, true, '2015-03-17 21:00:00', NULL, 'Градостроительный конкурс Минстроя России', NULL, '<p>В этом году конкурс Министерства строительства и жилищно-коммунального хозяйства Российской Федерации будет проходить по 10 номинациям:</p> <p> 1. Лучший генеральный план города.</p> <p> 2. Лучшие правила землепользования и застройки.</p> <p> 3. Лучшая практика внедрения информационных технологий в градостроительной сфере.</p> <p> 4. Лучший проект комплексного освоения территорий.</p> <p> 5. Лучший реализованный проект сохранения объектов культурного наследия.</p> <p> 6. Лучший реализованный проект энергосбережения при строительстве жилья эконом-класса.</p> <p> 7. Лучший реализованный проект застройки территории объектами малоэтажного строительства.</p> <p> 8. Лучший реализованный проект строительства объекта социальной инфраструктуры.</p> <p> 9. Лучший реализованный проект строительства объекта транспортной инфраструктуры.</p> <p>10. Лучший проект развития застроенных территорий</p> <p>Цель конкурса – определить лучшие практики реализации проектов в сфере градостроительства и поддержать их использование в других регионах страны.</p> <p>Конкурсная комиссия состоит из специалистов ведущих научных организаций России, руководителей национальных объединений и объединений работодателей в строительной сфере.</p> <p>Заявки на участие принимаются на сайте Минстроя России с 1 сентября по 31 октября 2015 года.</p> <p>Принять участие в конкурсе могут как органы публичной власти, так и представители бизнес-структур – застройщики, технические заказчики.</p> <p>Объявление победителей конкурса состоится на очередном Российском инвестиционно-строительном форуме.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.647065', '2016-06-07 09:08:15.647065');
INSERT INTO articles VALUES (48, true, '2015-03-19 21:00:00', NULL, 'Сертификаты на сухие смеси ООО «Сен-Гобен Строительная Продукция Рус»', NULL, '<p>Номенклатура сертифицированной продукции производства ООО «Сен-Гобен Строительная Продукция Рус» пополнилась новыми сухими смесями:</p> <p>- смесь сухая шпаклевочная вебер.ветонит Джей Эс (weber.vetonit JS);</p> <p>- смесь сухая штукатурная вебер.ветонит 414 (weber.vetonit 414).</p> <p>Сертификаты выданы в Системе «НЦСС» органом по сертификации «Строительная экспертиза» в составе ЗАО НИЦ «Строительная экспертиза».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.65922', '2016-06-07 09:08:15.65922');
INSERT INTO articles VALUES (49, true, '2015-03-23 21:00:00', NULL, 'Отмена согласований проектной документации', NULL, '<p>Исключается из перечня процедур в сфере жилищного строительства процедура согласования проектной документации на оборудование узла учета воды, сточных вод.</p> <p>Минстроем России разработан проект постановления Правительства РФ, предусматривающий отмену необходимости согласования проектной документации на оборудование узла учета воды, сточных вод с организацией, осуществляющей водоснабжение и/или водоотведение.</p> <p>Необходимые изменения вносятся в Правила организации коммерческого учета воды, сточных вод, утвержденные постановлением Правительства РФ № 776 от 04 сентября 2013 г.</p> <p>Органы исполнительной власти города Москвы продолжают оптимизировать процедуры в сфере строительства, исключая избыточные согласования, разрешения, сокращая сроки прохождения процедур, развивая электронное взаимодействие при предоставлении государственных услуг.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.673587', '2016-06-07 09:08:15.673587');
INSERT INTO articles VALUES (50, true, '2015-03-25 21:00:00', NULL, 'Открытие Центрального Детского Магазина', NULL, '<p>31 марта 2015 года открывается «Центральный Детский Магазин на Лубянке» («ЦДМ на Лубянке») - самый большой детский торговый комплекс в мире.</p> <p>«ЦДМ на Лубянке» - уникальный комплекс детского и семейного досуга, включающий в себя торговый центр с огромным ассортиментом детских товаров и услуг. В магазине реализована концепция обучающего развлечения, позволяющая детям в игровой форме получать новые знания.</p> <p>Ежедневно комплекс будут посещать 50 000 человек.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.681409', '2016-06-07 09:08:15.681409');
INSERT INTO articles VALUES (51, true, '2015-03-31 21:00:00', NULL, 'Новый стандарт на силикатный кирпич', NULL, '<p>1 октября 2015 года в Российской Федерации вводится в действие национальный стандарт <b>ГОСТ 379-2015 «Кирпич, камни, блоки и плиты перегородочные силикатные. Общие технические условия»</b> взамен ГОСТ 379-95.</p> <p>Объектом стандартизации являются кладочные стеновые изделия из силикатного бетона (кирпич, камни, блоки и плиты перегородочные). В стандарте учитывается тенденция к расширению номенклатуры данных изделий, их типоразмеров, прочностных характеристик, долговечности.</p> <p>В стандарте отражены требования к стеновым материалам, содержащиеся в:</p> <p>- СП 15.13330.2012 Каменные и армокаменные конструкции. Актуализированная редакция СНиП II-22-81*;</p> <p>- СП 70.13330.2012 Несущие и ограждающие конструкции. Актуализированная редакция СНиП 3.03.01-87.</p> <p>Стандарт разработан НП «АПСИ», ЦНИИСК им. Кучеренко, ОАО НИЦ «Строительство», ООО «ВНИИСТРОМ «Научный центр керамики».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.688881', '2016-06-07 09:08:15.688881');
INSERT INTO articles VALUES (52, true, '2015-04-02 21:00:00', NULL, 'Новый стандарт на метод оценки эксплуатационных характеристик полов', NULL, '<p>1 октября 2015 года в Российской Федерации вводится в действие для добровольного применения национальный стандарт ГОСТ Р «Полы. Метод испытания несущей способности».</p> <p>В стандарте установлена методики испытаний и оценки несущей способности полов в процессе их эксплуатации в помещениях жилых и общественных зданий.</p> <p>Стандарт разработан ОАО «ЦНИИпромзданий».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.698441', '2016-06-07 09:08:15.698441');
INSERT INTO articles VALUES (53, true, '2015-05-24 21:00:00', NULL, 'Новый стандарт на стекло', NULL, '<p>1 апреля 2016 года в Российской Федерации вводится в действие для добровольного применения стандарт <b>ГОСТ 111-2014</b> «Стеклолистовое бесцветное. Технические условия». Действие стандарта ГОСТ 111-2001 «Стеклолистовое бесцветное. Технические условия» отменяется.</p> <p>Стандарт распространяется на стекло листовое бесцветное, изготовленное методами флоат или вертикального вытягивания, предназначенное для изготовления изделий технического, строительного и бытового назначения, для остекления светопрозрачных конструкций.</p> <p>Стандарт разработан ОАО "НИИ стекла".</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.705872', '2016-06-07 09:08:15.705872');
INSERT INTO articles VALUES (54, true, '2015-06-28 21:00:00', NULL, 'Закон о стандартизации в Российской Федерации', NULL, '<p>29 июня 2015 года Президентом Российской Федерации подписан Федеральный закон <b>«О стандартизации в Российской Федерации»</b>. Федеральный закон «О стандартизации в Российской Федерации» был принят Государственной Думой 19 июня 2015 года и одобрен Советом Федерации 24 июня 2015 года.</p> <p>Закон устанавливает правовые основы стандартизации в Российской Федерации, и направлен на обеспечение проведения единой государственной политики в сфере стандартизации.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.719081', '2016-06-07 09:08:15.719081');
INSERT INTO articles VALUES (55, true, '2015-07-07 21:00:00', NULL, 'Новый стандарт на краны грузоподъемные', NULL, '<p>1 января 2016 года в Российской Федерации вводится в действие для добровольного применения национальный стандарт Российской Федерации <b>ГОСТ 33166.3-2014 «Краны грузоподъемные. Требования к механизмам. Часть 3. Краны башенные»</b>.</p> <p>Стандарт устанавливает специальные требования к механизмам башенных кранов для обеспечения безопасности в процессе эксплуатации. Стандарт соответствует международному стандарту ИСО 10972-3:2003 (NEQ).</p> <p>Проект стандарта разработан ЗАО «РАТТЕ».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.730954', '2016-06-07 09:08:15.730954');
INSERT INTO articles VALUES (56, true, '2015-09-08 21:00:00', NULL, 'Новые стандарты на строительные материалы на основе керамзита', NULL, '<p>1 апреля 2016 года в Российской Федерации вводятся в действие стандарты на строительные материалы на основе керамзита:</p> <p><b>ГОСТ Р «Блоки керамзитогипсовые стеновые. Технические условия»</b>;</p> <p><b>ГОСТ Р «Смеси сухие строительные штукатурные на цементном вяжущем с использованием керамзитового песка. Технические условия»</b>.</p> <p>Первый из вышеперечисленных стандартов устанавливает требования к керамзитогипсовым блокам для устройства несущих, самонесущих и ненесущих стен и внутренних перегородок зданий и сооружений, второй стандарт – к сухим строительным смесям для устройства выравнивающих слоев из строительного раствора, а также для устройства слоев, защищающих от атмосферного воздействия, улучшающих теплозащитные и огнестойкие свойства.</p> <p>Проекты стандартов разработана ЗАО «НИИКерамзит» при участии НО «Союз производителей керамзита и керамзитобетона».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.739201', '2016-06-07 09:08:15.739201');
INSERT INTO articles VALUES (57, true, '2015-09-10 21:00:00', NULL, 'Стандарт на методы испытаний «лежачих полицейских»', NULL, '<p>1 февраля 2016 года в Российской Федерации вводится в действие для добровольного применения межгосударственный стандарт <b>ГОСТ 32964-2014 «Дороги автомобильные общего пользования. Искусственные неровности сборные. Технические требования. Методы контроля»</b>. Документ вводится с правом досрочного применения.</p> <p>В стандарте установлены технические требования и методы контроля сборных искусственных неровностей для принудительного ограничения скорости движения транспортных средств на автодорогах общего пользования.</p> <p>Проект стандарта разработан ФГБУ «РОСДОРНИИ».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.746496', '2016-06-07 09:08:15.746496');
INSERT INTO articles VALUES (58, true, '2015-09-20 21:00:00', NULL, 'Стандарты устанавливают требованиями к бизнес-отелям и сельским гостевым домам', NULL, '<p>1 июля 2016 года в Российской Федерации вводятся в действие для добровольного применения национальные стандарты на услуги средств размещения.</p> <p>Стандарт <b>«Услуги средств размещения. Бизнес-отели. Общие требования»</b> устанавливает общие требования к бизнес-отелям и аналогичным средствам размещения в сфере делового туризма и предоставляемым в них услугам. Деловой туризм объединяет индустрию корпоративных путешествий (Corporatetravelindustry) и индустрию встреч (MICE). Мероприятия в сфере делового туризма объединяют под общим названием: конгрессные и выставочные мероприятия.</p> <p>Стандарт <b>«Услуги малых средств размещения. Сельские гостевые дома. Общие требования»</b> устанавливает общие требования к сельским гостевым домам, предоставляемым ими услугам, персоналу гостевых домов, а также требования безопасности.</p> <p>Стандарты разработаны ОАО «ВНИИС».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.753862', '2016-06-07 09:08:15.753862');
INSERT INTO articles VALUES (59, true, '2015-09-22 21:00:00', NULL, 'Новый порядок поверки средств измерений', NULL, '<p>20 сентября 2015 года вступил в силу новый порядок поверки средств измерений, и начали действовать новые требования к знаку поверки и содержанию свидетельства о поверке.</p> <p>Документы введены в действие Приказом Минпромторга России от 02.07.2015 № 1815 «Об утверждении Порядка проведения поверки средств измерений, требований к знаку поверки и содержанию свидетельства о поверке» (регистрационный номер в Минюсте № 38822).</p> <p>Отменены ранее действующие документы:</p> <p>- Приказ Госстандарта России от 18.07.1994 № 125 «Об утверждении порядка проведения поверки средств измерений» (регистрационный номер в Минюсте № 640);</p> <p>- Приказ Госстандарта России от 26.11.2001 № 476 «Об утверждении Изменения № 1 к Приказу Госстандарта России от 18.07.1994 № 125 «Об утверждении порядка проведения поверки средств измерений» (регистрационный номер в Минюсте № 3157);</p> <p>- Приказ Госстандарта России от 26.11.2001 № 477 «Об утверждении правил метрологии «Государственная система обеспечения единства измерений. Поверительные клейма) (регистрационный номер в Минюсте № 3221).</p> <p>Принятый документ содержит новые и уточненные положения порядка проведения поверки с учетом практики последних десятилетий.</p> <p>Согласно новому Порядку необходимо описывать все процедуры поверки, включая выборочную. Изменилась форма свидетельства о поверке - исключен пункт «Принадлежность средства измерения». Графики поверок стали добровольными.</p> <p>Положения нового Порядка разработаны с целью максимального приближения к практической реализации поверки средств измерений, действующей в Российской Федерации.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.763569', '2016-06-07 09:08:15.763569');
INSERT INTO articles VALUES (66, true, '2016-03-13 21:00:00', NULL, 'Выдан сертификат ООО «Сен-Гобен Строительная Продукция Рус» на смесь сухую кладочную', NULL, '<p>Выдан сертификат соответствия на смесь сухую кладочную вебер.ветонит МЛ 5 зима (weber.vetonit ML 5 winter) производства ООО «Сен-Гобен Строительная Продукция Рус».</p> <p>Сертификат выдан в Системе «НЦСС» органом по сертификации «Строительная экспертиза» в составе АО НИЦ «Строительная экспертиза».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.825562', '2016-06-07 09:08:15.825562');
INSERT INTO articles VALUES (60, true, '2015-10-06 21:00:00', NULL, 'Обновлены российские стандарты по системам менеджмента качества', NULL, '<p>1 ноября 2015 года в Российской Федерации вводятся в действие для добровольного применения новые версии национальных стандартов на системы менеджмента качества:</p> <p><b>ГОСТ Р ИСО 9000-2015 «Системы менеджмента качества. Основные положения и словарь»</b>,</p> <p><b>ГОСТ Р ИСО 9001-2015 «Системы менеджмента качества. Требования»</b>.</p> <p>Стандарты идентичны международным стандартам ИСО 9000:2015 «Системы менеджмента качества. Основные положения и словарь» и ИСО 9001:2015 «Системы менеджмента качества. Требования».</p> <p>Проекты стандартов разработаны ОАО «ВНИИС».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.771827', '2016-06-07 09:08:15.771827');
INSERT INTO articles VALUES (61, true, '2015-10-28 21:00:00', NULL, 'Об обозначении ТУ в соответствии с ОКПД2', NULL, '<p>В связи с обращениями организаций по вопросу обозначения технических условий на продукцию (ТУ) Федеральное агентство по техническому регулированию и метрологии сообщает – в обозначении ТУ с 1 января 2016 г. будет использоваться шестиразрядный код Общероссийского классификатора продукции по видам экономической деятельности (ОКПД2) ОК 034-2014 (КПЕС 2008).</p> <p>При этом предполагается сохранение обозначений ТУ, утвержденных до 1 января 2016 г., до их аннулирования или принятия новой редакции.</p> <p>Соответствующие поправки будут внесены в следующие стандарты:</p> <p>ГОСТ Р 51740-2001 «Технические условия на пищевые продукты. Общие требования к разработке и оформлению»;</p> <p>ГОСТ 2.114-95 «Единая система конструкторской документации. Технические условия».</p> <p>В случае пересмотра (принятия новой редакции) ТУ после введения в действие ОКПД2 допускается использование прежнего обозначения ТУ в скобках под новым обозначением.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.778883', '2016-06-07 09:08:15.778883');
INSERT INTO articles VALUES (62, true, '2015-11-11 21:00:00', NULL, 'Продлены сроки действия классификаторов', NULL, '<p>Приказами Федерального агентства по техническому регулированию и метрологии (Росстандарт) от 10.11.2015 г. №№ 1745-ст и 1746-ст продлены до 01.01.2017 г. сроки действия ряда общероссийских классификаторов:</p> <p>- Общероссийского классификатора продукции (<b>ОКП</b>) <b>ОК 005-93</b>;</p> <p>- Общероссийского классификатора видов экономической деятельности, продукции и услуг (<b>ОКДП</b>) <b>ОК 004-93</b>;</p> <p>- Общероссийского классификатора услуг населению (<b>ОКУН</b>) <b>ОК 002-93</b>;</p> <p>- Общероссийского классификатора видов экономической деятельности (<b>ОКВЭД</b>) <b>ОК 029-2001</b>;</p> <p>- Общероссийского классификатора продукции по видам экономической деятельности (<b>ОКПД</b>) <b>ОК 034-2007</b>;</p> <p>- Общероссийского классификатора основных фондов (<b>ОКОФ</b>) <b>ОК 013-94</b>.</p> <p>Соответствующие изменения внесены в приказы Росстандарта от 31.01.2014 г. № 14-ст и от 12.12.2014 г. № 2018-ст.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.788293', '2016-06-07 09:08:15.788293');
INSERT INTO articles VALUES (63, true, '2015-12-09 21:00:00', NULL, 'Вводится ГОСТ на оборудование и покрытия детских площадок', NULL, '<p>1 июня 2016 года в Российской Федерации вводится в действие для добровольного применения национальный стандарт Российской Федерации <b>ГОСТ 33602-2015 «Оборудование и покрытия детских игровых площадок. Термины и определения»</b>.</p> <p>Стандартом устанавливаются термины и определения в области проектирования, производства, поставок, эксплуатации, стандартизации оборудования и покрытий детских игровых площадок.</p> <p>Стандарт разработан ФГУП «ВНИИНМАШ».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.79874', '2016-06-07 09:08:15.79874');
INSERT INTO articles VALUES (64, true, '2016-02-11 21:00:00', NULL, 'Введен в действие ГОСТ на QR Code', NULL, '<p>1 февраля 2016 года в Российской Федерации введен в действие для добровольного применения национальный стандарт Российской Федерации <b>ГОСТ Р ИСО 18004-2015 «Информационные технологии. Технологии автоматической идентификации и сбора данных. Спецификация символики штрихового кода QRCode»</b>.</p> <p>Стандартом устанавливаются требования к символике QRCode, размерам, качеству производства, форматам символов, методам кодирования знаков данных, приведены правила исправления ошибок, рекомендуемый алгоритм декодирования, выбираемые пользователем параметры применения.</p> <p>Стандарт разработан Ассоциацией автоматической идентификации «ЮНИСКАН/ГС1 РУС» совместно с ООО НПЦ «Интелком».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.808123', '2016-06-07 09:08:15.808123');
INSERT INTO articles VALUES (65, true, '2016-02-14 21:00:00', NULL, 'Изменилась методика поверки счетчиков воды', NULL, '<p>Росстандарт, в соответствии с приказом от 12 февраля 2016 г. № 135, информирует о введении в действие нормативного документа <b>МИ 1592-2015 «Рекомендации. ГСИ. Счетчики воды. Методика поверки»</b>.</p> <p>Документ вводится взамен отмененного МИ 1592-99 «Рекомендации. ГСИ. Счетчики воды. Методика поверки».</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.815989', '2016-06-07 09:08:15.815989');
INSERT INTO articles VALUES (67, true, '2016-03-13 21:00:00', NULL, 'Определение энергоэффективности лабораторией АО НИЦ «Строительная экспертиза»', NULL, '<p>Научно-исследовательская испытательная лаборатория Строительная экспертиза в составе АО НИЦ «Строительная экспертиза» аккредитована в дополнительной области аккредитации.</p> <p>Обучение персонала и приобретение необходимого оборудования позволило расширить сферу деятельности лаборатории – теперь появилась возможность проводить работы по определению параметров энергоэффективности зданий и сооружений.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.837835', '2016-06-07 09:08:15.837835');
INSERT INTO articles VALUES (68, true, '2016-03-15 21:00:00', NULL, 'Подтверждена квалификация персонала лаборатории АО НИЦ «Строительная экспертиза»', NULL, '<p>Подтверждена квалификация инженеров-лаборантов Научно-исследовательской испытательной лаборатории Строительная экспертиза в составе АО НИЦ «Строительная экспертиза».</p> <p>Область аккредитации испытательной лаборатории распространяется на бетонные и железобетонные изделия и конструкции, металлические изделия и конструкции, стеновые материалы, крепежные изделия, показатели энергоэффективности зданий и сооружений.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.848825', '2016-06-07 09:08:15.848825');
INSERT INTO articles VALUES (69, true, '2016-03-15 21:00:00', NULL, 'Обязательная сертификация цементов', NULL, '<p>Министерство промышленности и торговли Российской Федерации информирует о вступлении в силу с 07 марта 2016 года Постановления Правительства РФ от 03 сентября 2015 года № 930 «О внесении изменений в единый перечень продукции, подлежащей обязательной сертификации» (далее – Постановление).</p> <p>Постановление предусматривает внесение в перечень продукции, подлежащей обязательной сертификации, цемента, портландцемента, цемента глиноземистого, цемента шлакового, цемента суперсульфатного и аналогичного гидравлического цемента, неокрашенного или окрашенного, готового или в форме клинкеров.</p> <p>В рамках реализации Постановления приказом Росстандарта от 11 января 2016 года утвержден национальный стандарт ГОСТ Р 56836-2016 «Оценка соответствия. Правила сертификации цементов», вступивший в силу 01 февраля 2016 года.</p> <p>С даты вступления в силу Постановления Правительства РФ от 03 сентября 2015 года № 930 необходимо получение нового сертификата в рамках обязательной сертификации. Сертификаты на продукцию, выданные в форме добровольной сертификации, не являются документами, подтверждающими соответствие продукции в рамках обязательной сертификации. К обращению на рынке допускаются цементы, имеющие сертификат соответствия, выданный в рамках обязательной сертификации.</p> <p>Выпуск производителями в обращение продукции без подтверждения соответствия в форме обязательной сертификации влечет административную ответственность.</p> <p>Данное решение имеет целью предотвращение появления на рынке продукции, не удовлетворяющей требованиям стандартов, контрафактной продукции, а также сокращения числа недобросовестных поставщиков и повышение доверия потребителей к сертификатам соответствия, выдаваемым на различные виды цемента аккредитованными в установленном порядке органами по сертификации продукции.</p>', NULL, NULL, NULL, '2016-06-07 09:08:15.856669', '2016-06-07 09:08:15.856669');
INSERT INTO articles VALUES (70, true, '2016-05-24 13:40:22', NULL, 'Сертификат ООО «Форбо Еврокол Рус» на смеси сухие клеевые', '', '<p>Сертифицирована продукция <strong>ООО «Форбо Еврокол Рус»</strong>:</p>  <p>- <strong>смесь сухая клеевая для фасадных систем 735 (insulation fix)</strong>;</p>  <p>- <strong>смесь сухая клеевая армирующая для фасадных систем 737 (fassade universal)</strong>,</p>  <p>выпускаемые по ТУ 5745-003-76816508-2009 (с изм. №№ 1-4).</p>    <p>Работы по сертификации выполнены органом по сертификации «Строительная экспертиза» в составе АО НИЦ «Строительная экспертиза», аккредитованном в Системе «НЦСС».</p>', '', '', '', '2016-06-08 13:40:22.179646', '2016-06-08 13:41:46.063158');
INSERT INTO articles VALUES (71, true, '2016-07-04 12:35:34', NULL, 'Закон о независимой оценке квалификации', '', '<p>03 июля 2016 г. принят <strong>Федеральный закон № 238-ФЗ «О независимой оценке квалификации»</strong>.</p>  <h1></h1>  <p>Закон регулирует проведение независимой оценки квалификации работников или лиц, претендующих на осуществление определенного вида трудовой деятельности.</p>    <p>Независимая оценка квалификации представляет собой процедуру подтверждения соответствия квалификации соискателя требованиям профессионального стандарта или квалификационным требованиям, установленным иными нормативно-правовыми актами, проеденную центром оценки квалификаций. </p>    <p>Также данным Законом устанавливаются правовые и организационные основы и порядок проведения независимой оценки квалификации, а также определяет правовое положение, права и обязанности участников такой оценки. </p>    <p>Закон не применяется в отношении государственных служащих и лиц, претендующих на замещение вакантных должностей государственной службы.</p>    <p><strong>Закон вступает в силу 01 января 2017 г.</strong></p>', '', '', '', '2016-07-18 12:35:34.55609', '2016-07-18 12:37:53.074879');
INSERT INTO articles VALUES (72, true, '2016-09-08 09:05:00.968991', NULL, 'Вводится новый ГОСТ на горнолыжные комплексы', '', '<p>1 января 2017 года в Российской Федерации вводится в действие национальный стандарт Российской Федерации <strong>ГОСТ Р 55881-2016</strong> <strong>«Туристические услуги. Общие требования к </strong><strong>деятельности горнолыжных комплексов»</strong>. Стандарт вводится в действие с правом досрочного применения.</p><p>Стандарт устанавливает пакеты базовых услуг в горнолыжных комплексах; определяет организационные и технические условия оказания для каждого вида услуг, основные принципы и примерные правила поведения туристов на горных склонах.</p><p>Стандарт распространяется на деятельность горнолыжных комплексов, курортов, зон отдыха с горнолыжными трассами; определяет общие требования к деятельности горнолыжных комплексов, в т.ч. формирование структуры управления, подготовку к оказанию услуг, ведению маркетинговой, экономической коммерческой и операционной деятельности.</p><p>Стандарт разработан на основе ранее действующего ГОСТ Р  55881-2013.</p><p>В работе над стандартом принимали участие ОАО «ВНИИС», Департамент туризма и региональной политики Министерства культуры РФ, ООО «Росинжиниринг Эксплуатация», Союз горнолыжной индустрии, АО «Курорты Северного Кавказа».</p>', '', '', '', '2016-09-08 09:03:12.392981', '2016-09-08 09:05:00.969855');


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('articles_id_seq', 72, true);


--
-- Data for Name: attestats; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO attestats VALUES (29, true, -3, 'RU.НЦСС.АЛ.002', 'ИСЛ ГАРАСТ, ООО "ГАРАСТ"', '2015-03-26', '2020-03-25', 31, 5, '2016-06-08 11:24:51.16025', '2016-08-25 08:05:03.946706');
INSERT INTO attestats VALUES (27, true, 1, 'RU.НЦСС.ЭС.013', 'Черноглазов Сергей Дмитриевич, эксперт по сертификации систем менеджмента качества, систем экологического менеджмента, систем менеджмента управления охраной и безопасностью труда, интегрированных системы менеджмента', '2016-04-05', NULL, 4, 5, '2016-04-11 10:38:38', '2016-06-08 09:03:24.448123');
INSERT INTO attestats VALUES (26, true, 1, 'RU.НЦСС.ОС.007', 'ОС "Современные Стандарты Качества - СМК", ООО "ССК-проект"', '2016-01-18', '2021-01-17', 2, 5, '2016-01-20 07:31:20', '2016-06-08 10:07:29.553962');
INSERT INTO attestats VALUES (25, true, -3, 'RU.НЦСС.ОС.004', 'ОС "НТЦ Система менеджмента качества", ЗАО НИЦ "Строительная экспертиза"', '2015-03-23', '2020-03-22', 3, 5, '2015-12-29 10:30:30', '2016-06-08 10:13:51.544353');
INSERT INTO attestats VALUES (24, true, 1, 'RU.НЦСС.ИЛ.004', 'ИЛ "Строительная экспертиза", АО НИЦ "Строительная экспертиза"', '2015-12-28', '2019-07-23', 4, 5, '2015-12-29 10:28:47', '2016-06-08 10:16:37.302721');
INSERT INTO attestats VALUES (23, true, 1, 'RU.НЦСС.АЛ.004', '"Научно-исследовательская испытательная лаборатория Строительная экспертиза", АО НИЦ "Строительная экспертиза', '2015-12-28', '2018-07-23', 4, 5, '2015-12-29 10:27:02', '2016-06-08 10:18:14.416882');
INSERT INTO attestats VALUES (22, true, 1, 'RU.НЦСС.ОС.006', 'ОС "НТЦ Система менеджмента качества", АО НИЦ "Строительная экспертиза"', '2015-12-28', '2020-03-22', 4, 5, '2015-12-29 10:20:08', '2016-06-08 10:22:46.617339');
INSERT INTO attestats VALUES (21, true, 1, 'RU.НЦСС.ОС.005', 'ОС "Строительная экспертиза", АО НИЦ «Строительная экспертиза»', '2015-12-28', '2019-07-23', 4, 5, '2015-12-29 10:16:45', '2016-06-08 10:25:54.4012');
INSERT INTO attestats VALUES (28, true, 1, 'RU.НЦСС.АЛ.007', 'Испытательная лаборатория МСУ-363, ООО "МСУ-363"', '2016-03-14', '2021-03-13', 5, 5, '2016-04-12 08:07:54', '2016-06-08 10:27:22.544196');
INSERT INTO attestats VALUES (20, true, 1, 'RU.НЦСС.ЭС.012', 'Рубашевский Дмитрий Игоревич, эксперт по сертификации систем менеджмента качества, систем экологического менеджмента, систем менеджмента управления охраной и безопасностью труда, интегрированных системы менеджмента', '2015-03-23', NULL, 26, 5, '2015-09-10 14:49:19', '2016-06-08 10:28:01.629583');
INSERT INTO attestats VALUES (17, true, 1, 'RU.НЦСС.ЭС.011', 'Клопыжников Николай Петрович, эксперт по сертификации продукции, работ (услуг), персонала', '2014-12-30', NULL, 2, 5, '2015-02-27 12:55:00', '2016-06-08 10:38:19.227474');
INSERT INTO attestats VALUES (13, true, -3, 'RU.НЦСС.ЭС.004', 'Гришин Игорь Николаевич, эксперт по сертификации продукции, работ (услуг), персонала', '2014-07-24', NULL, 1, 5, '2015-02-27 12:49:15', '2016-06-08 10:36:38.438281');
INSERT INTO attestats VALUES (16, true, -3, 'RU.НЦСС.ЭС.006', 'Клопыжников Николай Петрович, эксперт по сертификации продукции, работ (услуг), персонала', '2014-07-24', NULL, 1, 5, '2015-02-27 12:53:35', '2016-06-08 10:37:17.476374');
INSERT INTO attestats VALUES (19, true, 1, 'RU.НЦСС.ЭА.001', 'Быков Андрей Рудольфович, эксперт по аккредитации экспертов, ОС, ИЛ, СУЦ', '2014-07-16', NULL, 29, 5, '2015-02-27 13:10:52', '2016-06-08 10:37:31.911264');
INSERT INTO attestats VALUES (18, true, 1, 'RU.НЦСС.ЭС.009', 'Гришин Игорь Николаевич, эксперт по сертификации продукции, работ (услуг), персонала', '2014-12-30', NULL, 2, 5, '2015-02-27 12:56:34', '2016-06-08 10:38:05.577592');
INSERT INTO attestats VALUES (15, true, 1, 'RU.НЦСС.ЭС.010', 'Чучмаев Виктор Владимирович, эксперт по сертификации продукции, работ (услуг), персонала', '2014-12-30', NULL, 2, 5, '2015-02-27 12:52:00', '2016-06-08 10:39:07.303638');
INSERT INTO attestats VALUES (14, true, -3, 'RU.НЦСС.ЭС.005', 'Чучмаев Виктор Владимирович, эксперт по сертификации продукции, работ (услуг), персонала', '2014-07-24', NULL, 1, 5, '2015-02-27 12:50:14', '2016-06-08 10:39:27.395713');
INSERT INTO attestats VALUES (12, true, -3, 'RU.НЦСС.ИЛ.002', 'ИЛ "ССК-испытания", ООО "ССК"', '2014-07-24', '2019-07-23', 1, 5, '2015-02-27 12:47:29', '2016-06-08 10:43:56.378651');
INSERT INTO attestats VALUES (11, true, -3, 'RU.НЦСС.ОС.002', 'ОС "ССК-сертификация", ООО "ССК"', '2014-07-24', '2019-07-23', 1, 5, '2015-02-27 12:42:44', '2016-06-08 10:46:23.351433');
INSERT INTO attestats VALUES (10, true, 1, 'RU.НЦСС.ЭС.008', 'Харькова Нина Ивановна, эксперт по сертификации продукции, работ (услуг), персонала', '2014-10-20', NULL, 3, 5, '2015-02-27 12:39:29', '2016-06-08 10:48:24.058877');
INSERT INTO attestats VALUES (9, true, 1, 'RU.НЦСС.ЭС.007', 'Рубашевский Дмитрий Игоревич, эксперт по сертификации продукции, работ (услуг), персонала', '2014-09-02', NULL, 26, 5, '2015-02-27 12:37:04', '2016-06-08 10:49:59.63134');
INSERT INTO attestats VALUES (8, true, 1, 'RU.НЦСС.ЭС.003', 'Чернигов Виталий Сергеевич, эксперт по сертификации продукции, работ (услуг), персонала', '2014-07-24', NULL, 3, 5, '2015-02-27 12:35:39', '2016-06-08 10:50:55.74838');
INSERT INTO attestats VALUES (7, true, 1, 'RU.НЦСС.ЭС.002', 'Кочетков Алексей Юрьевич, эксперт по сертификации продукции, работ (услуг), персонала', '2014-07-24', NULL, 3, 5, '2015-02-27 12:34:40', '2016-06-08 10:52:27.174036');
INSERT INTO attestats VALUES (6, true, 1, 'RU.НЦСС.ЭС.001', 'Топчий Дмитрий Владимирович, эксперт по сертификации продукции, работ (услуг), персонала', '2014-07-24', NULL, 3, 5, '2015-02-27 12:32:09', '2016-06-08 10:53:14.665512');
INSERT INTO attestats VALUES (4, true, 1, 'RU.НЦСС.ИЛ.003', 'ИЛ "ССК-сертификация", ООО «ССК-проект»', '2014-12-30', '2019-12-29', 2, 5, '2015-02-27 12:28:58', '2016-06-08 10:59:08.369663');
INSERT INTO attestats VALUES (3, true, -3, 'RU.НЦСС.ИЛ.001', 'ИЛ "Строительная экспертиза", ЗАО НИЦ «Строительная экспертиза»', '2014-07-24', '2019-07-23', 3, 5, '2015-02-27 12:25:15', '2016-06-08 11:04:21.526579');
INSERT INTO attestats VALUES (5, true, -3, 'RU.НЦСС.АЛ.001', 'Научно-исследовательская испытательная лаборатория «Строительная экспертиза», ЗАО НИЦ «Строительная экспертиза»', '2014-07-24', '2019-07-23', 3, 5, '2015-02-27 12:30:35', '2016-06-08 11:05:24.216914');
INSERT INTO attestats VALUES (2, true, 1, 'RU.НЦСС.ОС.003', 'ОС "ССК-сертификация", ООО «ССК-проект»', '2015-01-30', '2019-12-29', 2, 5, '2015-02-27 11:58:01', '2016-06-08 11:09:00.087739');
INSERT INTO attestats VALUES (1, true, -3, 'RU.НЦСС.ОС.001', 'ОС "Строительная экспертиза", ЗАО НИЦ «Строительная экспертиза»', '2014-07-24', '2019-07-23', 3, 5, '2015-02-27 11:54:03', '2016-06-08 11:13:49.810704');
INSERT INTO attestats VALUES (30, true, 1, 'RU.НЦСС.АЛ.003', 'Испытательная лаборатория СВАП БЕТОН, ООО "СВАП БЕТОН"', '2015-10-09', '2020-10-08', 32, 5, '2016-06-08 11:30:28.827696', '2016-06-09 07:38:01.080441');
INSERT INTO attestats VALUES (31, true, -3, 'RU.НЦСС.АЛ.005', 'ИЛ "Современные Стандарты Качества", ООО "ССК"', '2016-01-18', '2021-01-17', 1, 5, '2016-06-08 11:34:30.132982', '2016-07-18 14:40:26.889255');
INSERT INTO attestats VALUES (32, true, 1, 'RU.НЦСС.АЛ.006', 'Научно-исследовательская испытательная лаборатория ССК-проект, ООО "ССК-проект"', '2016-02-26', '2021-02-25', 2, 5, '2016-06-08 11:37:55.89232', '2016-06-08 11:37:55.89232');
INSERT INTO attestats VALUES (33, true, 1, 'RU.НЦСС.АЛ.008', 'ИЛ "Современные Стандарты Качества", ООО "ССК"', '2016-07-06', '2021-01-17', 1, 5, '2016-07-18 14:43:56.247831', '2016-07-18 14:44:40.908828');


--
-- Name: attestats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('attestats_id_seq', 33, true);


--
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO certificates VALUES (12, true, -3, 'RU.НЦСС.001.003.3.ПР.00012', 'Плиты дорожные марки ПДН-14, изготавливаемые методом безопалубочного формования на длинных стендах марки «Стройтех ST-2000» (ТУ 5846-001-57650077-2013, серия 3.503.2-13) ', 'ОКДП, ОКП', '2695527, 584611', 'ПР', '2014-12-25', '2019-12-24', 11, 1, '2015-02-27 13:25:15', '2016-06-07 13:20:11.715656');
INSERT INTO certificates VALUES (1, true, -1, 'RU.НЦСС.001.003.1.ПР.00001', 'Сварные соединения секций кронштейнов блоков кондиционирования в соответствии с листом 3 «Конструкция под блоки кондиционирования» Рабочей документации «Архитектурно-строительные решения» Г.0.016914001-ТНЭСС/ГТП/000.3-АС (без учета соединений конструкций под блоки кондиционирования лист 057.06-01.14-КМ Рабочей документации «Техническое перевооружение инженерных систем офисного здания, расположенного по адресу: г. Москва, ул. Добролюбова, д. 16, кв. 1») (сварные соединения шести секций)', 'ОКДП', '2810000', 'ПР', '2014-08-01', '2015-07-30', 7, 1, '2014-09-23 20:09:28', '2015-09-10 14:25:49');
INSERT INTO certificates VALUES (4, true, -3, 'RU.НЦСС.001.008.1.ПР.00004', 'Смеси сухие напольные Densitop Primer, Densitop MT, Densiphait', 'ОКП ТНВЭД', '574500 3824 50 900 0', 'ПР', '2014-12-10', '2017-12-09', 10, 1, '2015-02-09 20:59:37', '2016-06-07 14:34:42.514688');
INSERT INTO certificates VALUES (2, true, 1, 'RU.НЦСС.001.003.1.ПР.00002', 'Ограждение кровли здания, расположенного по адресу: г. Москва, ул. Осенняя, д. 11, этаж 4', 'ОКДП ОКП', '2810000 526247', 'ПР', '2014-08-22', '2024-08-21', 8, 1, '2015-02-09 11:58:40', '2015-09-10 14:26:04');
INSERT INTO certificates VALUES (3, true, 1, 'RU.НЦСС.001.003.3.ПР.00003', 'Дюбели тарельчатые марки LIR для крепления теплоизоляционных строительных материалов и изделий к наружным и внутренним конструкциям зданий и сооружений различного назначения LIR 10х70, LIR 10х90, LIR 10х120, LIR 10х140, LIR 10х160, LIR 10х180', 'ОКДП ОКП ТНВЭД ТС', '2522129 229199 3925 90 100 0', 'ПР', '2014-12-05', '2019-12-04', 9, 1, '2015-02-09 20:43:26', '2015-09-10 14:29:04');
INSERT INTO certificates VALUES (9, true, 1, 'RU.НЦСС.001.008.2.ПР.00009', 'Смеси сухие штукатурные вебер.ветонит ТТ (weber.vetonit ТТ), вебер.ветонит ТТТ (weber.vetonit ТТ) ', 'ОКП', '574550', 'ПР', '2014-12-25', '2017-05-19', 6, 1, '2015-02-27 13:16:07', '2016-06-07 14:47:18.926348');
INSERT INTO certificates VALUES (88, true, 1, 'RU.НЦСС.001.008.2.ПР.00029', 'Смесь сухая напольная вебер.ветонит 3000 (weber.vetonit 3000) Выпускается по ТУ 5745-033-56846022-2013
', 'ОКП', '57 4550', 'ПР', '2015-08-10', '2018-08-09', 6, 1, '2016-06-08 07:21:06.905715', '2016-06-08 07:21:06.905715');
INSERT INTO certificates VALUES (5, true, 1, 'RU.НЦСС.001.008.2.ПР.00005', 'Смесь сухая клеевая вебер.ветонит оптима (weber.vetonit optima)', 'ОКП', '574550', 'ПР', '2014-12-25', '2016-10-14', 6, 1, '2015-02-09 22:06:01', '2015-09-10 14:29:40');
INSERT INTO certificates VALUES (6, true, 1, 'RU.НЦСС.001.008.2.ПР.00006', 'Смесь сухая клеевая вебер.ветонит изи фикс (weber.vetonit easy fix)', 'ОКП', '574550', 'ПР', '2014-12-25', '2016-10-14', 6, 1, '2015-02-09 22:09:09', '2015-09-10 14:29:52');
INSERT INTO certificates VALUES (7, true, 1, 'RU.НЦСС.001.008.2.ПР.00007', 'Смесь сухая клеевая вебер.ветонит абсолют (weber.vetonit absolut)', 'ОКП', '574550', 'ПР', '2014-12-25', '2016-10-14', 6, 1, '2015-02-10 01:27:27', '2015-09-10 14:30:01');
INSERT INTO certificates VALUES (8, true, 1, 'RU.НЦСС.001.008.2.ПР.00008', 'Смесь сухая напольная вебер.ветонит 4350 (weber.vetonit 4350)', 'ОКП', '574550', 'ПР', '2014-12-25', '2016-10-14', 6, 1, '2015-02-27 13:14:04', '2015-09-10 14:30:12');
INSERT INTO certificates VALUES (10, true, 1, 'RU.НЦСС.001.008.2.ПР.00010', 'Смесь сухая шпаклевочная вебер.ветонит ВХ Серая (weber.vetonit VH Grey) ', 'ОКП', '574550', 'ПР', '2014-12-25', '2016-12-26', 6, 1, '2015-02-27 13:20:36', '2015-09-10 14:30:30');
INSERT INTO certificates VALUES (11, true, 1, 'RU.НЦСС.001.008.2.ПР.00011', 'Смесь сухая клеевая вебер.ветонит блок (weber.vetonit block) ', 'ОКП', '574550', 'ПР', '2014-12-25', '2016-12-26', 6, 1, '2015-02-27 13:22:48', '2015-09-10 14:30:42');
INSERT INTO certificates VALUES (13, true, 1, 'RU.НЦСС.001.008.2.ПР.00013', 'Смесь сухая ремонтная вебер.ветонит С06 (weber.vetonit S06)', 'ОКП', '574550', 'ПР', '2015-01-26', '2016-12-26', 6, 1, '2015-02-27 13:27:34', '2015-09-10 14:30:50');
INSERT INTO certificates VALUES (14, true, 1, 'RU.НЦСС.001.008.2.ПР.00014', 'Смесь сухая напольная вебер.ветонит 5700 (weber.vetonit 5700)', 'ОКП', '574550', 'ПР', '2015-01-26', '2016-12-26', 6, 1, '2015-02-27 13:29:43', '2015-09-10 14:30:59');
INSERT INTO certificates VALUES (16, true, 1, 'RU.НЦСС.001.008.2.ПР.00016', 'Смесь сухая шпаклевочнаявебер.ветонит Джей Эс (weber.vetonit JS) ', 'ОКП, ТН ВЭД', '574550, 3214 90 000 9', 'ПР', '2015-03-11', '2017-05-19', 6, 1, '2015-03-11 12:15:00', '2015-09-10 14:53:02');
INSERT INTO certificates VALUES (15, true, -3, 'RU.НЦСС.001.008.2.ПР.00015', 'Смесь сухая шпаклевочная вебер.ренд фасад зима белый (weber.rend facade winter white)', 'ОКП', '574550', 'ПР', '2015-01-30', '2016-11-26', 6, 1, '2015-02-27 13:31:13', '2016-08-08 10:10:22.247329');
INSERT INTO certificates VALUES (66, true, 1, 'RU.НЦСС.001.008.2.ПР.00057', 'Смесь сухая клеевая вебер.терм теплофасад (weber.therm teplofacade)', 'ОКП', '574550', 'ПР', '2015-11-25', '2018-11-24', 6, 1, '2015-12-07 07:26:57', '2015-12-07 07:28:09');
INSERT INTO certificates VALUES (93, true, 1, 'RU.НЦСС.005.008.2.ПР.00081', 'Смесь сухая штукатурная вебер.штук цемент зима (weber.stuk cement winter) Выпускается по ТУ 5745-032-56846022-2015', 'ОКП', '574550', 'ПР', '2016-07-14', '2019-07-13', 6, 1, '2016-07-14 12:12:26.543387', '2016-07-14 12:21:59.331454');
INSERT INTO certificates VALUES (67, true, 1, 'RU.НЦСС.001.008.2.ПР.00058', 'Смесь сухая специальная вебер.ветонит ПСЛ (weber.vetonit PSL)', 'ОКП', '574550', 'ПР', '2015-11-25', '2018-11-24', 6, 1, '2015-12-07 07:28:47', '2015-12-07 07:29:19');
INSERT INTO certificates VALUES (92, true, 1, 'RU.НЦСС.005.008.2.ПР.00080', 'Смесь сухая шпаклевочная вебер.ветонит Джей Эс Плюс (weber.vetonit  JS Plus) Выпускается по ТУ 5745-036-56846022-2012 c изменением № 2', 'ОКП', '574550', 'ПР', '2016-07-14', '2019-07-13', 6, 1, '2016-07-14 12:09:09.912849', '2016-07-14 12:22:10.44907');
INSERT INTO certificates VALUES (68, true, 1, 'RU.НЦСС.001.008.2.ПР.00059', 'Смесь сухая напольная вебер.ветонит 6000 (weber.vetonit 6000)', 'ОКП', '574550', 'ПР', '2015-11-25', '2017-05-19', 6, 1, '2015-12-07 07:30:02', '2015-12-07 07:30:50');
INSERT INTO certificates VALUES (91, true, 1, 'RU.НЦСС.005.008.2.ПР.00079', 'Смесь сухая шпаклевочная вебер.ветонит Джей Эс (weber.vetonit  JS) Выпускается по ТУ 5745-036-56846022-2012 c изменением № 2', 'ОКП', '574550', 'ПР', '2016-07-14', '2019-07-13', 6, 1, '2016-07-14 12:05:07.339908', '2016-07-14 12:22:35.770528');
INSERT INTO certificates VALUES (90, true, 1, 'RU.НЦСС.005.008.2.ПР.00078', 'Cмесь сухая штукатурная вебер.ветонит ТТ40 (weber.vetonit  ТТ40) Выпускается по ТУ 5745-034-56846022-2014', 'ОКП', '574550', 'ПР', '2016-07-14', '2019-07-13', 6, 1, '2016-07-14 12:01:25.426694', '2016-07-14 12:22:50.308613');
INSERT INTO certificates VALUES (17, true, -3, 'RU.НЦСС.001.008.2.ПР.00017', 'Смесь сухая штукатурнаявебер.ветонит 414 (weber.vetonit 414) ', 'ОКП, ТН ВЭД', '574550, 3214 90 000 9', 'ПР', '2015-03-11', '2017-09-14', 6, 1, '2015-03-11 12:19:31', '2016-08-08 10:11:46.990648');
INSERT INTO certificates VALUES (20, true, 1, 'RU.НЦСС.003.010.1.ПС.00003', 'Кулябичев Антон Александрович, строительный эксперт по исследованию промышленных и гражданских объектов, их отдельных фрагментов, инженерных систем, оборудования и коммуникаций с целью установления объема, качества и стоимости выполненных работ, использованных материалов и изделий', '', '', 'ПС', '2015-04-01', '2020-03-30', 3, 2, '2015-04-10 09:11:13', '2016-06-08 08:24:42.702156');
INSERT INTO certificates VALUES (22, true, 1, 'RU.НЦСС.003.010.1.ПС.00005', 'Храбров Антон Павлович, строительный эксперт по исследованию промышленных и гражданских объектов, их отдельных фрагментов, инженерных систем, оборудования и коммуникаций с целью установления объема, качества и стоимости выполненных работ, использованных материалов и изделий', '', '', 'ПС', '2015-04-01', '2020-03-30', 3, 2, '2015-04-10 09:14:52', '2016-06-08 08:29:11.122888');
INSERT INTO certificates VALUES (23, true, 1, 'RU.НЦСС.003.010.1.ПС.00006', 'Храбров Антон Павлович, строительный эксперт по исследованию проектной документации промышленных и гражданских объектов в целях установления их соответствия требованиям специальных правил; определении технического состояния, а так же причин, условий, обстоятельств и механизма разрушения строительных объектов, частичной или полной утраты ими своих функциональных, эксплуатационных, эстетических и других свойств', '', '', 'ПС', '2015-04-01', '2020-03-30', 3, 2, '2015-04-10 09:15:54', '2016-06-08 08:31:16.66894');
INSERT INTO certificates VALUES (24, true, 1, 'RU.НЦСС.004.012.1.СМ.00001', 'Система менеджмента качества при выполнении работ по подготовке строительного участка, предшествующей строительству, проведению общих строительных работ по возведению зданий и сооружений, по монтажу оборудования, работ по завершению строительства, а также при осуществлении функций генеральной подрядной организации и строительного контроля', '', '', 'СМ', '2015-04-03', '2018-04-02', 2, 3, '2015-04-10 09:17:16', '2016-01-26 09:11:04');
INSERT INTO certificates VALUES (41, true, 1, 'RU.НЦСС.001.003.1.ПР.00032', 'Установки бетоносмесительные автоматизированные (Бетонные заводы) «ST-БСУ», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4826-002-89635895-2006 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 2622, 8474 31 000 0', 'ПР', '2015-08-18', '2020-08-17', 13, 1, '2015-08-20 14:36:09', '2015-09-10 14:26:37');
INSERT INTO certificates VALUES (42, true, 1, 'RU.НЦСС.001.003.1.ПР.00033', 'Стенды технологические с изменяемым углом рабочей поверхности (опрокидные поддоны) для производства плоских железобетонных изделий (трехслойных ограждающих панелей, диафрагм жесткости, панелей шахт лифтов и прочее) «ST-ОП», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4840-01-89635895-2014 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7) ', 'ОКП, ТН ВЭД', '48 4000, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 13, 1, '2015-08-20 14:37:54', '2015-09-10 14:26:44');
INSERT INTO certificates VALUES (43, true, 1, 'RU.НЦСС.001.003.1.ПР.00034', 'Металлические подогреваемые формы для изготовления железобетонных изделий (колонн, свай, лестничных маршей, перемычек и прочее) «ST», включая модификации, комплектую-щие изделия и запасные части, выпускаемые по ТУ 4850-01-89635895-2014 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 4200, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 13, 1, '2015-08-20 14:39:07', '2015-09-10 14:26:54');
INSERT INTO certificates VALUES (44, true, 1, 'RU.НЦСС.001.003.1.ПР.00035', 'Технологическая линия для производства преднапряженных железобетонных изделий мето-дом виброформования на длинных стендах «ST-ЛБФ», включая модификации, комплек-тующие изделия и запасные части, выпускаемая по ТУ 4842-01-89635895-2006 (адрес производства: 129085, г. Москва, Звездный бульвар, д. 21, стр. 1)', 'ОКП, ТН ВЭД', '48 4200, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 14, 1, '2015-08-20 14:41:12', '2015-09-10 14:27:03');
INSERT INTO certificates VALUES (45, true, 1, 'RU.НЦСС.001.003.1.ПР.00036', 'Технологическая линия для изготовления методом вибропрессования мелкоштучных изделий для жилищного и дорожного строительства «ST-Р», включая модификации, комплектующие изделия и запасные части, выпускаемая по ТУ 4845-01-89635895-2006 (адрес производства: 129085, г. Москва, Звездный бульвар, д. 21, стр. 1)', 'ОКП, ТН ВЭД', '48 4500, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 14, 1, '2015-08-20 14:42:25', '2015-09-10 14:27:13');
INSERT INTO certificates VALUES (27, true, 1, 'RU.НЦСС.001.002.1.ПС.00008', 'Чучмаев Виктор Владимирович, строительный эксперт по исследованию проектной документации промышленных и гражданских объектов в целях установления их соответствия требованиям специальных правил; определении технического состояния, а так же причин, условий, обстоятельств и механизма разрушения строительных объектов, частичной или полной утраты ими своих функциональных, эксплуатационных, эстетических и других свойств', '', '', 'ПС', '2015-05-12', '2020-05-11', 1, 1, '2015-05-12 07:15:01', '2016-06-08 08:37:08.854272');
INSERT INTO certificates VALUES (28, true, 1, 'RU.НЦСС.001.008.2.ПР.00018', 'Смесь сухая клеевая вебер.ветонит оптима (weber.vetonit optima) Выпускается по ТУ 5745-031-56846022-2013 с изменением № 1 ', 'ОКП', '574550', 'ПР', '2015-06-08', '2018-06-07', 6, 1, '2015-06-11 13:26:22', '2015-09-10 14:53:22');
INSERT INTO certificates VALUES (94, true, 1, 'RU.НЦСС.005.008.2.ПР.00082', 'Смесь сухая штукатурная декоративная вебер.мин короед (weber.min koroed) Выпускается по ТУ 5745-001-56846022-2013 c изменением № 1', 'ОКП', '574550', 'ПР', '2016-07-14', '2019-07-13', 6, 1, '2016-07-14 12:14:44.217042', '2016-07-14 12:21:47.42469');
INSERT INTO certificates VALUES (29, true, 1, 'RU.НЦСС.001.008.2.ПР.00019', 'Смесь сухая клеевая вебер.ветонит изи фикс (weber.vetonit easy fix) Выпускается по ТУ 5745-031-56846022-2013 с изменением № 1 ', 'ОКП', '574550', 'ПР', '2015-06-08', '2018-06-07', 6, 1, '2015-06-11 13:29:26', '2015-09-10 14:53:32');
INSERT INTO certificates VALUES (30, true, 1, 'RU.НЦСС.001.008.2.ПР.00020', 'Смесь сухая клеевая вебер.ветонит ультра фикс (weber.vetonit ultra fix) Выпускается по ТУ 5745-031-56846022-2013 с изменением № 1 ', 'ОКП', '574550', 'ПР', '2015-06-08', '2018-06-07', 6, 1, '2015-06-11 13:34:25', '2015-09-10 14:53:42');
INSERT INTO certificates VALUES (31, true, 1, 'RU.НЦСС.001.008.2.ПР.00021', 'Смесь сухая клеевая вебер.ветонит гранит фикс (weber.vetonit granit fix) Выпускается по ТУ 5745-031-56846022-2013 с изменением № 1 ', 'ОКП', '574550', 'ПР', '2015-06-08', '2018-06-07', 6, 1, '2015-06-11 13:36:05', '2015-09-10 14:53:51');
INSERT INTO certificates VALUES (32, true, -1, 'RU.НЦСС.001.008.2.ПР.00022', 'Смесь сухая клеевая вебер.ветонит мрамор (weber.vetonit mramor)', 'ОКП', '574550', 'ПР', '2015-06-22', '2016-05-05', 6, 1, '2015-06-25 07:30:27', '2015-09-10 14:54:04');
INSERT INTO certificates VALUES (33, true, -1, 'RU.НЦСС.001.008.2.ПР.00023', 'Смесь сухая клеевая вебер.ветонит гранит фикс (weber.vetonit granit fix)', 'ОКП', '574550', 'ПР', '2015-06-22', '2016-05-05', 6, 1, '2015-06-25 07:34:20', '2015-09-10 14:54:12');
INSERT INTO certificates VALUES (34, true, -1, 'RU.НЦСС.001.008.2.ПР.00024', 'Смесь сухая клеевая вебер.ветонит ультра фикс (weber.vetonit ultra fix)', 'ОКП', '574550', 'ПР', '2015-06-22', '2016-05-05', 6, 1, '2015-06-25 07:35:58', '2015-09-10 14:52:37');
INSERT INTO certificates VALUES (35, true, -1, 'RU.НЦСС.001.008.2.ПР.00025', 'Смесь сухая клеевая вебер.ветонит профи плюс (weber.vetonit profi plus)', 'ОКП', '574550', 'ПР', '2015-06-22', '2016-05-05', 6, 1, '2015-06-25 07:38:04', '2015-09-10 14:52:23');
INSERT INTO certificates VALUES (36, true, 1, 'RU.НЦСС.001.008.3.ПР.00026', 'Плиты теплоизоляционные из пеностекла НЕОПОРМ®', 'ОКП, ТН ВЭД', '59 1470, 7016 90 400 1', 'ПР', '2015-08-10', '2017-07-22', 12, 1, '2015-08-07 11:40:18', '2015-09-10 13:53:39');
INSERT INTO certificates VALUES (37, true, 1, 'RU.НЦСС.001.008.3.ПР.00027', 'Изделия теплоизоляционные из пеностекла НЕОПОРМ®', 'ОКП, ТН ВЭД', '59 1470, 7016 90 700 1', 'ПР', '2015-08-10', '2017-07-22', 12, 1, '2015-08-07 11:43:49', '2015-09-10 13:54:13');
INSERT INTO certificates VALUES (38, true, 1, 'RU.НЦСС.001.008.3.ПР.00028', 'Изделия из пеностекла НЕОПОРМ® для тепловой изоляции трубопроводов, технологического оборудования и резервуаров ', 'ОКП, ТН ВЭД', '59 1470, 7016 90 700 1', 'ПР', '2015-08-10', '2017-07-22', 12, 1, '2015-08-07 11:46:57', '2015-09-10 13:54:33');
INSERT INTO certificates VALUES (39, true, 1, 'RU.НЦСС.001.003.1.ПР.00030', 'Технологическая линия для производства преднапряженных железобетонных изделий мето-дом виброформования на длинных стендах «ST-ЛБФ», включая модификации, комплек-тующие изделия и запасные части, выпускаемая по ТУ 4842-01-89635895-2006 (адрес производст-ва: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 4200, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 13, 1, '2015-08-20 14:30:13', '2015-09-10 14:26:20');
INSERT INTO certificates VALUES (40, true, 1, 'RU.НЦСС.001.003.1.ПР.00031', 'Технологическая линия для изготовления методом вибропрессования мелкоштучных изделий для жилищного и дорожного строительства «ST-Р», включая модификации, комплектующие изделия и запасные части, выпускаемая по ТУ 4845-01-89635895-2006 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 4500, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 13, 1, '2015-08-20 14:34:38', '2015-09-10 14:26:29');
INSERT INTO certificates VALUES (62, true, 1, 'RU.НЦСС.001.008.2.ПР.00053', 'Смесь сухая клеевая вебер.терм ЕПС (weber.therm EPS)', 'ОКП', '574550', 'ПР', '2015-11-25', '2018-11-24', 6, 1, '2015-12-07 07:20:56', '2015-12-07 07:22:00');
INSERT INTO certificates VALUES (63, true, 1, 'RU.НЦСС.001.008.2.ПР.00054', 'Смесь сухая клеевая вебер.терм МВ (weber.therm MW)', 'ОКП', '574550', 'ПР', '2015-11-25', '2018-11-24', 6, 1, '2015-12-07 07:22:46', '2015-12-08 14:29:52');
INSERT INTO certificates VALUES (64, true, 1, 'RU.НЦСС.001.008.2.ПР.00055', 'Смесь сухая штукатурно-клеевая вебер.терм А100 (weber.therm А100)', 'ОКП', '574550', 'ПР', '2015-11-25', '2018-11-24', 6, 1, '2015-12-07 07:24:15', '2015-12-07 07:24:52');
INSERT INTO certificates VALUES (65, true, 1, 'RU.НЦСС.001.008.2.ПР.00056', 'Смесь сухая армировочно-клеевая вебер.терм С100 (weber.therm S100)', 'ОКП', '574550', 'ПР', '2015-11-25', '2018-11-24', 6, 1, '2015-12-07 07:25:42', '2015-12-07 07:26:17');
INSERT INTO certificates VALUES (46, true, 1, 'RU.НЦСС.001.003.1.ПР.00037', 'Установки бетоносмесительные автоматизированные (Бетонные заводы) «ST-БСУ», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4826-002-89635895-2006 (адрес производства: 129085, г. Москва, Звездный бульвар, д. 21, стр. 1)', 'ОКП, ТН ВЭД', '48 2622, 8474 31 000 0', 'ПР', '2015-08-18', '2020-08-17', 14, 1, '2015-08-20 14:43:44', '2015-09-10 14:27:22');
INSERT INTO certificates VALUES (49, true, 1, 'RU.НЦСС.001.003.1.ПР.00040', 'Технологическая линия для производства преднапряженных железобетонных изделий методом виброформования на длинных стендах «ST-ЛБФ», включая модификации, комплектующие изделия и запасные части, выпускаемая по ТУ 4842-01-89635895-2006 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 4200, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 15, 1, '2015-08-20 14:47:09', '2015-09-10 14:28:18');
INSERT INTO certificates VALUES (50, true, 1, 'RU.НЦСС.001.003.1.ПР.00041', 'Технологическая линия для изготовления методом вибропрессования мелкоштучных изделий для жилищного и дорожного строительства «ST-Р», включая модификации, комплектующие изделия и запасные части, выпускаемая по ТУ 4845-01-89635895-2006 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 4500, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 15, 1, '2015-08-20 14:48:22', '2015-09-10 14:28:27');
INSERT INTO certificates VALUES (51, true, 1, 'RU.НЦСС.001.003.1.ПР.00042', 'Установки бетоносмесительные автоматизированные (Бетонные заводы) «ST-БСУ», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4826-002-89635895-2006 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 2622, 8474 31 000 0', 'ПР', '2015-08-18', '2020-08-17', 15, 1, '2015-08-20 14:51:13', '2015-09-10 14:28:35');
INSERT INTO certificates VALUES (96, true, 1, 'RU.НЦСС.005.008.2.ПР.00084', 'Смесь сухая штукатурная гипсовая вебер.ветонит изи гипс (weber.vetonit easy gyps) Выпускается по ТУ 5745-002-56846022-2016 с изменением № 1', 'ОКП', '574550', 'ПР', '2016-07-14', '2019-07-13', 6, 1, '2016-07-14 12:19:07.189065', '2016-07-14 12:21:28.542051');
INSERT INTO certificates VALUES (52, true, 1, 'RU.НЦСС.001.003.1.ПР.00043', 'Стенды технологические с изменяемым углом рабочей поверхности (опрокидные поддоны) для производства плоских железобетонных изделий (трехслойных ограждающих пане-лей, диафрагм жесткости, панелей шахт лифтов и прочее) «ST-ОП», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4840-01-89635895-2014 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 4000, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 15, 1, '2015-08-20 14:52:34', '2015-09-10 14:28:43');
INSERT INTO certificates VALUES (95, true, 1, 'RU.НЦСС.005.008.2.ПР.00083', 'Смесь сухая напольная вебер.ветонит стронг (weber.vetonit strong) Выпускается по ТУ 5745-033-56846022-2013 c изменением № 1', 'ОКП', '574550', 'ПР', '2016-07-14', '2019-07-13', 6, 1, '2016-07-14 12:16:50.299073', '2016-07-14 12:21:37.488331');
INSERT INTO certificates VALUES (53, true, 1, 'RU.НЦСС.001.003.1.ПР.00044', 'Металлические подогреваемые формы для изготовления железобетонных изделий (колонн, свай, лестничных маршей, перемычек и прочее) «ST», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4850-01-89635895-2014 (адрес производства: 143900, Московская область, г. Балашиха, Западная промзона, ш. Энтузиастов, д. 7)', 'ОКП, ТН ВЭД', '48 4200, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 15, 1, '2015-08-20 14:53:46', '2015-09-10 14:28:53');
INSERT INTO certificates VALUES (54, true, 1, 'RU.НЦСС.001.008.2.ПР.00045', 'Смесь сухая кладочная вебер.ветонит МЛ 5 (weber.vetonit ML 5)', 'ОКП', '574550', 'ПР', '2015-09-17', '2018-09-16', 6, 1, '2015-10-13 08:36:20', '2015-10-13 08:37:50');
INSERT INTO certificates VALUES (55, true, 1, 'RU.НЦСС.001.008.2.ПР.00046', 'Смесь сухая напольная вебер.ветонит фаст левел (weber.vetonit fast level)', 'ОКП', '574550', 'ПР', '2015-10-06', '2018-10-05', 6, 1, '2015-10-13 08:39:00', '2015-10-13 08:40:00');
INSERT INTO certificates VALUES (56, true, 1, 'RU.НЦСС.001.008.2.ПР.00047', 'Смесь сухая штукатурная вебер.ветонит ТТ40 (weber.vetonit ТТ40)', 'ОКП', '574550', 'ПР', '2015-10-06', '2018-10-05', 6, 1, '2015-10-13 08:41:29', '2015-10-13 08:42:57');
INSERT INTO certificates VALUES (57, true, 1, 'RU.НЦСС.001.008.3.ПР.00048', 'Смесь сухая шпаклевочная вебер.ветонит ЛР+ (weber.vetonit LR+)', 'ОКП', '574550', 'ПР', '2015-10-15', '2018-10-14', 6, 1, '2015-12-07 07:10:10', '2015-12-07 07:11:40');
INSERT INTO certificates VALUES (58, true, 1, 'RU.НЦСС.001.008.3.ПР.00049', 'Смесь сухая шпаклевочная вебер.ветонит ЛР Файн (weber.vetonit LR Fine)', 'ОКП', '574550', 'ПР', '2015-10-15', '2018-10-14', 6, 1, '2015-12-07 07:12:55', '2015-12-07 07:13:56');
INSERT INTO certificates VALUES (59, true, 1, 'RU.НЦСС.001.008.3.ПР.00050', 'Смесь сухая шпаклевочная вебер.ветонит КР (weber.vetonit KR)', 'ОКП', '574550', 'ПР', '2015-10-15', '2018-10-14', 6, 1, '2015-12-07 07:14:47', '2015-12-07 07:15:39');
INSERT INTO certificates VALUES (60, true, 1, 'RU.НЦСС.001.008.3.ПР.00051', 'Смесь сухая шпаклевочная вебер.ветонит ВХ (weber.vetonit VH)', 'ОКП', '574550', 'ПР', '2015-10-15', '2018-10-14', 6, 1, '2015-12-07 07:16:34', '2015-12-07 07:17:12');
INSERT INTO certificates VALUES (61, true, -1, 'RU.НЦСС.001.008.3.ПР.00052', 'Смесь сухая шпаклевочная вебер.ренд фасад белый (weber.rend façade white)', 'ОКП', '574550', 'ПР', '2015-10-15', '2016-05-26', 6, 1, '2015-12-07 07:19:27', '2015-12-07 07:20:14');
INSERT INTO certificates VALUES (79, true, 1, 'RU.НЦСС.005.003.3.ПР.00068', 'Плиты дорожные предварительно напряженные ПДН, изготавливаемые методом безопалубочного формования по ТУ 5846-003-57650077-2016 «Плиты железобетонные предварительно напряженные дорожные ПДН» ', 'ОКДП, ОКП', '2695527, 584611', 'ПР', '2016-02-10', '2020-02-09', 11, 1, '2016-02-25 13:53:29', '2016-06-07 13:48:27.546092');
INSERT INTO certificates VALUES (69, true, 1, 'RU.НЦСС.001.003.1.ПР.00060', 'Индивидуальные сборные лестничные марши марок М1, М2, М3, М4 из бетона по прочности на сжатие В30, изготовляемые АО «Промстройтехно-Инвест» на объекте по адресу: Москва, Ленинский пр-т, вл. 97-99 (партия 272 шт.) ', 'ОКДП, ОКП', '2695410, 229199', 'ПР', '2015-12-07', '2016-12-06', 16, 1, '2015-12-08 14:18:59', '2015-12-08 14:29:46');
INSERT INTO certificates VALUES (80, true, 1, 'RU.НЦСС.005.003.3.ПР.00069', 'Плиты дорожные предварительно напряженные ПДН, изготавливаемые методом безопалубочного формования по ТУ 5846-003-57650077-2016 «Плиты железобетонные предварительно напряженные дорожные ПДН» ', 'ОКДП, ОКП', '2695527, 584611', 'ПР', '2016-02-10', '2020-02-09', 11, 1, '2016-02-25 14:00:34', '2016-06-07 13:49:03.850806');
INSERT INTO certificates VALUES (70, true, 1, 'RU.НЦСС.001.008.2.ПР.00061', 'Смесь сухая напольная вебер.ветонит 5000 (weber.vetonit 5000) Выпускается по ТУ 5745-033-56846022-2013 с изменением № 1 ', 'ОКП', '574550', 'ПР', '2015-12-10', '2018-12-09', 6, 1, '2015-12-11 08:38:57', '2015-12-11 08:40:16');
INSERT INTO certificates VALUES (72, true, -1, 'RU.НЦСС.001.008.2.ПР.00063', 'Настоящий сертификат удостоверяет, что смесь сухая шпаклевочная вебер.ветонит ВХ (weber.vetonit VH) Выпускается по EN 998-1 ', 'ОКП', '574550', 'ПР', '2015-12-10', '2016-10-02', 6, 1, '2015-12-11 08:44:29', '2016-10-01 21:00:12.847204');
INSERT INTO certificates VALUES (71, true, 1, 'RU.НЦСС.001.008.2.ПР.00062', 'Смесь сухая напольная вебер.ветонит 4100 (weber.vetonit 4100) Выпускается по ТУ 5745-033-56846022-2013 с изменением № 1 ', 'ОКП', '574550', 'ПР', '2015-12-10', '2018-12-09', 6, 1, '2015-12-11 08:42:49', '2015-12-11 08:43:41');
INSERT INTO certificates VALUES (73, true, -1, 'RU.НЦСС.001.008.2.ПР.00064', 'Смесь сухая шпаклевочная вебер.ветонит КР (weber.vetonit КR) Выпускается по EN 998-1 ', 'ОКП', '574550', 'ПР', '2015-12-10', '2016-10-02', 6, 1, '2015-12-11 08:47:24', '2016-10-01 21:00:12.968358');
INSERT INTO certificates VALUES (74, true, -1, 'RU.НЦСС.001.008.2.ПР.00065', 'Смесь сухая шпаклевочная вебер.ветонит ЛР+ (weber.vetonit LR+) Выпускается по EN 998-1 ', 'ОКП', '574550', 'ПР', '2015-12-10', '2016-10-02', 6, 1, '2015-12-11 08:49:23', '2016-10-01 21:00:12.99209');
INSERT INTO certificates VALUES (75, true, 1, 'RU.НЦСС.001.008.2.ПР.00066', 'Штукатурка декоративная водно-дисперсионная для отделки фасадов weber.pas marmolit Выпускается по EТА- 03/0012 ', 'ОКП, ТН ВЭД', '23 1600, 3214 90 000 9', 'ПР', '2015-12-28', '2016-12-27', 6, 1, '2015-12-29 10:05:19', '2015-12-29 10:06:28');
INSERT INTO certificates VALUES (76, true, 1, 'RU.НЦСС.001.008.2.ПР.00067', 'Штукатурка декоративная водно-дисперсионная для отделки фасадов weber.pas silikon Выпускается по ЕТА-03/0012 ', 'ОКП, ТН ВЭД', '23 1600, 3214 90 000 9', 'ПР', '2015-12-28', '2016-12-27', 6, 1, '2015-12-29 10:07:20', '2015-12-29 10:08:00');
INSERT INTO certificates VALUES (77, true, 1, 'RU.НЦСС.007.012.1.СМ.00003', 'Система менеджмента качества при выполнении работ по подготовке строительного участка, предшествующих строительству, проведению общих строительных работ по возведению зданий и сооружений, работ по монтажу оборудования, работ по завершению строительства, при оказании услуг по подтверждению соответствия, услуг по проведению инструментального контроля (измерений) и технических испытаний объектов в области строительства и жилищно-коммунального хозяйства, услуг по проведению строительного контроля, а также при осуществлении функций генеральной подрядной организации', 'ОКДП', '4510000-4540000, 7420000', 'СМ', '2016-01-22', '2019-01-21', 4, 4, '2016-01-26 08:54:38', '2016-01-26 09:06:09');
INSERT INTO certificates VALUES (81, true, 1, 'RU.НЦСС.005.008.2.ПР.00070', 'Настоящий сертификат удостоверяет, что смесь сухая клеевая вебер.ветонит блок зима (weber.vetonit block winter) Выпускается по ТУ 5745-031-56846022-2013 c изменением № 2 ', 'ОКП', '574550', 'ПР', '2016-02-15', '2017-07-23', 6, 1, '2016-04-11 10:17:20', '2016-04-11 10:19:07');
INSERT INTO certificates VALUES (82, true, 1, 'RU.НЦСС.005.008.2.ПР.00071', 'Настоящий сертификат удостоверяет, что смесь сухая клеевая вебер.ветонит ультра фикс зима (weber.vetonit ultra fix winter) Выпускается по ТУ 5745-031-56846022-2013 c изменением № 2 ', 'ОКП', '574550', 'ПР', '2016-02-15', '2017-07-23', 6, 1, '2016-04-11 10:19:58', '2016-04-11 10:21:15');
INSERT INTO certificates VALUES (83, true, 1, 'RU.НЦСС.005.008.2.ПР.00072', 'Смесь сухая кладочная вебер.ветонит МЛ 5 зима (weber.vetonit ML 5 winter) Выпускается по ТУ 5745-003-56846022-2015 ', 'ОКП', '574550', 'ПР', '2016-03-14', '2019-03-13', 6, 1, '2016-04-11 10:22:45', '2016-04-11 10:24:12');
INSERT INTO certificates VALUES (84, true, 1, 'RU.НЦСС.005.008.2.ПР.00073', 'Мастика гидроизоляционная вебер.тек 822 (weber.tec 822) Выпускается по ТУ 5775-024-60499460-2015 ', 'ОКП', '577530', 'ПР', '2016-04-05', '2019-04-04', 6, 1, '2016-04-11 10:25:03', '2016-04-11 10:26:24');
INSERT INTO certificates VALUES (85, true, 1, 'RU.НЦСС.005.008.2.ПР.00074', 'Смесь сухая специальная вебер.ветонит ПСЛ зима (weber.vetonit PSL winter) Выпускается по ТУ 5745-004-56846022-2015 ', 'ОКП', '574550', 'ПР', '2016-04-05', '2019-04-04', 6, 1, '2016-04-11 10:27:25', '2016-04-11 10:28:28');
INSERT INTO certificates VALUES (86, true, 1, 'RU.НЦСС.005.008.2.ПР.00075', 'Смеси сухие армировочно-клеевые: вебер.терм С100 (weber.therm S100), вебер.терм С100 зима (weber.therm S100 winter) Выпускаются по ТУ 5745-031-56846022-2013 с изменением № 2 ', 'ОКП', '574550', 'ПР', '2016-04-07', '2019-04-06', 6, 1, '2016-04-11 10:29:23', '2016-04-11 10:30:29');
INSERT INTO certificates VALUES (87, true, 1, 'RU.НЦСС.005.008.1.ПР.00076', 'Смеси сухие клеевые т.м. «πQ»: INSTALLER MX-100, INSTALLER MX-200, INSTALLER MX-300, INSTALLER MX-400 Выпускаются по ГОСТ Р 56387-2015 ', 'ОКП', '574550', 'ПР', '2016-04-11', '2019-04-10', 17, 1, '2016-04-11 10:34:32', '2016-04-11 10:35:38');
INSERT INTO certificates VALUES (18, true, 1, 'RU.НЦСС.003.010.1.ПС.00001', 'Топчий Дмитрий Владимирович, строительный эксперт по исследованию промышленных и гражданских объектов, их отдельных фрагментов, инженерных систем, оборудования и коммуникаций с целью установления объема, качества и стоимости выполненных работ, использованных материалов и изделий', '', '', 'ПС', '2015-04-01', '2020-03-30', 3, 2, '2015-04-10 09:06:08', '2016-06-08 08:21:46.773914');
INSERT INTO certificates VALUES (78, true, 1, 'RU.НЦСС.003.010.1.ПС.00009', 'Черноглазов Сергей Дмитриевич, руководитель лаборатории по оценке энергоэффективности зданий и сооружений', '', '', 'ПС', '2016-02-25', '2021-02-24', 4, 2, '2016-02-25 13:39:36', '2016-06-08 08:38:30.012436');
INSERT INTO certificates VALUES (19, true, 1, 'RU.НЦСС.003.010.1.ПС.00002', 'Топчий Дмитрий Владимирович, строительный эксперт по исследованию проектной документации промышленных и гражданских объектов в целях установления их соответствия требованиям специальных правил; определении технического состояния, а так же причин, условий, обстоятельств и механизма разрушения строительных объектов, частичной или полной утраты ими своих функциональных, эксплуатационных, эстетических и других свойств', '', '', 'персонал', '2015-04-01', '2020-03-30', 3, 2, '2015-04-10 09:09:07', '2016-06-08 08:22:35.517255');
INSERT INTO certificates VALUES (21, true, 1, 'RU.НЦСС.003.010.1.ПС.00004', 'Кулябичев Антон Александрович, строительный эксперт по исследованию проектной документации промышленных и гражданских объектов в целях установления их соответствия требованиям специальных правил; определении технического состояния, а так же причин, условий, обстоятельств и механизма разрушения строительных объектов, частичной или полной утраты ими своих функциональных, эксплуатационных, эстетических и других свойств', '', '', 'ПС', '2015-04-01', '2020-03-30', 3, 2, '2015-04-10 09:13:11', '2016-06-08 08:26:59.952156');
INSERT INTO certificates VALUES (26, true, 1, 'RU.НЦСС.001.002.1.ПС.00007', 'Чучмаев Виктор Владимирович, строительный эксперт по исследованию промышленных и гражданских объектов, их отдельных фрагментов, инженерных систем, оборудования и коммуникаций с целью установления объема, качества и стоимости выполненных работ, использованных материалов и изделий', '', '', 'ПС', '2015-05-12', '2020-05-11', 1, 1, '2015-05-12 07:12:10', '2016-06-08 08:34:18.311986');
INSERT INTO certificates VALUES (89, true, 1, 'RU.НЦСС.005.008.3.ПР.00077', 'Смесь сухая клеевая для фасадных систем 735 (insulation fix),
Смесь сухая клеевая армирующая для фасадных систем 737 (fassade universal)
Выпускается по ТУ 5745-003-76816508-2009 с изм. №№ 1, 2, 3, 4', 'ОКП, ТН ВЭД', '57 4550, 3214 90 000 9', 'ПР', '2016-05-24', '2019-05-23', 30, 1, '2016-06-08 07:58:15.653284', '2016-06-09 07:35:29.872798');
INSERT INTO certificates VALUES (48, true, 1, 'RU.НЦСС.001.003.1.ПР.00039', 'Металлические подогреваемые формы для изготовления железобетонных изделий (колонн, свай, лестничных маршей, перемычек и прочее) «ST», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4850-01-89635895-2014 (адрес производства: 129085, г. Москва, Звездный бульвар, д. 21, стр. 1)', 'ОКП, ТН ВЭД', '48 4200, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 14, 1, '2015-08-20 14:46:05', '2016-06-09 13:20:13.585137');
INSERT INTO certificates VALUES (47, true, 1, 'RU.НЦСС.001.003.1.ПР.00038', 'Стенды технологические с изменяемым углом рабочей поверхности (опрокидные поддоны) для производства плоских железобетонных изделий (трехслойных ограждающих панелей, диафрагм жесткости, панелей шахт лифтов и прочее) «ST-ОП», включая модификации, комплектующие изделия и запасные части, выпускаемые по ТУ 4840-01-89635895-2014 (адрес производства: 129085, г. Москва, Звездный бульвар, д. 21, стр. 1)', 'ОКП, ТН ВЭД', '48 4000, 8474 80 908 0', 'ПР', '2015-08-18', '2020-08-17', 14, 1, '2015-08-20 14:45:07', '2016-06-09 13:20:49.36458');
INSERT INTO certificates VALUES (25, true, -3, 'RU.НЦСС.004.012.1.СМ.00002', 'Система менеджмента качества при выполнении работ по подготовке строительного участка, предшествующей строительству, проведению общих строительных работ по возведению зданий и сооружений, по монтажу оборудования, работ по завершению строительства, а также при осуществлении функций генеральной подрядной организации и строительного контроля', '', '', 'СМ', '2015-04-03', '2018-04-02', 1, 3, '2015-04-10 09:19:51', '2016-07-28 11:48:59.265108');
INSERT INTO certificates VALUES (97, true, 1, 'RU.НЦСС.006.013.1.СМ.00004', 'Система менеджмента качества при выполнении работ по подготовке строительного участка, предшествующей строительству, проведению общих строительных работ по возведению зданий и сооружений, по монтажу оборудования, работ по завершению строительства, а также при осуществлении функций генеральной подрядной организации и строительного контроля', 'ОКДП', '4510000, 4520000, 4530000, 45400', 'СМ', '2016-07-13', '2018-04-02', 1, 3, '2016-07-28 11:51:15.193507', '2016-07-28 11:56:51.528076');


--
-- Name: certificates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('certificates_id_seq', 97, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO customers VALUES (1, true, 'ООО «ССК»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.296997', '2016-06-07 09:08:18.296997');
INSERT INTO customers VALUES (2, true, 'ООО «ССК-проект»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.307043', '2016-06-07 09:08:18.307043');
INSERT INTO customers VALUES (3, true, 'ЗАО НИЦ «Строительная экспертиза»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.317224', '2016-06-07 09:08:18.317224');
INSERT INTO customers VALUES (4, true, 'АО НИЦ «Строительная экспертиза»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.325319', '2016-06-07 09:08:18.325319');
INSERT INTO customers VALUES (6, true, 'ООО «Сен-Гобен Строительная Продукция Рус»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.34722', '2016-06-07 09:08:18.34722');
INSERT INTO customers VALUES (7, true, 'ООО «СтройПрогресс»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.355409', '2016-06-07 09:08:18.355409');
INSERT INTO customers VALUES (8, true, 'ООО «ПолиХимГрупп»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.377131', '2016-06-07 09:08:18.377131');
INSERT INTO customers VALUES (9, true, 'ООО «ФОРМПЛАСТ»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.387951', '2016-06-07 09:08:18.387951');
INSERT INTO customers VALUES (10, true, 'ООО «ИНТРЕЙ Полимерные Системы»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.395442', '2016-06-07 09:08:18.395442');
INSERT INTO customers VALUES (11, true, 'ООО «К-777»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.402402', '2016-06-07 09:08:18.402402');
INSERT INTO customers VALUES (12, true, 'ЗАО «Компания «СТЭС-ВЛАДИМИР»', NULL, NULL, 'Владимир', NULL, '2016-06-07 09:08:18.409683', '2016-06-07 09:08:18.409683');
INSERT INTO customers VALUES (13, true, 'ООО «Технологии бетона»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.428445', '2016-06-07 09:08:18.428445');
INSERT INTO customers VALUES (14, true, 'ООО «НПЦ «Стройтех»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.438177', '2016-06-07 09:08:18.438177');
INSERT INTO customers VALUES (15, true, 'ООО «Торговый дом «СТРОЙТЕХ-345МЗ»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.445762', '2016-06-07 09:08:18.445762');
INSERT INTO customers VALUES (16, true, 'АО «Промстройтехно-Инвест»', NULL, NULL, 'Москва', NULL, '2016-06-07 09:08:18.45615', '2016-06-07 09:08:18.45615');
INSERT INTO customers VALUES (17, true, 'ООО «Торговый Дом «Экс Морэ»', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.464458', '2016-06-07 09:08:18.464458');
INSERT INTO customers VALUES (18, true, 'Храбров Антон Павлович', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.472298', '2016-06-07 09:08:18.472298');
INSERT INTO customers VALUES (19, true, 'Гришин Игорь Николаевич', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.479755', '2016-06-07 09:08:18.479755');
INSERT INTO customers VALUES (20, true, 'Топчий Дмитрий Владимирович', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.487786', '2016-06-07 09:08:18.487786');
INSERT INTO customers VALUES (21, true, 'Чернигов Виталий Сергеевич', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.494762', '2016-06-07 09:08:18.494762');
INSERT INTO customers VALUES (22, true, 'Черноглазов Сергей Дмитриевич', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.504541', '2016-06-07 09:08:18.504541');
INSERT INTO customers VALUES (23, true, 'Чучмаев Виктор Владимирович', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.513794', '2016-06-07 09:08:18.513794');
INSERT INTO customers VALUES (24, true, 'Кулябичев Антон Александрович', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.525728', '2016-06-07 09:08:18.525728');
INSERT INTO customers VALUES (25, true, 'Кочетков Алексей Юрьевич', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.536805', '2016-06-07 09:08:18.536805');
INSERT INTO customers VALUES (27, true, 'Харькова Нина Ивановна', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.554622', '2016-06-07 09:08:18.554622');
INSERT INTO customers VALUES (28, true, 'Клопыжников Николай Петрович', NULL, NULL, NULL, NULL, '2016-06-07 09:08:18.562354', '2016-06-07 09:08:18.562354');
INSERT INTO customers VALUES (29, true, 'ЗАО "НЦСС"', '', '', '', NULL, '2016-06-07 09:08:18.571755', '2016-06-08 08:00:48.135378');
INSERT INTO customers VALUES (26, true, 'ЗАО НИЦ "Строительная экспертиза"', '', '', '', NULL, '2016-06-07 09:08:18.545147', '2016-06-08 08:02:38.806208');
INSERT INTO customers VALUES (32, true, 'ООО "СВАП БЕТОН"', '', '', '127204, Москва, Дмитровское шоссе, д. 163, стр. 20', 2, '2016-06-08 11:21:04.980045', '2016-06-09 07:34:43.012664');
INSERT INTO customers VALUES (31, true, 'ООО "ИСЛ ГАРАСТ"', '', '', '143560, Московская область, Истринский р-н, п. Румянцево, Волоколамское ш., д. 120', 2, '2016-06-08 11:19:30.36283', '2016-06-09 07:34:56.273642');
INSERT INTO customers VALUES (30, true, 'ООО «Форбо Еврокол Рус»', '', '+7 (495) 215-21-01, +7 (4725) 46-91-11', '309500, Белгородская обл., г. Старый Оскол, Ст. Котел,  Промузел, пл. Складская, проезд Ш-6, 4а, стр. 1', 2, '2016-06-08 07:54:28.366392', '2016-06-09 07:35:05.536807');
INSERT INTO customers VALUES (5, true, 'ООО "МСУ-363"', '', '', '', NULL, '2016-06-07 09:08:18.337292', '2016-06-09 07:37:15.340285');


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('customers_id_seq', 32, true);


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO partners VALUES (1, true, 0, 'gost.jpg', 'Федеральное агентство по техническому регулированию и метрологии', '<p>Федеральный орган исполнительной власти, осуществляющий функции по оказанию государственных услуг, управлению государственным имуществом в сфере технического регулирования и метрологии.</p>', '', '', 'г. Москва, Ленинский проспект 9', '//www.gost.ru/wps/portal/', '2016-06-07 09:08:15.892993', '2016-07-09 10:16:14.213721');
INSERT INTO partners VALUES (2, true, 1, 'mgsu.jpg', 'Московский государственный строительный университет', '<p>ФГБОУ ВПО «МГСУ», Национальный исследовательский университет - до 1993 года МИСИ им. В.В. Куйбышева.</p>', '', '', 'г. Москва, Ярославское шоссе 26', '//www.mgsu.ru/', '2016-06-07 09:08:16.260083', '2016-07-09 10:16:27.771912');
INSERT INTO partners VALUES (3, true, 2, 'labmgsu.jpg', 'АО НИЦ «Строительная экспертиза»', '<p>Консалтинг, лабораторное сопровождение строительства, обследование зданий и сооружений промышленного и гражданского назначения.</p>', '', '', 'г. Москва, Ярославское шоссе 26', '//labmgsu.ru/', '2016-06-07 09:08:16.607581', '2016-07-09 10:16:39.31049');
INSERT INTO partners VALUES (10, true, 9, 'wkretmet.jpg', '«Wkret-met»', '', '', '', 'г. Москва, ул. Ферганская 6 строение 7', '//www.wkretmet.ru/', '2016-06-07 09:08:17.903824', '2016-07-09 10:31:54.203653');
INSERT INTO partners VALUES (7, true, 6, NULL, 'ООО «НПО СтройПрогресс»', '', NULL, NULL, '', '', '2016-06-07 09:08:17.636181', '2016-06-07 09:08:17.636181');
INSERT INTO partners VALUES (4, true, 3, 'gkcck.jpg', 'Группа компаний «ССК»', '<p>Объединяет строительные, инжиниринговые и ремонтные компании осуществляющие работы по проектированию, строительству и техническому надзору.</p>', '', '', 'г. Москва, улица Малая Дмитровка 18А строение 3', '//gkcck.ru/', '2016-06-07 09:08:16.897128', '2016-07-09 10:16:49.981801');
INSERT INTO partners VALUES (5, true, 4, 'stroilab_sl.jpg', 'ООО «Стройлаборатория СЛ»', '', '', '', 'г. Москва ул. Народного Ополчения 14 корпуc 2', '//stroilab-sl.ru/', '2016-06-07 09:08:17.154566', '2016-07-09 10:17:06.482707');
INSERT INTO partners VALUES (8, true, 7, NULL, 'ООО «ПолиХимГрупп»', '', NULL, NULL, '', '', '2016-06-07 09:08:17.643997', '2016-06-09 07:01:21.383533');
INSERT INTO partners VALUES (6, true, 5, 'giprosc.jpg', 'ООО НПФ «Гипростройкомплекс»', '<p>
Инженерно-геодезические изыскания, усиление конструкций, техническое обследование несущих и ограждающих конструкций зданий и сооружений, проектирование и сопровождение на всех этапах строительного производства.
</p>', '', '', 'г. Москва, Рязанский проспект 16 строение 4', '//giprosc.ru/', '2016-06-07 09:08:17.378887', '2016-07-09 10:17:19.05391');
INSERT INTO partners VALUES (9, true, 8, 'saint_gobain.jpg', '«Сен-Гобен»', '<p>«Сен-Гобен» (Saint-Gobain) – мировой лидер в создании комфортного пространства для проживания, работы и отдыха человека. Компания разрабатывает инновационные решения для строительства, реновации, промышленности, науки.
</p>', '', '', 'г. Москва, ул. Электрозаводская 27 строение 8', '//www.saint-gobain.ru/', '2016-06-07 09:08:17.653004', '2016-07-09 10:31:44.72146');


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('partners_id_seq', 10, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO schema_migrations VALUES ('20160401000000');
INSERT INTO schema_migrations VALUES ('20160401000001');
INSERT INTO schema_migrations VALUES ('20160401000100');
INSERT INTO schema_migrations VALUES ('20160401000200');
INSERT INTO schema_migrations VALUES ('20160401000300');
INSERT INTO schema_migrations VALUES ('20160401000400');
INSERT INTO schema_migrations VALUES ('20160401000500');
INSERT INTO schema_migrations VALUES ('20160401000600');
INSERT INTO schema_migrations VALUES ('20160401000700');
INSERT INTO schema_migrations VALUES ('20160401000800');


--
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO stages VALUES (83, '@', '2016-12-24', '', NULL, 'Certificate', 12, '2016-06-07 14:59:21.927936', '2016-06-08 19:19:56.713301');
INSERT INTO stages VALUES (57, '@', '2015-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.694264', '2016-06-08 19:19:56.507864');
INSERT INTO stages VALUES (8, '!', '2014-12-30', '', NULL, 'Attestat', 16, '2016-06-07 09:08:19.062823', '2016-06-08 19:19:56.18861');
INSERT INTO stages VALUES (7, '!', '2014-12-30', '', NULL, 'Attestat', 14, '2016-06-07 09:08:19.022598', '2016-06-08 19:19:56.181313');
INSERT INTO stages VALUES (6, '!', '2014-12-30', '', NULL, 'Attestat', 13, '2016-06-07 09:08:18.998717', '2016-06-08 19:19:56.173053');
INSERT INTO stages VALUES (58, '@', '2016-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.697603', '2016-06-08 19:19:56.515233');
INSERT INTO stages VALUES (59, '@', '2017-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.699311', '2016-06-08 19:19:56.524867');
INSERT INTO stages VALUES (60, '@', '2018-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.701032', '2016-06-08 19:19:56.537035');
INSERT INTO stages VALUES (61, '@', '2019-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.702741', '2016-06-08 19:19:56.545638');
INSERT INTO stages VALUES (62, '@', '2020-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.704377', '2016-06-08 19:19:56.552904');
INSERT INTO stages VALUES (63, '@', '2021-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.706154', '2016-06-08 19:19:56.559888');
INSERT INTO stages VALUES (64, '@', '2022-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.707885', '2016-06-08 19:19:56.567013');
INSERT INTO stages VALUES (65, '@', '2023-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.709573', '2016-06-08 19:19:56.574268');
INSERT INTO stages VALUES (66, '@', '2024-05-22', '', NULL, 'Certificate', 2, '2016-06-07 14:27:01.711282', '2016-06-08 19:19:56.58156');
INSERT INTO stages VALUES (67, '@', '2015-12-05', '', NULL, 'Certificate', 3, '2016-06-07 14:29:55.758881', '2016-06-08 19:19:56.58872');
INSERT INTO stages VALUES (68, '@', '2016-12-05', '', NULL, 'Certificate', 3, '2016-06-07 14:29:55.763245', '2016-06-08 19:19:56.599338');
INSERT INTO stages VALUES (69, '@', '2017-12-05', '', NULL, 'Certificate', 3, '2016-06-07 14:29:55.765778', '2016-06-08 19:19:56.60634');
INSERT INTO stages VALUES (70, '@', '2018-12-05', '', NULL, 'Certificate', 3, '2016-06-07 14:29:55.767846', '2016-06-08 19:19:56.614523');
INSERT INTO stages VALUES (71, '@', '2015-12-09', '', NULL, 'Certificate', 4, '2016-06-07 14:32:08.30012', '2016-06-08 19:19:56.621501');
INSERT INTO stages VALUES (73, '!', '2015-12-10', 'По заявлению владельца', NULL, 'Certificate', 4, '2016-06-07 14:34:42.506454', '2016-06-08 19:19:56.628482');
INSERT INTO stages VALUES (72, '@', '2016-12-08', '', NULL, 'Certificate', 4, '2016-06-07 14:32:08.303605', '2016-06-08 19:19:56.635204');
INSERT INTO stages VALUES (74, '@', '2015-12-24', '', '2016-02-03', 'Certificate', 5, '2016-06-07 14:36:58.242797', '2016-06-08 19:19:56.642672');
INSERT INTO stages VALUES (75, '@', '2015-12-24', '', '2016-02-03', 'Certificate', 6, '2016-06-07 14:38:33.595079', '2016-06-08 19:19:56.649639');
INSERT INTO stages VALUES (76, '@', '2015-12-24', '', '2016-02-03', 'Certificate', 7, '2016-06-07 14:39:37.676269', '2016-06-08 19:19:56.656615');
INSERT INTO stages VALUES (77, '@', '2015-12-24', '', '2016-02-03', 'Certificate', 8, '2016-06-07 14:40:30.396802', '2016-06-08 19:19:56.66361');
INSERT INTO stages VALUES (78, '@', '2015-12-24', '', '2016-02-03', 'Certificate', 9, '2016-06-07 14:43:13.76062', '2016-06-08 19:19:56.670212');
INSERT INTO stages VALUES (79, '@', '2016-12-23', '', NULL, 'Certificate', 9, '2016-06-07 14:47:18.930309', '2016-06-08 19:19:56.676924');
INSERT INTO stages VALUES (80, '@', '2015-12-24', '', '2016-02-03', 'Certificate', 10, '2016-06-07 14:48:49.315812', '2016-06-08 19:19:56.685472');
INSERT INTO stages VALUES (81, '@', '2015-12-24', '', '2016-02-03', 'Certificate', 11, '2016-06-07 14:49:41.777628', '2016-06-08 19:19:56.692544');
INSERT INTO stages VALUES (82, '@', '2015-12-24', '', NULL, 'Certificate', 12, '2016-06-07 14:59:21.92414', '2016-06-08 19:19:56.699521');
INSERT INTO stages VALUES (10, '!', '2016-02-10', 'По заявлению владельца', NULL, 'Certificate', 12, '2016-06-07 09:08:19.677264', '2016-06-08 19:19:56.706525');
INSERT INTO stages VALUES (84, '@', '2017-12-24', '', NULL, 'Certificate', 12, '2016-06-07 14:59:21.930533', '2016-06-08 19:19:56.719814');
INSERT INTO stages VALUES (85, '@', '2018-12-24', '', NULL, 'Certificate', 12, '2016-06-07 14:59:21.933282', '2016-06-08 19:19:56.727492');
INSERT INTO stages VALUES (86, '@', '2016-01-25', '', '2016-02-03', 'Certificate', 13, '2016-06-07 15:00:18.332873', '2016-06-08 19:19:56.737998');
INSERT INTO stages VALUES (87, '@', '2016-01-25', '', '2016-02-03', 'Certificate', 14, '2016-06-07 15:01:21.067615', '2016-06-08 19:19:56.746716');
INSERT INTO stages VALUES (88, '@', '2016-01-26', '', NULL, 'Certificate', 15, '2016-06-07 15:02:20.108756', '2016-06-08 19:19:56.753885');
INSERT INTO stages VALUES (92, '@', '2017-06-06', '', NULL, 'Certificate', 28, '2016-06-07 15:07:12.882967', '2016-06-08 19:19:57.067215');
INSERT INTO stages VALUES (94, '@', '2017-06-06', '', NULL, 'Certificate', 29, '2016-06-07 15:08:14.700517', '2016-06-08 19:19:57.081149');
INSERT INTO stages VALUES (96, '@', '2017-06-06', '', NULL, 'Certificate', 30, '2016-06-07 15:09:17.0281', '2016-06-08 19:19:57.094795');
INSERT INTO stages VALUES (55, '@', '2016-10-14', '', NULL, 'Certificate', 58, '2016-06-07 14:20:41.884754', '2016-06-08 19:19:57.658502');
INSERT INTO stages VALUES (56, '@', '2017-10-13', '', NULL, 'Certificate', 58, '2016-06-07 14:20:41.888369', '2016-06-08 19:19:57.669624');
INSERT INTO stages VALUES (53, '@', '2016-10-14', '', NULL, 'Certificate', 59, '2016-06-07 14:16:47.138206', '2016-06-08 19:19:57.677129');
INSERT INTO stages VALUES (54, '@', '2017-10-13', '', NULL, 'Certificate', 59, '2016-06-07 14:16:47.141667', '2016-06-08 19:19:57.685273');
INSERT INTO stages VALUES (51, '@', '2016-10-14', '', NULL, 'Certificate', 60, '2016-06-07 14:15:33.908488', '2016-06-08 19:19:57.692904');
INSERT INTO stages VALUES (52, '@', '2017-10-13', '', NULL, 'Certificate', 60, '2016-06-07 14:15:33.912078', '2016-06-08 19:19:57.700858');
INSERT INTO stages VALUES (49, '@', '2016-11-24', '', NULL, 'Certificate', 62, '2016-06-07 14:09:38.733899', '2016-06-08 19:19:57.708432');
INSERT INTO stages VALUES (50, '@', '2017-11-23', '', NULL, 'Certificate', 62, '2016-06-07 14:09:38.739429', '2016-06-08 19:19:57.716288');
INSERT INTO stages VALUES (47, '@', '2016-11-24', '', NULL, 'Certificate', 63, '2016-06-07 14:08:34.643559', '2016-06-08 19:19:57.723443');
INSERT INTO stages VALUES (48, '@', '2017-11-23', '', NULL, 'Certificate', 63, '2016-06-07 14:08:34.647642', '2016-06-08 19:19:57.730484');
INSERT INTO stages VALUES (45, '@', '2016-11-24', '', NULL, 'Certificate', 64, '2016-06-07 14:07:35.653488', '2016-06-08 19:19:57.737916');
INSERT INTO stages VALUES (46, '@', '2017-11-23', '', NULL, 'Certificate', 64, '2016-06-07 14:07:35.656603', '2016-06-08 19:19:57.749455');
INSERT INTO stages VALUES (43, '@', '2016-11-24', '', NULL, 'Certificate', 65, '2016-06-07 14:06:26.398252', '2016-06-08 19:19:57.756632');
INSERT INTO stages VALUES (44, '@', '2017-11-23', '', NULL, 'Certificate', 65, '2016-06-07 14:06:26.401955', '2016-06-08 19:19:57.763464');
INSERT INTO stages VALUES (41, '@', '2016-11-24', '', NULL, 'Certificate', 66, '2016-06-07 14:05:35.464911', '2016-06-08 19:19:57.770874');
INSERT INTO stages VALUES (42, '@', '2017-11-23', '', NULL, 'Certificate', 66, '2016-06-07 14:05:35.468443', '2016-06-08 19:19:57.778853');
INSERT INTO stages VALUES (39, '@', '2016-11-24', '', NULL, 'Certificate', 67, '2016-06-07 14:04:21.704234', '2016-06-08 19:19:57.786593');
INSERT INTO stages VALUES (40, '@', '2017-11-23', '', NULL, 'Certificate', 67, '2016-06-07 14:04:21.707176', '2016-06-08 19:19:57.793702');
INSERT INTO stages VALUES (38, '@', '2016-11-24', '', NULL, 'Certificate', 68, '2016-06-07 14:02:47.620686', '2016-06-08 19:19:57.801045');
INSERT INTO stages VALUES (36, '@', '2016-12-09', '', NULL, 'Certificate', 70, '2016-06-07 14:00:45.03294', '2016-06-08 19:19:57.809092');
INSERT INTO stages VALUES (37, '@', '2017-12-08', '', NULL, 'Certificate', 70, '2016-06-07 14:00:45.036063', '2016-06-08 19:19:57.816182');
INSERT INTO stages VALUES (34, '@', '2016-12-09', '', NULL, 'Certificate', 71, '2016-06-07 13:59:29.377136', '2016-06-08 19:19:57.82314');
INSERT INTO stages VALUES (35, '@', '2017-12-08', '', NULL, 'Certificate', 71, '2016-06-07 13:59:29.381961', '2016-06-08 19:19:57.829635');
INSERT INTO stages VALUES (32, '@', '2017-01-22', '', NULL, 'Certificate', 77, '2016-06-07 13:54:55.089472', '2016-06-08 19:19:57.836007');
INSERT INTO stages VALUES (33, '@', '2018-01-22', '', NULL, 'Certificate', 77, '2016-06-07 13:54:55.09302', '2016-06-08 19:19:57.842473');
INSERT INTO stages VALUES (28, '@', '2017-02-25', '', NULL, 'Certificate', 78, '2016-06-07 13:52:47.626486', '2016-06-08 19:19:57.849106');
INSERT INTO stages VALUES (29, '@', '2018-02-25', '', NULL, 'Certificate', 78, '2016-06-07 13:52:47.628933', '2016-06-08 19:19:57.855769');
INSERT INTO stages VALUES (30, '@', '2019-02-25', '', NULL, 'Certificate', 78, '2016-06-07 13:52:47.63067', '2016-06-08 19:19:57.862045');
INSERT INTO stages VALUES (31, '@', '2020-02-25', '', NULL, 'Certificate', 78, '2016-06-07 13:52:47.632484', '2016-06-08 19:19:57.868138');
INSERT INTO stages VALUES (25, '@', '2017-02-10', '', NULL, 'Certificate', 79, '2016-06-07 13:48:27.550799', '2016-06-08 19:19:57.874764');
INSERT INTO stages VALUES (26, '@', '2018-02-10', '', NULL, 'Certificate', 79, '2016-06-07 13:48:27.553683', '2016-06-08 19:19:57.882119');
INSERT INTO stages VALUES (27, '@', '2019-02-10', '', NULL, 'Certificate', 79, '2016-06-07 13:48:27.555652', '2016-06-08 19:19:57.888504');
INSERT INTO stages VALUES (21, '@', '2017-02-10', '', NULL, 'Certificate', 80, '2016-06-07 13:43:12.740015', '2016-06-08 19:19:57.895569');
INSERT INTO stages VALUES (22, '@', '2018-02-10', '', NULL, 'Certificate', 80, '2016-06-07 13:43:12.744433', '2016-06-08 19:19:57.90202');
INSERT INTO stages VALUES (23, '@', '2019-02-10', '', NULL, 'Certificate', 80, '2016-06-07 13:43:12.750696', '2016-06-08 19:19:57.909497');
INSERT INTO stages VALUES (19, '@', '2017-03-13', '', NULL, 'Certificate', 83, '2016-06-07 13:38:13.580263', '2016-06-08 19:19:57.916165');
INSERT INTO stages VALUES (20, '@', '2018-03-12', '', NULL, 'Certificate', 83, '2016-06-07 13:38:13.584647', '2016-06-08 19:19:57.922899');
INSERT INTO stages VALUES (17, '@', '2017-04-04', '', NULL, 'Certificate', 84, '2016-06-07 13:36:25.209521', '2016-06-08 19:19:57.929929');
INSERT INTO stages VALUES (18, '@', '2018-04-03', '', NULL, 'Certificate', 84, '2016-06-07 13:36:25.213037', '2016-06-08 19:19:57.936586');
INSERT INTO stages VALUES (15, '@', '2017-04-04', '', NULL, 'Certificate', 85, '2016-06-07 13:33:28.668957', '2016-06-08 19:19:57.943281');
INSERT INTO stages VALUES (16, '@', '2018-04-03', '', NULL, 'Certificate', 85, '2016-06-07 13:33:28.673471', '2016-06-08 19:19:57.950724');
INSERT INTO stages VALUES (13, '@', '2017-04-06', '', NULL, 'Certificate', 86, '2016-06-07 13:27:55.765928', '2016-06-08 19:19:57.957755');
INSERT INTO stages VALUES (14, '@', '2018-04-05', '', NULL, 'Certificate', 86, '2016-06-07 13:27:55.770146', '2016-06-08 19:19:57.964335');
INSERT INTO stages VALUES (12, '@', '2017-04-10', '', NULL, 'Certificate', 87, '2016-06-07 13:19:03.653893', '2016-06-08 19:19:57.972224');
INSERT INTO stages VALUES (11, '@', '2018-04-09', '', NULL, 'Certificate', 87, '2016-06-07 13:19:03.644882', '2016-06-08 19:19:58.040019');
INSERT INTO stages VALUES (179, '@', '2017-04-01', '', NULL, 'Certificate', 18, '2016-06-08 08:13:12.498912', '2016-06-08 19:19:56.788473');
INSERT INTO stages VALUES (180, '@', '2018-04-01', '', NULL, 'Certificate', 18, '2016-06-08 08:13:12.500575', '2016-06-08 19:19:56.796646');
INSERT INTO stages VALUES (181, '@', '2019-04-01', '', NULL, 'Certificate', 18, '2016-06-08 08:13:12.502191', '2016-06-08 19:19:56.807183');
INSERT INTO stages VALUES (182, '@', '2016-04-01', '', '2016-04-06', 'Certificate', 19, '2016-06-08 08:18:47.121035', '2016-06-08 19:19:56.814423');
INSERT INTO stages VALUES (183, '@', '2017-04-01', '', NULL, 'Certificate', 19, '2016-06-08 08:18:47.123051', '2016-06-08 19:19:56.82177');
INSERT INTO stages VALUES (185, '@', '2019-04-01', '', NULL, 'Certificate', 19, '2016-06-08 08:18:47.12595', '2016-06-08 19:19:56.836762');
INSERT INTO stages VALUES (186, '@', '2016-04-01', '', '2016-04-06', 'Certificate', 20, '2016-06-08 08:24:42.70552', '2016-06-08 19:19:56.845599');
INSERT INTO stages VALUES (91, '@', '2016-06-07', 'Подтверждение действия. Решение ОС № 8-ПР-ИК от 26.07.2016', '2016-07-26', 'Certificate', 28, '2016-06-07 15:07:12.879334', '2016-08-02 10:36:26.008195');
INSERT INTO stages VALUES (187, '@', '2017-04-01', '', NULL, 'Certificate', 20, '2016-06-08 08:24:42.707666', '2016-06-08 19:19:56.855069');
INSERT INTO stages VALUES (188, '@', '2018-04-01', '', NULL, 'Certificate', 20, '2016-06-08 08:24:42.70917', '2016-06-08 19:19:56.863209');
INSERT INTO stages VALUES (189, '@', '2019-04-01', '', NULL, 'Certificate', 20, '2016-06-08 08:24:42.710641', '2016-06-08 19:19:56.870071');
INSERT INTO stages VALUES (190, '@', '2016-04-01', '', '2016-04-06', 'Certificate', 21, '2016-06-08 08:26:59.958892', '2016-06-08 19:19:56.876932');
INSERT INTO stages VALUES (191, '@', '2017-04-01', '', NULL, 'Certificate', 21, '2016-06-08 08:26:59.960888', '2016-06-08 19:19:56.88388');
INSERT INTO stages VALUES (192, '@', '2018-04-01', '', NULL, 'Certificate', 21, '2016-06-08 08:26:59.962442', '2016-06-08 19:19:56.890807');
INSERT INTO stages VALUES (193, '@', '2019-04-01', '', NULL, 'Certificate', 21, '2016-06-08 08:26:59.963905', '2016-06-08 19:19:56.897511');
INSERT INTO stages VALUES (174, '@', '2016-04-03', '', '2016-04-08', 'Certificate', 24, '2016-06-08 08:07:49.735654', '2016-06-08 19:19:56.975055');
INSERT INTO stages VALUES (175, '@', '2017-04-03', '', NULL, 'Certificate', 24, '2016-06-08 08:07:49.738322', '2016-06-08 19:19:56.981613');
INSERT INTO stages VALUES (176, '@', '2016-04-03', '', '2016-04-08', 'Certificate', 25, '2016-06-08 08:10:33.786193', '2016-06-08 19:19:56.987947');
INSERT INTO stages VALUES (177, '@', '2017-04-03', '', NULL, 'Certificate', 25, '2016-06-08 08:10:33.788722', '2016-06-08 19:19:56.994808');
INSERT INTO stages VALUES (98, '@', '2017-06-06', '', NULL, 'Certificate', 31, '2016-06-07 15:10:27.251363', '2016-06-08 19:19:57.11026');
INSERT INTO stages VALUES (105, '@', '2017-08-18', '', NULL, 'Certificate', 39, '2016-06-08 07:24:11.477419', '2016-06-08 19:19:57.15093');
INSERT INTO stages VALUES (107, '@', '2019-08-18', '', NULL, 'Certificate', 39, '2016-06-08 07:24:11.480432', '2016-06-08 19:19:57.167275');
INSERT INTO stages VALUES (109, '@', '2017-08-18', '', NULL, 'Certificate', 40, '2016-06-08 07:25:48.859981', '2016-06-08 19:19:57.180881');
INSERT INTO stages VALUES (110, '@', '2018-08-18', '', NULL, 'Certificate', 40, '2016-06-08 07:25:48.861356', '2016-06-08 19:19:57.187585');
INSERT INTO stages VALUES (111, '@', '2019-08-18', '', NULL, 'Certificate', 40, '2016-06-08 07:25:48.862866', '2016-06-08 19:19:57.193852');
INSERT INTO stages VALUES (113, '@', '2017-08-18', '', NULL, 'Certificate', 41, '2016-06-08 07:29:02.142095', '2016-06-08 19:19:57.208098');
INSERT INTO stages VALUES (114, '@', '2018-08-18', '', NULL, 'Certificate', 41, '2016-06-08 07:29:02.143533', '2016-06-08 19:19:57.217805');
INSERT INTO stages VALUES (115, '@', '2019-08-18', '', NULL, 'Certificate', 41, '2016-06-08 07:29:02.145009', '2016-06-08 19:19:57.22533');
INSERT INTO stages VALUES (117, '@', '2017-08-18', '', NULL, 'Certificate', 42, '2016-06-08 07:30:39.883782', '2016-06-08 19:19:57.240113');
INSERT INTO stages VALUES (118, '@', '2018-08-18', '', NULL, 'Certificate', 42, '2016-06-08 07:30:39.886155', '2016-06-08 19:19:57.247442');
INSERT INTO stages VALUES (119, '@', '2019-08-18', '', NULL, 'Certificate', 42, '2016-06-08 07:30:39.888511', '2016-06-08 19:19:57.254491');
INSERT INTO stages VALUES (121, '@', '2017-08-18', '', NULL, 'Certificate', 43, '2016-06-08 07:32:36.852585', '2016-06-08 19:19:57.268743');
INSERT INTO stages VALUES (122, '@', '2018-08-18', '', NULL, 'Certificate', 43, '2016-06-08 07:32:36.854059', '2016-06-08 19:19:57.275763');
INSERT INTO stages VALUES (123, '@', '2019-08-18', '', NULL, 'Certificate', 43, '2016-06-08 07:32:36.8556', '2016-06-08 19:19:57.282574');
INSERT INTO stages VALUES (125, '@', '2017-08-18', '', NULL, 'Certificate', 44, '2016-06-08 07:33:57.656124', '2016-06-08 19:19:57.296285');
INSERT INTO stages VALUES (126, '@', '2018-08-18', '', NULL, 'Certificate', 44, '2016-06-08 07:33:57.657687', '2016-06-08 19:19:57.303709');
INSERT INTO stages VALUES (129, '@', '2017-08-18', '', NULL, 'Certificate', 45, '2016-06-08 07:35:31.111821', '2016-06-08 19:19:57.324644');
INSERT INTO stages VALUES (130, '@', '2018-08-18', '', NULL, 'Certificate', 45, '2016-06-08 07:35:31.114132', '2016-06-08 19:19:57.333645');
INSERT INTO stages VALUES (131, '@', '2019-08-18', '', NULL, 'Certificate', 45, '2016-06-08 07:35:31.115907', '2016-06-08 19:19:57.340531');
INSERT INTO stages VALUES (133, '@', '2017-08-18', '', NULL, 'Certificate', 46, '2016-06-08 07:36:55.727272', '2016-06-08 19:19:57.355456');
INSERT INTO stages VALUES (134, '@', '2018-08-18', '', NULL, 'Certificate', 46, '2016-06-08 07:36:55.728818', '2016-06-08 19:19:57.36256');
INSERT INTO stages VALUES (135, '@', '2019-08-18', '', NULL, 'Certificate', 46, '2016-06-08 07:36:55.730289', '2016-06-08 19:19:57.369688');
INSERT INTO stages VALUES (137, '@', '2017-08-18', '', NULL, 'Certificate', 47, '2016-06-08 07:38:06.308999', '2016-06-08 19:19:57.383234');
INSERT INTO stages VALUES (138, '@', '2018-08-18', '', NULL, 'Certificate', 47, '2016-06-08 07:38:06.311669', '2016-06-08 19:19:57.390324');
INSERT INTO stages VALUES (139, '@', '2019-08-18', '', NULL, 'Certificate', 47, '2016-06-08 07:38:06.314164', '2016-06-08 19:19:57.39776');
INSERT INTO stages VALUES (141, '@', '2017-08-18', '', NULL, 'Certificate', 48, '2016-06-08 07:39:30.300551', '2016-06-08 19:19:57.413462');
INSERT INTO stages VALUES (142, '@', '2018-08-18', '', NULL, 'Certificate', 48, '2016-06-08 07:39:30.302107', '2016-06-08 19:19:57.420427');
INSERT INTO stages VALUES (143, '@', '2019-08-18', '', NULL, 'Certificate', 48, '2016-06-08 07:39:30.30357', '2016-06-08 19:19:57.430448');
INSERT INTO stages VALUES (145, '@', '2017-08-18', '', NULL, 'Certificate', 49, '2016-06-08 07:40:43.237808', '2016-06-08 19:19:57.450432');
INSERT INTO stages VALUES (146, '@', '2018-08-18', '', NULL, 'Certificate', 49, '2016-06-08 07:40:43.239327', '2016-06-08 19:19:57.458124');
INSERT INTO stages VALUES (147, '@', '2019-08-18', '', NULL, 'Certificate', 49, '2016-06-08 07:40:43.240808', '2016-06-08 19:19:57.465614');
INSERT INTO stages VALUES (149, '@', '2017-08-18', '', NULL, 'Certificate', 50, '2016-06-08 07:42:05.925926', '2016-06-08 19:19:57.479157');
INSERT INTO stages VALUES (150, '@', '2018-08-18', '', NULL, 'Certificate', 50, '2016-06-08 07:42:05.928535', '2016-06-08 19:19:57.490057');
INSERT INTO stages VALUES (151, '@', '2019-08-18', '', NULL, 'Certificate', 50, '2016-06-08 07:42:05.930659', '2016-06-08 19:19:57.499984');
INSERT INTO stages VALUES (153, '@', '2017-08-18', '', NULL, 'Certificate', 51, '2016-06-08 07:43:26.728396', '2016-06-08 19:19:57.51386');
INSERT INTO stages VALUES (154, '@', '2018-08-18', '', NULL, 'Certificate', 51, '2016-06-08 07:43:26.729853', '2016-06-08 19:19:57.521643');
INSERT INTO stages VALUES (155, '@', '2019-08-18', '', NULL, 'Certificate', 51, '2016-06-08 07:43:26.73134', '2016-06-08 19:19:57.533046');
INSERT INTO stages VALUES (157, '@', '2017-08-18', '', NULL, 'Certificate', 52, '2016-06-08 07:44:46.971055', '2016-06-08 19:19:57.547772');
INSERT INTO stages VALUES (158, '@', '2018-08-18', '', NULL, 'Certificate', 52, '2016-06-08 07:44:46.973325', '2016-06-08 19:19:57.554412');
INSERT INTO stages VALUES (159, '@', '2019-08-18', '', NULL, 'Certificate', 52, '2016-06-08 07:44:46.975328', '2016-06-08 19:19:57.561502');
INSERT INTO stages VALUES (161, '@', '2017-08-18', '', NULL, 'Certificate', 53, '2016-06-08 07:46:51.011369', '2016-06-08 19:19:57.574737');
INSERT INTO stages VALUES (162, '@', '2018-08-18', '', NULL, 'Certificate', 53, '2016-06-08 07:46:51.012789', '2016-06-08 19:19:57.581391');
INSERT INTO stages VALUES (163, '@', '2019-08-18', '', NULL, 'Certificate', 53, '2016-06-08 07:46:51.014253', '2016-06-08 19:19:57.588525');
INSERT INTO stages VALUES (164, '@', '2016-09-16', '', NULL, 'Certificate', 54, '2016-06-08 07:48:22.417309', '2016-06-08 19:19:57.598808');
INSERT INTO stages VALUES (165, '@', '2017-09-15', '', NULL, 'Certificate', 54, '2016-06-08 07:48:22.419671', '2016-06-08 19:19:57.606948');
INSERT INTO stages VALUES (166, '@', '2016-10-05', '', NULL, 'Certificate', 55, '2016-06-08 07:49:35.154842', '2016-06-08 19:19:57.613872');
INSERT INTO stages VALUES (167, '@', '2017-10-04', '', NULL, 'Certificate', 55, '2016-06-08 07:49:35.157432', '2016-06-08 19:19:57.620831');
INSERT INTO stages VALUES (168, '@', '2016-10-05', '', NULL, 'Certificate', 56, '2016-06-08 07:50:54.748261', '2016-06-08 19:19:57.627643');
INSERT INTO stages VALUES (170, '@', '2016-10-14', '', NULL, 'Certificate', 57, '2016-06-08 07:51:56.127015', '2016-06-08 19:19:57.644995');
INSERT INTO stages VALUES (171, '@', '2017-10-13', '', NULL, 'Certificate', 57, '2016-06-08 07:51:56.129436', '2016-06-08 19:19:57.651509');
INSERT INTO stages VALUES (102, '@', '2016-08-09', '', NULL, 'Certificate', 88, '2016-06-08 07:21:06.916331', '2016-06-08 19:19:58.046728');
INSERT INTO stages VALUES (103, '@', '2017-08-08', '', NULL, 'Certificate', 88, '2016-06-08 07:21:06.922414', '2016-06-08 19:19:58.052956');
INSERT INTO stages VALUES (172, '@', '2017-05-23', '', NULL, 'Certificate', 89, '2016-06-08 07:58:15.657263', '2016-06-08 19:19:58.059282');
INSERT INTO stages VALUES (173, '@', '2018-05-22', '', NULL, 'Certificate', 89, '2016-06-08 07:58:15.659049', '2016-06-08 19:19:58.065895');
INSERT INTO stages VALUES (226, '@', '2016-03-23', '', '2016-03-21', 'Attestat', 22, '2016-06-08 10:22:46.620408', '2016-06-08 19:19:56.218014');
INSERT INTO stages VALUES (227, '@', '2017-03-23', '', NULL, 'Attestat', 22, '2016-06-08 10:22:46.622522', '2016-06-08 19:19:56.225542');
INSERT INTO stages VALUES (228, '@', '2018-03-23', '', NULL, 'Attestat', 22, '2016-06-08 10:22:46.62406', '2016-06-08 19:19:56.2328');
INSERT INTO stages VALUES (229, '@', '2019-03-23', '', NULL, 'Attestat', 22, '2016-06-08 10:22:46.625937', '2016-06-08 19:19:56.24004');
INSERT INTO stages VALUES (223, '@', '2017-07-24', '', NULL, 'Attestat', 24, '2016-06-08 10:16:37.309367', '2016-06-08 19:19:56.261158');
INSERT INTO stages VALUES (224, '@', '2018-07-24', '', NULL, 'Attestat', 24, '2016-06-08 10:16:37.311517', '2016-06-08 19:19:56.269061');
INSERT INTO stages VALUES (194, '@', '2016-04-01', '', '2016-04-06', 'Certificate', 22, '2016-06-08 08:29:11.125951', '2016-06-08 19:19:56.912817');
INSERT INTO stages VALUES (195, '@', '2017-04-01', '', NULL, 'Certificate', 22, '2016-06-08 08:29:11.129304', '2016-06-08 19:19:56.919516');
INSERT INTO stages VALUES (196, '@', '2018-04-01', '', NULL, 'Certificate', 22, '2016-06-08 08:29:11.131331', '2016-06-08 19:19:56.925915');
INSERT INTO stages VALUES (197, '@', '2019-04-01', '', NULL, 'Certificate', 22, '2016-06-08 08:29:11.133149', '2016-06-08 19:19:56.936685');
INSERT INTO stages VALUES (198, '@', '2016-04-01', '', '2016-04-06', 'Certificate', 23, '2016-06-08 08:31:16.672515', '2016-06-08 19:19:56.947625');
INSERT INTO stages VALUES (199, '@', '2017-04-01', '', NULL, 'Certificate', 23, '2016-06-08 08:31:16.674491', '2016-06-08 19:19:56.954923');
INSERT INTO stages VALUES (100, '@', '2016-08-02', 'Подтверждение действия. Решение ОС № 16-ПР-ИК от 20.07.2016', '2016-07-20', 'Certificate', 37, '2016-06-07 15:14:14.031598', '2016-08-02 10:33:35.372886');
INSERT INTO stages VALUES (104, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №17-1/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 39, '2016-06-08 07:24:11.474698', '2016-09-26 11:13:56.080588');
INSERT INTO stages VALUES (112, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №17-3/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 41, '2016-06-08 07:29:02.139733', '2016-09-26 11:17:11.037605');
INSERT INTO stages VALUES (120, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №17-5/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 43, '2016-06-08 07:32:36.849955', '2016-09-26 11:18:30.540556');
INSERT INTO stages VALUES (128, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №18-2/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 45, '2016-06-08 07:35:31.108568', '2016-09-26 11:20:07.684521');
INSERT INTO stages VALUES (144, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №19-1/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 49, '2016-06-08 07:40:43.235495', '2016-09-26 11:23:50.646013');
INSERT INTO stages VALUES (136, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №18-4/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 47, '2016-06-08 07:38:06.305264', '2016-09-26 11:22:55.339703');
INSERT INTO stages VALUES (160, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №19-5/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 53, '2016-06-08 07:46:51.009003', '2016-09-26 11:26:09.993569');
INSERT INTO stages VALUES (200, '@', '2018-04-01', '', NULL, 'Certificate', 23, '2016-06-08 08:31:16.675997', '2016-06-08 19:19:56.961444');
INSERT INTO stages VALUES (201, '@', '2019-04-01', '', NULL, 'Certificate', 23, '2016-06-08 08:31:16.677395', '2016-06-08 19:19:56.968234');
INSERT INTO stages VALUES (202, '@', '2016-05-12', '', '2016-04-25', 'Certificate', 26, '2016-06-08 08:34:18.315854', '2016-06-08 19:19:57.002648');
INSERT INTO stages VALUES (203, '@', '2017-05-12', '', NULL, 'Certificate', 26, '2016-06-08 08:34:18.317821', '2016-06-08 19:19:57.009788');
INSERT INTO stages VALUES (204, '@', '2018-05-12', '', NULL, 'Certificate', 26, '2016-06-08 08:34:18.319307', '2016-06-08 19:19:57.017887');
INSERT INTO stages VALUES (205, '@', '2019-05-12', '', NULL, 'Certificate', 26, '2016-06-08 08:34:18.320756', '2016-06-08 19:19:57.025154');
INSERT INTO stages VALUES (254, '@', '2015-07-24', '', '2015-10-08', 'Attestat', 1, '2016-06-08 11:13:49.815878', '2016-06-08 19:19:55.896529');
INSERT INTO stages VALUES (1, '!', '2015-12-28', 'Аннулирование с последующим переоформлением в связи с изменением формы собственности юридического лица', NULL, 'Attestat', 1, '2016-06-07 09:08:18.697381', '2016-06-08 19:19:55.91381');
INSERT INTO stages VALUES (255, '@', '2016-07-24', '', NULL, 'Attestat', 1, '2016-06-08 11:13:49.817742', '2016-06-08 19:19:55.926537');
INSERT INTO stages VALUES (256, '@', '2017-07-24', '', NULL, 'Attestat', 1, '2016-06-08 11:13:49.819174', '2016-06-08 19:19:55.934635');
INSERT INTO stages VALUES (257, '@', '2018-07-24', '', NULL, 'Attestat', 1, '2016-06-08 11:13:49.820708', '2016-06-08 19:19:55.94223');
INSERT INTO stages VALUES (250, '@', '2015-12-30', '', '2015-12-07', 'Attestat', 2, '2016-06-08 11:09:00.091022', '2016-06-08 19:19:55.949361');
INSERT INTO stages VALUES (251, '@', '2016-12-30', '', NULL, 'Attestat', 2, '2016-06-08 11:09:00.093536', '2016-06-08 19:19:55.957845');
INSERT INTO stages VALUES (252, '@', '2017-12-30', '', NULL, 'Attestat', 2, '2016-06-08 11:09:00.095168', '2016-06-08 19:19:55.965377');
INSERT INTO stages VALUES (253, '@', '2018-12-30', '', NULL, 'Attestat', 2, '2016-06-08 11:09:00.097089', '2016-06-08 19:19:55.972765');
INSERT INTO stages VALUES (246, '@', '2015-07-24', '', '2015-10-08', 'Attestat', 3, '2016-06-08 11:04:21.531823', '2016-06-08 19:19:55.982023');
INSERT INTO stages VALUES (2, '!', '2015-12-28', 'Аннулирование с последующим переоформлением в связи с изменением формы собственности юридического лица', NULL, 'Attestat', 3, '2016-06-07 09:08:18.760598', '2016-06-08 19:19:55.993494');
INSERT INTO stages VALUES (247, '@', '2016-07-24', '', NULL, 'Attestat', 3, '2016-06-08 11:04:21.533579', '2016-06-08 19:19:56.002479');
INSERT INTO stages VALUES (248, '@', '2017-07-24', '', NULL, 'Attestat', 3, '2016-06-08 11:04:21.535135', '2016-06-08 19:19:56.010285');
INSERT INTO stages VALUES (249, '@', '2018-07-24', '', NULL, 'Attestat', 3, '2016-06-08 11:04:21.536603', '2016-06-08 19:19:56.019027');
INSERT INTO stages VALUES (242, '@', '2015-12-30', '', '2015-12-07', 'Attestat', 4, '2016-06-08 10:59:08.372485', '2016-06-08 19:19:56.027795');
INSERT INTO stages VALUES (243, '@', '2016-12-30', '', NULL, 'Attestat', 4, '2016-06-08 10:59:08.374564', '2016-06-08 19:19:56.037025');
INSERT INTO stages VALUES (244, '@', '2017-12-30', '', NULL, 'Attestat', 4, '2016-06-08 10:59:08.375986', '2016-06-08 19:19:56.047062');
INSERT INTO stages VALUES (245, '@', '2018-12-30', '', NULL, 'Attestat', 4, '2016-06-08 10:59:08.377431', '2016-06-08 19:19:56.055912');
INSERT INTO stages VALUES (3, '!', '2015-12-28', 'Аннулирование с последующим переоформлением в связи с изменением формы собственности юридического лица', NULL, 'Attestat', 5, '2016-06-07 09:08:18.827156', '2016-06-08 19:19:56.063413');
INSERT INTO stages VALUES (241, '@', '2016-07-24', '', NULL, 'Attestat', 5, '2016-06-08 10:56:03.91096', '2016-06-08 19:19:56.072725');
INSERT INTO stages VALUES (4, '!', '2014-12-30', 'Аннулирован за нарушение правил аккредитации в Системе "НЦСС" (не оплата работ по аккредитации)', NULL, 'Attestat', 11, '2016-06-07 09:08:18.939159', '2016-06-08 19:19:56.080265');
INSERT INTO stages VALUES (237, '@', '2015-07-24', '', NULL, 'Attestat', 11, '2016-06-08 10:46:23.356146', '2016-06-08 19:19:56.089036');
INSERT INTO stages VALUES (238, '@', '2016-07-24', '', NULL, 'Attestat', 11, '2016-06-08 10:46:23.357892', '2016-06-08 19:19:56.097799');
INSERT INTO stages VALUES (239, '@', '2017-07-24', '', NULL, 'Attestat', 11, '2016-06-08 10:46:23.35934', '2016-06-08 19:19:56.107388');
INSERT INTO stages VALUES (240, '@', '2018-07-24', '', NULL, 'Attestat', 11, '2016-06-08 10:46:23.360776', '2016-06-08 19:19:56.12024');
INSERT INTO stages VALUES (5, '!', '2014-12-30', 'Аннулирован за нарушение правил аккредитации в Системе "НЦСС" (не оплата работ по аккредитации)', NULL, 'Attestat', 12, '2016-06-07 09:08:18.970594', '2016-06-08 19:19:56.130928');
INSERT INTO stages VALUES (233, '@', '2015-07-24', '', NULL, 'Attestat', 12, '2016-06-08 10:43:56.384499', '2016-06-08 19:19:56.138766');
INSERT INTO stages VALUES (234, '@', '2016-07-24', '', NULL, 'Attestat', 12, '2016-06-08 10:43:56.386466', '2016-06-08 19:19:56.146088');
INSERT INTO stages VALUES (235, '@', '2017-07-24', '', NULL, 'Attestat', 12, '2016-06-08 10:43:56.388001', '2016-06-08 19:19:56.15434');
INSERT INTO stages VALUES (236, '@', '2018-07-24', '', NULL, 'Attestat', 12, '2016-06-08 10:43:56.389629', '2016-06-08 19:19:56.163752');
INSERT INTO stages VALUES (231, '@', '2017-07-24', '', NULL, 'Attestat', 21, '2016-06-08 10:25:54.406171', '2016-06-08 19:19:56.203007');
INSERT INTO stages VALUES (232, '@', '2018-07-24', '', NULL, 'Attestat', 21, '2016-06-08 10:25:54.407853', '2016-06-08 19:19:56.211026');
INSERT INTO stages VALUES (9, '!', '2015-12-28', '', NULL, 'Attestat', 25, '2016-06-07 09:08:19.350283', '2016-06-08 19:19:56.276765');
INSERT INTO stages VALUES (218, '@', '2016-03-23', '', NULL, 'Attestat', 25, '2016-06-08 10:13:51.549662', '2016-06-08 19:19:56.285581');
INSERT INTO stages VALUES (219, '@', '2017-03-23', '', NULL, 'Attestat', 25, '2016-06-08 10:13:51.551496', '2016-06-08 19:19:56.292517');
INSERT INTO stages VALUES (220, '@', '2018-03-23', '', NULL, 'Attestat', 25, '2016-06-08 10:13:51.553341', '2016-06-08 19:19:56.299496');
INSERT INTO stages VALUES (221, '@', '2019-03-23', '', NULL, 'Attestat', 25, '2016-06-08 10:13:51.554931', '2016-06-08 19:19:56.30765');
INSERT INTO stages VALUES (214, '@', '2017-01-18', '', NULL, 'Attestat', 26, '2016-06-08 10:07:29.558044', '2016-06-08 19:19:56.316446');
INSERT INTO stages VALUES (215, '@', '2018-01-18', '', NULL, 'Attestat', 26, '2016-06-08 10:07:29.560157', '2016-06-08 19:19:56.32425');
INSERT INTO stages VALUES (216, '@', '2019-01-18', '', NULL, 'Attestat', 26, '2016-06-08 10:07:29.563116', '2016-06-08 19:19:56.331688');
INSERT INTO stages VALUES (217, '@', '2020-01-18', '', NULL, 'Attestat', 26, '2016-06-08 10:07:29.566331', '2016-06-08 19:19:56.340585');
INSERT INTO stages VALUES (210, '@', '2017-03-14', '', NULL, 'Attestat', 28, '2016-06-08 09:01:07.763591', '2016-06-08 19:19:56.348229');
INSERT INTO stages VALUES (211, '@', '2018-03-14', '', NULL, 'Attestat', 28, '2016-06-08 09:01:07.766266', '2016-06-08 19:19:56.356225');
INSERT INTO stages VALUES (212, '@', '2019-03-14', '', NULL, 'Attestat', 28, '2016-06-08 09:01:07.767964', '2016-06-08 19:19:56.364169');
INSERT INTO stages VALUES (213, '@', '2020-03-14', '', NULL, 'Attestat', 28, '2016-06-08 09:01:07.769579', '2016-06-08 19:19:56.371129');
INSERT INTO stages VALUES (258, '@', '2016-03-26', '', NULL, 'Attestat', 29, '2016-06-08 11:26:11.236845', '2016-06-08 19:19:56.378316');
INSERT INTO stages VALUES (259, '@', '2017-03-26', '', NULL, 'Attestat', 29, '2016-06-08 11:26:11.239364', '2016-06-08 19:19:56.386284');
INSERT INTO stages VALUES (260, '@', '2018-03-26', '', NULL, 'Attestat', 29, '2016-06-08 11:26:11.24089', '2016-06-08 19:19:56.39334');
INSERT INTO stages VALUES (261, '@', '2019-03-26', '', NULL, 'Attestat', 29, '2016-06-08 11:26:11.242391', '2016-06-08 19:19:56.401305');
INSERT INTO stages VALUES (262, '@', '2016-10-09', '', NULL, 'Attestat', 30, '2016-06-08 11:30:28.831238', '2016-06-08 19:19:56.407939');
INSERT INTO stages VALUES (263, '@', '2017-10-09', '', NULL, 'Attestat', 30, '2016-06-08 11:30:28.833002', '2016-06-08 19:19:56.416465');
INSERT INTO stages VALUES (264, '@', '2018-10-09', '', NULL, 'Attestat', 30, '2016-06-08 11:30:28.834398', '2016-06-08 19:19:56.424701');
INSERT INTO stages VALUES (265, '@', '2019-10-09', '', NULL, 'Attestat', 30, '2016-06-08 11:30:28.835833', '2016-06-08 19:19:56.432217');
INSERT INTO stages VALUES (266, '@', '2017-01-18', '', NULL, 'Attestat', 31, '2016-06-08 11:34:30.136202', '2016-06-08 19:19:56.439326');
INSERT INTO stages VALUES (267, '@', '2018-01-18', '', NULL, 'Attestat', 31, '2016-06-08 11:34:30.137988', '2016-06-08 19:19:56.446311');
INSERT INTO stages VALUES (268, '@', '2019-01-18', '', NULL, 'Attestat', 31, '2016-06-08 11:34:30.139704', '2016-06-08 19:19:56.454284');
INSERT INTO stages VALUES (269, '@', '2020-01-18', '', NULL, 'Attestat', 31, '2016-06-08 11:34:30.141178', '2016-06-08 19:19:56.47008');
INSERT INTO stages VALUES (270, '@', '2017-02-26', '', NULL, 'Attestat', 32, '2016-06-08 11:37:55.895264', '2016-06-08 19:19:56.477494');
INSERT INTO stages VALUES (271, '@', '2018-02-26', '', NULL, 'Attestat', 32, '2016-06-08 11:37:55.897079', '2016-06-08 19:19:56.484946');
INSERT INTO stages VALUES (272, '@', '2019-02-26', '', NULL, 'Attestat', 32, '2016-06-08 11:37:55.898579', '2016-06-08 19:19:56.492076');
INSERT INTO stages VALUES (273, '@', '2020-02-26', '', NULL, 'Attestat', 32, '2016-06-08 11:37:55.903338', '2016-06-08 19:19:56.499152');
INSERT INTO stages VALUES (178, '@', '2016-04-01', '', '2016-04-06', 'Certificate', 18, '2016-06-08 08:13:12.496161', '2016-06-08 19:19:56.77817');
INSERT INTO stages VALUES (184, '@', '2018-04-01', '', NULL, 'Certificate', 19, '2016-06-08 08:18:47.124517', '2016-06-08 19:19:56.829219');
INSERT INTO stages VALUES (206, '@', '2016-05-12', '', '2016-04-25', 'Certificate', 27, '2016-06-08 08:37:08.857253', '2016-06-08 19:19:57.03213');
INSERT INTO stages VALUES (207, '@', '2017-05-12', '', NULL, 'Certificate', 27, '2016-06-08 08:37:08.859214', '2016-06-08 19:19:57.03918');
INSERT INTO stages VALUES (208, '@', '2018-05-12', '', NULL, 'Certificate', 27, '2016-06-08 08:37:08.860665', '2016-06-08 19:19:57.046395');
INSERT INTO stages VALUES (209, '@', '2019-05-12', '', NULL, 'Certificate', 27, '2016-06-08 08:37:08.862736', '2016-06-08 19:19:57.053876');
INSERT INTO stages VALUES (106, '@', '2018-08-18', '', NULL, 'Certificate', 39, '2016-06-08 07:24:11.478888', '2016-06-08 19:19:57.158592');
INSERT INTO stages VALUES (127, '@', '2019-08-18', '', NULL, 'Certificate', 44, '2016-06-08 07:33:57.659188', '2016-06-08 19:19:57.311036');
INSERT INTO stages VALUES (169, '@', '2017-10-04', '', NULL, 'Certificate', 56, '2016-06-08 07:50:54.750965', '2016-06-08 19:19:57.637263');
INSERT INTO stages VALUES (89, '@', '2016-03-10', 'Решение ОС № 9-ПР-ИК-1 от 01.06.2016', '2016-06-01', 'Certificate', 16, '2016-06-07 15:03:00.727883', '2016-07-04 10:54:58.600266');
INSERT INTO stages VALUES (90, '@', '2016-03-10', 'Решение ОС № 9-ПР-ИК-1 от 01.06.2016', '2016-06-01', 'Certificate', 17, '2016-06-07 15:03:55.388043', '2016-07-04 10:55:42.734402');
INSERT INTO stages VALUES (230, '@', '2016-07-24', 'Решение ОА №2-09-10 от 18.07.2019, подтверждение', '2016-07-18', 'Attestat', 21, '2016-06-08 10:25:54.404051', '2016-07-18 12:12:45.272933');
INSERT INTO stages VALUES (225, '@', '2016-07-24', 'Решение ОА №2-09-12 от 18.07.2019, подтверждение', '2016-07-18', 'Attestat', 23, '2016-06-08 10:18:14.420028', '2016-07-18 12:13:23.477036');
INSERT INTO stages VALUES (276, '@', '2017-07-13', '', NULL, 'Certificate', 90, '2016-07-14 12:01:25.450692', '2016-07-14 12:01:25.450692');
INSERT INTO stages VALUES (277, '@', '2018-07-12', '', NULL, 'Certificate', 90, '2016-07-14 12:01:25.452785', '2016-07-14 12:01:25.452785');
INSERT INTO stages VALUES (280, '@', '2017-07-13', '', NULL, 'Certificate', 91, '2016-07-14 12:05:07.349315', '2016-07-14 12:05:07.349315');
INSERT INTO stages VALUES (281, '@', '2018-07-12', '', NULL, 'Certificate', 91, '2016-07-14 12:05:07.35137', '2016-07-14 12:05:07.35137');
INSERT INTO stages VALUES (317, '@', '2017-04-03', '', NULL, 'Certificate', 97, '2016-07-28 11:51:15.205405', '2016-07-28 11:51:15.205405');
INSERT INTO stages VALUES (99, '@', '2016-08-02', 'Подтверждение действия. Решение ОС № 16-ПР-ИК от 20.07.2016', '2016-07-20', 'Certificate', 36, '2016-06-07 15:13:33.380485', '2016-08-02 10:32:52.652806');
INSERT INTO stages VALUES (101, '@', '2016-08-02', 'Подтверждение действия. Решение ОС № 16-ПР-ИК от 20.07.2016', '2016-07-20', 'Certificate', 38, '2016-06-07 15:16:19.057937', '2016-08-02 10:34:05.420181');
INSERT INTO stages VALUES (93, '@', '2016-06-07', 'Подтверждение действия. Решение ОС № 8-ПР-ИК от 26.07.2016', '2016-07-26', 'Certificate', 29, '2016-06-07 15:08:14.694421', '2016-08-02 10:36:55.11075');
INSERT INTO stages VALUES (95, '@', '2016-06-07', 'Подтверждение действия. Решение ОС № 8-ПР-ИК от 26.07.2016', '2016-07-26', 'Certificate', 30, '2016-06-07 15:09:17.024648', '2016-08-02 10:37:24.218195');
INSERT INTO stages VALUES (97, '@', '2016-06-07', 'Подтверждение действия. Решение ОС № 8-ПР-ИК от 26.07.2016', '2016-07-26', 'Certificate', 31, '2016-06-07 15:10:27.247457', '2016-08-02 10:37:49.870958');
INSERT INTO stages VALUES (290, '@', '2017-07-13', '', NULL, 'Certificate', 92, '2016-07-14 12:10:36.545357', '2016-07-14 12:10:36.545357');
INSERT INTO stages VALUES (291, '@', '2018-07-12', '', NULL, 'Certificate', 92, '2016-07-14 12:10:36.548418', '2016-07-14 12:10:36.548418');
INSERT INTO stages VALUES (294, '@', '2017-07-13', '', NULL, 'Certificate', 93, '2016-07-14 12:12:26.551045', '2016-07-14 12:12:26.551045');
INSERT INTO stages VALUES (319, '!', '2016-08-05', 'Аннулирован по заявлению владельца. Решение ОС № 7-ПР-АН от 05.08.2016', NULL, 'Certificate', 15, '2016-08-08 10:10:22.231771', '2016-08-08 10:10:22.231771');
INSERT INTO stages VALUES (295, '@', '2018-07-12', '', NULL, 'Certificate', 93, '2016-07-14 12:12:26.552792', '2016-07-14 12:12:26.552792');
INSERT INTO stages VALUES (298, '@', '2017-07-13', '', NULL, 'Certificate', 94, '2016-07-14 12:14:44.224848', '2016-07-14 12:14:44.224848');
INSERT INTO stages VALUES (320, '!', '2016-08-08', 'Аннулирован по заявлению владельца. Решение ОС № 9-ПР-АН от 16.02.2016', NULL, 'Certificate', 17, '2016-08-08 10:11:46.980078', '2016-08-08 10:11:46.980078');
INSERT INTO stages VALUES (299, '@', '2018-07-12', '', NULL, 'Certificate', 94, '2016-07-14 12:14:44.226536', '2016-07-14 12:14:44.226536');
INSERT INTO stages VALUES (301, '@', '2017-07-13', '', NULL, 'Certificate', 95, '2016-07-14 12:16:50.338808', '2016-07-14 12:16:50.338808');
INSERT INTO stages VALUES (321, '!', '2016-08-25', 'Аннулирование по заявлению владельца аттестата аккредитации № 2-02-13 от 25.08.2016, Решение ОА об аннулировании № 2-09-13 от 25.08.2016', NULL, 'Attestat', 29, '2016-08-25 08:05:03.917798', '2016-08-25 08:05:03.917798');
INSERT INTO stages VALUES (302, '@', '2018-07-12', '', NULL, 'Certificate', 95, '2016-07-14 12:17:27.411435', '2016-07-14 12:17:27.411435');
INSERT INTO stages VALUES (305, '@', '2017-07-13', '', NULL, 'Certificate', 96, '2016-07-14 12:19:07.198159', '2016-07-14 12:19:07.198159');
INSERT INTO stages VALUES (108, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №17-2/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 40, '2016-06-08 07:25:48.857728', '2016-09-26 11:16:24.129972');
INSERT INTO stages VALUES (306, '@', '2018-07-12', '', NULL, 'Certificate', 96, '2016-07-14 12:19:07.20004', '2016-07-14 12:19:07.20004');
INSERT INTO stages VALUES (116, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №17-4/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 42, '2016-06-08 07:30:39.880254', '2016-09-26 11:17:51.314618');
INSERT INTO stages VALUES (222, '@', '2016-07-24', 'Решение ОА №2-09-11 от 18.07.2019, подтверждение', '2016-07-18', 'Attestat', 24, '2016-06-08 10:16:37.306644', '2016-07-18 12:11:40.210051');
INSERT INTO stages VALUES (307, '!', '2016-07-06', 'Аннулирование с последующим переоформлением в связи с изменением формы собственности юридического лица', NULL, 'Attestat', 31, '2016-07-18 14:40:26.869211', '2016-07-18 14:40:26.869211');
INSERT INTO stages VALUES (308, '@', '2017-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.349026', '2016-07-18 14:43:56.349026');
INSERT INTO stages VALUES (312, '@', '2017-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.400645', '2016-07-18 14:43:56.400645');
INSERT INTO stages VALUES (313, '@', '2018-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.40288', '2016-07-18 14:43:56.40288');
INSERT INTO stages VALUES (309, '@', '2018-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.352324', '2016-07-18 14:43:56.352324');
INSERT INTO stages VALUES (310, '@', '2019-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.354129', '2016-07-18 14:43:56.354129');
INSERT INTO stages VALUES (314, '@', '2019-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.404543', '2016-07-18 14:43:56.404543');
INSERT INTO stages VALUES (311, '@', '2020-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.355909', '2016-07-18 14:43:56.355909');
INSERT INTO stages VALUES (315, '@', '2020-01-18', '', NULL, 'Attestat', 33, '2016-07-18 14:43:56.406199', '2016-07-18 14:43:56.406199');
INSERT INTO stages VALUES (316, '!', '2016-07-13', 'Решение ОС об аннулировании № 2-СМ-АН от 13.07.2016, по заявлению владельца от 11.07.2016', NULL, 'Certificate', 25, '2016-07-28 11:48:59.230162', '2016-07-28 11:48:59.230162');
INSERT INTO stages VALUES (124, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №18-1/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 44, '2016-06-08 07:33:57.653645', '2016-09-26 11:19:28.345803');
INSERT INTO stages VALUES (132, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №18-3/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 46, '2016-06-08 07:36:55.724842', '2016-09-26 11:21:07.081528');
INSERT INTO stages VALUES (140, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №18-5/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 48, '2016-06-08 07:39:30.298078', '2016-09-26 11:22:27.663005');
INSERT INTO stages VALUES (148, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №19-2/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 50, '2016-06-08 07:42:05.922663', '2016-09-26 11:24:27.559631');
INSERT INTO stages VALUES (152, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №19-3/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 51, '2016-06-08 07:43:26.725907', '2016-09-26 11:25:02.207076');
INSERT INTO stages VALUES (156, '@', '2016-08-18', 'Подтверждение действия. Решение ОС №19-4/ИК-1 от 15.08.2016', '2016-08-15', 'Certificate', 52, '2016-06-08 07:44:46.968031', '2016-09-26 11:25:36.00603');


--
-- Name: stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('stages_id_seq', 321, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: exp
--

INSERT INTO users VALUES (2, 'mail@ncsc.msk.ru', '$2a$11$1tCRmdIvKgJ9wQ8duU5F8uy8HyF1F/qLBZgpz8rssXJT79/HwZxOK', NULL, 0, NULL, NULL, NULL, NULL, '2016-06-07 09:08:15.026353', '2016-06-07 13:14:22.557668', false, true, 'НЦСС', '', '');
INSERT INTO users VALUES (1, 'admin@test.test', '$2a$11$O5k6OIW76h3idpBVw5DzleOGOnpvleFF0518Y.G1bp8kcG4Hrcl82', NULL, 57, '2016-09-28 17:15:25.104386', '2016-09-28 06:02:06.408024', '46.249.1.199', '46.249.1.199', '2016-06-07 09:08:14.836281', '2016-09-28 17:15:25.107768', true, true, 'Администратор', '', 'Lookch2@mail.ru');
INSERT INTO users VALUES (3, 'manager@test.test', '$2a$11$ei/tgjvU97ep7Uwy0ZerS.OvrlXOSs7HRURXdiHrg4hXANLHen/P6', NULL, 2, '2016-09-29 14:41:24.987656', '2016-06-09 08:03:21.240726', '86.62.121.155', '128.68.101.44', '2016-06-07 09:08:15.212461', '2016-09-29 14:41:24.990687', false, false, 'Клиент', '', '');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: exp
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: agents_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: attestats_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY attestats
    ADD CONSTRAINT attestats_pkey PRIMARY KEY (id);


--
-- Name: certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: partners_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stages_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: exp; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_agents_on_active; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_agents_on_active ON agents USING btree (active);


--
-- Name: index_agents_on_name; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE UNIQUE INDEX index_agents_on_name ON agents USING btree (name);


--
-- Name: index_agents_on_role; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_agents_on_role ON agents USING btree (role);


--
-- Name: index_agents_on_user_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_agents_on_user_id ON agents USING btree (user_id);


--
-- Name: index_articles_on_header; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_articles_on_header ON articles USING btree (header);


--
-- Name: index_articles_on_published_at; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_articles_on_published_at ON articles USING btree (published_at);


--
-- Name: index_attestats_on_active; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_attestats_on_active ON attestats USING btree (active);


--
-- Name: index_attestats_on_agent_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_attestats_on_agent_id ON attestats USING btree (agent_id);


--
-- Name: index_attestats_on_customer_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_attestats_on_customer_id ON attestats USING btree (customer_id);


--
-- Name: index_attestats_on_number; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE UNIQUE INDEX index_attestats_on_number ON attestats USING btree (number);


--
-- Name: index_attestats_on_status; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_attestats_on_status ON attestats USING btree (status);


--
-- Name: index_certificates_on_active; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_certificates_on_active ON certificates USING btree (active);


--
-- Name: index_certificates_on_agent_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_certificates_on_agent_id ON certificates USING btree (agent_id);


--
-- Name: index_certificates_on_customer_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_certificates_on_customer_id ON certificates USING btree (customer_id);


--
-- Name: index_certificates_on_number; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE UNIQUE INDEX index_certificates_on_number ON certificates USING btree (number);


--
-- Name: index_certificates_on_status; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_certificates_on_status ON certificates USING btree (status);


--
-- Name: index_customers_on_active; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_customers_on_active ON customers USING btree (active);


--
-- Name: index_customers_on_name; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE UNIQUE INDEX index_customers_on_name ON customers USING btree (name);


--
-- Name: index_customers_on_user_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_customers_on_user_id ON customers USING btree (user_id);


--
-- Name: index_partners_on_index; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_partners_on_index ON partners USING btree (index);


--
-- Name: index_partners_on_name; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE UNIQUE INDEX index_partners_on_name ON partners USING btree (name);


--
-- Name: index_partners_on_published; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_partners_on_published ON partners USING btree (published);


--
-- Name: index_stages_on_operate_at; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_stages_on_operate_at ON stages USING btree (operate_at);


--
-- Name: index_stages_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_stages_on_resource_type_and_resource_id ON stages USING btree (resource_type, resource_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_is_admin_and_in_staff; Type: INDEX; Schema: public; Owner: exp; Tablespace: 
--

CREATE INDEX index_users_on_is_admin_and_in_staff ON users USING btree (is_admin, in_staff);


--
-- Name: fk_rails_7a1301a99e; Type: FK CONSTRAINT; Schema: public; Owner: exp
--

ALTER TABLE ONLY certificates
    ADD CONSTRAINT fk_rails_7a1301a99e FOREIGN KEY (agent_id) REFERENCES agents(id) ON DELETE SET NULL;


--
-- Name: fk_rails_8b40c575bf; Type: FK CONSTRAINT; Schema: public; Owner: exp
--

ALTER TABLE ONLY attestats
    ADD CONSTRAINT fk_rails_8b40c575bf FOREIGN KEY (agent_id) REFERENCES agents(id) ON DELETE SET NULL;


--
-- Name: fk_rails_97732e95cb; Type: FK CONSTRAINT; Schema: public; Owner: exp
--

ALTER TABLE ONLY certificates
    ADD CONSTRAINT fk_rails_97732e95cb FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL;


--
-- Name: fk_rails_9917eeaf5d; Type: FK CONSTRAINT; Schema: public; Owner: exp
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT fk_rails_9917eeaf5d FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: fk_rails_b2a20fc47e; Type: FK CONSTRAINT; Schema: public; Owner: exp
--

ALTER TABLE ONLY attestats
    ADD CONSTRAINT fk_rails_b2a20fc47e FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL;


--
-- Name: fk_rails_ef89880eea; Type: FK CONSTRAINT; Schema: public; Owner: exp
--

ALTER TABLE ONLY agents
    ADD CONSTRAINT fk_rails_ef89880eea FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

