-- Análise de Cancelamentos
-- Query 1 -  city vs resort
SELECT
hotel, SUM(is_canceled) AS soma_cancelamentos
FROM hotel_bookings
GROUP BY 1;

-- Quantidade de reservas
SELECT
hotel, COUNT(*)
FROM hotel_bookings	
GROUP BY hotel;

-- Query 2 | Quais canais de reserva tem a maior taxa de cancelamento?
SELECT 
hotel, SUM(is_canceled) AS soma_cancelamentos, distribution_channel
FROM hotel_bookings
GROUP BY 1, 3
ORDER BY 2 DESC;

-- Query 3 | Quais países tem mais taxa de cancelamento?
SELECT
country, SUM(is_canceled) AS soma_cancelamento
FROM hotel_bookings
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Query 4 | Clientes repetidos cancelam mais que clientes novos?
SELECT
is_repeated_guest, is_canceled,
COUNT(is_repeated_guest)
FROM hotel_bookings
WHERE is_repeated_guest = 1
GROUP BY 1, 2;

--

SELECT
is_repeated_guest, is_canceled,
COUNT(is_repeated_guest)
FROM hotel_bookings
WHERE is_repeated_guest = 0
GROUP BY 1, 2;

-- Query 5 | Lead time tem relação com cancelamento?
SELECT
is_canceled, lead_time,
COUNT(is_canceled) AS cancelamento_ptempo
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1, 2
ORDER BY cancelamento_ptempo DESC;

-- Query 6 | Qual o impacto do tipo de cliente no cancelamento?
SELECT
COUNT(is_canceled) AS qtd_cancelamentos, customer_type
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 2;

SELECT
COUNT(*), customer_type
FROM hotel_bookings
GROUP BY 2;

-- Verificar tipo de cliente por lead time e hotel
SELECT 
hotel, customer_type, lead_time, COUNT(*) AS contagem_registros
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1, 2, 3
ORDER BY 4 DESC;


-- Análise de receita e ocupação 
-- Query 1 | Ticket médio por hotel e tipo de canal | Quais canais trazem mais receita
SELECT
hotel, distribution_channel, SUM(adr) media_diaria
FROM hotel_bookings
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Query 2 - Quais mercados de origem (countries) geram mais receita?
SELECT
country, market_segment, SUM(adr) AS media_preço
FROM hotel_bookings
GROUP BY 1, 2
ORDER BY media_preço DESC
LIMIT 20;

-- Query 3 - Qual a receita perdida devido aos cancelamentos? 
SELECT
    SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) AS receita_perdida
FROM hotel_bookings
WHERE is_canceled = 1;

-- Query 4 | Qual a taxa de ocupação mensal?
SELECT
arrival_date_month,
COUNT(*) AS total_reservas,
SUM(stays_in_week_nights + stays_in_weekend_nights) AS total_noites_ocupadas
FROM hotel_bookings
WHERE is_canceled = 0
GROUP BY 1
ORDER BY 3 DESC;
--
SELECT 
    arrival_date_year,
    arrival_date_month,
    SUM(stays_in_weekend_nights + stays_in_week_nights) AS noites_ocupadas,
    COUNT(*) * dias.no_dias AS capacidade_mes,
    ROUND(
        (SUM(stays_in_weekend_nights + stays_in_week_nights) / (COUNT(*) * dias.no_dias)) * 100, 
        2
    ) AS taxa_ocupacao_percentual
FROM hotel_bookings
JOIN (
    SELECT 'January' AS mes, 31 AS no_dias UNION ALL
    SELECT 'February', 28 UNION ALL
    SELECT 'March', 31 UNION ALL
    SELECT 'April', 30 UNION ALL
    SELECT 'May', 31 UNION ALL
    SELECT 'June', 30 UNION ALL
    SELECT 'July', 31 UNION ALL
    SELECT 'August', 31 UNION ALL
    SELECT 'September', 30 UNION ALL
    SELECT 'October', 31 UNION ALL
    SELECT 'November', 30 UNION ALL
    SELECT 'December', 31
) AS dias
ON hotel_bookings.arrival_date_month = dias.mes
WHERE is_canceled = 0
GROUP BY arrival_date_year, arrival_date_month, dias.no_dias
ORDER BY arrival_date_year, 
    FIELD(arrival_date_month, 
        'January', 'February', 'March', 'April', 'May', 'June', 
        'July', 'August', 'September', 'October', 'November', 'December');

-- Query 5 | Média de noites reservadas por tipo de cliente e hotel
SELECT
    hotel,
    customer_type,
    ROUND(AVG(stays_in_week_nights + stays_in_weekend_nights), 2) AS media_noites_reservadas
FROM hotel_bookings
GROUP BY hotel, customer_type
ORDER BY hotel, media_noites_reservadas DESC;

-- Análise de sazonalidade e Demanda
-- Query 1 | Quais meses ocorre o maior número de cancelamentos
SELECT
arrival_date_month, SUM(is_canceled) AS reservas_canceladas
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1
ORDER BY 2 DESC;

-- Query 2 | Quais meses tem o maior número de reservas efetivas?
SELECT
arrival_date_month, COUNT(is_canceled) AS reservas_efetivas
FROM hotel_bookings
WHERE is_canceled = 0
GROUP BY 1
ORDER BY 2 DESC;

-- Query 3 | Quais canais de venda se destacam por temporada
SELECT
    CASE
        WHEN arrival_date_month IN ('January', 'February', 'July', 'December') THEN 'Alta Temporada'
        WHEN arrival_date_month IN ('March', 'April', 'May', 'September') THEN 'Baixa Temporada'
        ELSE 'Média Temporada'
    END AS temporada,
    distribution_channel,
    COUNT(*) AS total_reservas
FROM hotel_bookings
WHERE is_canceled = 0
GROUP BY temporada, distribution_channel
ORDER BY temporada, total_reservas DESC;

-- Query 4 | Existe uma diferença entre reservas de city vs resort ao longo do ano?
SELECT
hotel, arrival_date_month, COUNT(*) AS total_reservas
FROM hotel_bookings
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Análise de perfil e segmentação
-- Query 1 | Principais países por tipo de hotel
SELECT
hotel, country, COUNT(*) AS total_reservas
FROM hotel_bookings
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 25

-- Query 2 | Perfil dos clientes que mais cancelam e reservam
-- Por país
SELECT
customer_type, country, COUNT(*) qtd_cancelamentos
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 25;

SELECT
customer_type, country, COUNT(*) qtd_reservas
FROM hotel_bookings
WHERE is_canceled = 0
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 25;

-- Por canal
SELECT
customer_type, distribution_channel, COUNT(*) qtd_cancelamentos
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT
customer_type,distribution_channel, COUNT(*) qtd_reservas
FROM hotel_bookings
WHERE is_canceled = 0
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Por tipo de cliente
SELECT
customer_type, COUNT(*) qtd_cancelamentos
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1
ORDER BY 2 DESC;

SELECT
customer_type, COUNT(*) qtd_reservas
FROM hotel_bookings
WHERE is_canceled = 0
GROUP BY 1
ORDER BY 2 DESC;



-- Query 3 - Clientes que depositam antes tem mais chance de cancelamento?
SELECT 
deposit_type, is_canceled,
COUNT) AS total_registros
FROM hotel_bookings
GROUP BY 1, 2
ORDER BY 3 DESC

-- Query 4 | Quais agentes/empresas estão associados as maiores taxas de cancelamento?
SELECT
agent,
COUNT(is_canceled) AS total_cancelados
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

SELECT
company,
COUNT(is_canceled) AS total_cancelados
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


