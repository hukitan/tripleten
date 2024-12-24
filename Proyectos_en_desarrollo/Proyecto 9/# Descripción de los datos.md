# Descripción de los datos
- La tabla visits (registros del servidor con datos sobre las visitas al sitio web):
    -  Uid: identificador único del usuario.
    - Device: dispositivo del usuario.
    - Start Ts: fecha y hora de inicio de la sesión.
    - End Ts: fecha y hora de término de la sesión.
    - Source Id: identificador de la fuente de anuncios de la que proviene el usuario.
Todas las fechas de esta tabla están en formato AAAA-MM-DD.

- La tabla orders (datos sobre pedidos):
    - Uid: identificador único del usuario que realiza un pedido.
    - Buy Ts: fecha y hora del pedido. 
    - Revenue: el ingreso de Showz por el pedido.

- La tabla costs (datos sobre gastos de marketing):
    - source_id: identificador de la fuente de anuncios.
    - dt: fecha.
    - costs: gastos en esta fuente de anuncios en este día.