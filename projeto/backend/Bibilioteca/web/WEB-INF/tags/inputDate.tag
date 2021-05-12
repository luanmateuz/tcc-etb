<%@ attribute name="id" required="true" %>
<%@ attribute name="value" required="false" %>
<%@ attribute name="classStyle" required="false" %>


<script src="assets/lib/jquery/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="assets/lib/datepicker/datepicker.css">
<script src="assets/lib/datepicker/datepicker.js"></script>

<input data-toggle="${id}" type="text" id="${id}" name="${id}" value="${value}" class="${classStyle}">
<script>
    $('[data-toggle="${id}"]').datepicker(
            {
                format: 'dd/MM/yyyy',
                days: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
                daysMin: ['D','S','T','Q','Q','S','S'],
                daysShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
                months: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthsShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']
            }
    );
</script>