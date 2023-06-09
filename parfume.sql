PGDMP         ,    
            {            parfume    13.9    13.9 D               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    16544    parfume    DATABASE     d   CREATE DATABASE parfume WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE parfume;
                postgres    false            �            1259    16577    Photos    TABLE     �   CREATE TABLE public."Photos" (
    "ID" integer NOT NULL,
    "Path" character varying NOT NULL,
    type character varying,
    "photoId" character varying
);
    DROP TABLE public."Photos";
       public         heap    postgres    false            �            1259    16575    Photos_PhotoID_seq    SEQUENCE     �   CREATE SEQUENCE public."Photos_PhotoID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Photos_PhotoID_seq";
       public          postgres    false    204            
           0    0    Photos_PhotoID_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public."Photos_PhotoID_seq" OWNED BY public."Photos"."ID";
          public          postgres    false    203            �            1259    16558    Products    TABLE     �   CREATE TABLE public."Products" (
    "ProductID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Price" integer NOT NULL,
    description character varying NOT NULL,
    "PhotoID" integer,
    title character varying
);
    DROP TABLE public."Products";
       public         heap    postgres    false            �            1259    16556    Products_ProductID_seq    SEQUENCE     �   CREATE SEQUENCE public."Products_ProductID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Products_ProductID_seq";
       public          postgres    false    202                       0    0    Products_ProductID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Products_ProductID_seq" OWNED BY public."Products"."ProductID";
          public          postgres    false    201            �            1259    16588    Sessions    TABLE     d   CREATE TABLE public."Sessions" (
    "SessionID" integer NOT NULL,
    "UserID" integer NOT NULL
);
    DROP TABLE public."Sessions";
       public         heap    postgres    false            �            1259    16586    Sessions_SessionID_seq    SEQUENCE     �   CREATE SEQUENCE public."Sessions_SessionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Sessions_SessionID_seq";
       public          postgres    false    206                       0    0    Sessions_SessionID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Sessions_SessionID_seq" OWNED BY public."Sessions"."SessionID";
          public          postgres    false    205            �            1259    16547    Users    TABLE     F  CREATE TABLE public."Users" (
    "UserID" integer NOT NULL,
    "Login" character varying NOT NULL,
    "Password" character varying,
    "FIO" character varying,
    "Email" character varying NOT NULL,
    "Admin" boolean DEFAULT false NOT NULL,
    "Activation" boolean DEFAULT false NOT NULL,
    "ActivationLink" text
);
    DROP TABLE public."Users";
       public         heap    postgres    false            �            1259    25122    Users_UserID_seq    SEQUENCE     �   ALTER TABLE public."Users" ALTER COLUMN "UserID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_UserID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    200            �            1259    25021    orders    TABLE       CREATE TABLE public.orders (
    id text NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    status_id bigint NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    address text NOT NULL,
    "FIO" text NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    25017    orders_product_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.orders_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.orders_product_id_seq;
       public          postgres    false    215                       0    0    orders_product_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.orders_product_id_seq OWNED BY public.orders.product_id;
          public          postgres    false    213            �            1259    25019    orders_status_id_seq    SEQUENCE     }   CREATE SEQUENCE public.orders_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orders_status_id_seq;
       public          postgres    false    215                       0    0    orders_status_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orders_status_id_seq OWNED BY public.orders.status_id;
          public          postgres    false    214            �            1259    25015    orders_user_id_seq    SEQUENCE     {   CREATE SEQUENCE public.orders_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orders_user_id_seq;
       public          postgres    false    215                       0    0    orders_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orders_user_id_seq OWNED BY public.orders.user_id;
          public          postgres    false    212            �            1259    24913    statuses    TABLE     S   CREATE TABLE public.statuses (
    id bigint NOT NULL,
    status text NOT NULL
);
    DROP TABLE public.statuses;
       public         heap    postgres    false            �            1259    24911    statuses_id_seq    SEQUENCE     x   CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.statuses_id_seq;
       public          postgres    false    211                       0    0    statuses_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;
          public          postgres    false    210            �            1259    16693    user_tokens    TABLE     i   CREATE TABLE public.user_tokens (
    id bigint NOT NULL,
    token text,
    user_id bigint NOT NULL
);
    DROP TABLE public.user_tokens;
       public         heap    postgres    false            �            1259    16689    user_tokens_id_seq    SEQUENCE     {   CREATE SEQUENCE public.user_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_tokens_id_seq;
       public          postgres    false    209                       0    0    user_tokens_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_tokens_id_seq OWNED BY public.user_tokens.id;
          public          postgres    false    207            �            1259    16691    user_tokens_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_tokens_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_tokens_user_id_seq;
       public          postgres    false    209                       0    0    user_tokens_user_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.user_tokens_user_id_seq OWNED BY public.user_tokens.user_id;
          public          postgres    false    208            U           2604    24840 	   Photos ID    DEFAULT     q   ALTER TABLE ONLY public."Photos" ALTER COLUMN "ID" SET DEFAULT nextval('public."Photos_PhotoID_seq"'::regclass);
 <   ALTER TABLE public."Photos" ALTER COLUMN "ID" DROP DEFAULT;
       public          postgres    false    203    204    204            T           2604    16561    Products ProductID    DEFAULT     ~   ALTER TABLE ONLY public."Products" ALTER COLUMN "ProductID" SET DEFAULT nextval('public."Products_ProductID_seq"'::regclass);
 E   ALTER TABLE public."Products" ALTER COLUMN "ProductID" DROP DEFAULT;
       public          postgres    false    201    202    202            V           2604    16591    Sessions SessionID    DEFAULT     ~   ALTER TABLE ONLY public."Sessions" ALTER COLUMN "SessionID" SET DEFAULT nextval('public."Sessions_SessionID_seq"'::regclass);
 E   ALTER TABLE public."Sessions" ALTER COLUMN "SessionID" DROP DEFAULT;
       public          postgres    false    205    206    206            Z           2604    25024    orders user_id    DEFAULT     p   ALTER TABLE ONLY public.orders ALTER COLUMN user_id SET DEFAULT nextval('public.orders_user_id_seq'::regclass);
 =   ALTER TABLE public.orders ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    212    215    215            [           2604    25025    orders product_id    DEFAULT     v   ALTER TABLE ONLY public.orders ALTER COLUMN product_id SET DEFAULT nextval('public.orders_product_id_seq'::regclass);
 @   ALTER TABLE public.orders ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    215    213    215            \           2604    25026    orders status_id    DEFAULT     t   ALTER TABLE ONLY public.orders ALTER COLUMN status_id SET DEFAULT nextval('public.orders_status_id_seq'::regclass);
 ?   ALTER TABLE public.orders ALTER COLUMN status_id DROP DEFAULT;
       public          postgres    false    214    215    215            Y           2604    24916    statuses id    DEFAULT     j   ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);
 :   ALTER TABLE public.statuses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            W           2604    16696    user_tokens id    DEFAULT     p   ALTER TABLE ONLY public.user_tokens ALTER COLUMN id SET DEFAULT nextval('public.user_tokens_id_seq'::regclass);
 =   ALTER TABLE public.user_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    207    209            X           2604    16697    user_tokens user_id    DEFAULT     z   ALTER TABLE ONLY public.user_tokens ALTER COLUMN user_id SET DEFAULT nextval('public.user_tokens_user_id_seq'::regclass);
 B   ALTER TABLE public.user_tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    209    208    209            �          0    16577    Photos 
   TABLE DATA           A   COPY public."Photos" ("ID", "Path", type, "photoId") FROM stdin;
    public          postgres    false    204   �K       �          0    16558    Products 
   TABLE DATA           a   COPY public."Products" ("ProductID", "Name", "Price", description, "PhotoID", title) FROM stdin;
    public          postgres    false    202   M       �          0    16588    Sessions 
   TABLE DATA           ;   COPY public."Sessions" ("SessionID", "UserID") FROM stdin;
    public          postgres    false    206   V       �          0    16547    Users 
   TABLE DATA           y   COPY public."Users" ("UserID", "Login", "Password", "FIO", "Email", "Admin", "Activation", "ActivationLink") FROM stdin;
    public          postgres    false    200   <V                 0    25021    orders 
   TABLE DATA           Z   COPY public.orders (id, user_id, product_id, status_id, date, address, "FIO") FROM stdin;
    public          postgres    false    215   �]       �          0    24913    statuses 
   TABLE DATA           .   COPY public.statuses (id, status) FROM stdin;
    public          postgres    false    211   �_       �          0    16693    user_tokens 
   TABLE DATA           9   COPY public.user_tokens (id, token, user_id) FROM stdin;
    public          postgres    false    209   `                  0    0    Photos_PhotoID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Photos_PhotoID_seq"', 5, true);
          public          postgres    false    203                       0    0    Products_ProductID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Products_ProductID_seq"', 13, true);
          public          postgres    false    201                       0    0    Sessions_SessionID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Sessions_SessionID_seq"', 1, false);
          public          postgres    false    205                       0    0    Users_UserID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Users_UserID_seq"', 2, true);
          public          postgres    false    216                       0    0    orders_product_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.orders_product_id_seq', 1, false);
          public          postgres    false    213                       0    0    orders_status_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_status_id_seq', 1, false);
          public          postgres    false    214                       0    0    orders_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_user_id_seq', 1, false);
          public          postgres    false    212                       0    0    statuses_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.statuses_id_seq', 3, true);
          public          postgres    false    210                       0    0    user_tokens_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.user_tokens_id_seq', 1058, true);
          public          postgres    false    207                       0    0    user_tokens_user_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.user_tokens_user_id_seq', 1, false);
          public          postgres    false    208            c           2606    24842    Photos Photos_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public."Photos"
    ADD CONSTRAINT "Photos_pk" PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public."Photos" DROP CONSTRAINT "Photos_pk";
       public            postgres    false    204            a           2606    16566    Products Products_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pk" PRIMARY KEY ("ProductID");
 B   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pk";
       public            postgres    false    202            e           2606    16593    Sessions Sessions_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_pk" PRIMARY KEY ("SessionID");
 B   ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pk";
       public            postgres    false    206            _           2606    16555    Users Users_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pk" PRIMARY KEY ("UserID");
 <   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pk";
       public            postgres    false    200            k           2606    25032    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    215            i           2606    24921    statuses statuses_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.statuses DROP CONSTRAINT statuses_pkey;
       public            postgres    false    211            g           2606    16702    user_tokens user_tokens_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_tokens DROP CONSTRAINT user_tokens_pkey;
       public            postgres    false    209            l           2606    16612    Sessions Sessions_fk0    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_fk0" FOREIGN KEY ("UserID") REFERENCES public."Users"("UserID");
 C   ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_fk0";
       public          postgres    false    206    200    2911            o           2606    25038    orders orders_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public."Products"("ProductID");
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_product_id_fkey;
       public          postgres    false    215    2913    202            p           2606    25043    orders orders_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.statuses(id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_status_id_fkey;
       public          postgres    false    211    215    2921            n           2606    25033    orders orders_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."Users"("UserID");
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          postgres    false    215    200    2911            m           2606    16703 $   user_tokens user_tokens_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."Users"("UserID");
 N   ALTER TABLE ONLY public.user_tokens DROP CONSTRAINT user_tokens_user_id_fkey;
       public          postgres    false    200    2911    209            �     x���=n�@���"��;N%J�!��f�;kLl�e�P������S��7������n�{����}���\&�i.Gn�DcI���D���r��v����il75b�FhHh=#��
8`�4��u}���	s��n�qZ�9g� vQq�3R�:�桛5z��0�m��`� ����Wl�B��
�<h���rߗ��&�� �F�WG�k�m�������)\�T�¦�ʯ���U='qM�P��������]��      �    	  x��YKSW^7���&+��1g)!�U�!%ƞJ�ldKq���w��(Lf���$��d5�F�M#���a~ɜ�;�vK�lR5CQ���8��|眫��R���Z\˙�˥�r)g����|�Q�ٻw���ȏ���Qԏ������:�0�F�Y���n6�^4�[U����M܊|�ϙ#Y���8:��vD�ۦ'������ɤ7�ҽ�M������0:O��5ѿd�a�6|ԉ�q�seU/
�U���r&���-�Y���oF���d8G����%����2m9���27��D�M@�� ��_�-��Wa�t�ӱ�"��F����w���3^!��XX��3���6/7k�U��� '��7����_��,�3��f��ދ��؟D�=w��,Jv��qD�2�[��k _��la~G&��0}|ȉ���>��pO?��px7>a~�y0�W�o�vB?�@Ў0��EA��M����V:H��΂W�����ՂX։�|��7d�������Qt��'Nxo�V�df�{T�y���v��i�3g����e�����xH�����E�)��W��������ں��@�����!-m]B.� j˼�5����b�`�n6�>]`�����=�1��}H��)*�?��o�Q�bu$�`^էO���L���2r����G#�����m ā�p|���L�
	,yĀ+3F#��Ɠ�c���O�y# ϙ�����c��X�|��� ��n�2�e8�(j* ΨQ�����2(�=P��J�֥��A6*Mҍ]��Jֶ��k��OM�Um�8�I�������M+	wd@N���}(�%Mg�%R�	up�[�� �Ňcl2�GB�Ŏ���#/D�w�+�$�2��סi;4�{��m�ǀ�51��N���+[IP��#� �e��1H�l�4�P�-�]�D�\`��1��%�[e��_y�O��@���������(H������#�JI�#j�RЮ�ɮǒx��r�Ny�ZPKb���)�Ko��V��AS�_D��ZA�kn\����S�e��B��P5@��P�jtн�+�l@�N�f"�)մPP����44��J�rk��m��iT+���*�\C���ɗw6Mq۔�W�K��@�
X�����G�g�ޓ��Fniټ��j����YުoW������'��N�Y�|��
�N��gB�M-�3LLd�����$�l���%7x8����S%�����b<i�Q�^�P�S;��/��-u�'��i�'��j
H$�>��Ϥ�n�N�XG��$�A���K
>�^�Ŭ��-��y���E}�a��omU�����4�kb��X�YvR:`���3 �'�>�#ڌ�4+���/࡮��	��]���E6;M�GD�2�+R�Ѣ0��}��.� �����I;]jY��H��.�"2��#�B��I9t#c9@�Se3溞�?���ظ�ʈM�����:Oq��{p;i�S/�[�?����W�K�V}^~&eF���k�\����XU�0;�t��#r3�Hm�Y�J_6�]�>'�~��gUn��1j.yo�M�t�)��Pp�F�b��ܴ �M=[���R��z��eٗ���xV�o��� p�<��Fx�,��V�_Q��S�pI#�a�r�:�X��}��GDй��3��>Z-�l�P�iQ��8kwd�"��AV�����^���J�T4R�P!���9`���N5�A�;��Z�߯�<r�K9d�k&��[��D]}����
:���})�*K�N&�"��|�Ŗk���%6e.1���. �Z �X���}Ǖ������\A�Eq��Ǚ�1i���$г�s��`�&I�u`�� �����Pd���b��[b߻���%�S������-��n�s�轗m�Ś�;qs�tH�[��p��eM׷�	��	�A^ډm~�҇fG�h��#���AKw�>y*�%h?�*C�q�bJ��:߹4�l(
�N՛��/p�;;l�~K��A��"f�+��.-���#��J�&�b��S5��T�n}�V�ݭz�	�
x��J����v��e��+co���.�8۔d���"��H}�.���8����֬z��_�כ���Fr�o��~�?U1N�s��O�D9����GY*^�����"�Wo����f�E����g?��Nu��di��XԱ��sW^Y}�����-'�DB�HJWt�6�p�rm�sȄ�Qk���R��q�x{w��?o�������:����qL�r�������p"��{־����X�����!�o-v�2;33�q&�W      �      x������ � �      �   c  x���ˎ����SԢ��%����^�˶l�]��J$-_e���*�Y�2@VA �t���t^��FaU�=]�$ݱ�S�s��Z��Jl��2�'�|�.-��l��+#����1ћ�B�m�m�?6�Q>]�yƤy���朥K�����z[�*��1��w������������_ϟ��ǟ^-h,�&�S�LR$��� :
��`�0�-�Y&t
�֢�X]ȼ���!V��xļ�x��F<-��e�W���pwt�v���Nk��S;���o:,V�)��2"߰���,�!��C�τo�ҴM��}["]p� �ah2Y ��߃���.:w��3�}���h@A��?"R1�1<(�׵�9g���ұ���{��� g>&:6�D>�	� H�
 �_ م0n��l7\l��߻Ԇ���l>6H{v�ī��$����+�r��Y����
�:��P�-�u��`���
�!іq�^���C:�i����݉R��[fkT"�1�OF��N�.%�(���W$�����{�ї��*H� X6թm*4�qt"MK�1e�a�* ��Y�u�L�ۚ]o7��ò��V�hu:���N&�"��������f- sp}[��v�����z}<����q�ts����Y-<q�z~�[�^i���l&�:�X�Ĵm��
��@�Q���L�Ca�@��j�ծ�/\sp�$w�X݆�)F�^٬n6NȎuoߓ�p�fm�e��������а��U�m���U�L�~Rl`	;p
���\I>�M�?l�c�8�ciB�_V�{ޜ$����t�5��*�5ٽ�V���������%!�qY���×\�_'���P�YLGr�qIu��q�bP�@��l�f�/��$k'�Qv�f��m�������8�&w��--nz�e��R7�OӒ�A�v��sֽ��)��������?<�t�E�|�K�j��ܪ�'?<s��3�e�cNt�	Q.	T�m_�����
�&��7|�3������V�X�֎��ݦ2�5J�b)��[�:�� b,�Un����SU~!kp�+�D�;:�%*���΅��3	�����9hL�����|78�J*)4ҀEI�}��e�����l����pz���j�4�������P�c(OR�F��[��WU%}}���_�>��ÅU�ǝ�7K�e���:v;c���nɾX�������d1��I+����B�I��W����&3-�#݁+11VtT�B�����x�:��ﯷ��検�j}��nB�m�rj�>.\��o�����e��ۦ~h߂E��;~@��s�SH�.;��jˡxi8��.p��h\�M\ݏj�0,��J7c�>����U�.�<�ض�fy�m�z�7��$ń?�e��(�	��Sj��Z��A��M�[�8���;^�����z3���`����a���۬�nw�(ٶ�7�,���|�J�х����P:�@5 J-� �&g<�x�1�"�T+���,6�(�lY����~�<��j!�$+ng���#u��β��#L%��
	W�������mf���T32�*{/���1�o�x#�����ne�����n�j&���m-�~�^�����||��{��Q��d�׆�
�@�KG\�P��}���h*�,��'�zb;�,F���^e]ӓ�rӛ��ܜ����eso7�a�����ߖ�����w�O*}%����~=O[�[b��!B���vl5\�	R'�cݴ-������EՔd#jk�}��ݧ������6;ʌ'�E�� ��o�lK��m�Yl�"�S�Ѩ��n[ǍSu����ɋ����(=j\��c�-���U������C3@:��W�&��b��`'Q-���B�_87P�         �  x���Kn�@���)� )����>����`�q�@@��znD�U�",,ٖUrY�J�l������6�x$�@H-jMi�|��Eh'�5�EKP�F�y����y?o�y7�ϻ�����z�{��<_�/o�y���|u�8o����?{yy�?��i~������?>��'���W/x��j�*�bU�P
����r�6���<��5ƕeIY������-�^�$g`���eS#��{��`Q8���u/�(��"A��n�U؍+� X��h�u�e}��OԶ
��'�M�Q-�ܰaquR��["��X����Kf�`��I}�q�����UF�<���j[��L9�N��t�͏��d{�uU;0ǿ�9/1e��RF@k�i,�%��~$�F�=�F�k�)7�!�dK2V�ݸ��0��NɑX<$��o�تh��>`J�U!ݍ�{�H"��ؓ�)�ԫ�lZZ��y.���K�#�b9�?S�O�      �   O   x���	�0��{StA]�a|l .�� ->�ry��v�L����).�S�������6�&�������Ј�t�+      �     x��K������IH`��`�6�`@@ݪ.�y��������O*�Te�&X -}��� ?;z�$33]sG�E�v�j�'km�g�[�':�#�������m׺��gtP�jB���F/���\U	Lc3�0*zIVV�˶LOnq�[��NZ&�x#c�� 2$�*�ʴ|1G�6=���1m]����'e8��ѹս�<-xc�������lJ�����ޕ��L*>��dc6�p7=SG��Ԥ	py�V���B)b\�Z~�܏��,����D-�ΰRn�7�*ӄn���1ʽA�t��O;-?�(?�h�E��֓�K7���j��2����K�+��d�z̷:w{���9���F�+J��s<��1��i�� ��R��ީ���|[moJg8�D�<l�>����ЛN�zj��x��<����/�(l� =`�ܠ�!�^!슌� ���y��ߋx����׫���r��}���U��T�w���&BcM� #'�Ǒoؐ#C�	���]_�pŷN��K���`�M��QК��/��d��C�4�/��q!�����0��l@�@e�{fngHkHt���"t,.���f�XG�Q�'��ἣ���W,��ms�}H�W]�"���um V���_rTnu�#�������ސ��:��ӵ0���҇uk��v�N�_�SΗm�%}�����R��X㺉��hL�j��3k2�Ck۱+����?l�go�|S|P�����Tg�d��}��9��xE�24��v�Z{h+�iaE�;ô�ouU��<��4Y���C쁸���	���V�ވX#�~$�$P"Y�8aPT���h-�'�r����NE�}=�.å��?��'������1��{&�,�e�`{�z�S��^L��N/���>'���W�<�n���(��j��@j�L"����VBx�ゖ�2\�P�zj=����^���yհN6�)�g�
���_�{P�(��f0Ə��D�]��� �8��]&-�
�f�⫻R75��/aTK�bG/���!H����c����ж�P�7�w��÷4e��x�w9h�i�9������<�KԐus�Al`Oy����~�LRb�l�j���y��x��g�G(c��G�A��@��)|����O�b���:%���
�Q{�.gJ���;o8�n��z{+p�|ث6��EL��(|��k@O������y0�S�y���Ð��?�b����Ѻ,ұ��'��Z��kM����}C���8�BC�Xyꊵ%������o(Y$T��m��ƣ��i��.�Q�cћ>�$\s���u"T����i�5-9e�5W�8��;�tfs>�.�<���١%��g�c
hohqs/���)��`%t��N˒���@��M8-|�b��9��-��g�������Ay�# ��!����m+"E7z��:�єz�_M��%e�~�2���:����x(9~�!�����O$�c���D�}"�ې,>��mH>�"�ː��i>�����     