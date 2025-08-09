# Otimização de Reservas e Redução de Cancelamentos no Setor Hoteleiro

## Descrição
Análise de dados do setor hoteleiro para reduzir cancelamentos, otimizar taxa de ocupação e entender o perfil dos clientes mais rentáveis. Utiliza SQL para extração e análise de dados, Power BI para visualização e dashboards interativos, e PowerPoint para storytelling e apresentação dos resultados.

## Contextualização do Negócio
O setor hoteleiro enfrenta desafios importantes na gestão de reservas, cancelamentos e na maximização da taxa de ocupação. Cancelamentos de última hora prejudicam a receita e uma gestão inadequada dos canais e perfis de clientes pode gerar desperdício de oportunidades de venda. Este projeto analisa dados reais de reservas em dois tipos de hotéis — City Hotel e Resort Hotel — para identificar padrões, gerar insights e recomendar ações estratégicas.

## Problema de Negócio
Como reduzir a taxa de cancelamento, otimizar a taxa de ocupação e entender o perfil dos clientes mais rentáveis para melhorar a performance dos hotéis?

## Objetivos do Projeto
- Reduzir a taxa de cancelamento  
- Otimizar a taxa de ocupação  
- Entender o perfil dos clientes mais rentáveis  

## Dataset
Dados de aproximadamente 40.800 reservas de dois tipos de hotéis:
- **City Hotel** (foco em negócios)  
- **Resort Hotel** (foco em lazer)  

Contém informações sobre:  
- Datas de chegada e número de noites reservadas  
- Tipo e status da reserva (confirmada ou cancelada)  
- Perfil dos hóspedes e tipo de cliente  
- Canal de reserva e política de pagamento  
- Dados de sazonalidade e demanda  

Fonte: [Hotel Bookings Dataset - Kaggle](https://www.kaggle.com/jessemostipak/hotel-booking-demand)

## Metodologia

| Etapa                 | Ferramenta                        |
|-----------------------|---------------------------------|
| Extração e Análise    | SQL (queries para análise e métricas)   |
| Visualização de Dados  | Power BI                       |
| Storytelling e Apresentação | PowerPoint                |

## Plano de Ação

### SQL
- Criação de queries para cálculo de taxa de cancelamento, análise de sazonalidade, receita, perfil de clientes e canais de venda.  
- Análise de dados para identificar padrões e gerar métricas-chave.  

### Power BI
- Desenvolvimento de dashboards dinâmicos com KPIs principais.  
- Visualizações para análise geográfica, temporal, por canal e perfil de hóspedes.  

### PowerPoint
- Apresentação dos resultados com storytelling claro, apoiado nos dashboards e insights obtidos.

## Insights

### Parte 1: Redução da Taxa de Cancelamento
- Resort Hotel concentra 90% das reservas e cancelamentos  
- Canal TA/TO (Agências/Tour Operadores) lidera cancelamentos devido a “No Deposit”  
- Países com mais cancelamentos: Portugal, Reino Unido, Espanha, Irlanda  
- Cliente Transient individual é o mais volátil  
- Políticas de pagamento impactam diretamente cancelamentos  

**Conclusão:** Cancelamentos concentrados em lazer (Resort Hotel), canal TA/TO e política de pagamento frouxa.

### Parte 2: Otimização da Ocupação
- TA/TO tem maior ticket médio, porém alta taxa de cancelamento  
- Vendas diretas são rentáveis e com menor risco  
- Receita perdida estimada: R$ 5,9 milhões  
- Clientes Contract garantem estadias longas e estáveis  
- Clientes Transient no City Hotel têm estadias curtas e frequentes  

**Conclusão:** Reduzir cancelamentos nos canais lucrativos, valorizar vendas diretas e ampliar contratos corporativos.

### Parte 3: Perfil dos Clientes Mais Rentáveis
- Canal Direct e clientes Contract ou Transient fidelizados são ideais  
- Políticas rígidas de pagamento ajudam a controlar cancelamentos  
- Monitoramento de parceiros e canais é essencial  

**Perfil ideal:** Canal Direct, cliente Contract ou Transient fidelizado, pagamento non-refundable ou com depósito, origem em países com baixa taxa de cancelamento.

### Parte 4: Sazonalidade e Demanda
- Meses críticos: Julho, Agosto, Abril, Maio, Junho (alta temporada)  
- Estratégias de overbooking e ajuste de políticas são recomendadas  

**Conclusão:** Ajustar políticas comerciais e estratégias de overbooking conforme mês e canal.

## KPIs Principais

| Indicador             | Descrição                                  |
|-----------------------|--------------------------------------------|
| Taxa de Cancelamento (%) | Cancelamentos / Total de Reservas         |
| Taxa de Ocupação (%)     | Noites ocupadas / Noites disponíveis       |
| ADR (Average Daily Rate) | Receita média diária por noite ocupada     |
| Receita Total            | Receita total gerada no período             |
| Lead Time Médio          | Tempo médio entre reserva e chegada         |
| Taxa por Canal           | Cancelamento e receita por canal            |

## Recomendações

- Exigir pagamento antecipado (non-refundable) para reservas de alto risco  
- Implementar overbooking controlado em meses voláteis  
- Focar retenção em países e canais críticos  
- Criar programas de fidelidade para clientes com maior intenção de comparecimento  
- Monitorar e controlar canais problemáticos, especialmente canal “undefined”

