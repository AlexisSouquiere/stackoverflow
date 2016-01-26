<tr>
    <td class="center-text">${answer.rate}</td>
    <td>
        <g:link resource="/question" action="show" id="${answer.question.id}" class="question-link">${answer.getDescriptionEscaped().substring(0,150)}</g:link>
    </td>
    <td>${formatDate(format:'dd/MM/yyyy', date:answer.dateCreated)}</td>
</tr>